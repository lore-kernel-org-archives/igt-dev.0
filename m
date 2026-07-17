Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D4C4451B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9009310E46E;
	Fri, 17 Jul 2026 14:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ud/6Q2Ar";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WHG5sPdC";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB0210E46E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:35:44 +0000 (UTC)
X-UUID: c72e978481ec11f18dc8c9802ae25ab1-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=sd8xlFjmsQ5ZC2Q/kDU+qYN839n7wqHkvX7fSvVVD64=; 
 b=Ud/6Q2ArYhds5ZepartqQXl9+re7id1rxPYST/l8o6dZyjUAAoIapbHRr9UzB22HJkIBYakZev8MhckMV7BjFTx0CFbI8BAcANrl9Nw2I+FVSyy/R/tnYoLTkiHgRGm4/4G9NHwQp64Ctt1uYXugarIGfr9iXYB4khKugrRq5OQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18, REQID:ee8fca66-d4c4-421b-99c1-f13ebd5741b7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:8a735a6, CLOUDID:1ee2623f-46cf-453a-bd84-ad9fc7cb0e8c,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
 nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
 :0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c72e978481ec11f18dc8c9802ae25ab1-20260717
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 533856847; Fri, 17 Jul 2026 22:35:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 22:35:33 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 22:35:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXKV8orNsjlmSbORsgy2kn9ryKxaE7OC690SkDaI4Ti9Fj67Q4X13ED8LfSiesDAK5sv/0o7rWsp/ryws3cPRoR6eN0DtSW+Z1ZkB7H9xyGx2AS9B0fhS09fFX1vzFjm265W+bB17VdNohtFOqh7yVMFMyRIU04FdjcnN9XuvL8CaYipJYBVPA+XCdOXaTTd3WZIWsU67cGSgfFigJjfphJQ3AmWyVouiroC8HJqrWMvSlQB9N1VGNvqcda5n2bx75Aj2/rIN4ApVtUVHBeDnRh4pQcgjmhU+zZybtEmAfvAJdyWyDOlWuZSYNPZFCR6E0jdGx1Hjx5tUqrQqeCdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd8xlFjmsQ5ZC2Q/kDU+qYN839n7wqHkvX7fSvVVD64=;
 b=CSvXhlTcoI7jAQGPKKOTLqBauneYRPe9Lleg4clS31HAk4JKrE0I1FCSYqvCY0qterDxy+mh/bIZIZTZRmkt/0jiwOkt0cQrcN3AytnYsk14q3znnqzZZd20w9vyKtLEh388XhILt+Ez6Q1NRn2PCQl2iumngt4OICc+feEdldom1oZ8hVbeWTxjl6400VBDx5HQ3nrGokVKVWEsS6+THqE/+4OCFGBqBL/oBwFhMl3H2u14quj2Yz1HJJ+EEa6wj86BCrUxhDL5JsGytbsi7dEd28oSRazJgeXFzgIM/dbRvjr6de49XrU7bn6sIJkcODQ2b+fJkoFRB+0u/ubuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd8xlFjmsQ5ZC2Q/kDU+qYN839n7wqHkvX7fSvVVD64=;
 b=WHG5sPdCk9hYOKfvuFLnvX9yeCV7kC2uRFbQLws2vwhx/5HMjzOWU2ODrfLMMel53j917isYw3dXmDkGgLeLS4QXkwguoPwF9B38JqmadVkM68X+DyRUVD11fZaxItz/Akl/ves543vY8lLc9/VFva5tVMUqLOPl66jaqNRzOuU=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by TYPPR03MB9650.apcprd03.prod.outlook.com (2603:1096:405:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 14:35:29 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::1a5c:29d7:cb68:2d36]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::1a5c:29d7:cb68:2d36%4]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 14:35:28 +0000
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
Subject: Re: [PATCH i-g-t v3] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Topic: [PATCH i-g-t v3] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Index: AQHdD3YkPz6pdOISKkOJmjiqgdEaybZxsveAgAAhIYA=
Date: Fri, 17 Jul 2026 14:35:28 +0000
Message-ID: <02ae0c60a93092068a84d7d5a83435fe250f50da.camel@mediatek.com>
References: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
 <20260717123653.ncv3xmnc7lphelkj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260717123653.ncv3xmnc7lphelkj@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|TYPPR03MB9650:EE_
