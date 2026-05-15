Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E435CD4F3C
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 02:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DFF10E401;
	Fri, 15 May 2026 02:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="AuJaH0Km";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ghJUXwuq";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5E510E401
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 02:02:40 +0000 (UTC)
X-UUID: 2410aa22500211f1b5a00d44d12bea5a-20260515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LWMKq2QqfoOreGXSMxxLM56ri5Iyhxc4zGyP8ROd/e4=; 
 b=AuJaH0KmARkYlZ2AncSPGnyQdNRD3qMnIM/N+pDOEkwEjISJ4Kzn+vdaGpdRNwK9qSGu1sCV3/5WkZFreMEmLlFF/NprIlOZGdTGkpXy2z4rHxWtBcQy9QfPVKWcbkHoA+Gc2ub5NEZ2k+L5qLyTZ330UET4rRpcICi4yRABIo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:36609e7e-e32b-4d28-aae1-f7fda7e6bf50, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:b5db5da4-a669-48ac-a1cb-3b38a93be682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2410aa22500211f1b5a00d44d12bea5a-20260515
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 379666348; Fri, 15 May 2026 10:02:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 15 May 2026 10:02:34 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 15 May 2026 10:02:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCHbdhbLYRyIMuQma9S5824BpSzpr55ED6ZOBW5idv8IVuRTRIOwLxVWsecnuM7BTAvWvOPBM0G0UhGW/EPKjzSpVauKJdaxYDuVeClB9DyHmUtP8VZfAElJF0888do3IHAPAT5uoCO5ZdEPeZWUXCRIxipEF3J44eynaDA/LUmAltZFvX9/aRQ77T/0ynK3/1ocP2RHWPaUnP0kdlLp1XeGVCgEGvSFHA/4sS80uaBoLTTfSPla1QNArTVH3kleZvqulJLlws03viIN/3ryKna5W1kZXOud+hcN3wXy3RmP53dMGcGyNMesvg6Lxd0rW7yH5XozOjWrZgTPuG2yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWMKq2QqfoOreGXSMxxLM56ri5Iyhxc4zGyP8ROd/e4=;
 b=lq/i0aa05NJ7gGKSa48NWV278Qdrb9PNzwd0Xjxdnk7nxJx1SHZBJrgi3+MGbkUPDJ65h/XZOUE+SvSPsqtLYzpaIx9SS+PM2xKHl5oTQWQ9YW8DSIR8qNl9UeN/FoRjOQe/37HdjChehTjc2fv3aYLa4TSf01wia3dgi4W2wMkciSdpjBS8Z88v5UKysd0wnGJwz+WgQX6K1XY7o//U+ga3FheZgi2OaoLYnYpt/5vVEGMo3zBxJw2HX3cWIh4fQPGbiQk9IBRL6petUdg83V1Ha1jEx/NL1MLnf+Vt2yOEKQpw+juKgw1yrihEucrkaax4izervq+aPBairDc1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWMKq2QqfoOreGXSMxxLM56ri5Iyhxc4zGyP8ROd/e4=;
 b=ghJUXwuq5uRq/OOtQ0cnoLP7cKYl5OpwDUGkAPOLWprMe86dM8FLyhgVVv83G6j3Ar/bOGqOoS5YZxmgWeCZCf4XvznDIzTt4rh1bo4/jih0CpdNNB5tnmd9OpP62JjPEbINnLeZPxty6LuSYld3otxPDwwQhrxMYK8Ciic4V9Q=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB7650.apcprd03.prod.outlook.com (2603:1096:400:42f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 02:02:30 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 02:02:30 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "santhosh.reddy.guddati@intel.com" <santhosh.reddy.guddati@intel.com>
CC: "suraj.kandpal@intel.com" <suraj.kandpal@intel.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>
Subject: Re: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Topic: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Index: AQHc44Xk9iYuV3wY2kWM+00j7/HxoLYOVrkA
Date: Fri, 15 May 2026 02:02:30 +0000
Message-ID: <c3346d1f09fc744a543ec86d4bf92b5e69013c85.camel@mediatek.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB7650:EE_
x-ms-office365-filtering-correlation-id: 1af3dd64-d20b-4fd8-ca87-08deb22605c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799003|38070700021|11063799003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: ZmiWKzLPT6IhbNNEvJtXMzvUrA9KyAV2CYR0sXC+vemcS1BzQaFtmKZdGE7x3wQRt7gPZbopeVyHoieXV8IJdTttnURswYhG2C4xsMExMkC94pWjUFbfjYbrhNHjie6QE+XD2dSKu0s1FjUJXdpUZ+rjq4TPgz9hBdJQLgCDTYYrw+1FuPb29kJcbns2winmPGpbUmzUDYTXKtxUWkq7Wv9wZ7EvfTqgOxGMTn6nOBkeHruBHUKhnJiZWuluXqcOGZu3HFeAhaE/lpB2gyyuCPxoYoENc9O7f1ioUglKy/IhL5e+eO+zuclCj4bZbuGZxZntD7HwIyp4iRgXXf44Ng1GPXV7qferThi0u1Ln2a0LS3dgMNx5fKvvO3OJ2RPNZ/mtvaiW0M5oyIeJIqhc3+9K0N8xtTp31B9ZOggha+2fPi4GWjfj8VhrDogyi4BRoc+o8wPBQVoSTnIgwoqh7M9I6t+I1Ftx2Z5k7CiR+3B3huoXW94Rw5YfLWuknZVvWzAFPZ7aKp77f90enxF9VLJXstRGicXl79bp5mHs7TM+XLYfdiU3AF5eLWsr/eiEQtbyfC5x/JNxZGP8dMm7btkOo4KYwUWpsNEbrCEFGL1YRw9d0ZV767rqoZQXm/Cxvk7FZBg4PGvshwAUiI6VtFFsU8ksT6E+2lLOq2adcyFNs1b/GdTOprXhAScVt595Xj/mgchcYIAFfZT1AU02fUUzQaIXTo/blBge2SRex5ryR49cuB/w1TSYPVHhxI9K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(38070700021)(11063799003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUVUZkRqSnI2eHh4Y2ZnTmZIZVVtaXRxOUk0bFArWERyN2VRUVdJVmUvNmhj?=
 =?utf-8?B?UjBFYzY4aERvbDNxTENhL1lqYlZjb25RT1FQTFg3cXd6R09TVWNBdDVtbnVu?=
 =?utf-8?B?MXZlcnVTODhLeGdxcjJJclU4WHhPb3V3cUVGZUg1b0tyaFNZeHNKa3BRcDl5?=
 =?utf-8?B?NEVCbEpCV0d3dUMzWVBxeHgzNEE0M01IeGZER1RrSjdQWWxTckQxdE1YVU4v?=
 =?utf-8?B?TmExMHVIZ1VYNjd4UjhHZDBUaEhLY2x1eEJSQ0JBZTA3cUt3eVRTS1lkZThT?=
 =?utf-8?B?Zi80cVZHK09oOGViVjZDekFPZmJaMXQ3Qk04VFlqY3dEMk5jRnRUMlIzOEdQ?=
 =?utf-8?B?SWwvdVp4aklWTVIrMmh4QjNBVUwxRHBzN2xWVmk5ZFEzUmt1eHlrdGd4Ym4w?=
 =?utf-8?B?Q2ZwNk9TMjE3V0k5KzNvdkRCSmMxMmxrd3FCQm5JR096MjNlSkQwOU5SOU5G?=
 =?utf-8?B?L2RzdzNsMXY3TjVGMjRHaFd4bktEQTFTaGdIKzRIQnVKYld1VkplaHJPdWdw?=
 =?utf-8?B?RkQ5c0YyOGtjSlhTSk1KdENLVUNWandPRTdsZ0doQklsektZVVFXVkNLaTc3?=
 =?utf-8?B?S0RoZ1dEeDd6UFcvME5mKzNhMGFqWUx0eGY2TDhncXY2Z3dlOEFIcVJvTHpE?=
 =?utf-8?B?ZVlpZG5HT2ozQkZSVE9ocktGSzZNb0J3VVc3RWRucjk5Zk8vMFpoVTYrT2xq?=
 =?utf-8?B?YkJlQjV1RFBEVTJ2V1RsT3VuczBOQnBOSlBnUXBHRGlyVnNpczBwTVV3Tmo1?=
 =?utf-8?B?R1hFaFhYQVRmOTdOdzZOM1kvcEVyZk9CTVpKOHdUSHkvWVR3UWt6V2pQRElq?=
 =?utf-8?B?N2hleWt2Z3U0K3hFeVl3cDd4enhidC9RbnhGbVdCelp0L1ZVUkoxTGxtbEYv?=
 =?utf-8?B?TDR3dTZDR3pheDFWMzdueStTTjhOSk12NTRvQkFTOHFLMWU0TUVDYjBMbzlH?=
 =?utf-8?B?TkdCMkZDZllHK2RqUGM2VWZVUTdJRmk2bFJVc09LU1hCc2JOREZtdjJZLzdr?=
 =?utf-8?B?SkxMQ2tGeDJiV2JrMTBFdSt3bVhCOG5RMGNIOUZrRDZTN2dNTG0zOCtzYzJI?=
 =?utf-8?B?SzdVZXpXa3dCQjBIaVNsY0VuYS9ZQ0RCSVVPN0tjRnkvQXhEK25jeG9ZOE9W?=
 =?utf-8?B?cVpzVm5HemtwQ3JTenNYUThkZ1h2MmlOUTRUUTVPcTFVWUZVRzl1SUkwb3ZU?=
 =?utf-8?B?L3lvTGxJYzArVzkrek8rcDcwanNteVJ0RHdpdmZQd1B0UG5ieGFjME04ZE9T?=
 =?utf-8?B?YTVVWjE1dUxoL3NYYVkyTUhVYzVPRk45ZldmVjRMTkc5T2t0SVU0cnNnU2oy?=
 =?utf-8?B?Y2QwK0U0VmNDMlV4RzBrdUxhNlNMM3lNYmNwbmxkS0VFcW9IUjJteHNGZnRR?=
 =?utf-8?B?QW0wZ002NzFwanQ3ZDB3ZXNQdVVqRWVVc0hUZVg2bjVCdFN4Ri93Q1hkYjZy?=
 =?utf-8?B?bXE5cjVKY3ZVN000WWNSNmtDeTJpTUdnM3pQMEpDcGtpS1IwMDlUWU44cWc0?=
 =?utf-8?B?QWJRbkcyRDZXZEV0Z3h5V1lNMklxdlc4bjAwZDBxYXpGUkZ2SWRvbktQeitS?=
 =?utf-8?B?ZmN2K3RxK09XbWtMZHdZWEludnRsYVZZelZQc3R4cVU3Qmoya2YxbFQ5bTAw?=
 =?utf-8?B?VEozS3Iwd0tvNHM1aHJCdjd4L0ZURC9RUzY3U3lIUVA1SVB5MUorYndBakF3?=
 =?utf-8?B?d0FhelJwUmg2Z1FYN0FBSEc2Q2lVNFh3QTRJUUU1aXJ6eE85SFFOSnQ5WDJl?=
 =?utf-8?B?YmpadEVwT2tic3VuT1RPdm9DSExzYjJBVVZDdTE4NWhTandxaVhPMHpYNEZl?=
 =?utf-8?B?QkxkbEVuREx0TmxHUUVyZUFFcDZQZmlKUlMwMncyMHZieUVTazdrL3pOMXhk?=
 =?utf-8?B?ZEpmdkV6WEdCM3VVUytiS1F6a21PcG4wck9OZWlSU084MlpDQTM4ci96WmFW?=
 =?utf-8?B?Tm5IVW1FZXRPc0FmTVJXTDNKWjFnS2QwcHlEMmJJY2duWlo3RnBmRmxCQWNr?=
 =?utf-8?B?WE1OcVJvWmV2REFCRVFveFdRVHp4Vml4a2xobldiVEZMb2dNWDJpQVVwekxR?=
 =?utf-8?B?Z2FJdnFvaHBuRVFwOUJlU3pqQjMrTnkzWVROcDBXQThwdFRDUDVKQnpBZU5y?=
 =?utf-8?B?bWgwK2ZCVTludjZFSklmSnhzVFVrMnJNdVV5NkhpK3Y3L0pSQ2VHcHVaSkRD?=
 =?utf-8?B?TDB1czJwVDlwRUE5ZG1SeDgxY2pud3UvRVB6c1owa0xJUlVwdnhKQTNTUDNy?=
 =?utf-8?B?eWxZSWQyaUsrc3orVWdYYzRxYlUzNGxLNVYrTVVLd1g3MkxwQkNMeVlKazNE?=
 =?utf-8?B?Y3dnZWp1aEpTcVBxcjZQLzBBMTY1WW9NbGNrT0hwK0xjTjJ1VjNlYzg5dzNL?=
 =?utf-8?Q?VOPIE6h50NFmQAxw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FAFF430115ADA4398B3DBA5963FC5D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: x08v/9HkZIq3YIvjM0t0xIVvgDs7k/sO/2JNxDhansDZeM0CPt6g8+hJIqV+xZI7HL6JqjRIg8Os2G+F0fu3JEqffHg/0+KfIUCTXMJY6Amvwq8iEBRXb2aYLnX9/J/74VTYYFlfYrJfRjK1Y6cPHnpSFAfez0ixsloghOq3AzFRjJqg6Z058A0bcj8nXypey8AnErCGSlaY2MrgFOtIyW5hHhmJRICLCLCdgXOZT7eGypTSqfx2Z1YEmR20yj48+Pockv6vy0PDb8cJzpg2vRBXPtieRdMaDwceiXTlNT0xQfwWghng/rAxWxzqz/bhNOLEbrxInWn+/aFjiBAEBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af3dd64-d20b-4fd8-ca87-08deb22605c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 02:02:30.8161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWJvWAHqXtVSMPfwjtgTUS2mr5l+Fmg1I18L/fHYu0IOEGLrPgHsquqT975AAQtbV4KSE1xvyOBoCKZ19hZN5z0OpmB4/+Isb+aREuMN/zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7650
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

T24gVGh1LCAyMDI2LTA1LTE0IGF0IDE1OjA1ICswNTMwLCBTYW50aG9zaCBSZWRkeSBHdWRkYXRp
IHdyb3RlOg0KPiBSZXZlcnRzIGJlbG93IGNvbW1pdHMNCj4gDQo+IGI0MDM2YjFhMCB0ZXN0cy9r
bXNfY29udGVudF9wcm90ZWN0aW9uOiBBZGQgRkIgY2xlYW51cCBmb3IgTVNUIHRlc3RzDQo+IDhk
N2MyNDUzZCB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uOiBQYXNzIGNydGMgcGFyYW1ldGVy
IGFuZCB1c2UNCj4gcGVyLUNSVEMgRkJzDQo+IDkyNWIxNGQ0MyB0ZXN0cy9rbXNfY29udGVudF9w
cm90ZWN0aW9uOiBBZGQgcGVyLUNSVEMgZnJhbWVidWZmZXINCj4gaW5mcmFzdHJ1Y3R1cmUNCj4g
DQo+IFRoZSBwZXItQ1JUQyBmYiBpbnRyb2R1Y2VkIGluIHRoZSBjb21taXRzIGNhdXNlZCByZWdy
ZXNzaW9uDQo+IGVzcGVjaWFsbHkNCj4gd2hlbiB0aGUgZURQIHBhbmVsIGlzIGNvbm5lY3RlZCB3
aXRoIDIgNGsgUGFuZWxzIGNvbm5lY3RlZCB0aHJvdWdoIGENCj4gRFAtTVNUIGh1YiB3aXRoICIt
RU5PU1BDIiBhbmQgYWxsIHRoZSBjb250ZW50IHByb3RlY3Rpb24gdGVzdHMgYXJlDQo+IGZhaWxp
bmcuDQo+IA0KPiBUaGUgTVNUIHN1YnRlc3RzIGFyZSBza2lwcGluZyB3aGVuIHN1YnRlc3RzIGFy
ZSBleGVjdXRlZCB3aXRoICItLXINCj4gZHAtbXN0KiIgLCBhcyB0aGUgTVNUIGNoYW5nZXMgaW50
cm9kdWNlZCBkaWQgbm90IGNsZWFuIHVwIHByb3Blcmx5DQo+IGFjcm9zcyBzdWJ0ZXN0cy4NCj4g
DQo+IFRoZSBjcmVhdGVfZmJzKCkgbm93IGl0ZXJhdGVkIHRocm91Z2ggYWxsIGNydGNzIGFuZCBl
RFAgKDJrKSBjbGFpbXMNCj4gdGhlIGZpcnN0DQo+IGNydGMgYmVmb3JlIHRoZSBsYXJnZXIgb3V0
cHV0IGFuZCBmYiBpcyBjcmVhdGVkIHdpdGggc21hbGxlciBzaXplLg0KPiBMYXRlciB3aGVuIERQ
LTQgbWFwcyB0bw0KPiB0aGUgc21hZSBDUlRDIChpdCBoYXMgZGlmZmVybnQgZmIgZGltZW5zaW9u
cyBub3cgMmsgZmIgdGhhbiB0aGUgbW9kZQ0KPiByZXF1aXJlZCkgLCB0aGUga2VybmVsIHJlamVj
dHMgdGhlIGNvbW1pdHPCoCB3aXRoIEVOT1NQQyBiZWNhdXNlIG9mDQo+IGludmFsaWQgY29vcmRp
bmF0ZXMuDQo+IA0KDQpIaSBTYW50aG9zaCwNCg0KSXQgc2VlbXMgeW91IGFuZCBJIGhhdmUgYSBj
b25mbGljdGluZyBpc3N1ZToNClsxXSBVbmRlcnNpemVkIGJ1ZmZlcnM6IFdoZW4gNEsgb3V0cHV0
IHVzZXMgQ1JUQyB3aXRoIDJLIEZCDQpbMl0gT3ZlcnNpemVkIGJ1ZmZlcnM6IFdoZW4gMzUwNHgy
MTkwIHBhbmVsIHdvdWxkIGdldCAzODQweDIxNjAgRkINCg0KWzFdIHRoYXQgcmVxdWlyZXMgcmV2
ZXJ0aW5nIHRvIG1heGltdW0gcmVzb2x1dGlvbiwgd2hpY2ggaW4gdHVybiBjYXVzZXMNCm15IHRl
c3Qgc2NlbmFyaW8gWzJdIHRvIHJlZ3Jlc3MuDQoNClRoZXJlZm9yZSwgSSB0aGluayB3ZSBzaG91
bGQgZmluZCBhIHNvbHV0aW9uIHRoYXQgc2F0aXNmaWVzIGJvdGggbmVlZHMsDQpyYXRoZXIgdGhh
biBzaW1wbHkgcmV2ZXJ0aW5nIG15IGVudGlyZSBzZXJpZXMuDQoNCg0KSGVyZSBpcyBteSBzb2x1
dGlvbjoNCkR5bmFtaWNhbGx5IGNoZWNrIGFuZCByZWNyZWF0ZSBmcmFtZWJ1ZmZlcnMgaW4gbW9k
ZXNldF93aXRoX2ZiKCk6DQotIElmIGV4aXN0aW5nIEZCIGlzIGxhcmdlIGVub3VnaCDihpIgcmV1
c2UgaXQNCi0gSWYgZXhpc3RpbmcgRkIgaXMgdG9vIHNtYWxsIOKGkiByZW1vdmUgYW5kIHJlY3Jl
YXRlIHdpdGggcmVxdWlyZWQgc2l6ZQ0KLSBPbmx5IGFsbG9jYXRlIHdoYXQncyBhY3R1YWxseSBu
ZWVkZWQsIHdoZW4gbmVlZGVkDQoNClRoaXMgcHJvdmlkZXMgb3B0aW1hbCBtZW1vcnkgdXNhZ2Ug
d2hpbGUgcHJldmVudGluZyBib3RoIHVuZGVyc2l6ZWQgYW5kDQpvdmVyc2l6ZWQgYnVmZmVyIGlz
c3Vlcy4NCg0KDQpIZXJlIGlzIGEgc2ltcGxlIHBhdGNoIGZvciB0aGlzOg0KDQorc3RhdGljIHZv
aWQgZW5zdXJlX2ZiX3NpemUoaWd0X2NydGNfdCAqY3J0YywgaW50IHdpZHRoLCBpbnQgaGVpZ2h0
KQ0KK3sNCisgICAgICAgc3RydWN0IGhkY3BfdGVzdF9mYnMgKmZicyA9ICZkYXRhLmZic1tjcnRj
LT5jcnRjX2luZGV4XTsNCisNCisgICAgICAgLyoNCisgICAgICAgICogQ2hlY2sgaWYgZXhpc3Rp
bmcgZnJhbWVidWZmZXJzIGFyZSBsYXJnZSBlbm91Z2guDQorICAgICAgICAqIFJlY3JlYXRlIG9u
bHkgaWYgdGhleSBhcmUgdG9vIHNtYWxsIGZvciB0aGUgY3VycmVudCBtb2RlLg0KKyAgICAgICAg
Ki8NCisgICAgICAgaWYgKGZicy0+cmVkLmZiX2lkICYmDQorICAgICAgICAgICBmYnMtPnJlZC53
aWR0aCA+PSB3aWR0aCAmJiBmYnMtPnJlZC5oZWlnaHQgPj0gaGVpZ2h0KQ0KKyAgICAgICAgICAg
ICAgIHJldHVybjsNCisNCisgICAgICAgLyogUmVtb3ZlIGV4aXN0aW5nIGZyYW1lYnVmZmVycyBp
ZiB0aGV5IGV4aXN0ICovDQorICAgICAgIGlmIChmYnMtPnJlZC5mYl9pZCkgew0KKyAgICAgICAg
ICAgICAgIGlndF9yZW1vdmVfZmIoZGF0YS5kcm1fZmQsICZmYnMtPnJlZCk7DQorICAgICAgICAg
ICAgICAgaWd0X3JlbW92ZV9mYihkYXRhLmRybV9mZCwgJmZicy0+Z3JlZW4pOw0KKyAgICAgICB9
DQorDQorICAgICAgIC8qIENyZWF0ZSBuZXcgZnJhbWVidWZmZXJzIHdpdGggdGhlIHJlcXVpcmVk
IHNpemUgKi8NCisgICAgICAgaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRhLmRybV9mZCwgd2lkdGgs
IGhlaWdodCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRk9STUFUX1hSR0I4ODg4
LCBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgMS5m
LCAwLmYsIDAuZiwgJmZicy0+cmVkKTsNCisgICAgICAgaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRh
LmRybV9mZCwgd2lkdGgsIGhlaWdodCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
Rk9STUFUX1hSR0I4ODg4LCBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMC5mLCAxLmYsIDAuZiwgJmZicy0+Z3JlZW4pOw0KK30NCiBzdGF0aWMgdm9p
ZCBtb2Rlc2V0X3dpdGhfZmIoaWd0X291dHB1dF90ICpvdXRwdXQsIGlndF9jcnRjX3QgKmNydGMs
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaWd0X2NvbW1pdF9zdHlsZSBjb21t
aXRfc3R5bGUpDQogew0KICAgICAgICAgaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLmRp
c3BsYXk7DQogICAgICAgICBkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQogICAgICAgICBpZ3RfcGxh
bmVfdCAqcHJpbWFyeTsNCg0KICAgICAgICAgbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUob3V0
cHV0KTsNCg0KKyAgICAgICAvKiBFbnN1cmUgZnJhbWVidWZmZXJzIGFyZSBsYXJnZSBlbm91Z2gg
Zm9yIHRoaXMgbW9kZSAqLw0KKyAgICAgICBlbnN1cmVfZmJfc2l6ZShjcnRjLCBtb2RlLT5oZGlz
cGxheSwgbW9kZS0+dmRpc3BsYXkpOw0KKw0KICAgICAgICBwcmltYXJ5ID0gaWd0X291dHB1dF9n
ZXRfcGxhbmVfdHlwZShvdXRwdXQsDQpEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsNCiAgICAgICAg
aWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZGF0YS5mYnNbY3J0Yy0+Y3J0Y19pbmRleF0ucmVk
KTsNCiAgICAgICAgaWd0X2ZiX3NldF9zaXplKCZkYXRhLmZic1tjcnRjLT5jcnRjX2luZGV4XS5y
ZWQsIHByaW1hcnksIG1vZGUtDQo+aGRpc3BsYXksIG1vZGUtPnZkaXNwbGF5KTsNCkBAIC0xMDUx
LDI3ICsxMDc3LDI3IEBAIHN0YXRpYyB2b2lkDQp0ZXN0X2NvbnRlbnRfcHJvdGVjdGlvbl9jbGVh
bnVwKHZvaWQpDQogc3RhdGljIHZvaWQgY3JlYXRlX2Zicyh2b2lkKQ0KICB7DQogICAgICAgICAg
ICAgIGRybU1vZGVNb2RlSW5mbyAqbW9kZTsNCiAgICAgICAgICAgICAgaWd0X291dHB1dF90ICpv
dXRwdXQ7DQogICAgICAgICAgICAgIGlndF9jcnRjX3QgKmNydGM7DQoNCi0gICAgICAgLyogQ3Jl
YXRlIGZyYW1lYnVmZmVycyBmb3IgZWFjaCBjb25uZWN0ZWQgb3V0cHV0J3MgcGlwZSAqLw0KKyAg
ICAgICAvKg0KKyAgICAgICAgKiBDcmVhdGUgaW5pdGlhbCBmcmFtZWJ1ZmZlcnMgZm9yIGVhY2gg
Q1JUQyB0aGF0IGhhcyBhIHZhbGlkDQpvdXRwdXQuDQorICAgICAgICAqIFRoZXNlIG1heSBiZSBy
ZWNyZWF0ZWQgbGF0ZXIgaWYgYSBsYXJnZXIgbW9kZSBpcyBuZWVkZWQuDQorICAgICAgICAqIFRo
aXMgYXBwcm9hY2ggYXZvaWRzIGNyZWF0aW5nIG92ZXJzaXplZCBidWZmZXJzDQp1bm5lY2Vzc2Fy
aWx5IHdoaWxlDQorICAgICAgICAqIGFsbG93aW5nIGR5bmFtaWMgcmVzaXppbmcgd2hlbiBuZWVk
ZWQuDQorICAgICAgICAqLw0KICAgICAgICBmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KCZkYXRh
LmRpc3BsYXksIG91dHB1dCkgew0KICAgICAgICAgICAgICAgIG1vZGUgPSBpZ3Rfb3V0cHV0X2dl
dF9tb2RlKG91dHB1dCk7DQogICAgICAgICAgICAgICAgaWd0X2Fzc2VydChtb2RlKTsNCg0KLSAg
ICAgICAgICAgICAgIC8qIEZpbmQgYSB2YWxpZCBjcnRjIGZvciB0aGlzIG91dHB1dCAqLw0KICAg
ICAgICAgICAgICAgIGZvcl9lYWNoX2NydGMoJmRhdGEuZGlzcGxheSwgY3J0Yykgew0KICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKCFpZ3RfY3J0Y19jb25uZWN0b3JfdmFsaWQoY3J0Yywgb3V0
cHV0KSkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQoNCi0gICAg
ICAgICAgICAgICAgICAgICAgIC8qIFNraXAgaWYgYWxyZWFkeSBjcmVhdGVkIGZvciB0aGlzIGNy
dGMgKi8NCisgICAgICAgICAgICAgICAgICAgICAgIC8qIENyZWF0ZSBGQiBmb3IgdGhpcyBDUlRD
IGlmIG5vdCBhbHJlYWR5IGRvbmUNCiovDQogICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGF0
YS5mYnNbY3J0Yy0+Y3J0Y19pbmRleF0ucmVkLmZiX2lkKQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsNCg0KLSAgICAgICAgICAgICAgICAgICAgICAgaWd0X2NyZWF0
ZV9jb2xvcl9mYihkYXRhLmRybV9mZCwgbW9kZS0NCj5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXks
DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRf
WFJHQjg4ODgsDQpEUk1fRk9STUFUX01PRF9MSU5FQVIsDQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDEuZiwgMC5mLCAwLmYsDQomZGF0YS5mYnNbY3J0Yy0+Y3J0
Y19pbmRleF0ucmVkKTsNCi0gICAgICAgICAgICAgICAgICAgICAgIGlndF9jcmVhdGVfY29sb3Jf
ZmIoZGF0YS5kcm1fZmQsIG1vZGUtDQo+aGRpc3BsYXksIG1vZGUtPnZkaXNwbGF5LA0KLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRk9STUFUX1hSR0I4ODg4
LA0KRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwLmYsIDEuZiwgMC5mLA0KJmRhdGEuZmJzW2NydGMtPmNydGNfaW5kZXhd
LmdyZWVuKTsNCisgICAgICAgICAgICAgICAgICAgICAgIGVuc3VyZV9mYl9zaXplKGNydGMsIG1v
ZGUtPmhkaXNwbGF5LCBtb2RlLQ0KPnZkaXNwbGF5KTsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOw0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KDQoNCkNvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSBpdCBhIHRyeT8gVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KUmVnYXJkcywNCkphc29u
LUpIIExpbg0KDQo+IFNhbnRob3NoIFJlZGR5IEd1ZGRhdGkgKDMpOg0KPiDCoCBSZXZlcnQgInRl
c3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb246IEFkZCBwZXItQ1JUQyBmcmFtZWJ1ZmZlcg0KPiDC
oMKgwqAgaW5mcmFzdHJ1Y3R1cmUiDQo+IMKgIFJldmVydCAidGVzdHMva21zX2NvbnRlbnRfcHJv
dGVjdGlvbjogUGFzcyBjcnRjIHBhcmFtZXRlciBhbmQgdXNlDQo+IMKgwqDCoCBwZXItQ1JUQyBG
QnMiDQo+IMKgIFJldmVydCAidGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbjogQWRkIEZCIGNs
ZWFudXAgZm9yIE1TVCB0ZXN0cyINCj4gDQo+IMKgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlv
bi5jIHwgMTY4ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0NCj4gwqAxIGZp
bGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTIxIGRlbGV0aW9ucygtKQ0KPiANCg==
