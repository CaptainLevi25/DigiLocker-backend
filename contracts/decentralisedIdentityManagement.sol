// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract decentralisedIdentityManagement {
    struct userDetails{
        uint idNumber;
        string[] GovermentID;
        string[] EducationalCertificates;
        string[] MedicalRecords;
        string[] generalPhotos;
        address detailsOwner;
        address[] allowedAccessForEducationalCertificates;
        address[] allowedAccessForMedicalRecords;
        address[] allowedAccessForGovernmentID;
        address[] allowedAccessForGeneralPhotos;
        }
        struct tempStruct{
        address[] tempAddress;
        
    }
  
    address[] tempArray;
    string[] tempArray2;

    userDetails[]  detailsArray;
    function addUser() public {
        uint flag = 0;
        for(uint i =0;i<detailsArray.length;i++){
                if(msg.sender==detailsArray[i].detailsOwner){
                    flag = 1;
                }
            }
        require(flag==0 , "User with this account already exists");
        // tempArray.push(msg.sender);
        detailsArray.push(userDetails({idNumber:(detailsArray.length + 1),
        detailsOwner:msg.sender,
        GovermentID:tempArray2,
        EducationalCertificates:tempArray2,
        MedicalRecords:tempArray2,
        generalPhotos:tempArray2,
        allowedAccessForEducationalCertificates:tempArray,
        allowedAccessForMedicalRecords:tempArray,
        allowedAccessForGovernmentID:tempArray,
        allowedAccessForGeneralPhotos:tempArray
        }));
    }
    //Functions for Government IDs starts
    function uploadGovernmentID(string memory _link) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "User not found");
        detailsArray[_idNumber-1].GovermentID.push(_link);
    }

    function getMyGovernmentIDs() public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , " User not found ");
        return detailsArray[_idNumber-1].GovermentID;
    }

    function giveGovernmentIdAccess(address _allowed) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        detailsArray[_idNumber-1].allowedAccessForGovernmentID.push(_allowed);
    }

    function removeGovernmentIdAccess(address _unallow) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        uint flag = 0;
        uint index = 0;
        for(uint i = 0; i<detailsArray[_idNumber-1].allowedAccessForGovernmentID.length;i++){
            if(detailsArray[_idNumber-1].allowedAccessForGovernmentID[i]==_unallow){
                 flag = 1;
                 index = i;
                 break ;
            }
        }
        require(flag==1 , "This address doesnot have access or access already removed");
        detailsArray[_idNumber-1].allowedAccessForGovernmentID[index] = address(0);
    }

    function retrieveOtherGovernmentID(address owner) public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0; i<detailsArray.length;i++){
            if(detailsArray[i].detailsOwner==owner){
                _idNumber = i+1;
            }
        }
        require(_idNumber>0 , "User does not exist");
        uint flag = 0;
        for(uint i = 0; i < detailsArray[_idNumber-1].allowedAccessForGovernmentID.length;i++){
            if(msg.sender == detailsArray[_idNumber-1].allowedAccessForGovernmentID[i]){
                flag = 1;
            }
        }
        require(flag==1 , "You do not have access to these files");
        return detailsArray[_idNumber-1].GovermentID;
    }
    
  function checkWhoHasGovernmentIdAccess() public view returns(tempStruct memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        tempStruct memory temporary = tempStruct({tempAddress : detailsArray[_idNumber-1].allowedAccessForGovernmentID});
        return temporary;
    }

    //Functions for Government IDs ends


    //Functions for Medical Records starts

    function uploadMedicalRecords(string memory _link) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "User not found");
        detailsArray[_idNumber-1].MedicalRecords.push(_link);
    }

    function getMyMedicalRecords() public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , " User not found ");
        return detailsArray[_idNumber-1].MedicalRecords;
    }

    function giveMedicalRecordsAccess(address _allowed) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        detailsArray[_idNumber-1].allowedAccessForMedicalRecords.push(_allowed);
    }

    function removeMedicalRecordsAccess(address _unallow) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        uint flag = 0;
        uint index = 0;
        for(uint i = 0; i<detailsArray[_idNumber-1].allowedAccessForMedicalRecords.length;i++){
            if(detailsArray[_idNumber-1].allowedAccessForMedicalRecords[i]==_unallow){
                 flag = 1;
                 index = i;
                 break ;
            }
        }
        require(flag==1 , "This address doesnot have access or access already removed");
        detailsArray[_idNumber-1].allowedAccessForMedicalRecords[index] = address(0);
    }

    function retrieveOthersMedicalRecords(address owner) public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0; i<detailsArray.length;i++){
            if(detailsArray[i].detailsOwner==owner){
                _idNumber = i+1;
            }
        }
        require(_idNumber>0 , "User does not exist");
        uint flag = 0;
        for(uint i = 0; i < detailsArray[_idNumber-1].allowedAccessForMedicalRecords.length;i++){
            if(msg.sender == detailsArray[_idNumber-1].allowedAccessForMedicalRecords[i]){
                flag = 1;
            }
        }
        require(flag==1 , "You do not have access to these files");
        return detailsArray[_idNumber-1].MedicalRecords;
    }
    
   function checkWhoHasMedicalRecordsAccess() public view returns(tempStruct memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = i+1;
            }
        }
        require(_idNumber>0 , "You are not registered");
        tempStruct memory temporary = tempStruct({tempAddress : detailsArray[_idNumber-1].allowedAccessForMedicalRecords});
        return temporary;
    }
    //Functions for Medical Records ends

    //Functions for Educational Certificates starts

    function uploadEducationalCertificates(string memory _link) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "User not found");
        detailsArray[_idNumber-1].EducationalCertificates.push(_link);
    }

    function getMyEducationalCertificates() public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , " User not found ");
        return detailsArray[_idNumber-1].EducationalCertificates;
    }

    function giveEducationalCertificatesAccess(address _allowed) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        detailsArray[_idNumber-1].allowedAccessForEducationalCertificates.push(_allowed);
    }

    function removeEducationalCertificatesAccess(address _unallow) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        uint flag = 0;
        uint index = 0;
        for(uint i = 0; i<detailsArray[_idNumber-1].allowedAccessForEducationalCertificates.length;i++){
            if(detailsArray[_idNumber-1].allowedAccessForEducationalCertificates[i]==_unallow){
                 flag = 1;
                 index = i;
                 break ;
            }
        }
        require(flag==1 , "This address doesnot have access or access already removed");
        detailsArray[_idNumber-1].allowedAccessForEducationalCertificates[index] = address(0);
    }

    function retrieveOthersEducationalCertificates(address owner) public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0; i<detailsArray.length;i++){
            if(detailsArray[i].detailsOwner==owner){
                _idNumber = i+1;
            }
        }
        require(_idNumber>0 , "User does not exist");
        uint flag = 0;
        for(uint i = 0; i < detailsArray[_idNumber-1].allowedAccessForEducationalCertificates.length;i++){
            if(msg.sender == detailsArray[_idNumber-1].allowedAccessForEducationalCertificates[i]){
                flag = 1;
            }
        }
        require(flag==1 , "You do not have access to these files");
        return detailsArray[_idNumber-1].EducationalCertificates;
    }
    
