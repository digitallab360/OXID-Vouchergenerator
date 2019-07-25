[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<script type="text/javascript">
<!--
function changeFnc( fncName )
{
    var langvar = document.myedit.elements['fnc'];
    if (langvar != null )
        langvar.value = fncName;
}
//-->
</script>

<form name="transfer" id="transfer" action="[{$oViewConf->getSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="cl" value="DlbGenerateVoucher">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="98%">
    <tr>
        <td valign="top" class="edittext">
            <form name="generateRandomVoucher" id="generateRandomVoucher" action="[{$oViewConf->getSelfLink()}]" method="post">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="DlbGenerateVoucher">
                <input type="hidden" name="fnc" value="generateRandomVoucher">
                <input type="hidden" name="oxid" value="[{$oxid}]">
                <input type="hidden" name="editval[oxvoucherseries__oxid]" value="[{$oxid}]">

                <table cellspacing="2" cellpadding="0" border="0">
                        <h2>[{oxmultilang ident="dlb_voucher_title"}][{oxinputhelp ident="help_dlb_voucher_random"}]</h2>
                        <tr>
                            [{if $successMessage}]
                                <td colspan="2" style="background-color: green; padding: 4px 20px; color: #fff; margin: 10px 0;">[{$successMessage}]</td>
                            [{/if}]
                            [{if $errorMessage}]
                                <td colspan="2" style="background-color: red; padding: 4px 20px; color: #fff; margin: 10px 0;">[{$errorMessage}]</td>
                            [{/if}]
                        </tr>
                        <tr>
                            <td class="edittext" width="80">
                                [{oxmultilang ident="dlb_voucher_count"}]
                            </td>
                            <td class="edittext" width="195">
                                <input class="editinput" type="text" name="voucherCount" size="4" value="0">
                                [{oxinputhelp ident="help_dlb_voucher_count"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext" width="80">
                                [{oxmultilang ident="dlb_voucher_length"}]
                            </td>
                            <td class="edittext" width="195">
                                <input class="editinput" type="text" name="voucherLength" size="4" value="0">
                                [{oxinputhelp ident="help_dlb_voucher_length"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext" width="80">
                                [{oxmultilang ident="dlb_voucher_prefix"}]
                            </td>
                            <td class="edittext" width="195">
                                <input class="editinput" type="text" name="voucherPrefix" size="15" value="">
                                [{oxinputhelp ident="help_dlb_voucher_prefix"}]
                            </td>
                        </tr>
                    <tr>
                        <td class="edittext" width="80">
                            [{oxmultilang ident="dlb_voucher_suffix"}]
                        </td>
                        <td class="edittext" width="195">
                            <input class="editinput" type="text" name="voucherSuffix" size="15" value="">
                            [{oxinputhelp ident="help_dlb_voucher_suffix"}]
                        </td>
                    </tr>
                        <tr>
                            <td class="edittext">
                                [{oxmultilang ident="dlb_voucher_characters"}]
                            </td>
                            <td class="edittext" width="195">
                                <input class="editinput" type="text" name="voucherCharacters" size="50" value="0123456789abcdefghijklmnopqrstuvwxyz">
                                [{oxinputhelp ident="help_dlb_voucher_characters"}]
                            </td>
                        </tr>
                    <tr>
                        <td class="edittext"></td>
                        <td class="edittext"><br>
                            <input type="submit" class="edittext" name="save" value="[{oxmultilang ident="dlb_voucher_generate"}]">
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]
