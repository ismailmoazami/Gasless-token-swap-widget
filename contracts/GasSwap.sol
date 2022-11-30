pragma solidity ^0.8.0;

import "./ERC2771Context.sol";
import "./IERC20.sol";
import "./IUniswapV2Router.sol";

contract GasSwap is ERC2771Context(0xFD4973FeB2031D4409fB57afEE5dF2051b171104){
    address private owner;
    uint256 public swapFee;
    IUniswapV2Router public uniswapRouter;
    address public WETH = 0xc778417E063141139Fce010982780140Aa0cD5Ab;

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }
    constructor(address router) public{
        uniswapRouter = IUniswapV2Router(router);
        owner = msg.sender;
        swapFee = 3;
    }
    function setTrustedForwarder(address newTrustedForwarder) external isOwner{
        _trustedForwarder = newTrustedForwarder;
    }

    function changeSwapFee(uint256 _newFee) external isOwner{
        swapFee = _newFee;
    }

    function changeRouter(address router) external isOwner{
        uniswapRouter = IUniswapV2Router(router);
    }

    function withdrawTokens(address token, uint256 amount, address to) external isOwner{
        IERC20(token).transfer(to, amount);
    }

    function gasSwap(
        address token,
        uint256 amountIn,
        uint256 amountOutMin
    ) external {
        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = IUniswapV2Router.WETH();
        
    }


}