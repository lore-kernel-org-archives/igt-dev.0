Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B5C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 16:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1181E10E085;
	Thu,  9 Jul 2026 16:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="O5MLR20Y";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Feb565Y/";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D010E085
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 16:16:34 +0000 (UTC)
X-UUID: 8af383747bb111f1b1788b6acf885367-20260710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=L6feozsFhKtKUEwJxOLb3Lxv/P6HYgyJ8VcY3UrQi+o=; 
 b=O5MLR20YaV2GVaw34KqDVsU1G9uldxeq7935Bdqdc0In69pgPtjgeqfEQDlQlVqu8hqTQfQmiWS2F2FDuzAExQ1/OEhdwQwUJc2pxQe10Sqm1DLDQrQ/5CgG5ey9wQTnZsyVPKxvEc9MKt32GTvTi1BuwM3jq7mWJeWWRe6vnuY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:5da1ce85-6aaf-49db-be20-cd1afb1b36c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:d64ded18-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8af383747bb111f1b1788b6acf885367-20260710
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 595945737; Fri, 10 Jul 2026 00:16:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 10 Jul 2026 00:16:28 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 10 Jul 2026 00:16:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1U9XEX2ULo+P2+bEOup3OYxXBvEUb9fxxhpKO/3gVZqtEprPg+IoKKIFqJ39aFhPPTOGLGX6V7NaX5V4dn1da1ZbILbU75KelT5nj12bpgMDPikwhdcIq/jOMsXHR1A/yskogm3RvOZrMLEJwrrSGswKlsBaooAuqwdj+mDKpOaaCjcHelp40RxB/JboX8yK6xbtJH4+CHhBxOYd87S3kHmin88rFNGeBqAm+7fc8Ya09hQKsrzyEvuej6hiaIqGXw5Nvb/wIrsmfR99QsfCZo4gt3TEDTdow2oluH2AWro6hbMmzyqldon1uzgPGxUythLVNiZBV70nBS7f8QJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6feozsFhKtKUEwJxOLb3Lxv/P6HYgyJ8VcY3UrQi+o=;
 b=H8bQcxiutVUoWkPm9dDXbKYRF7ufobNO6NxTZqTXJJDjJJaO6Bi6KcH6Vsao5RpNilc95U7mDW7FuscGMcMKijYU4yU/uyfwI/nBwPukg7a1HvGPjNRX6zGNSf6jqcZKqOsFjg5bCNm8xTBmF5GoK2QPub/KE72j16K1OyQFpajwdIEgIcouXgh2Hpk0b6h89tPnvmwyvA/ViWc1ymPJuYMX70vf49crAunmiV4KmP5McRvKrtlnM/Ke1WLr41aFSmJvaBAQyq4M+M25CX6OWUQ4MDA83PvyCKxyv+Q29rsU4XcEDoWjyDg8QmkSqUfQhuHa6F9K1Snmfgu7rYfF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6feozsFhKtKUEwJxOLb3Lxv/P6HYgyJ8VcY3UrQi+o=;
 b=Feb565Y/xHadq3T+Kt5VOnIJVaO8NzPJCWwoTKHqprlPc0yIDGHTANqYxDpO8I1zR6HBZ+HWE3u4w/xE4cmLYBshsIHWSN6tv7IzrMmwrY+gNvGYT7qLcpBgkqo0YEH+z1QXNGeEeEBHtY2R8UftVA80xoWj3gslVBTI1ry+NVM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8518.apcprd03.prod.outlook.com (2603:1096:405:63::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 16:16:25 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 16:16:25 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "navaremanasi@google.com" <navaremanasi@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Thread-Topic: [PATCH i-g-t v2 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Thread-Index: AQHdAVpPV31AF/fQ5UaAFPHJvUXeIbZlVTKAgAAkqoA=
Date: Thu, 9 Jul 2026 16:16:24 +0000
Message-ID: <9aaaa3237e1d5496f556b0a66a7fb86a19efd706.camel@mediatek.com>
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
 <20260621084445.614024-3-jason-jh.lin@mediatek.com>
 <20260709140509.4utfunjpn4uaejup@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260709140509.4utfunjpn4uaejup@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8518:EE_
x-ms-office365-filtering-correlation-id: 07a38c78-6923-47d3-7e96-08deddd56ca7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|7416014|1800799024|376014|921020|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: pGXXH2vdUm2N6cs+X53xOjIKLg1IabcZZMUHDaXV81D6n849GArC/QLCGkFgk8Kn51kOUbAHfzFuyPqSTFMXv7kE4YerLWN7APcU935HQQhzZKES8K8XA7lGJsWX4PiBsBM0HbA1aexKaETA41wGSre12SEbv4p9oYhRyxDw3tONfvVFFB48Rv6+5kHhtHNILQ9JepeEVShxChbj5u75i5ZjC2x2maF/ZuazV4J53v9dcwLH6pPH5yfIKCx06FNtkNvqVS2Sscb/0o3DlE98AlZ+S+9pdOYK7GBlsijR4o9wfQTOnwPrt9Rg/csANAnyv+18vfh6zfICsEJQlY5DSyeuset3zjLBxxFozgxHXt5N3V8olUj/zVt7XAbXLWNplv/RrSArMEViPEOFn2RZg7GtXpDqIEv55ShDnnTNwCp297COg2JRCrUezBixCB9X0+KdSXPQz8M3hOA+JFIV3XIhmrnYWVhhv5rHHfTKNHruD/C/DZGXyLCOaFRVCIYDAyIGs6BrUkdE+aVZ7qGjgr6iwXLzwagu3OkRJ6+Mg7Sbu/KmgKcAF/44yo/0pQET/U2YX9h3zMJ+l8jv0uSK8H//JtWaG38EOCN/BromuXsCZgsGGpH3Oi11ZlzJm0mveswBjtQFgew9OL7AZiOixY1VQtvvwJm/T519pbR0Ls5WSvarhczZDy3EsCMbCd+G7/ha405x7ldrBviuSK21xKmGWR8YUOPYHAKHKJxeu7U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(921020)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUxYZzdNWVA4SXIvMDBsVHloRlBidEhyMmtubFgyMTk0VzdPeE95SlpJTlcz?=
 =?utf-8?B?RzgzYUpodEhWTnZrdDZ1TkhxZlBDRTVhRUhWaGFCLzNtLzAxRytVTGlXYUtB?=
 =?utf-8?B?V0Qxa1FBNVVGK2lnTzlKQUFMY05EbFY4Y3hTb09sVVFNQnVyQ092OVdZdzc5?=
 =?utf-8?B?S29jQU9lWHhXRmpwS1B6dmxtMFAwekhBalhBYnE0cVQ0eVRCSDI2SHFMTUh2?=
 =?utf-8?B?RVpMVXhmQVVadStkVkUzRWxGbXZtT1FVd0lsZ0RGSytZenFzUUFzTlJSU3hO?=
 =?utf-8?B?Z2JLZ0FzMFE0aHJvOTNJQVBYWmo1Lyt0TUlBMDNSWStTN1RLTkdZSU9WTWF2?=
 =?utf-8?B?SzhJblI1RFNia1R2QkNYRFMxOXRMc1pRbWlxUlpUNk9QUlNjNlVpSS9TL1l4?=
 =?utf-8?B?bTg1UUl1Z2N2MUZUY1lwY1BOM2Uwemx6VVhXZG9PdHVDWkYwNmVSWStoOHdC?=
 =?utf-8?B?NmpOODhvWm9RaHd6U0FtODQ4WDNxM3dXd01uUUpmQXF5K1VzaEc3WTJLQ0ZX?=
 =?utf-8?B?K2crajNSVUNyenZVKzNScjRYSVBBMit0aWNuWDZjQUpxMWE2RHNjN0NBd1Bm?=
 =?utf-8?B?aTduVVltZkxMZFBHek40YnRKMDFjY2NtdVFTekFuVGZoV1F5ODhOd2hVZGwr?=
 =?utf-8?B?WFBCZWZJalRFbldwS21OZVAySkRtMmNCYUZRYXMxU3F6cXVYdTYxTDhOZzRq?=
 =?utf-8?B?YnIxdktrNmlZaDNEWjFLK0RESnFCS2JXM1ZHR0VzYW1ycElEdFRIN3VpRWpz?=
 =?utf-8?B?eWFnbm5vajRIbm90L1JFNklTcVhXZ0hidDZpbWIxVzY1S3cxQWE1RkRQSFhm?=
 =?utf-8?B?c2I2VHFudVR4VnpOTWp6OTlRbkZvWkZML1ZDQVU3endodXZlNGtuYnhnYmIw?=
 =?utf-8?B?NHBJWFNhKyt3cklMSWZDUURCV3hjK2N3WGxZS3BTTHhuT1BEdmtvbFdGU1Zv?=
 =?utf-8?B?VkdNWDhBRytXelFPY0k5SkN3M0V0ZXhxdUsrZmUvZk5aV0R2NEVHUFNTckRz?=
 =?utf-8?B?NHFFaHhTQ2JXRFZuRmhjRHBXa2xYRkdTeTJ4RDVQZSsxOVJNdWI4ODRnQzZS?=
 =?utf-8?B?bHQzdmRmYzVVd2ZOaWQ0TGRzb3VEWnppbUZIUjNsYzd4NzNIVFFMeEVZbWpj?=
 =?utf-8?B?TzVITXg4KytJK0J1MTNMSkJqWkR5dm5COEg5RnVLODg4UnFuTTdTZ3FpcS82?=
 =?utf-8?B?WTVZc0tNTnpVdFZDUGo3bXg4eDd1eTZEZzlpZThMWmNabXZtMTh4S1luSGd6?=
 =?utf-8?B?U1BIQXN2eUdGaXdVOFNXcmtCb25QMXFlQVk1RWZ3dlU4bWpOTGllV1NJMEtZ?=
 =?utf-8?B?QnFuSVk0Z29tdUh6UTEwakl2bkJUbkNzU2ZKWVBSVWMrT1AzYk5Nb3BoSk4v?=
 =?utf-8?B?OTRxZWx4UXZQWHFTV2FjVDBiL1Z4Z1BBaklRWlJIR1lTUjExNkRxQUh2WFpt?=
 =?utf-8?B?VmZ0T3RJTHdZckIvUmllTzBQRDFqaDFOTlVpeVY1Tmx0Vy8vRVQyanlkeXBu?=
 =?utf-8?B?cGVUMXBWWFNySE9Qa3NsWmxLMnYxWEV5R0lhSUVHWDVRZU5mVTFBcEtnK29F?=
 =?utf-8?B?czM4WWY4Z0NWSkNaUjZEcWVMM1AvTE1mZTZ0WVVUcm5VbkJjejdYeXVuK1Z1?=
 =?utf-8?B?dmkvQzc2djA5dllnUDJXWjM5dExpdkRubTBSZUR3RWxzSnRVRjd2eEZBamw3?=
 =?utf-8?B?RExRUXRvcDI1TUl6Q1p3T083eisyemN0d056Ym9MQUs0enE0MXJpOHB6SlJN?=
 =?utf-8?B?RE5uaC9STXBLSXJzeUMyZnRvdVl5aGJEM25yTngyakNSSGw3enBuUkZNcExq?=
 =?utf-8?B?cFN4VWNqRi92ZGZiVkNoSG1meUNZbmVyQzk2QjBRRENQcDBKcTJ2SjlXZEI4?=
 =?utf-8?B?VFBUcy9yazlzYktzTUFqd2lGOUs3Rm03SWxSSnphcGdmbHN1d3ZhNmZRQUl2?=
 =?utf-8?B?RWdNTUlVZE1jelQzNUR1MG9qa2l2TEFuUXVoUjkwOWVEYnF5N1JHOFRnYnBv?=
 =?utf-8?B?ekkvQ2h4VnR4cU5yUnU4M2xlNWRobmlWVEtJVHNsd3hGcEZTRFNiV3daSW0w?=
 =?utf-8?B?dTRuN3ZZNEhiS2lpRkNhbldiQ05VSnhIVzU2ZTJHU1g2Mm9Ma1hoUXFVcEVs?=
 =?utf-8?B?a2dLN1c4Q1JyT1VPYXlWd2JqSkovMmh6NGJUUUlFSUJrQ3FZWVZ6eTVmcGhx?=
 =?utf-8?B?bE9qUnczNDdVSmVqZXF3MUJFQUFGeEdPdTZBNHJEd21BMDJOZnRjTldXRG1V?=
 =?utf-8?B?ejRGdUk2QVFOdUk2WjJ1TmN6TCtnUk5hVlhNZWtPN0lHbDZGeEMyV1RpMy94?=
 =?utf-8?B?bmRxOG9EUElWbkpuaHF3aWlwZk9zVWRhcEU2ekhzSGdLZGFEclk0UEZCOVI5?=
 =?utf-8?Q?aQMgKUDWnMugPpos=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D7DA6FA89B7F54489A647899B162320@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Sbb46OaZp8N8gpe2c883zVKroD/rGxsPrT7RRobjN1YjX7qmkqJBq/5Th26kYCPOolIaKEcEGfVazweVFjZ5MYut0H1SgWqkORVGnHTTk9s0ExLKwsZYbYzsEAKiUXMZNKzxwF5MXYhLM9ACNcjtKl9sq5qAQfqfbI9GtCNutQLrNDjnt4iaDwDcXwPXl3MJ0FaGrGezM8QA/2iOA6sxZvbiB3lV+eTIFgAqlk6Yb5/KhX6WlhY5c6ZGayDHCeS1DOBpB/gdZprREik/uo8T77pTmOMHyYSQbYfuFjFhLYqOk4x8o6YRkoKt1zinMSMabyBbRtoTMFSPTvQCz7DGTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a38c78-6923-47d3-7e96-08deddd56ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 16:16:24.9177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfEbKMzSIZpu+XLd31YbcLI6rQ4lHgk/bCp3xdieQAlGa/jvyy7nlKqswumjp39Gsyonbon0AGrtDo5XmzT3ZDHQ2XyPOsqyWnEyNy9jGGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8518
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

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDE2OjA1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEphc29uLUpILA0KPiBPbiAyMDI2LTA2LTIxIGF0IDE2OjQzOjI4ICswODAwLCBKYXNv
bi1KSCBMaW4gd3JvdGU6DQo+ID4gQWRkIGEgbmV3IHN1YnRlc3QgdGhhdCBkaXNhYmxlcyBDUFUg
ZGVlcCBzbGVlcCB0byBlbGltaW5hdGUgd2FrZXVwDQo+ID4gbGF0ZW5jeSBpbnRlcmZlcmVuY2Ug
ZHVyaW5nIHZibGFuayB0aW1lc3RhbXAgdmVyaWZpY2F0aW9uLg0KPiA+IA0KPiA+IFRoaXMgYWxs
b3dzIHBsYXRmb3JtcyB3aXRob3V0IGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgdG8gdmVyaWZ5DQo+
ID4gdGhlaXINCj4gPiB0aW1lc3RhbXAgYWNjdXJhY3kgaXMgY29ycmVjdCwgc2VwYXJhdGUgZnJv
bSBDUFUgaWRsZSBpbnRlcmZlcmVuY2UuDQo+ID4gDQo+ID4gVGhlIG9yaWdpbmFsICJiYXNpYyIg
dGVzdCByZW1haW5zIHVuY2hhbmdlZCB0byBkZXRlY3QgYW55IHRpbWVzdGFtcA0KPiA+IGlzc3Vl
cyBpbmNsdWRpbmcgQ1BVIGlkbGUgaW50ZXJmZXJlbmNlLCB3aGlsZSAiYmFzaWMtbm8tY3B1LWlk
bGUiDQo+ID4gc3BlY2lmaWNhbGx5IHRlc3RzIHRpbWVzdGFtcCBhY2N1cmFjeSB3aXRob3V0IGV4
dGVybmFsDQo+ID4gaW50ZXJmZXJlbmNlLg0KPiA+IA0KPiA+IE9uY2UgZ2V0X3NjYW5vdXRfcG9z
aXRpb24oKSBpcyBpbXBsZW1lbnRlZCwgdGhlIHZibGFuayB0aW1lc3RhbXANCj4gPiB3aWxsIGJl
IGFjY3VyYXRlbHkgY29tcGVuc2F0ZWQgcmVnYXJkbGVzcyBvZiBDUFUgaWRsZSBzdGF0ZXMuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMva21zX3NldG1vZGUuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0
aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfc2V0bW9kZS5jIGIvdGVz
dHMva21zX3NldG1vZGUuYw0KPiA+IGluZGV4IDNhZGM0NTM0Y2U4OC4uZTVmMmM0ZmVlMTQxIDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19zZXRtb2RlLmMNCj4gPiArKysgYi90ZXN0cy9rbXNf
c2V0bW9kZS5jDQo+ID4gQEAgLTQyLDYgKzQyLDcgQEANCj4gPiDCoCNpbmNsdWRlIDxtYXRoLmg+
DQo+ID4gwqANCj4gPiDCoCNpbmNsdWRlICJpOTE1L2ludGVsX2RycnMuaCINCj4gPiArI2luY2x1
ZGUgImlndF9wbS5oIg0KPiA+IMKgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4gwqANCj4g
PiDCoC8qKg0KPiA+IEBAIC00OSw2ICs1MCwxMyBAQA0KPiA+IMKgICogRGVzY3JpcHRpb246IFRl
c3RzIHRoZSB2YmxhbmsgdGltaW5nIGJ5IGl0ZXJhdGluZyB0aHJvdWdoIGFsbA0KPiA+IHZhbGlk
IGNydGMvY29ubmVjdG9yDQo+ID4gwqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbWJp
bmF0aW9ucw0KPiA+IMKgICoNCj4gPiArICogU1VCVEVTVDogYmFzaWMtbm8tY3B1LWlkbGUNCj4g
PiArICogRGVzY3JpcHRpb246IFRlc3RzIHZibGFuayB0aW1pbmcgd2l0aCBDUFUgZGVlcCBzbGVl
cCBkaXNhYmxlZA0KPiA+IHRvIHZlcmlmeQ0KPiA+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRpbWVzdGFtcCBhY2N1cmFjeSB3aXRob3V0IENQVSBpZGxlIGludGVyZmVyZW5jZS4NCj4g
PiBUaGlzIHRlc3QNCj4gPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcyBmb3IgcGxh
dGZvcm1zIGxhY2tpbmcgSFcvU1cNCj4gPiBnZXRfc2Nhbm91dF9wb3NpdGlvbigpIHN1cHBvcnQs
DQo+ID4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWxsb3dpbmcgdGhlbSB0byB2ZXJp
ZnkgdmJsYW5rIHRpbWVzdGFtcA0KPiA+IGNvcnJlY3RuZXNzIHdpdGhvdXQNCj4gPiArICrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleHRlcm5hbCBDUFUgd2FrZXVwIGxhdGVuY3kgaW50ZXJm
ZXJlbmNlLg0KPiA+ICsgKg0KPiA+IMKgICogU1VCVEVTVDogYmFzaWMtY2xvbmUtc2luZ2xlLWNy
dGMNCj4gPiDCoCAqIERlc2NyaXB0aW9uOiBUZXN0IGFsbG93cyB0aGUgdXNlIG9mIGEgc2luZ2xl
IENSVEMgZm9yIHR3bw0KPiA+IGNvbm5lY3RvcnMsIHN1Y2ggYXMgVkdBL0hETUksDQo+ID4gwqAg
KgkJVkdBL0RQLCBhbmQgSERNSS9IRE1JDQo+ID4gQEAgLTExMDYsNiArMTExNCwzMCBAQCBpbnQg
aWd0X21haW5fYXJncygiZGV0OiIsIE5VTEwsIGhlbHBfc3RyLA0KPiA+IG9wdF9oYW5kbGVyLCBO
VUxMKQ0KPiA+IMKgCQl9DQo+ID4gwqAJfQ0KPiA+IMKgDQo+ID4gKwkvKg0KPiA+ICsJICogVGhp
cyBzdWJ0ZXN0IGRpc2FibGVzIENQVSBkZWVwIHNsZWVwIHRvIGVsaW1pbmF0ZQ0KPiA+IHdha2V1
cCBsYXRlbmN5DQo+ID4gKwkgKiBpbnRlcmZlcmVuY2UgZHVyaW5nIHZibGFuayB0aW1lc3RhbXAg
dmVyaWZpY2F0aW9uLg0KPiA+ICsJICoNCj4gPiArCSAqIE5PVEU6IFRoaXMgaXMgZm9yIHBsYXRm
b3JtcyB0aGF0IGhhdmUgbm90IHlldA0KPiA+IGltcGxlbWVudGVkDQo+ID4gKwkgKiBnZXRfc2Nh
bm91dF9wb3NpdGlvbigpLiBPbmNlIGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgaXMNCj4gPiBwcm9w
ZXJseQ0KPiA+ICsJICogaW1wbGVtZW50ZWQsIHRoZSB2YmxhbmsgdGltZXN0YW1wIHdpbGwgYmUg
YWNjdXJhdGVseQ0KPiA+IGNvbXBlbnNhdGVkDQo+ID4gKwkgKiByZWdhcmRsZXNzIG9mIENQVSBp
ZGxlIHN0YXRlcywgYW5kIHRoaXMgdGVzdCBiZWNvbWVzDQo+ID4gcmVkdW5kYW50DQo+ID4gKwkg
KiB3aXRoIHRoZSBzdGFuZGFyZCAiYmFzaWMiIHRlc3QuDQo+ID4gKwkgKi8NCj4gPiArCWlndF9k
ZXNjcmliZSgiVGVzdHMgdmJsYW5rIHRpbWluZyB3aXRoIENQVSBkZWVwIHNsZWVwDQo+ID4gZGlz
YWJsZWQiKTsNCj4gPiArCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiYmFzaWMtbm8tY3B1LWlk
bGUiKSB7DQo+ID4gKwkJc3RydWN0IHRlc3RfY29uZmlnIHRjb25mID0gew0KPiA+ICsJCQkuZmxh
Z3MJCT0gVEVTVF9USU1JTkdTLA0KPiA+ICsJCQkubmFtZQkJPSAiYmFzaWMtbm8tY3B1LWlkbGUi
LA0KPiA+ICsJCQkucmVzb3VyY2VzCT0gZHJtX3Jlc291cmNlcywNCj4gPiArCQl9Ow0KPiA+ICsN
Cj4gPiArCQlpZ3RfcmVxdWlyZV9mKGlndF9wbV9kaXNhYmxlX2NwdV9kZWVwX3NsZWVwKCksDQo+
ID4gKwkJCcKgwqDCoMKgwqAgIlBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgQ1BVIGlkbGUNCj4g
PiBjb250cm9sXG4iKTsNCj4gPiArCQlydW5fdGVzdCgmdGNvbmYpOw0KPiA+ICsJCWlndF9wbV9l
bmFibGVfY3B1X2RlZXBfc2xlZXAoKTsNCj4gDQo+IFNlZW1zIG9rIGJ1dCB0aGlzIGVuYWJsZSB3
aWxsIGJlIHNraXBwZWQgaW4gY2FzZSBvZiB0ZXN0IGZhaWwuDQo+IGltaG8geW91IHNob3VsZCBh
ZGQgZW5hYmxpbmcgdG8gYXRfZXhpdCBwYXRoLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3
ISBJIGluaXRpYWxseSB0aG91Z2h0IHRoZSBlbmFibGUgY2FsbCB3YXMgb25seQ0KbmVlZGVkIHdo
ZW4gZGlzYWJsZSBzdWNjZWVkZWQsIGJ1dCBJIG1pc3NlZCB0aGUgY2FzZSB3aGVyZSBydW5fdGVz
dCgpDQpmYWlscyBtaWR3YXkgYWZ0ZXIgYSBzdWNjZXNzZnVsIGRpc2FibGUuDQoNCkknbGwgYWRk
IGlndF9pbnN0YWxsX2V4aXRfaGFuZGxlcigpIHRvIGVuc3VyZQ0KaWd0X3BtX2VuYWJsZV9jcHVf
ZGVlcF9zbGVlcCgpIGlzIGFsd2F5cyBjYWxsZWQgYWZ0ZXIgYSBzdWNjZXNzZnVsDQpkaXNhYmxl
LCByZWdhcmRsZXNzIG9mIHRlc3Qgb3V0Y29tZS4NCg0KRSxnLg0KICAgICAgICBpZ3RfcmVxdWly
ZV9mKGlndF9wbV9kaXNhYmxlX2NwdV9kZWVwX3NsZWVwKCksDQogICAgICAgICAgICAgICAgICAi
UGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCBDUFUgaWRsZSBjb250cm9sXG4iKTsNCisgICAgICAg
aWd0X2luc3RhbGxfZXhpdF9oYW5kbGVyKHJlc3RvcmVfY3B1X2RlZXBfc2xlZXApOw0KICAgICAg
ICBydW5fdGVzdCgmdGNvbmYpOw0KLSAgICAgICBpZ3RfcG1fZW5hYmxlX2NwdV9kZWVwX3NsZWVw
KCk7DQoNClJlZ2FyZHMsDQpKYXNkb24tSkggTGluDQoNCg0KPiBSZWdhcmRzLA0KPiBLYW1pbA0K
PiANCj4gPiArCX0NCj4gPiArDQo+ID4gwqAJaWd0X2ZpeHR1cmUoKSB7DQo+ID4gwqAJCWRybU1v
ZGVGcmVlUmVzb3VyY2VzKGRybV9yZXNvdXJjZXMpOw0KPiA+IMKgCQlkcm1fY2xvc2VfZHJpdmVy
KGRybV9mZCk7DQo+ID4gLS0gDQo+ID4gMi40My4wDQo+ID4gDQoNCg==