x-ms-office365-filtering-correlation-id: 4e72ea54-3a7d-4c9e-1d53-08dee410a5b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|38070700021|10067099003|56012099006|11063799006|921020;
x-microsoft-antispam-message-info: kWOJSM66i254ElO+gmF7dQGSczjl3DD4nRqcCr9gAicENIrvldRqdPgf4jrppLah5fYupNA80VDPEZmr0+AKtzoYgfXaBndUr84xJbgaXmWYDL+zxmVNAEzfSPD9kMiMko+gVhsZxBfWda+Z9Yrfb8hB3glK9lFPHCj5FQvynqG93rwXz6aN6yxvwUlZJLDZv8TwMnClNtXHShDW9AFBWZZMVhJzV0n0Qr9D+2mcdxil1nGI6HOOCU7eWsLXax98uOkdtVspTkL4l59bMXGWLbu9OhkWvJ5USPrX9XiuMBVgRofek4p4XOUuiAat7OTZwH/VxdyiRLVW5xwTlvWf6gIAuhtb7+to1oHfy9AccJpdcc+Lz3Cmj5CwBHeybHs+3xB4xQGLuNBb5ipwFQYyxyd4Iw8pakdZo+SxrbxWnMsfO8ySDsFv17ipVvO1f/cZW+MlZXSxGMH0SWqb+q2hVuwJ3m+IEOsyiGcT699lls8WlSEsQi8m/7hEzx/wn8lx816J9SPDYL0xibULO0EK57r15UXMASvhFx7/TTBenLcGNs947dMS0DE1JVMBBEx36n53u3ymQOUozvtiU8Ty3eaK3OGTQCeKYtcsSAqrtJPtqP40zAbiuhaoSAtjMqWupSkQOxgP8w/8Bizh3se+nGP3p6vHFkhB+01RGGD0P4csc9+MO+LI8XrkAPgG32UarpBHXSXQ9rs3sIkaW0Oz1JvB3hCPpA2bdGgwNuPvr2luykp5mAHUNR7alRFV+1fg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB7669.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(38070700021)(10067099003)(56012099006)(11063799006)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NThtbmxpZnRwNnZ3em5pc21qNFVaL3lGcFN5Z0FRT2tTN0lQc3JCekJHbUY2?=
 =?utf-8?B?UVA3VDdmZUoxK2tYaFQzazQ1NS9vZHVWak5pTFN6VW9ieVpMQnZrTXRwY3R6?=
 =?utf-8?B?YWRjZjBnVTR6Yjc0eGRqNUpXdmExSWhtQWZWa3RNRG05UER2VWN1UHJxUGFv?=
 =?utf-8?B?QnR0NDVURjVwZS9wcFA2WGdwOHhvanFtZjRMN1hFYUo3a0NaVzV5VzVOdmJi?=
 =?utf-8?B?WlJOeWo0ZWUxY0JlSkFEUmROWG05TnZlYjlHKzlnOFpiWGpFUEFMM3BZSmt0?=
 =?utf-8?B?RnJ1bUxuVTdOdlBGdFk3TWxaRkl3TXFMNGlMemxURGx6cldGWTF6dmg2MlZz?=
 =?utf-8?B?eDBPMFh2V1lFV2Jlb1V4SWRYSGRPOFpDWVVVcEVSMVQ5NE9EOUd4Rk54YTB4?=
 =?utf-8?B?Y2FQZzhpWG04L012bDVNMm5hVWNoR25CM3Q0WXlGSXFOZ29ZYTUvMzdENmJN?=
 =?utf-8?B?S2pyMjFEZWhGekdlcGd5M01FWmIybFdnOVE3SUo0VWk2VnJZdlArTW9OdG1J?=
 =?utf-8?B?ODlRbXUvOElsZEFUbzAzeXoxdEY4eGF5K3JkR1lkUU1SaklKalE4eXR3ZFFR?=
 =?utf-8?B?azNtdkQwakgrc2ZEbTNjOWNYTld5ak9qWWpjRFRBYVVGYW5jUjVlR1B6VjM0?=
 =?utf-8?B?dWRZeHB5R29kWUllMUpCeUFMWVgrTUpET3RrT1V2QnA2cUlGWTFxWFg3TDFN?=
 =?utf-8?B?V0xOQXFvaXQ4WE1vTmFRWjJYTkd1Q0gwZFNvTjJmVzdTaCs4aDlnU1kwTjg1?=
 =?utf-8?B?dUNtWW0xWFBYNDMrVlZBamU1SDZuYlpvM1lpM083MWgyZk5QZDM2bHpWdEw4?=
 =?utf-8?B?Rlh5amZ4bUU2RWh2c0ZzVzI3NHlHR0J4SnNBYjU0NE52b3ByNmpnanBFR25I?=
 =?utf-8?B?NlBaQVZaMEJ0bHhDcExDNU04VEp5Qkh2Qk5rTlNXRkJoVjBHUG5PUTJjem1r?=
 =?utf-8?B?WDZnL2lBU1YxdnVRQmhXUUNNNlIyV1pCSnB0YmJ6QzBtcDA0ZkNpWi9ZeVkw?=
 =?utf-8?B?WVBvcGNLcjNoeWl2UlU0MHo5Mzl0djJ4WW9ZeVJCM2kxaUFlbzE5YnQzRlVQ?=
 =?utf-8?B?K1J5NTJtOHE4cTBaM2JHTUxlb2dmMXBoMmRGZURwdjhLQmgyWWtJc2JYUVJx?=
 =?utf-8?B?Vjc5L2JPRzZSUEVIdFVkdjY4U2F5VkJiY2tudi84eWFwVXNqT09UdDBlTkps?=
 =?utf-8?B?Q0poMC9YMG9NaDFuL0RQU1Blbm1yeU9Nc2JwdmtXaEFVemp5TFpzakRhQ2Ew?=
 =?utf-8?B?bGZNNjJNUXp6QnluK1ROd1U5U1MvVjlPNEUzOTFQbEFXT1JHdVQyMmZCQUFF?=
 =?utf-8?B?bFJobFluWVJGaHF4OERBUGZya0JieHhNU25uSXAra1l1TnJkcm02MjVJUWJM?=
 =?utf-8?B?WmxhQjNRK2pnVG00MTNWc0FZcjV2a3Vlbm0vTVZkTXZKM05SRjlBMU9nb1dU?=
 =?utf-8?B?Wk1RdXRuRlNQYjFCTWt0ejhGa3Z3czJ3M3Y5S3FSbXdlMHovTGtmY2dMNW5y?=
 =?utf-8?B?NWl6aml5MmpMVzV5a1Z4azNVYTFGN29NVVplZ3ZvbFZmcTZuVkFvK2djQVlT?=
 =?utf-8?B?bFp1N3JqZXF2U2YwbHJjUDdlWjNLRHlGTTZ5NURwbzBoQ3Z6bjAydjc0TENR?=
 =?utf-8?B?V1dQbTFsTm85ZisyK0VEbkhVRlpad1g0NitkSkc2OGhEd2JxSTVidlFBZ283?=
 =?utf-8?B?NGRpQ1lSZ2xlVXZlNERLcDZoMjNZQlVxSlVTU2FUeDdEUm1vZVVJdUttYTVr?=
 =?utf-8?B?NDVLYitWRkVoK0ttR3kzVStQRG0wN0dXL091L3dKVmg0WFZsTWgwdXpvc2tk?=
 =?utf-8?B?Z0RrNGxzYWdpbXZPVnBsREVacUhsMEFhMkdpTzBTd2FWNndsYXpjNUV5R3du?=
 =?utf-8?B?M3dPWmRQaUh1WWw3Wk9pWnVBYXVKY0JVKzkxSlJvaytsUk5qWkI5TitCWnh5?=
 =?utf-8?B?QkYvQ3BoRFNIanhtcFJhZTR0YkJaS3h3K09mM2YyTGFyRDZWZnJSaGhTS1d2?=
 =?utf-8?B?Z1E3RENDWkdoNUtEK2NBdEtCNzA5MUlRNy9TRXZ5OVNEZG00eFgvTjQyeld1?=
 =?utf-8?B?QlRRdXRHaUFsWUR6S0FvVEY4eUVPY2l0YXVEbU1lS2dtL01XSDFKbjlNTFRa?=
 =?utf-8?B?Nmo5M1lyaytydkZiN2Jua2xCcmhoa2JjOGVpUXpHL1MvWStRVXBIem9tcFIy?=
 =?utf-8?B?TUlyWUhPc3NjeWNXditIYjltMVBUeTFneGVNR1NzOThIT2Z3TFlObFZzTWhZ?=
 =?utf-8?B?U3VtaE1ZcXlpd1FJUmtOeGpkVzdKbXFBOTBvWVAxRlhRNEZGQkhPY0haVisz?=
 =?utf-8?B?cUs3SzNXYW9HM2hPYStjd2NDTTNBc3R5Uk0zem1WbnVaUXF3ancvWEQwOElB?=
 =?utf-8?Q?MpOjPxlsYTQvrMDs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBA5C49E724CFC48AB71B0B6BAEB1B3D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iZVpjsD/J3iZrojm/r1scRSYZgN6BAEogvdkmOkTz9FmhZsqOdGoQ4yfV3udJxHzJ/nEFD1I1+0dyvSFz8gDUSzehFe/Jxq5iljd8SN0di9vg8t1/e7YIGXfkxJUurUs9ALpEuF2OzCWKr25B9o9+JAcocV5NPO6CrhaQ0c1jwX0k4cMAFS4S8XWfuhsk2GUZE7PLGus2VdGo6Zt4OtjKAAET7p/iFTp4WI+mI8aWqjRHJfevq/VvarDVMeyycXK718Mew0tfu5BiYTUWguLWMJbiISlH68IhnMZXkuFW9N1muJNsPbKGHj56qYBfl1V9hQmCYxFS+V7JOnkTwpxAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e72ea54-3a7d-4c9e-1d53-08dee410a5b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 14:35:28.3284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjL/3RYcVGkVTVP0PLmjkgbgsJn9rdhAUrZ7/lNZxsu6Q9x1qyqUqBIypudoz76fENYjBA20dn4OitNvC37luHcF/PHdzDGdc96AqcU0cdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9650
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDE0OjM2ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEphc29uLUpILA0KPiBPbiAyMDI2LTA3LTA5IGF0IDE1OjM4OjUyICswODAwLCBKYXNv
bi1KSCBMaW4gd3JvdGU6DQo+ID4gQ2hlY2sgaWYgdGhlIHByaW1hcnkgcGxhbmUgc3VwcG9ydHMg
dGhlIHRlc3QgZm9ybWF0IGJlZm9yZQ0KPiA+IGF0dGVtcHRpbmcNCj4gPiB0byBjcmVhdGUgZnJh
bWVidWZmZXIuIFRoaXMgYWxsb3dzIHRoZSB0ZXN0IHRvIGdyYWNlZnVsbHkgc2tpcA0KPiA+IGZv
cm1hdHMNCj4gPiBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSAoZS5nLiwgRlAxNiBmb3Jt
YXRzIG9uIE1lZGlhVGVrKQ0KPiA+IGluc3RlYWQNCj4gPiBvZiBmYWlsaW5nIHdpdGggYXNzZXJ0
aW9uIGVycm9ycy4NCj4gPiANCj4gPiBGaXhlczogNWQ0NjYyNWNmYjIxICgidGVzdHMva21zX2hk
cjogYWRkIEZQMTYgZm9ybWF0IGNvdmVyYWdlIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1K
SCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IA0KPiBZb3UgZ290IHItYiBmcm9t
IFN3YXRpIGFuZCB5b3UgZGlkbid0IGNoYW5nZSBjb2RlDQo+IHNvIGluIHN1Y2ggY2FzZXMsIHdo
ZW4geW91IHJlc2VuZCwgcGxlYXNlIGFkZCByLWIuDQo+IA0KDQpHb3QgaXQsIEknbSBzb3JyeSBm
b3IgdGhhdC4NCg0KDQo+IEJ0dyBJIGFwbGxpZWQgdGhpcyB0b2RheSwgdGh4IQ0KPiANCg0KVGhh
bmsgeW91IHZlcnkgbXVjaCENCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IFJlZ2FyZHMs
DQo+IEthbWlsDQoNCg==
