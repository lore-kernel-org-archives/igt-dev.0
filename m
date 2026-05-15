Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF307CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956DC10F46A;
	Fri, 15 May 2026 08:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EUlbHOW+";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="eFAUBCrh";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52CF10F46A;
 Fri, 15 May 2026 08:03:03 +0000 (UTC)
X-UUID: 7cce78ba503411f1a3561939bc42ff46-20260515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZOl8VvpBf/GoxaXnF7e4h9dW071rKnqFfDlUtMmWKYw=; 
 b=EUlbHOW+uNBkhEYgOKg76vkl1g3SMWhgU/thNVIJksF1hk6rmHjuWUv5uOLeqXRLw9+FoWvnOH3KQ7Yc18AcQBPyg1JtEcFkAJLLhrXIBjDjO6bYNwwOCRlMmXKGpvy7eGBpJ8VjTazuinFU5hfZ1o5SWsELy7i6E/i0DHtK8CE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:460734a2-4e94-4ccf-b85b-2ca3c69d94e1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:39f8767b-1fd6-4ee4-b486-88dbea9db487,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7cce78ba503411f1a3561939bc42ff46-20260515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 655585518; Fri, 15 May 2026 16:02:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 15 May 2026 16:02:57 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 15 May 2026 16:02:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvipag2vENDwrt72DsjKLU7gU0wfHNW1uv6XI5cNCrRY4Z3MhZ5LqRDqq3BLb6uTvHuyXZplXvH0onqethj/jXQ3fCbarjwz3UodVNPzHOplMWAQP81ipGfh6pPQEVetXVlisCYVLJp40D0aE+Scwm31q2Vt3eZkpGbB9v1kzK9XupDtNTvdKjbFKLaUbUKGrSNPi/RqQ4SxlngZJf1XMZ6YRcTykCQFZCTwSVoTYXO7mlTcd5j5YKpVWONTOhFh9EV7iidfYuXhR+eS/0C/p98KWvjkeN9v1eIq/di1vCPg8ILel8gs13Tns2kFuEgTFUkSQLws7mfCyE8mZiF8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOl8VvpBf/GoxaXnF7e4h9dW071rKnqFfDlUtMmWKYw=;
 b=JuhIcnSp/EOd8MssVrWB3/fO623OZHMzGVjcrxhPRWy5WK44I31oApEXIzkH3nOl7WmHOFN/PPyVxSxFWOKaCtUhDe7IRUcHTyQmZQakX/QBqUANyWW5+DQeiRNIXyE5hid+Ow3fhh5tGYLWVncjeMiJS4wUzILIbB5uESJFsS6eaQKbOpc6m8Y36bHLKzBR30B35ERI6iVEuu6X5r7aH2XqH4HlIpArOJ+wAhfQiJ70jJPlHfsynocCTI+I5k3CGOxxbnQ0W7SpNqaDiyh/IxoJ7BbPuEFslvFGUjseapbAWDJ+kIhUPzWKpm7MGTbFwjXknuXcCHsrA2mEFdRpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOl8VvpBf/GoxaXnF7e4h9dW071rKnqFfDlUtMmWKYw=;
 b=eFAUBCrh6dY6KRuMxJr/aClWwuLIH4xpsyYSIDo1UUGnH5y7voS3Wz9UwnFVFxJREHQPvwT30MaKzABQWULgkYgdlPKWnZiXm214L8RrIfHirOeGHYnfq4A4alcbg45I2J2ezW09iEfnWiFgFmSQok7171ipZs0ItdaeH7ku1dQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OSNPR03MB10328.apcprd03.prod.outlook.com (2603:1096:604:49c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 08:02:55 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 08:02:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "suraj.kandpal@intel.com" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-gfx-trybot@lists.freedesktop.org"
 <intel-gfx-trybot@lists.freedesktop.org>
CC: "navaremanasi@google.com" <navaremanasi@google.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "santhosh.reddy.guddati@intel.com" <santhosh.reddy.guddati@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Subject: Re: tests/kms_content_protection: clamp plane src/dst to output mode
Thread-Topic: tests/kms_content_protection: clamp plane src/dst to output mode
Thread-Index: AQHc5ECOzz5/MUEAGkO4ofb+H55yXLYOufYA
Date: Fri, 15 May 2026 08:02:54 +0000
Message-ID: <3f66cca0183086ab8ff8436e5baa81ffc763ffed.camel@mediatek.com>
References: <20260515052433.903588-1-suraj.kandpal@intel.com>
In-Reply-To: <20260515052433.903588-1-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OSNPR03MB10328:EE_
x-ms-office365-filtering-correlation-id: 4155bdf3-ca98-4a8d-279c-08deb2585eba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003|22082099003|38070700021|11063799003;
x-microsoft-antispam-message-info: pwN2P88uzbbWngVhWT/w7L3NLidcpPOwEx1VCXKOxi4vQZoRrEmhU25g+yM3guvD+ZHSQ7aUJqFLhLoQawTnaY6t+ma7BcmAtT9bJNzVo/fJHemtof1zDIWyBXZW9zA9XXr/BO1V60TSVu1vvxG38G2GMcmhkm2e6alF8cVCgDdXMr6xaTg+uN0Vlj0hNMUizufnzosCKPCmMm+M2LWlcJUXw6Jfki4w3kycYEHq8iL9vmXsJS/bEPlBc0709WmyBBXjbapIv9c7m7b7dM0FEFk1IJWwKDoNcrMBH66fK5GP9YtN4/QWd9NtULyDAIEKaXKyXz/rY4biplJQF+JiYTtEqstG0Q8F3lueAzahsKS94fIpDBSyz+aeNsS6zcmNd3chCizRjNcE9SaKSnkyrlKQboIMka3FM/Fn9E31In+lYxmYUu0ZOOTXkiq3TqNQDPMWRW9fB/3sz6Vyx1DQrtTVIu9rMTLTsqV6XeKAXU052997B4orgf6ITOy/FDW8Mfhlj4q+PQJBuJqhkq7eIMDz8bPWKm2Cao0RhSuN9y2B1/BvBIg14iv6TKWkgiszM08mO9hzWelt4GzODIVcDEkyF2TJjnU2w5MEqyuL0vLSnNAcVMUJ24BEXg/smZtVf62TQLnPpofh2Wk6jraoUAC3q6pyynqpSHX7waIGtYwR+NIzfvc9aOWGTmAoV2hw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003)(22082099003)(38070700021)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkt3cWhrVnlMS3k3VjRKUTU4L2tWMi85SVZHUkxqakNEdlcxdWVoSDB2MUx6?=
 =?utf-8?B?NGllVmp1eXlVSGNIelJNM0FkUS9FNUVmNnpBTERmUXl5YTlqcXU4QTI1RGVX?=
 =?utf-8?B?SzNVT3NRTmdiVDRqQ3B0bVljRTVqb0d4dGdRaUpYUk1Pdm42OUIreEkxN1ZM?=
 =?utf-8?B?c3o3MVUrQzNNbStDR0dkM3Z3WldKSGNOK21rUUlWcll4NnZrVjI2dVI5MWhP?=
 =?utf-8?B?QWNzZkhBc3hOL05ocktScTdwcjZaZ0pCaGVxZHJuRG80L1hHRVI0dkl6Q0h1?=
 =?utf-8?B?aUtuNzVhSkMyeDFsL2hXSFdnWTJ5OXQ1cG1CNkdIeXlTMjdTUEVSVHAxSjEv?=
 =?utf-8?B?bmU4S2NCQVBpRmJPYUc5ZmhvZUQzSFM4MnRpdHpBN3NCRTNvL0JpNVdwb0xG?=
 =?utf-8?B?RzU4cHltQkxocjVXbnVvWktsYVVUYW8yck5xeDhCUlpkcGpBbXhyS05mQUhL?=
 =?utf-8?B?cm93Q1QzM2s0Tm90cFRaQm1VSzdkV0lRZ0tJV3J2eTV5Yk1FcjhmZE9nUXps?=
 =?utf-8?B?eVdjam53WE5paHpNSjFYSEh4WGZKYzYxaVllSDV6bFNiVXhQT3RsU2ZZMGRX?=
 =?utf-8?B?SmVFeTFZWjJQcit6R1h5RWdBcFJ6eFhNZzIxWnRSQ3hqcDJvTDNJNyt3b1A3?=
 =?utf-8?B?WmpkUllsckJUTC9yeUVibllUbHZQbnhRa21BVjFtMlNvMVhNWktqWUl4eFBE?=
 =?utf-8?B?WG05eGtDWGt4eUZoSW82UFJ3TXRlamlTbm1YdUxtcURSK1VRa2ZKeUtWME1H?=
 =?utf-8?B?UG5mdTBWWnBtcmxydjMyK1hmUldRcmdRaTdiQ2ZabGhYTVhORHR5dWk2NDFM?=
 =?utf-8?B?MTVIWHJESUdlbGlNTnQvVXBvaXdKUnVocjRyK1hrZXlVSXczTHJpOU16WDJT?=
 =?utf-8?B?RDM0Ykh6UDNEVDRJUEpPT3NOd2dhZWw5ZE90M3NKbndNVHN0NlNaOGxIaitF?=
 =?utf-8?B?dHFYSlpVRDJrOVRNanlwTGlJT1l5NFBwMGR3cFlXVnhURVpPRmgxM0F6OU4w?=
 =?utf-8?B?WWJNdlExRktkclNGcGNhc0FCVFhZbm9ndmZXbWRiTE1Ra0loMUluSU9MQjR2?=
 =?utf-8?B?QmIvOTdiM3hhcTNWdCtyWW9aY2lnWlIyR3NxRm5QcTYxdFhJQTlNaDBPaS9i?=
 =?utf-8?B?cFVvTW9FSWovQ3JuZXRUQlVSbVBweDdzR0EvVXUzSEZEQVRzRkVIMTZUVU5s?=
 =?utf-8?B?ZVRXVGppTUwydithN3BtcWlqdzRMUkZXelZPUThoeEtBMW9vbmZGWW5hYkRB?=
 =?utf-8?B?QlBVYVhJZTNUZ2JmemdmY3RZeEtNY1JWcXRtamVSNzBUb0hWNVQwaFZrWHRv?=
 =?utf-8?B?d1JoQ3Axc0ZPYWo1Z1NvYzRZSWZNKzROamJ4TVExSUFXRHVZdUdCZ1lkaVR0?=
 =?utf-8?B?N2JGbWZYbFQrYVY2QjVtU0FhSnpKVU1taFFYMy9NeHYrTTRUWTVISVBJVTNV?=
 =?utf-8?B?OEtxcXNaTXA1UXRBUXdzMEN3L0d5SkNyQlJwMVZsbkhHdjA2QVErb1lXdC9i?=
 =?utf-8?B?akdHRFlxOExtM1R3dDF1V0RKNkY1b2NabWxyNGhwdG5wOXkrdE9rakx6V2tm?=
 =?utf-8?B?MGdEQ3ZQR2V0ZGpIeHEzSTAwYlBSM1REc1pBdW5Zc0dwempPcndOVHpmN2Yv?=
 =?utf-8?B?UnJnQmswdkhHeHlRdHRyTy9HMVpQU1NPcHNicXRUTFVvS3pjOTRYMWdTYVFV?=
 =?utf-8?B?VldobHBQTEN4ZUsxcFE5K0MyUEhaanRqQ0hCUW1JQjBBSGw1bzBGMndDc3gx?=
 =?utf-8?B?bElvb25vc05DLzRHNGhsYTBOUVdDZDJhOXVCRm5BRHhOZER2NzB2SVNFL2hC?=
 =?utf-8?B?TnNCVUJCdHozZlYzM1RaZTg0eEZMSHJJU0p3bkFSUmgwVENzYVZRUy81RUpO?=
 =?utf-8?B?ZEIrMzhnazk3eWNsU2hRbFN1S1cyR01yRmcwNmhScUJOdW5aVUtjTjJ4ek5U?=
 =?utf-8?B?VXU0M2tRREhqOXZqMVdsYy84Ukl2UTVEbk1aUXZGSURoUVYrd1FHVzJWNG9p?=
 =?utf-8?B?b1I0WThQczBpNzhYbVFSai9YVFJWRGFZQXNHMzc0bk15ZmJEbFhxZjVudSs1?=
 =?utf-8?B?Q0V2MlNhOWhnQ3EvbjlXU3JTeTkvUmV5YlplODZnVUoxRi9NUjVqbVdLMTZY?=
 =?utf-8?B?Q1pkWlRBU1BzUXk0ZE1uZ2JPM1VMMUNQSWNYL2w2cWEwclZxejVGTUNza3h0?=
 =?utf-8?B?M2UzMjk1MXBoZmxEQUVhWUlERGEyQUVzMjVVNXZ5YXV4RmJPL2pJa1FZdFRu?=
 =?utf-8?B?SXhyem9ZT1R1UHBJbU5WQzN1RjdVY2tHQS9kVWJ0T29hVUFjamdMaW1qdnF3?=
 =?utf-8?B?Uy9rUTYwaWc0YmJ3c2p3b29LVnhrcXQ4QnBNazVMSzJ3VHBrbGhiTVo5dW42?=
 =?utf-8?Q?H3sEkU2oCcUX6Mzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D740488FEDCA3E48AEB4019C52D62D25@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QpVX8daNioVk/SiJ6UCTyRHR+bmhNJ9n403PibiQcRUTrxh2ZmUQIllMWhB4z4TL8G1FMk8YwlRXHkMcZRMoRHAqmnI/qjlz8PPBAcw0qzzU6SVUIV9McFJRqDIkpqNnEReu5nOs6qm7o6AnouV/AP2QxnvuuVs5Xa9x199e0UNICQOFWLFMroWfl2UA7CUXD3ZhlLHhtZ64TRsuEmyoBQ8otJiUn42QRQ1AsHi7hfQDcqTyMKZ50Sa+VRhH4n3cKUtGNtDhqGtaUOLBpcoxIoYbKbBK8YUGTmwHKeFssfL5eCSZykAWripsH4sXR5tmPfoU+8KsTQ3kGJhuuZfhIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4155bdf3-ca98-4a8d-279c-08deb2585eba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:02:54.8506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/ZdF3qnpl84Z8Vd3XneoMwFNERWuFxv2DUGyztBGc9CStTHZ4Xl0pyJM9Wh5M5kiqq9eseVBB80+9AEs1RaYssXxbH3/XFU8t7Qv9bxA6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10328
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

