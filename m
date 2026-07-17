Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E1C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 16:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0B10E093;
	Fri, 17 Jul 2026 16:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Wd/pvqs7";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fX5UOEQi";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8F10E093
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 16:58:43 +0000 (UTC)
X-UUID: c2b7ccc0820011f1b1788b6acf885367-20260718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=gZt5aBeEQxNfoJHIsWhQ84vC4BsCk/bHjP4/iCShAyw=; 
 b=Wd/pvqs7JJE3RV0XX26jr7k5tIfvD2GZNHoXPlfXBDqJNqIokyrt2E38Yxmu34wbd9ukauUS/A+qoCRTNas1qkhVwDhjsWZdfxd/nrsZq1WCzvBqJmsu1xvkxK/zyNEX8A57eFTDqvTXLdY1MCjtET0wZzBKIqcunx0qJUXKboo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18, REQID:0a5806d7-71ce-4e45-8cef-dba0333e9266, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:8a735a6, CLOUDID:09a33f19-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2b7ccc0820011f1b1788b6acf885367-20260718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1512845160; Sat, 18 Jul 2026 00:58:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 18 Jul 2026 00:58:39 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 18 Jul 2026 00:58:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQaEsrv524j59YcAfO3+fKpaKjqG3G4YNPNQQT4o450QUBvtUTJ/bTz29PQAkIwhpfJfhK1OULIN4KoCeayF7yQp88eDJm9zIZ7jOvsxGUi8wMNAbWzatK36Xg0a8cbSUBNeln0hOJcA+1Z9/Vo5ws01yg4MFbZKiefEVpcORM3DKZwHUF5K6bF7RbvACPH8QGDDgBFtLfH2mgaZVZKQBWGuz6Gp2+rJCOlMRcq36L5Y+1atkf2jpCvx6CzNJO8rD934YjvLvL3Gc6sBUEtP0WPva1Mf+GVTLjSV2Xkyn55g64mM3RI9RxCE+WNWCa047cFb+0EvBpl9d8//wZFn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZt5aBeEQxNfoJHIsWhQ84vC4BsCk/bHjP4/iCShAyw=;
 b=U1WsSizBUpNucpPVgCRYUeet8fix72jDneFj5EG80+0GnFFM23JNK0WhRcvWyBCVvm/3Hz1jCo59Bme6lXPqP4qO6eyil2VttnoQIAZitBLyXYWsrkAN5wti0nKd4OuOIz0Wi9z2zwdR5SGv/wued6Ubno7E0Q37qRQtGBkcLeou4Ef3No6S3BNa3g1XyL2dVjE+dS/f2Denu20No2q6PNoZSSc219wOuRVYbR8vHadgje9LM5EC/PjN366lU2aYy4G1NOU5sSu9rJpqgCxMPCJjb1R43AafFsRSUuGpTAR/ZDP4NVJ6NpKyWCCZYjfP0SZrte/nbQcH83RqluBzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZt5aBeEQxNfoJHIsWhQ84vC4BsCk/bHjP4/iCShAyw=;
 b=fX5UOEQiRvrC/sQihjWpMCorYD2wJOpJZLN42KY9y/hN7AYDhpbUSOzbe+kX4rqF6M6pQrS6/EuZ9DZvbOQNhwxIdNs8FThnJs8LSlk8OSPZ+5gPuklPh+CROsaS+jeo0MOCswKCllwyTBBhIzVh7yjQ+txwKWeDAKxjMQ12Mfg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB8164.apcprd03.prod.outlook.com (2603:1096:820:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 16:58:35 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 16:58:35 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "santhosh.reddy.guddati@intel.com" <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
Thread-Index: AQHdB2pDeWEgjlWn4EaRKIo00hgO2LZmV2cAgAhzFACAA0GxAA==
Date: Fri, 17 Jul 2026 16:58:35 +0000
Message-ID: <1de1d9f616efbb16ce26bf2653da27eefb4ff148.camel@mediatek.com>
References: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
 <c67f184b-c93c-47b7-ad5a-a19a2a6078e4@intel.com>
 <96a7b371898c7363f886b2a80186ff5edeca1359.camel@mediatek.com>
In-Reply-To: <96a7b371898c7363f886b2a80186ff5edeca1359.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB8164:EE_
x-ms-office365-filtering-correlation-id: 64e17331-854c-41b8-d746-08dee424a3de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|5023799004|56012099006|11063799006|4143699003|10067099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: l3PYm0arSj7IWEnIxjbMoIVB/5PjmqPmj2xYe90mu3nS8ZYSIYKHOlbbbK3YnaAeTn1oNbblTwJl+A6s7sPxhFhFxPXnugdyMw3bqCIdBbJZmmTXYxRxNyCuX4jsSScuIfwFmadt01CEQDA3W6JG3aizfVrf0XeNguAUcFhNpbDw7UtArXGA5Xzvp5fbIfMcWmEBnGzbJmsl2eEUzWvOD23O0qVbtfsJ0SxHcH7aAWP87hmxC9z1oeG3M/qM+NhwbCTyB7nLDpI6QdSGM1H4S0353I8Ik1kM215C3/fpAO5xRxqnSOpN4ZXkIJJOaxXDM8T9ACmpXNx3gBU6Tpo7tZhSvZ8NEOzTLYxuqhLhXvoUQ9G+Medw4yXE2TQGeYqYDjMxueXrIBVw0g2Xphe5rJHA8plcBerPyMBR7EQjrQzGeBGbU57pFK/MHZ4zdPuyaTlFVA1hiPRAXImHjLgFLzp+TxuXyMl/eCGWszIIxzEreVesb6TxFEyV84OLd72dcr1TFPEj61sX3fZ6uMD7Fahlib5P+c5+kc7sbcANR1owLrLaD/Sia78/Ruk3ZGE6+DHIzyePVenM496+SnDWsMGDThh/HMbT0PLD5wUNP8fugEWzqkR9JWoJzvscwgWCYZt0F2u4igDblu2K1URi1xqyuZZoqEaSdy7CqPgZeSh5i5dm4EKIebqp+gjJUtuxPAipQWr37cQg49zRKscXToEdTe3sA+WJ+Q4j1mHjwKY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXoxbW90WTZZaWNMQmc3dTE5MkVlcDd0WGNBY3I2ZFB0TWt3MFhlbUpHbDA0?=
 =?utf-8?B?M2dpWHNVOHI2dzlBaGlJUjg0K05SUU1xR2t4ZVIrakdPNHJJbG94MHN3ZHpG?=
 =?utf-8?B?RW90ZkFCaFN1WjBqZFRMR0FiQWFYMEJXd1F6WStIUDRjMEdvSUI4VFRKMmxB?=
 =?utf-8?B?S0pKU0I1UGtMR3lvNU0rUmxTQU9ENlMvTUxOYU51OFlBNzFIY09OUWxGS0NQ?=
 =?utf-8?B?NUtoVVphUUhwYnh1K0daU1k3MDljcHVqSkRxazVMRVZBNlN1UU10NmZ1cnJx?=
 =?utf-8?B?RHI2dW40V3dzUi9RSTlmSEN4azVyQ0VPV0JDNnh4Z05IOENpU3JkVGhmcXgx?=
 =?utf-8?B?bGp2M3RiZ2RTVXoyUmJYUG9hdk5PMXh3eitpbGd1akNwbkluZWU1VGFndkZ5?=
 =?utf-8?B?cXQ4QTVhaW1QQlFseENkZ0FRV3cyRlNQeVhKSU9QSnJqTlZaeldibGprVHJi?=
 =?utf-8?B?VHVlVFFwZ1J6OXdhR3FUdlFFc2pBemtRaEtoUUc5N2RGUUkzbXJ1TEFHM0lO?=
 =?utf-8?B?czl6QnZobDh3UWQ2bmJGZTZ4VWRmWGZXL1NrdmJscStPWDNWYlZjMWVPTWgv?=
 =?utf-8?B?YWEvdk9ZWmJPem4xbGlPVmpzRVJ6eUs5TzBkWWxGYjZ6eFB0K2dteVY0K2lS?=
 =?utf-8?B?U0Z3cisvN1RWUFhSWTBUOWRGT285MFI5MGZBTnU1ODlJV3BwdkFJYzVROWc2?=
 =?utf-8?B?SjJnWlJRSUFhdHVGZ2tTaU9qQ2ZwVXRWOFU2N2NpZzhiMHZrUnFGQlV2RXZ0?=
 =?utf-8?B?d1RjVitwVElpek5iTTNzc1YxeEh0NklmbzJYUHMzTXJnOE9CMU56cU56c3VB?=
 =?utf-8?B?WUF5aCtwRkVQUzUyTU5uL0FEU3BrR3BnNlYyTXJ0YlliaEpsMG5RZzFneDk2?=
 =?utf-8?B?NmpNNjhNdjBpY3RFbXhBMVlEdVJGVWp5alZiRmw5KzFWd0tGdVM1Y1JCWTc0?=
 =?utf-8?B?Vm5DV3ppcnY5a3ZnK3dDRVExYXNUc3ZOWlNhVDFFNHIyQUtDbjRnb0dwZFhM?=
 =?utf-8?B?ZEhiOHlpTXZ1TTQ1dEM0VjJKMUI3R21TT0NrdHhsQW9VVmtYQTI0QW5zUW5u?=
 =?utf-8?B?Zk9UclhITEw5SEFQeHBjMEhpSGpmb2drdHVDbHMzSEthK2Z0SDhhZWFFZzZC?=
 =?utf-8?B?VW9wbnd1VkRvRXZ2aVVudVRsbFdXb3FrVkZ3SUhxbkxUVGlKTGpMMGJrRTVr?=
 =?utf-8?B?dG9Rb0Nlcm1rY0RibXdoNUxCWGloU21zNlhGS1lIOE1VeDUxT1Z0ZEdmeHM1?=
 =?utf-8?B?bjhWMXkvblNscnhhRGp6MHVXcU9zcWVoa3VYUHdNcXBWLzYwUU54YnJ3cXBY?=
 =?utf-8?B?bm4wN3RIbmI0b2ZFTGlQck5oNDRXOEF5YU9vTFJjUGNhRUFDVktLdE5udnhR?=
 =?utf-8?B?b3RxTG1xaENjcEdOSHNNR0ZLeG9GNmlCZUE5aENTazlyeXJ4VHVtT0I4ZU5s?=
 =?utf-8?B?OGdmTG1MdGJoSjNXRWNDR2xEdG95djR2OXVDUFloZXlEMkIzUGdFRW5DcFJO?=
 =?utf-8?B?TzZDU0t6a3o1N2pwcTVxZWozbDNVbFZsUHRtTVVZT24vR0JrVmZVYndIMUcz?=
 =?utf-8?B?NThMT1lSanZXZm5kNnFnM0d1VURDSFVhbC83WkpBcHBmaHBSSmUvMUlCK29S?=
 =?utf-8?B?N1BGWFpNTzhoODYrYXdwRmt6clhIaGJiK2N1VVZSWlhQc3k4OWN2TjR5Mk0w?=
 =?utf-8?B?OFBteDBlMm9nc2FKdTFLK2pKcWVwTnRrdkpnM00yU200YUphcVZjbnQ3dmwr?=
 =?utf-8?B?L1dQaTZLV0dWQk9xa1JjaDNCdnh1RjFHUThNaWFpWU13N0x2dXJjZk82SHFX?=
 =?utf-8?B?dmxZbTE2ZmhDUWZ6Y29yTFptSUk1Q09pL3kyMmxwejlWck5wZENPRlMzMjho?=
 =?utf-8?B?OGhjUDM2N2V3U2VZWldoWEVwTGhWRFVZTm5JVjNkRXRPWVI3R20xdE8yWHJn?=
 =?utf-8?B?VzhST0F1KzQrQnpCWkJkemdLQ1Q2WVdGZUtvV3hDZnZrZ1VLOCt5c29MYzQ4?=
 =?utf-8?B?T1JMYnNNV0RxTTR1d2c3Nm9xL29IdzZxeGhiVFJYMzNEV0RGZGVselArbzMv?=
 =?utf-8?B?VmdQSTRKTnlDZDJSQ0YvYnVPc0ZNMWpIMm50REdWYkVKNDRKNDIycVJVajNM?=
 =?utf-8?B?TEk1UHgxcytxbXRDZ2xiM0V0ZlQwcjNXcnpJdS9TOU9wS3FKcVlteml5VXNn?=
 =?utf-8?B?Ym04UHdHMTBpd25QNDBScGZiSnU3WCtMZllKOGJ3VnpnWWhIdzd5VllKY3ZO?=
 =?utf-8?B?N1cxOUV6R25sbHdCeGJaS3NMVGdybSszdFdwdXIxZVo3cHFONkdQSUNNMUNq?=
 =?utf-8?B?ZDlXd25lMVVqcEFpY1dsUVRlQm11SnkyRDRPWVFqbFRFQUgxcjRZVlZpTEQx?=
 =?utf-8?Q?O17lz12vr6vlczpg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AFA0DB709F5754CA862E31706263292@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m+UavWF4p5IbRnBen3fE/6vsxwsbRmZGHH6tSIcTfeHWRFEAcB3y4zYnB63uD0MUxzBR4MT7LivL/ygLAto9XYEGilSeZOSIIQpOSI/peH26/3JPmoefqakD+N4F1gznsyi7EYG69oAKc9LOrKyrJDApswpD3c77L5W4aLeYeB5UEfEinFs/P0YhQut52cpQP3IuxmUMzYCJpBIBATJnW4wdadDTiFrJfxeITAlRYiYCKv+/BeWWsYwpl1XG7rIOyvdOe3MRquEEMR19WUoaCPA58e+PtcMtKUbN2elV2XRq+WKZ4zQUUZuy4u0WJu4rhEuGXowxr09EfaHToRSMdw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e17331-854c-41b8-d746-08dee424a3de
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 16:58:35.2022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5m7zFrgLSjX3HgHlafc5UmaPxCHCumBhTwBHJIWIQ8uKWey2+QnwVzEHowSfKh9cfP65Xy/p1NTdowylSO+fuL2PQAPpmAY5I0TKMhcxhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8164
X-MTK: N
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDIzOjE0ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
IE9uIEZyaSwgMjAyNi0wNy0xMCBhdCAxMTo0MiArMDUzMCwgUmVkZHkgR3VkZGF0aSwgU2FudGhv
c2ggd3JvdGU6DQo+ID4gSGkgSmFzb24sDQo+ID4gDQo+ID4gT24gMjktMDYtMjAyNiAwNzoyMywg
SmFzb24tSkggTGluIHdyb3RlOg0KPiA+ID4gTVNUIChNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KSBv
dXRwdXRzIHJlcXVpcmUgdG9wb2xvZ3ktd2lkZSBIRENQDQo+ID4gPiBhdXRoZW50aWNhdGlvbiB3
aGljaCBpcyBoYW5kbGVkIGJ5IGRlZGljYXRlZCBkcC1tc3QtKiBzdWJ0ZXN0cy4NCj4gPiA+IFJ1
bm5pbmcgU1NULXN0eWxlIHRlc3RzIG9uIE1TVCBvdXRwdXRzIGNhbiBjYXVzZSBpc3N1ZXMgYmVj
YXVzZToNCj4gPiA+IA0KPiA+ID4gMS4gTVNUIEhEQ1AgYXV0aGVudGljYXRpb24gaW52b2x2ZXMg
dGhlIGVudGlyZSB0b3BvbG9neSAoaHViICsNCj4gPiA+IG1vbml0b3JzKQ0KPiA+ID4gMi4gUGVy
LWNvbm5lY3RvciBIRENQIHN0YXRlIG1hbmFnZW1lbnQgZGlmZmVycyBmcm9tIFNTVA0KPiA+ID4g
My4gVGhlIGRwLW1zdC1saWMtdHlwZS0wLzEgc3VidGVzdHMgYXJlIHNwZWNpZmljYWxseSBkZXNp
Z25lZCB0bw0KPiA+ID4gdGVzdA0KPiA+ID4gwqDCoMKgIE1TVCBIRENQIHNjZW5hcmlvcw0KPiA+
ID4gDQo+ID4gPiBTa2lwIE1TVCBvdXRwdXRzIGluIGdldF9oZGNwX291dHB1dHMoKSB3aGVuIHJ1
bm5pbmcgbm9uLU1TVA0KPiA+ID4gc3VidGVzdHMNCj4gPiA+IHRvIGVuc3VyZSBwcm9wZXIgdGVz
dCBpc29sYXRpb24uDQo+ID4gDQo+IA0KPiBIaSBSZWRkeSwNCj4gDQo+IFNvcnJ5IGZvciB0aGUg
bGF0ZSByZXBseS4gSSBkb24ndCBrbm93IHdoeSBJIGxvc3QgeW91ciByZXBseSBtYWlsLvCfmKvv
uI8NCj4gDQo+ID4gSU1ITywgSSBkb250IHRoaW5rIHdlIHNob3VsZCBza2lwIGFsbCBNU1Qgb3V0
cHV0cyBpbg0KPiA+IHRoZSBTU1Qtc3R5bGUgdGVzdHMgLSB0aGlzIHJlbW92ZXMgYSBsb3Qgb2Yg
Y292ZXJhZ2UuIE5BQ0sgZm9yIG5vdw0KPiA+IA0KPiA+IFlvdSB3aWxsIHNlZSBhIGxvdCBvZiBz
a2lwcyBhZnRlciB0aGlzIGFueSBtc3Qgc2V0dXAgd2lsbCBub3QgcnVuIA0KPiA+IGluZGl2aWR1
YWwgdGVzdCBvbiB0aG9zZSBtb25pdG9ycy4gV2Ugd2FudCB0byB0ZXN0IGluZGl2aWR1YWwNCj4g
PiBkaXNwbGF5cyANCj4gPiBldmVuIHRob3VnaCB0aGV5IGFyZSBjb25uZWN0ZWQgaW4gTVNULg0K
PiA+IA0KPiA+IFRoZSB0ZXN0cyAobGVnYWN5LCB0eXBlMSwgbGljLCB1ZXZlbnQsIHNybSwgbWVp
LWludGVyZmFjZSkgd2lsbA0KPiA+IHNraXAgDQo+ID4gZXZlbiBpZiBhIHNpbmdsZSBtb25pdG9y
IGlzIGNvbm5lY3RlZCB0aHJvdWdoIGEgTVNUIGh1YiB0aGVyZWJ5IGENCj4gPiBzaW5nbGUgDQo+
ID4gTVNUIGRpc3BsYXkgd291bGQgdGhlbiBnZXQgbm8gSERDUCBjb3ZlcmFnZSBhdCBhbGwuDQo+
ID4gDQo+ID4gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQo+IA0KPiBJIHRoaW5r
IGEgc2luZ2xlIG1vbml0b3IgaXMgY29ubmVjdGVkIHRocm91Z2ggYSBNU1QgaHViIG1ha2Ugc2Vu
c2UuDQo+IEJ1dCBpbiBNVEsgcGxhdGZvcm0gd2hpY2ggc3VwcG9ydHMgTVNULCBldmVuIGlmIG9u
ZSBtb25pdG9yIGNvbm5lY3RlZA0KPiB0byBhIE1TVCBodWIsIGl0J2xsIGdvdCB0byB0aGUgTVNU
IGZsb3cgYW5kIG1ha2UgdGhlIEhEQ1AgYXV0aCBmYWlsLg0KPiANCj4gQnV0IHdlIGZvdW5kIGEg
SERDUCBpc3N1ZSBpbiBNU1QgbW9kZSByZWNlbnRseS4gV2UnbGwgY29uZmlybSBpZiB3ZQ0KPiBz
dGlsbCBuZWVkIHRoaXMgc2tpcCBwYXRjaCBhZnRlciB3ZSBmaXggdGhlIGlzc3VlIGFuZCBsZXQg
eW91IGtub3cuDQo+IA0KDQpIaSBSZWRkeSwNCg0KQWZ0ZXIgd2Ugc29sdmVkIHRoZSBNU1QgSERD
UCBpc3N1ZSwgSSBjb25maXJtZWQgdGhhdCB3ZSBjYW4gcGFzcyBTU1QNCnRlc3QgY2FzZSBpbiBN
U1QgbW9kZSB3aXRob3V0IHRoaXMgcGF0Y2guDQoNClNvIHdlIGNhbiBkcm9wIHRoaXMgcGF0Y2gg
bm93Lg0KDQpUaGFua3MNCkphc29uLUpIIExpbg0K