function checkWhoHasEducationalCertificatesAccess() public view returns(tempStruct memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        tempStruct memory temporary = tempStruct({tempAddress : detailsArray[_idNumber-1].allowedAccessForEducationalCertificates });
        return temporary;
    }
    
    //Functions for Educational Certificates ends

    //Functions for General Photos starts
    function uploadGeneralPhotos(string memory _link) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "User not found");
        detailsArray[_idNumber-1].generalPhotos.push(_link);
    }

    function getMyGeneralPhotos() public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , " User not found ");
        return detailsArray[_idNumber-1].generalPhotos;
    }

    function giveGeneralPhotosAccess(address _allowed) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        detailsArray[_idNumber-1].allowedAccessForGeneralPhotos.push(_allowed);
    }

    function removeGeneralPhotosAccess(address _unallow) public {
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        uint flag = 0;
        uint index = 0;
        for(uint i = 0; i<detailsArray[_idNumber-1].allowedAccessForGeneralPhotos.length;i++){
            if(detailsArray[_idNumber-1].allowedAccessForGeneralPhotos[i]==_unallow){
                 flag = 1;
                 index = i;
                 break ;
            }
        }
        require(flag==1 , "This address doesnot have access or access already removed");
        detailsArray[_idNumber-1].allowedAccessForGeneralPhotos[index] = address(0);
    }

    function retrieveOthersGeneralPhotos(address owner) public view returns(string[] memory){
        uint _idNumber = 0;
        for(uint i = 0; i<detailsArray.length;i++){
            if(detailsArray[i].detailsOwner==owner){
                _idNumber = i+1;
            }
        }
        require(_idNumber>0 , "User does not exist");
        uint flag = 0;
        for(uint i = 0; i < detailsArray[_idNumber-1].allowedAccessForGeneralPhotos.length;i++){
            if(msg.sender == detailsArray[_idNumber-1].allowedAccessForGeneralPhotos[i]){
                flag = 1;
            }
        }
        require(flag==1 , "You do not have access to these files");
        return detailsArray[_idNumber-1].generalPhotos;
    }
    
    function checkWhoHasgGeneralPhotosAccess() public view returns(tempStruct memory){
        uint _idNumber = 0;
        for(uint i = 0 ; i < detailsArray.length ; i++){
            if(msg.sender == detailsArray[i].detailsOwner){
                _idNumber = detailsArray[i].idNumber;
            }
        }
        require(_idNumber>0 , "You are not registered");
        tempStruct memory temporary = tempStruct({tempAddress : detailsArray[_idNumber-1].allowedAccessForGeneralPhotos});
        return temporary;
    }
    //Functions for General Photos starts

}