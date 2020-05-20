# Blockchain Network

## Docker Images

- peer : `hyperledger/fabric-peer`
- orderer : `hyperledger/fabric-orderer`
- ca : `hyperledger/fabric-ca`
    - Enrollment CA or the ECert CA
        - Used enrolling
    - TLS CA
        - used for generating TLS certs

## MSP
- Membership Service Provider does not actually provide anything
- The implementation of the MSP requirement is a set of folders that are added to the configuration of the network and is used to define an organization both inwardly (organizations decide who its admins are) and outwardly (by allowing other organizations to validate that entities have the authority to do what they are attempting to do).
- Whereas Certificate Authorities generate the certificates that represent identities, the MSP contains a list of permissioned identities.

## CA
- when a user is registered with a Fabric CA, a role of admin, peer, client, orderer, or member must be associated with the user.
    - For example, identities registered with the “peer” role should, naturally, be given to a peer. Similarly, identities registered with the “admin” role should be given to organization admins.