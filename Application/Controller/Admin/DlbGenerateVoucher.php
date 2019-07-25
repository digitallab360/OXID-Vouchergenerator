<?php
/**
 * Modul: dlb_vouchergenerator
 * Web: https://www.digitallab360.de
 * Mail: oxid@digitallab360.de
 * (c) 2019 by digitallab360
 */

namespace DigitalLab\VoucherGenerator\Application\Controller\Admin;

class DlbGenerateVoucher extends \OxidEsales\Eshop\Application\Controller\Admin\AdminDetailsController {

    protected $_successMessage;
    protected $_errorMessage;

    public function render() {

        parent::render();
        return "dlb_vouchergenerator.tpl";

    }

    protected function _generateRandomCode($Length, $Characters) {

        $code = '';
        for ($c = 0; $c < $Length; $c++) {
            $code .= $Characters[mt_rand(0, strlen($Characters)-1)];
        }
        return $code;

    }

    public function generateRandomVoucher() {

        $oConfig = \OxidEsales\Eshop\Core\Registry::getConfig();
        $voucherCount = $oConfig->getRequestParameter("voucherCount");
        if (!$voucherCount) { $voucherCount = 1; }

        $voucherLength = $oConfig->getRequestParameter("voucherLength");
        $voucherOxid = $oConfig->getRequestParameter("oxid");
        $voucherCharacters = $oConfig->getRequestParameter("voucherCharacters");
        $voucherPrefix = $oConfig->getRequestParameter("voucherPrefix");
        $voucherSuffix = $oConfig->getRequestParameter("voucherSuffix");

        if ($voucherCharacters && $voucherLength <= 40 && $voucherLength > 2 && $voucherOxid ) {
            for ($count = 0; $count < $voucherCount; $count++) {
                $voucherCode = $voucherPrefix . $this->_generateRandomCode($voucherLength, $voucherCharacters) . $voucherSuffix;
                $voucherNew = oxNew(\OxidEsales\Eshop\Application\Model\Voucher::class);
                $voucherNew->oxvouchers__oxvoucherserieid = new \OxidEsales\Eshop\Core\Field($voucherOxid);
                $voucherNew->oxvouchers__oxvouchernr = new \OxidEsales\Eshop\Core\Field($voucherCode);
                $voucherNew->save();
            }
            $this->_successMessage = \OxidEsales\Eshop\Core\Registry::getLang()->translateString("dlb_voucher_success_message");
        } else {
            $this->_errorMessage = \OxidEsales\Eshop\Core\Registry::getLang()->translateString("dlb_voucher_error_message");
        }

        $this->_aViewData["successMessage"] = $this->_successMessage;
        $this->_aViewData["errorMessage"] = $this->_errorMessage;

    }

}