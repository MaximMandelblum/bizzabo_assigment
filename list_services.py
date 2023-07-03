import boto3

def list_services_by_region():
    ec2 = boto3.client('ec2')
    regions = [region['RegionName'] for region in ec2.describe_regions()['Regions']]

    services_by_region = {}
    for region in regions:
        services = []
        for service in boto3.session.Session(region_name=region).get_available_services():
            services.append(service)
        services_by_region[region] = services

    return services_by_region

def get_service_details(region, service_name):
    client = boto3.client(service_name, region_name=region)
    service_details = client.describe_service()
    return service_details

def main():
    aws_services_by_region = list_services_by_region()

    for region, services in aws_services_by_region.items():
        print(f"Region: {region}")
        for service in services:
            print(f"Service: {service}")
            try:
                service_details = get_service_details(region, service)
                print(service_details)
            except Exception as e:
                print(f"Error fetching details for {service}: {e}")
        print()

if __name__ == "__main__":
    main()