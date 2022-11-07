// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getConversionRate(uint amount, AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint)
    {
        (, int answer, , , ) = priceFeed.latestRoundData();
        uint ethPrice = uint(answer * 1e18);
        return (ethPrice * amount) / 1e18;
    }
}
