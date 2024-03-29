// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "./extensions/ERC20Capped.sol";

contract LottLink is ERC20, ERC20Burnable, AccessControl, ERC20Permit, ERC20Votes, ERC20Capped {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant SUPPLY_RESERVE_ROLE = keccak256("SUPPLY_RESERVE_ROLE");

    constructor(address defaultAdmin)
        ERC20("Lott.Link", "LLTT")
        ERC20Permit("Lott.Link")
        ERC20Capped(7777777 ether)
    {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function reserveSupply(uint256 amount) public onlyRole(SUPPLY_RESERVE_ROLE) {
        _reserveSupply(amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes, ERC20Capped)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}