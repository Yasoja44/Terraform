provider "oci" {
   #auth = "InstancePrincipal"
   
   tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
   user_ocid = "ocid1.user.oc1..aaaaaaaa7sgoxvcfywrmpav6jp2uwnrx3qz6d26ngw54njkogqlprtlwxwfq"
   private_key_path = "C:/Users/User/Downloads/yasoja44-12-02-03-44.pem"
   private_key_password = ""
   fingerprint = "a0:3b:c2:24:60:e3:53:e0:06:35:9c:74:7f:f5:cf:6d"
   
   region = "ap-hyderabad-1"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
}

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"

    #Optional
    cidr_block = "172.16.0.0/24"
    display_name = "My VCN"
    dns_label = "newLabel"
    
}

#terraform init

#terraform plan
#terraform apply

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = "172.16.0.0/24"
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
    vcn_id = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaagltuylaaik6dsdwmplbcsgg56l6qecw3bkqjrwglnzc74gamzsgq"

    #Optional
    display_name = "${var.subnet_display_name}"
    dns_label = "internal"
    prohibit_public_ip_on_vnic = false

}

#terraform plan
#terraform apply


#terraform destroy