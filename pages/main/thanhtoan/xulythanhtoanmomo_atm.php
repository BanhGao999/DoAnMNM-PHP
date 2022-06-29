<?php
header('Content-type: text/html; charset=utf-8');

include("helper_momo.php");

$endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";


$partnerCode = 'MOMOBKUN20180529';
$accessKey = 'klm05TvNBzhg7h7j';
$secretKey = 'at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa';

$orderInfo = "Thanh toán qua ATM";
$amount = $_SESSION['tongtien'];
$orderId = time() . "";
$redirectUrl = "http://localhost:8888/Plan/pages/main/thanhtoan/index.php?quanly=thanhtoan";
$ipnUrl = "https://webhook.site/b3088a6a-2d17-4f8d-a383-71389a6c600b";
$extraData = "";

// $partnerCode = $_POST["partnerCode"];
// $accessKey = $_POST["accessKey"];
// $serectkey = $_POST["secretKey"];
// $orderId = $_POST["orderId"]; // Mã đơn hàng
// $orderInfo = $_POST["orderInfo"];
// $amount = $_POST["amount"];
// $ipnUrl = $_POST["ipnUrl"];
// $redirectUrl = $_POST["redirectUrl"];
// $extraData = $_POST["extraData"];

$requestId = time() . "";
$requestType = "payWithATM";

$extraData = ($_POST["extraData"] ? $_POST["extraData"] : "");
//before sign HMAC SHA256 signature
$rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&ipnUrl=" . $ipnUrl . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . "&redirectUrl=" . $redirectUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;
$signature = hash_hmac("sha256", $rawHash, $secretKey);
$data = array(
    'partnerCode' => $partnerCode,
    'partnerName' => "Test",
    "storeId" => "MomoTestStore",
    'requestId' => $requestId,
    'amount' => $amount,
    'orderId' => $orderId,
    'orderInfo' => $orderInfo,
    'redirectUrl' => $redirectUrl,
    'ipnUrl' => $ipnUrl,
    'lang' => 'vi',
    'extraData' => $extraData,
    'requestType' => $requestType,
    'signature' => $signature
);
$result = execPostRequest($endpoint, json_encode($data));
$jsonResult = json_decode($result, true);  // decode json

//Just a example, please check more in there

header('Location: ' . $jsonResult['payUrl']);