T24gRnJpLCAyMDI2LTA1LTE1IGF0IDEwOjU0ICswNTMwLCBTdXJhaiBLYW5kcGFsIHdyb3RlOg0K
PiBjcmVhdGVfZmJzKCkgc2l6ZXMgdGhlIHNoYXJlZCByZWQvZ3JlZW4gRkJzIHRvIHRoZSBtYXgg
d2lkdGggYW5kDQo+IGhlaWdodCBhY3Jvc3MgYWxsIGNvbm5lY3RlZCBvdXRwdXRzLiBXaXRoIHBh
bmVscyBvZiBkaWZmZXJpbmcgbmF0aXZlDQo+IHJlc29sdXRpb25zIChlLmcuIDM1MDR4MjE5MCBh
bmQgMzg0MHgyMTYwKSwgdGhlIEZCIGVuZHMgdXAgbGFyZ2VyDQo+IHRoYW4NCj4gYXQgbGVhc3Qg
b25lIHBhbmVsIGluIHNvbWUgZGltZW5zaW9uLiBpZ3RfcGxhbmVfc2V0X2ZiKCkgcmVzZXRzIHRo
ZQ0KPiBwbGFuZSBzcmMgYW5kIGRzdCByZWN0YW5nbGVzIHRvIHRoZSBmdWxsIEZCIHNpemUsIHNv
IHN1YnNlcXVlbnQNCj4gY29tbWl0cyBzdWJtaXQgYSBzb3VyY2UgcmVjdCB0aGF0IGV4Y2VlZHMg
dGhlIENSVEMgYWN0aXZlIGFyZWEgYW5kDQo+IGF0b21pYyBjaGVjayByZWplY3RzIHRoZW0gd2l0
aCAtRUlOVkFMIGJlZm9yZSBIRENQIGF1dGhlbnRpY2F0aW9uIGNhbg0KPiBzdGFydC4NCj4gDQo+
IENsYW1wIHRoZSBwbGFuZSBzb3VyY2UgKGlndF9mYl9zZXRfc2l6ZSkgYW5kIGRlc3RpbmF0aW9u
DQo+IChpZ3RfcGxhbmVfc2V0X3NpemUpIHRvIHRoZSBvdXRwdXQncyBjdXJyZW50IG1vZGUgYWZ0
ZXIgZXZlcnkNCj4gaWd0X3BsYW5lX3NldF9mYigpIGluIG1vZGVzZXRfd2l0aF9mYigpLCB0ZXN0
X2NwX2VuYWJsZSgpLA0KPiB0ZXN0X2NwX2Rpc2FibGUoKSBhbmQgdGVzdF9tc3RfY3BfZGlzYWJs
ZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+DQoNCkhpIFN1cmFqLA0KDQpBZnRlciByZXZlcnRpbmcgbXkgc2VyaWVzOg0KLSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE2NDA1Mi8NCg0KVGhpcyBw
YXRjaCBjYW4gcmVzb2x2ZSBteSBwcmV2aW91cyBpc3N1ZS4NClRoYW5rIHlvdSBmb3IgeW91ciBw
YXRjaC4NCg0KVGVzdGVkLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+DQoNCj4gLS0tDQo+IMKgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwgMjkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb250
ZW50X3Byb3RlY3Rpb24uYw0KPiBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYw0KPiBp
bmRleCBjNTk0NDFmMTEuLmQxYjdjNTg2MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2NvbnRl
bnRfcHJvdGVjdGlvbi5jDQo+ICsrKyBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYw0K
PiBAQCAtMjY0LDE2ICsyNjQsMjIgQEAgc3RhdGljIHZvaWQgbW9kZXNldF93aXRoX2ZiKGlndF9v
dXRwdXRfdA0KPiAqb3V0cHV0LA0KPiDCoAlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEu
ZGlzcGxheTsNCj4gwqAJZHJtTW9kZU1vZGVJbmZvICptb2RlOw0KPiDCoAlpZ3RfcGxhbmVfdCAq
cHJpbWFyeTsNCj4gKwlpbnQgd2lkdGgsIGhlaWdodDsNCj4gwqANCj4gwqAJbW9kZSA9IGlndF9v
dXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gKwl3aWR0aCA9IG1vZGUtPmhkaXNwbGF5Ow0KPiAr
CWhlaWdodCA9IG1vZGUtPnZkaXNwbGF5Ow0KPiDCoA0KPiDCoAlwcmltYXJ5ID0gaWd0X291dHB1
dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsDQo+IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiDC
oAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksICZkYXRhLnJlZCk7DQo+IC0JaWd0X2ZiX3NldF9z
aXplKCZkYXRhLnJlZCwgcHJpbWFyeSwgbW9kZS0+aGRpc3BsYXksIG1vZGUtDQo+ID52ZGlzcGxh
eSk7DQo+ICsJaWd0X2ZiX3NldF9zaXplKCZkYXRhLnJlZCwgcHJpbWFyeSwgd2lkdGgsIGhlaWdo
dCk7DQo+ICsJaWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnksIHdpZHRoLCBoZWlnaHQpOw0KPiDC
oA0KPiDCoAlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIGNvbW1pdF9zdHlsZSk7DQo+IMKg
DQo+IMKgCWlndF9wbGFuZV9zZXRfZmIocHJpbWFyeSwgJmRhdGEuZ3JlZW4pOw0KPiArCWlndF9m
Yl9zZXRfc2l6ZSgmZGF0YS5ncmVlbiwgcHJpbWFyeSwgd2lkdGgsIGhlaWdodCk7DQo+ICsJaWd0
X3BsYW5lX3NldF9zaXplKHByaW1hcnksIHdpZHRoLCBoZWlnaHQpOw0KPiDCoA0KPiDCoAkvKiBX
YWl0IGZvciBGbGlwIGNvbXBsZXRpb24gYmVmb3JlIHN0YXJ0aW5nIHRoZSBIRENQDQo+IGF1dGhl
bnRpY2F0aW9uICovDQo+IMKgCWNvbW1pdF9kaXNwbGF5X2FuZF93YWl0X2Zvcl9mbGlwKGNvbW1p
dF9zdHlsZSk7DQo+IEBAIC0yODQsNiArMjkwLDggQEAgc3RhdGljIGJvb2wgdGVzdF9jcF9lbmFi
bGUoaWd0X291dHB1dF90ICpvdXRwdXQsDQo+IGVudW0gaWd0X2NvbW1pdF9zdHlsZSBjb21taXRf
c3QNCj4gwqB7DQo+IMKgCWlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAmZGF0YS5kaXNwbGF5Ow0K
PiDCoAlpZ3RfcGxhbmVfdCAqcHJpbWFyeTsNCj4gKwlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQo+
ICsJaW50IHdpZHRoLCBoZWlnaHQ7DQo+IMKgCWJvb2wgcmV0Ow0KPiDCoA0KPiDCoAlwcmltYXJ5
ID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsDQo+IERSTV9QTEFORV9UWVBFX1BS
SU1BUlkpOw0KPiBAQCAtMzAyLDcgKzMxMCwxMiBAQCBzdGF0aWMgYm9vbCB0ZXN0X2NwX2VuYWJs
ZShpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCj4gZW51bSBpZ3RfY29tbWl0X3N0eWxlIGNvbW1pdF9z
dA0KPiDCoAlyZXQgPSB3YWl0X2Zvcl9wcm9wX3ZhbHVlKG91dHB1dCwgQ1BfRU5BQkxFRCwNCj4g
wqAJCQkJwqAgS0VSTkVMX0FVVEhfVElNRV9BTExPV0VEX01TRUMpOw0KPiDCoAlpZiAocmV0KSB7
DQo+ICsJCW1vZGUgPSBpZ3Rfb3V0cHV0X2dldF9tb2RlKG91dHB1dCk7DQo+ICsJCXdpZHRoID0g
bW9kZS0+aGRpc3BsYXk7DQo+ICsJCWhlaWdodCA9IG1vZGUtPnZkaXNwbGF5Ow0KPiDCoAkJaWd0
X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZGF0YS5ncmVlbik7DQo+ICsJCWlndF9wbGFuZV9zZXRf
c2l6ZShwcmltYXJ5LCB3aWR0aCwgaGVpZ2h0KTsNCj4gKwkJaWd0X2ZiX3NldF9zaXplKCZkYXRh
LmdyZWVuLCBwcmltYXJ5LCB3aWR0aCwNCj4gaGVpZ2h0KTsNCj4gwqAJCWlndF9kaXNwbGF5X2Nv
bW1pdDIoZGlzcGxheSwgY29tbWl0X3N0eWxlKTsNCj4gwqAJfQ0KPiDCoA0KPiBAQCAtMzE1LDEz
ICszMjgsMjAgQEAgc3RhdGljIHZvaWQgdGVzdF9tc3RfY3BfZGlzYWJsZShpZ3Rfb3V0cHV0X3QN
Cj4gKmhkY3BfbXN0X291dHB1dFtdLA0KPiDCoHsNCj4gwqAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxh
eSA9ICZkYXRhLmRpc3BsYXk7DQo+IMKgCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiArCWRybU1v
ZGVNb2RlSW5mbyAqbW9kZTsNCj4gKwlpbnQgd2lkdGgsIGhlaWdodDsNCj4gwqAJYm9vbCByZXQ7
DQo+IMKgCWludCBjb3VudDsNCj4gwqAJdTY0IHZhbDsNCj4gwqANCj4gwqAJZm9yIChjb3VudCA9
IDA7IGNvdW50IDwgdmFsaWRfb3V0cHV0czsgY291bnQrKykgew0KPiDCoAkJcHJpbWFyeSA9DQo+
IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUoaGRjcF9tc3Rfb3V0cHV0W2NvdW50XSwNCj4gRFJN
X1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ICsJCW1vZGUgPSBpZ3Rfb3V0cHV0X2dldF9tb2RlKGhk
Y3BfbXN0X291dHB1dFtjb3VudF0pOw0KPiArCQl3aWR0aCA9IG1vZGUtPmhkaXNwbGF5Ow0KPiAr
CQloZWlnaHQgPSBtb2RlLT52ZGlzcGxheTsNCj4gwqAJCWlndF9wbGFuZV9zZXRfZmIocHJpbWFy
eSwgJmRhdGEucmVkKTsNCj4gKwkJaWd0X2ZiX3NldF9zaXplKCZkYXRhLnJlZCwgcHJpbWFyeSwg
d2lkdGgsIGhlaWdodCk7DQo+ICsJCWlndF9wbGFuZV9zZXRfc2l6ZShwcmltYXJ5LCB3aWR0aCwg
aGVpZ2h0KTsNCj4gwqAJCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUoaGRjcF9tc3Rfb3V0cHV0
W2NvdW50XSwNCj4gSUdUX0NPTk5FQ1RPUl9DT05URU5UX1BST1RFQ1RJT04sDQo+IMKgCQkJCQnC
oCBDUF9VTkRFU0lSRUQpOw0KPiDCoAl9DQo+IEBAIC0zNDMsMTAgKzM2MywxNSBAQCBzdGF0aWMg
dm9pZCB0ZXN0X2NwX2Rpc2FibGUoaWd0X291dHB1dF90DQo+ICpvdXRwdXQsIGVudW0gaWd0X2Nv
bW1pdF9zdHlsZSBjb21taXRfcw0KPiDCoHsNCj4gwqAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9
ICZkYXRhLmRpc3BsYXk7DQo+IMKgCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiArCWRybU1vZGVN
b2RlSW5mbyAqbW9kZTsNCj4gKwlpbnQgd2lkdGgsIGhlaWdodDsNCj4gwqAJYm9vbCByZXQ7DQo+
IMKgDQo+IMKgCXByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKG91dHB1dCwNCj4g
RFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+IMKgDQo+ICsJbW9kZSA9IGlndF9vdXRwdXRfZ2V0
X21vZGUob3V0cHV0KTsNCj4gKwl3aWR0aCA9IG1vZGUtPmhkaXNwbGF5Ow0KPiArCWhlaWdodCA9
IG1vZGUtPnZkaXNwbGF5Ow0KPiDCoAkvKg0KPiDCoAkgKiBFdmVuIG9uIEhEQ1AgZW5hYmxlIGZh
aWxlZCBzY2VuYXJpbywgSUdUIHNob3VsZCBleGl0DQo+IGxlYXZpbmcgdGhlDQo+IMKgCSAqICJj
b250ZW50IHByb3RlY3Rpb24iIGF0ICJVTkRFU0lSRUQiLg0KPiBAQCAtMzU0LDYgKzM3OSw4IEBA
IHN0YXRpYyB2b2lkIHRlc3RfY3BfZGlzYWJsZShpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCj4gZW51
bSBpZ3RfY29tbWl0X3N0eWxlIGNvbW1pdF9zDQo+IMKgCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFs
dWUob3V0cHV0LA0KPiBJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTiwNCj4gwqAJCQkJ
wqAgQ1BfVU5ERVNJUkVEKTsNCj4gwqAJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZGF0YS5y
ZWQpOw0KPiArCWlndF9wbGFuZV9zZXRfc2l6ZShwcmltYXJ5LCB3aWR0aCwgaGVpZ2h0KTsNCj4g
KwlpZ3RfZmJfc2V0X3NpemUoJmRhdGEucmVkLCBwcmltYXJ5LCB3aWR0aCwgaGVpZ2h0KTsNCj4g
wqAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBjb21taXRfc3R5bGUpOw0KPiDCoA0KPiDC
oAkvKiBXYWl0IGZvciBIRENQIHRvIGJlIGRpc2FibGVkLCBiZWZvcmUgY3J0YyBvZmYgKi8NCg0K
