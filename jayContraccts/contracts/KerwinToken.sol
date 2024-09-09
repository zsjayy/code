// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract KerwinToken{
    using SafeMath for uint256; //为了uint256后面使用sub，add方法
    //发行代币的名称
    string public name = "KerwinToken";
    //发行代币的标识
    string public symbol = "KWT";
    //发行代币的单位
    uint256 public decimals = 18; //1KerwinToken = 10**decimals
    //发行代币的总量
    uint256 public totalSupply;
    //以上会自动生成getter方法

    //mapping
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address=>uint256)) public allowance;

    //使用constructor构造器初始化代币的总量
    constructor(){
        totalSupply = 1000000 * (10 ** decimals);
        //获取的是部署账号，读的就是truffle-config.js配置的那个
        balanceOf[msg.sender] = totalSupply;
    }

    //事件-记录交易日志
    event Transfer(address indexed _from, address indexed _to, uint256 _vaule);


    //因为会改变状态变量，所以不用view
    //这个方法时对外暴露的，所以用public
    function transfer(address _to, uint256 _value) public returns(bool success){
        //先校验发送者是否有那么多钱去转||地址不为空
        require(_to != address(0));
        _transfer(msg.sender, _to, _value);
        return true;
        
    }

    function _transfer(address _from,address _to, uint256 _value) internal {
        require(balanceOf[msg.sender]>= _value);// 当此结果为true时才会运行下面的代码，否则以太坊会抛出异常
        
        //从哪个账号发起的调用者的账号，因为metamask可以切换账号
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        
        //触发事件
        emit Transfer(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value)public return(bool success){
        //msg.sender 当前网页登录的账号
        //_spender 第三方交易所的账号地址
        //_value授权的钱数
        allowance[msg.sender][_spender] = _value;
        //当前登录账号--交易所--授权的钱
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

}