provider "oci" {
   #auth = "InstancePrincipal"
   
   tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
   user_ocid = "ocid1.user.oc1..aaaaaaaa7sgoxvcfywrmpav6jp2uwnrx3qz6d26ngw54njkogqlprtlwxwfq"
   private_key_path = "C:/Users/User/Downloads/yasoja44-12-02-03-44.pem"
   private_key_password = ""
   fingerprint = "a0:3b:c2:24:60:e3:53:e0:06:35:9c:74:7f:f5:cf:6d"
   
   region = "ap-hyderabad-1"
}

resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = "NdZG:AP-HYDERABAD-1-AD-1"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaavmzf6u5fmc3u2zdwbrdpwnw53j5r22rkzkxywm5wdzarpd7bmtna"
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaafx7pm3hiyfpsvfwqxnqpf2kdg75kstohaixygsi7xo6dygs2ldsq"
        source_type = "image"
    }

    is_pv_encryption_in_transit_enabled = true

    metadata = {
        ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDiiHoHqjv+W3qEunwBzfwEGggN2fIcDm4LsNLwVTQeqdUszStB5Ym6985ooMBCe7FVDU0vtRruAuQCUeo1y52rkxsiGk3C1c+Z+IKvpnXdvj/C+8FjwxS576dNUXi6er8K+N4QikvHBReN1QfO6LTcwpcwrgiBIoXpXNObLdToY9So+ikg/DfTt3acHWlyHeW6OCDF/0+YoBvDyBJo+Z/HwZpX/Rt9iWk/qI+ztr/RZ26K7PEW08s1ZpnFdrzvSJMMxgRKspG0CHga++VPlxSL3nAN0U9Jbop0ZLVca3F5eggXuib1FTaD9aYVvAaRvyqNwaQ8V8Mqbaxm5sg00erObN4fARu2Gt553eC0jlSxIWDDtq9vLCO33LeT270adcoJUSR+ulBPoTVgA21exf9I1Ktm0ZJh6Savgcbx5e5x+AWS9IWiV4tRfJjM4Q5d11s7L7zEYIu/AaOZdfydAuw2yV7K6pK5zvGizarbgYZulaLLJoJQSLVC84mTzQkky9E= user@DESKTOP-M8Q095F"
    }

    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaabgf6u4yktjlmn3yfsptwzf3iisddqwo4wzct2cvq4fdulcnwjlka"
    }
}


output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}
