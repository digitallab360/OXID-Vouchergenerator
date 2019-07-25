<?php
/**
 * Modul: dlb_vouchergenerator
 * Web: https://www.digitallab360.de
 * Mail: oxid@digitallab360.de
 * (c) 2019 by digitallab360
 */

/**
 * Metadata version
 */
$sMetadataVersion = '2.0';

/**
 * Module information
 */
$aModule = [
    'id'          => 'dlb_vouchergenerator',
    'title'       => [
        'de' => '.dlb. | Gutscheingenerator',
        'en' => '.dlb. | Voucher generator'
    ],
    'description' => [
        'de' => 'Modul zum erstellen von Gutscheincodes mit individuellen Einstellungen.',
        'en' => 'Module for creating coupon codes with individual settings.',
    ],
    'thumbnail'     => 'out/admin/src/img/logo.svg',
    'version'       => '1.0',
    'author'        => 'digitallab360',
    'url'           => 'https://www.digitallab360.de',
    'email'         => 'oxid@digitallab360.de',
    'extend'        => [],
    'controllers'   => [
        'DlbGenerateVoucher'            => \DigitalLab\VoucherGenerator\Application\Controller\Admin\DlbGenerateVoucher::class
    ],
    'blocks'        => [],
    'templates'     => [
        'dlb_vouchergenerator.tpl'      => 'dlb360/dlb_vouchergenerator/Application/views/admin/tpl/dlb_vouchergenerator.tpl'
    ],
    'events'        => [],
    'settings'      => []
];
