// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhotoNFT {
    // Struct to represent a photo NFT
    struct Photo {
        address creator;
        string photoHash;
        string description;
        uint256 timestamp;
        bool isPublic;
    }

    // Array to store all photo NFTs
    Photo[] public photos;

    // Mapping to track photo ownership
    mapping(address => uint256[]) public ownerPhotos;

    // Mapping to track photo visibility permissions
    mapping(uint256 => mapping(address => bool)) public photoAccess;

    // Event to log when a new photo is minted
    event PhotoMinted(
        uint256 indexed photoId, 
        address indexed creator, 
        string photoHash, 
        bool isPublic
    );

    // Event to log when photo access is granted
    event PhotoAccessGranted(
        uint256 indexed photoId, 
        address indexed viewer
    );

    // Function to mint a new photo NFT
    function mintPhoto(
        string memory _photoHash, 
        string memory _description, 
        bool _isPublic
    ) public returns (uint256) {
        // Validate input parameters
        require(bytes(_photoHash).length > 0, "Photo hash cannot be empty");
        
        // Create new photo NFT
        Photo memory newPhoto = Photo({
            creator: msg.sender,
            photoHash: _photoHash,
            description: _description,
            timestamp: block.timestamp,
            isPublic: _isPublic
        });

        // Add photo to the array and get its ID
        uint256 photoId = photos.length;
        photos.push(newPhoto);

        // Track photos owned by the creator
        ownerPhotos[msg.sender].push(photoId);

        // Set default access for public photos
        if (_isPublic) {
            photoAccess[photoId][msg.sender] = true;
        }

        // Emit event for photo minting
        emit PhotoMinted(photoId, msg.sender, _photoHash, _isPublic);

        return photoId;
    }

    // Function to grant access to a private photo
    function grantPhotoAccess(uint256 _photoId, address _viewer) public {
        // Validate photo exists and is not public
        require(_photoId < photos.length, "Invalid photo ID");
        require(!photos[_photoId].isPublic, "Photo is already public");
        require(msg.sender == photos[_photoId].creator, "Only creator can grant access");

        // Grant access to the specified viewer
        photoAccess[_photoId][_viewer] = true;

        // Emit event for access granted
        emit PhotoAccessGranted(_photoId, _viewer);
    }

    // Function to check if a user can view a photo
    function canViewPhoto(uint256 _photoId, address _viewer) public view returns (bool) {
        // Validate photo exists
        require(_photoId < photos.length, "Invalid photo ID");

        // Check if photo is public or viewer has been granted access
        return photos[_photoId].isPublic || 
               photoAccess[_photoId][_viewer] || 
               _viewer == photos[_photoId].creator;
    }
}