# Lott.Link 
- using ERC20 openzeppelin standard in wizard with this features:
  - ERC20Mintable
  - ERC20Burnable
  - ERC20Permit
  - ERC20Votes 
  - accessControl
- adding cap as a maximum value for totalSupply
  - the cap is a constant value equal to 7,777,777 as the maximum amount can be minted
- adding supplyReserve to keep space from cap
  - for specific situations some token holders may transfer their tokens cross-chain. or some tokens may be burned that are needed to be minted again. so we need some space to reserve for that burned tokens
  - the supplyReserve variable can be set by the SUPPLY_RESERVE_ROLE wich is an access control role.
  
