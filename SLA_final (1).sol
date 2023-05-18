// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SLA {

   
    address payable public serviceProvider;
    address payable public client;
    uint public deadline;
     uint totalServiceTime;
     uint totalUptime;
    uint public penaltyAmount;
    
    bool public serviceCompleted;
    bool public clientApproved;
    bool public serviceProviderApproved;
    string public description;

    

    constructor(
        address payable _serviceProvider,
        address payable _client,
        uint _deadline,
        uint _totalServiceTime,
     uint _totalUptime,
        uint _penaltyAmount,
      
        string memory _description
    ) {
        serviceProvider = _serviceProvider;
        client = _client;
        deadline = _deadline;
        totalServiceTime=_totalServiceTime;
        totalUptime=_totalUptime;
        penaltyAmount = _penaltyAmount;
       
         _description = description;
    }

   
      event SLACreated(address client, address serviceProvider, uint256 deadline, uint256 penaltyAmount);
   
   function createSLA( address serviceProvider, uint256 deadline, uint256 penaltyAmount) external {
       
        require(penaltyAmount > 0, "Penalty amount must be greater than zero");
        
       
        emit SLACreated(client, serviceProvider,deadline, penaltyAmount);
    }
    
    function completeService() public {
        require(msg.sender == serviceProvider, "Only service provider can call this function");
       
        serviceCompleted = true;
    }

    function approveService() public {
        if (msg.sender == client) {
            clientApproved = true;
        } else if (msg.sender == serviceProvider) {
            serviceProviderApproved = true;
        }
    }


     function calculatePenaltyAmount() external view returns (uint256) {
       
        
        return (penaltyAmount*deadline)-(((penaltyAmount*deadline)*25)/100);
}
    


  
}
