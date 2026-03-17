Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC25FD8741
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 11:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1A710E5D0;
	Tue, 17 Mar 2026 11:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cxEDfMwD";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Iq8WaDKq";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734F610E5D0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 11:23:46 +0000 (UTC)
X-UUID: bf9f8aea21f311f1a39cd589f645bc18-20260317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mPndFdN5z+447o3hct99/4DEJOhP8Rgmc700mQW6vBM=; 
 b=cxEDfMwD5pYR3S0T+VnrMBukjIVeGgA2TXW5HL3FKH7It0yEota2VmsVNjLFsg+lXTC8zvkOVMbtevHPSjN+vL8VbMKFM1RYNePlInBcuvSIt8q3lSmHpqYe2W0BplUXXI3LyTIsOLTtxB00OyNGWsH4VtkQhHrerdCjEXroGIY=;
X-CID-CACHE: Type:Local,Time:202603171920+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:0fb7a18e-d049-4d76-83c4-0f06a302f5c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:d92ad2d4-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf9f8aea21f311f1a39cd589f645bc18-20260317
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2133426883; Tue, 17 Mar 2026 19:23:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Mar 2026 19:23:38 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Mar 2026 19:23:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1p6TGoLDcKAUCX2DAjMt34gDk9YVkDsHrXS/FkYy9jW0QgGdLyWdbu/X63nAb4XbZbW1yRuhHKYPZ4x1BBXNi+VhiRW6k18QjUNpyIKmKrKk0ZWTfVxcnrFlCFxCqMAKVkDgmfZQ/3HrvU+7a6gqH2i1+EGe4YvAy5xEkhBRDeLK8wxO4Kis+TR9AN1g9WLBvok5C/kUXZeHPCuWCW/lN9XnHc83ZKUZTh9pko5PN/d7z+mgY5v8mQCaWUU2lqPz0P3SFF3/MTMy9EBk6kX4PdgJR9UwgHwq3d4QwG2SVOT2xCRTcZV9PJ9ASI/N2tEwXRyvP54X833yNU9T0sZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPndFdN5z+447o3hct99/4DEJOhP8Rgmc700mQW6vBM=;
 b=ooxWaykNns61FaGfY9VQreC+CoRqmZgfLtBaHrPOkWaaJIjRhdTnatteG27bxSdY05B5RcwS6SAbcnqeb7DT3KUsU8CfkBTxRokKy81hU+X1y4YRRr8eTRKIWSaes1xrZUvghbTRLPFdn95Kul4Zvs9ieaHpfck4AkYc7rZPXdW2pOL+ChWWmhjDz4DUnANK6u3DBgCoCKrZyllwltPnl3aJkTVxAziVoca22rU/wt+EXLVfCYLq+stht7fMozl2MHoZOlW3nICz18ZbPzITbDTJR2KcpXwsYVea2YeUq7iX3r0i5XdMkjMoXURkMUSwgMkKTMRf2GS8BAu+8EHGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPndFdN5z+447o3hct99/4DEJOhP8Rgmc700mQW6vBM=;
 b=Iq8WaDKq+71stgmq6IGnBZctwDPFryNM/nVBT3tuJZqKhpLQ3R/YsN5MJLT78IUNe5G6ZFncs3z9GNk5H+F+CaztpaxdFn1ftyR+FBWU57O1XvaMGR47vj/GXoKI/TFYdB8mDRw/Rs5al8IkEd8RNiKDMvvnjSsbgxjTSAMmpEs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PS1PPFE34507454.apcprd03.prod.outlook.com (2603:1096:308::2ee)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 11:23:35 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 11:23:35 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Topic: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Index: AQHctRwLD4a7Qv2cTUydO+Pm8eJdY7WygRwAgAAVpwA=
Date: Tue, 17 Mar 2026 11:23:35 +0000
Message-ID: <7511ae59f251a186fabee226fa9eb63ac49e3714.camel@mediatek.com>
References: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
 <356099f0d5b2c882460e344869720b92c0da538d@intel.com>
In-Reply-To: <356099f0d5b2c882460e344869720b92c0da538d@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PS1PPFE34507454:EE_
x-ms-office365-filtering-correlation-id: 09db7d40-2450-4ade-868a-08de8417a121
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: rNdJYOfKwt5pS8mi85eZFQEauvRA8NDBgQvUfxWgStuk1pdRgVhQXzVN4OUIHHNy3PU+Qky6pPlKLXEnFn8A3dnqoTVQwSuryWZz6fxrKW96ORuz8cZ/J+nwdsl3iZOLDQz8NThwiZiRX2+E4NNI1oyG3iy5QBi8icqZfUZMJ48RpnWNhykxm95rjJjcSoG7Dfq+nTrLSavcNw5DUYQUKUHMHin5qqgrKnPvh3RR80pq0kY9wgTGnrK1CHgotAtnG4B6uClULjy3swVHeoOCbH0sr7/1xX3DMsqvRKSk74PKgWoWe0HIeu1whCWAHSJuzYIGdoFvS/qxVwaxSWWAV+SD3zfcn72FGaJ5tIwRfJpIyMy/zg9ix9rnuiv217ayxtxt2kluFHz5W4UFh+UYAlSYZoYnJ1XxG87Cw9U++QUM0XaSeAvaTGpwPYvbQ6vGufTTx7WHm9HVgPbqsLcrXj++d414RqqXS0zaqMQdACs8qIq/PQHM7MVY3R+CrRyNJ1FbgYKlObCDdrtft7cA67LtooIZk1SrIKsI9ozomsqGMpshfOzxlUl8eWP/sJ4c1i4gsroFTBT/4DMGrs7jFmOlBzElpjqokO+OV1Zo6Hi0ChP6h8UpgnOUcFt5CbFNOmdV4Om0XZQCIViwI6mb2H04sokderk/aiB2VpfIGVgZKIAF34XxsTk2MXNDxR8P0oLjiWJFhEn/Wd1g88ozXgyX2jZVWO4NP7nOdLdWCnpxUIxAAbYJUO2oTm+3fMfc7ZtBD5S3Ozb2LF8ahOjco/QM6pyMnjrdAulF36D3Ozs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um1zdFErV3RRVURIaVgvZmZkN0RjMTJIbGhNWllvcExCQlFQV2dRZ3AvUEZX?=
 =?utf-8?B?WjhFTmV4UUZMbCtXdUllbDdEUkNURVBjTDRIcHBvNmw4VFNDZ24ya2RTbklz?=
 =?utf-8?B?YXEwWThnZ1pzRm9tNzROUDV1Z1NJdFVEUlQya29LNFJ3Z3htd1ZPbXB6Vm5B?=
 =?utf-8?B?T2I0MEx6WWVQZzdSUW9tQXhybHJGM0dGQ0V0VkdwN1g2bUszNms0RFpEMWJy?=
 =?utf-8?B?Rmh0dmUwbE9Idm5ic2taUmNjU0pFYVltK2hGWVJDYnVSZTBiVlhPLzVFM2E1?=
 =?utf-8?B?WWx5a1dqMUVnQ0NQbzlRaktJc1cwMDh4aVl0NlhwZk9IbEV1MlFlQ2ZMTDd1?=
 =?utf-8?B?VVJuMlRjVnY3ZEpIenhPb2tiVTdDei9JckNPUjhFL3lFVHNZVzZJSXpLYWQ2?=
 =?utf-8?B?Wko5bVlHd3NjSGM4UmlQcFZzZHRpSW1QN3V3eGxmUXd2c1BnbHIrTVVDaWdk?=
 =?utf-8?B?OVcxZ3pTWXdHRDZ3Q2x2SnhBcFRNVFVzMWVJM05OZUhJSmRpTzRLTDN2Ni9P?=
 =?utf-8?B?UGR5elJCTHVMQVUxc2ZEcEFzbnVmeHlYd3FQV1RqTEdKVGFHaXpYMXloOUx3?=
 =?utf-8?B?SmFCMmN4SWNRK2JtZTN5OEYvbVFsUzAxTFBwWnJ1bGxaYjBEMDRRcGE2R0dC?=
 =?utf-8?B?ek81MkFPMVVxZ1lUNnMwRTVMUi9GVXNWVDRaOS9PNEZLbzNxMDJrNVp6dEhU?=
 =?utf-8?B?YlNmQ2p2ZjZYVkc1bFpwblFhOTU5VlVqTWdwb3hRaU5pMHhlcU5Yd2NTM05G?=
 =?utf-8?B?YWNpSWRXMXFKaWFlM0p2Zk1XN2tDVUs5cjg1dXlORGVXOEluRElrMEtWMW9y?=
 =?utf-8?B?TG1oUkhIYUlHZE5aZU51YnI3RlVmTFpFbkZEcmxxRnNFOVd6K0V1UXpzdHJk?=
 =?utf-8?B?eHUvZzhXQlhlSGh2amJtTmE0OGpuYUdaUzdZbSt2RUxNVk5aRXNjVWhaeFpJ?=
 =?utf-8?B?LytHOGIzMG1PQzVicEJYZTZQUGpiTk94Y3JzcVV4MUQraEc1KzVEa2xpOWo1?=
 =?utf-8?B?eXdnK1AyaUIzUnpSY3lqMFY4Z3Z0OHpua1lHT3Q0R0xTNlNKeHg2UFNJTUJU?=
 =?utf-8?B?Y2VxeGJ1OVczZjN6SlBrcEwxTzF4akVUb0NtS3l3aGtlRytmbWhMMDYrS1ZZ?=
 =?utf-8?B?eUpDWDJRRk9YNXBWYkRkRCthN3VteDhyTktLVGsveWVzV2xYNzQ4WTZjVi9I?=
 =?utf-8?B?WkMwaGlwNEpneHNFY0JLcTFkbjVpclMxeVBmbTh3eUxaY2ZmVTRJdlN2VDN0?=
 =?utf-8?B?YzNrUytIdGpqRmhQazZxVkRTNDI1Q2JpSWd2Sy9EcnU0eWFrcC9hemxyWUVo?=
 =?utf-8?B?TmpZQ29xZXlRMVV3SkdUTDc0WUhDRUNpdi9udEV5S1VhTlVxa3F2TUFwSGVQ?=
 =?utf-8?B?WGdHK0xlVi8rM2V3ZzM4ZkJNaDJpS0M0QXZiaUYyQ1JlOCtFOVJ6WkJsQlBN?=
 =?utf-8?B?MVlUNUFyeEtvRGdlVW9Hd0dPRExKTUZQQVhQVzRNRnNyVjVrVm1pMlFpQmI1?=
 =?utf-8?B?VzJSU0F4cEc1NnVndHN0VCtTN0dPdDA2MzNoY29EMC9pWHVISjZ4Qnp1SGV3?=
 =?utf-8?B?WXJwYWpMREdwZ0FTaStRekluRUkwSVRXNjdGMEJGNGZNNm5CUE1vankzYVVt?=
 =?utf-8?B?TlJZRk1HV0srckVGTVhrY2R1Y01nQVV6SEdsL0ZQcnRVTTVjTEswdFgzSUFB?=
 =?utf-8?B?NmhKZXQxVkNGMFpVL0M4UFVtNmdsYXgwcmt5Wk5BTXVBNjZCRnVQT2FTTEpx?=
 =?utf-8?B?Z3F3andMajNaM3RCSU9RdG5oQ05HMVlveERNM04yUEpWSWswWS8rNWFxbHkv?=
 =?utf-8?B?aEc1Yk1hMTFNMUMwUlcwYVJJUFFLNU9MNi9nWnUrNjBRczlwbHhMTGpZeHJF?=
 =?utf-8?B?clh6S2Q0YnU5OGk2M0d0TTkyWnNJVVc1Q3Y2V2plYytKVnp6cHhKVm1XeHhv?=
 =?utf-8?B?aTdsTXFZUElaZThTMWlqV2VTdHh0eTRxYlNqV1RVM0EwdHBxd0xGaGgrTXR1?=
 =?utf-8?B?WHVMaTZpMmI4a1Rwdi91Q1MzUjVHRkl2MEVzQldUdXg3R2xZRDA4cTBDRkxH?=
 =?utf-8?B?U0VvRk50R2JoVEkrWDE1VEhwVjAvZUI5T0lIbHVxT1hPdklFZFp2MXN5bDNh?=
 =?utf-8?B?YTFrTlF4ZmpYNit0RXBuYWxucW5xM3M5NGNlUlJHNFZCUjR6SGFhanlmUENk?=
 =?utf-8?B?TEMzS1d1OUlBczRpdU1wc1lXZmFZdXlERnhRN1p2aC9EalkyRWl6Vm14b0hO?=
 =?utf-8?B?YTFqQ0dKUW8vNHhaVktoNGtmSGpaSW1FVlo1K251L04waWc3Ulkvbng0RmI0?=
 =?utf-8?B?UnN1R1hKSC9ueUtBajRWKzFsaTdZeVRIbHFqR2hyS21RVzlvazR5WUFNVExR?=
 =?utf-8?Q?qLzDMHtbgtNRWzYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DC73B47A3003246B0A3261F1A90433E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iQDrONtsM3VBBpoRsDydY6/ffAW6y0l0voebDzbqgVfEA0uBZ/BuZfNx6gbkmXoDTYhkBgmtQxIy8qj2DA+nH7Ixsw82cCTWgY8c+JkDnihq4DfthKyU7ab+ekcAMlr0C+ThJS+wa1jgmha9IHqXvR1xRwefLTc3BVVy4+TawgP9uDi02A6SE2x+vy2XDQboZEJyaKJg5d6uBGA2owTSJQtTt0SIUPY+IQCJz8U/TBAZuzezG2bSYgLTd7aqg/v2Zrx2aC5R0Ymj+K9TKgCZDKXEkQrPeoOjw3uvDy8rrdEb8Xo4HmrpUySjThNWvKZgDMlnZAx4kW1WPd/aJudGPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09db7d40-2450-4ade-868a-08de8417a121
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 11:23:35.5077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qarMS8lNbawRkneNhoMSFie2FNJaMIBliXv2gz2hs2fJSwN7oDoG9mixkkhFo6lwZkqclzeTJt+3Y+NY5bmZOHqPn57HpkRiMVV9YcZOD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPFE34507454
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDEyOjA2ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAxNiBNYXIgMjAyNiwgSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPiB3cm90ZToNCj4gPiBSZWZhY3RvciBmcmFtZWJ1ZmZlciBtYW5hZ2VtZW50IHRvIGltcHJv
dmUgcmV1c2FiaWxpdHk6DQo+ID4gLSBDcmVhdGUgZnJhbWVidWZmZXJzIG9uY2UgcGVyIHBpcGUg
YXQgdGVzdCBpbml0aWFsaXphdGlvbiB2aWENCj4gPiDCoCBjcmVhdGVfZmJzKCkgYW5kIHJldXNl
IHRoZW0gYWNyb3NzIGFsbCBzdWJ0ZXN0cw0KPiA+IC0gQ2VudHJhbGl6ZSBjbGVhbnVwIGluIHJl
bW92ZV9mYnMoKSBjYWxsZWQgYXQgdGVzdCBmaXh0dXJlIGVuZA0KPiA+IC0gVXNlIHBlci1waXBl
IGZyYW1lYnVmZmVyIGFycmF5IChkYXRhLmZic1tJR1RfTUFYX1BJUEVTXSkgaW5zdGVhZA0KPiA+
IMKgIG9mIHNpbmdsZSBnbG9iYWwgZnJhbWVidWZmZXJzDQo+ID4gDQo+ID4gRWFjaCBmcmFtZWJ1
ZmZlciBpcyBjcmVhdGVkIHdpdGggdGhlIGFjdHVhbCByZXNvbHV0aW9uIG9mIHRoZSBmaXJzdA0K
PiA+IG91dHB1dCB0aGF0IGNhbiBjb25uZWN0IHRvIHRoYXQgcGlwZSwgYXZvaWRpbmcgYnVmZmVy
IHNpemUgbWlzbWF0Y2gNCj4gPiBpc3N1ZXMgKGUuZy4sIDM1MDR4MjE5MCBwYW5lbCBpbmNvcnJl
Y3RseSB1c2luZyAzODQweDIxNjAgYnVmZmVyKS4NCj4gPiANCj4gPiBGb3IgTVNUIHRlc3RzLCBt
dWx0aXBsZSBvdXRwdXRzIHNoYXJlIGJhbmR3aWR0aCBhbmQgbWF5IHJlcXVpcmUNCj4gPiBtb2Rl
DQo+ID4gb3ZlcnJpZGUgdG8gZml0IHdpdGhpbiBiYW5kd2lkdGggY29uc3RyYWludHMuIFdoZW4g
bW9kZSBvdmVycmlkZQ0KPiA+IGNoYW5nZXMgdGhlIHJlc29sdXRpb24sIHByb3Blcmx5IGRldGFj
aCBwbGFuZXMgYmVmb3JlIHJlbW92aW5nIHRoZQ0KPiA+IGV4aXN0aW5nIGZyYW1lYnVmZmVycywg
dGhlbiByZWNyZWF0ZSB0aGVtIHdpdGggdGhlIG5ldyBkaW1lbnNpb25zLg0KPiANCj4gUGxlYXNl
IGF2b2lkIHVzaW5nIGVudW0gcGlwZSBhbmQgY3J0Yy0+cGlwZSBmb3IgYW55dGhpbmcgdW5sZXNz
IHlvdQ0KPiBhY3R1YWxseSByZWFsbHkgKnJlYWxseSogbmVlZCB0byBrbm93IHRoZSAoSW50ZWwp
IGhhcmR3YXJlIHBpcGUuDQo+IA0KPiBQbGVhc2UgcGFzcyBpZ3RfY3J0Y190KiBhcm91bmQsIGFu
ZCB1c2UgY3J0Yy0+Y3J0Y19pbmRleCBpbnN0ZWFkLg0KPiANCj4gVmlsbGUgYW5kIEkgaGF2ZSBi
ZWVuIHdvcmtpbmcgaGFyZCB0byBzdG9wIHRoZSBjb25mbGF0aW9uIG9mIHBpcGVzDQo+IGFuZA0K
PiBDUlRDIGluZGV4ZXMgaW4gdGhlIElHVCBjb2RlYmFzZSBpbiB0aGUgcGFzdCBtb250aHMsIGEg
dG90YWwgb2YgMjAwKw0KPiBjb21taXRzLiBUaGlzIGFsc28gbmVlZHMgYSBzaGlmdCBpbiB0aGUg
bWluZHNldCBvZiBJR1QgZGV2ZWxvcG1lbnQgdG8NCj4gYXZvaWQgdXNpbmcgcGlwZXMgYWNyb3Nz
IHRoZSBib2FyZCwgYW5kIG1ha2UgZXZlcnl0aGluZyBhYm91dCB0aGUNCj4gQ1JUQw0KPiBhbmQg
Q1JUQyBpbmRleGVzLiBUaGV5J3JlIHRoZSBoYXJkd2FyZSBhbmQgdmVuZG9yIGFnbm9zdGljIHRo
aW5ncy4NCj4gDQo+IEkndmUgY29uc2lkZXJlZCBzdWdnZXN0aW5nIHRvIHJlbmFtZSBlbnVtIHBp
cGUgdG8gdmVuZG9yX3BpcGUgYW5kDQo+IGNydGMtPnBpcGUgdG8gY3J0Yy0+dmVuZG9yX3BpcGUs
IHdoaWNoIGNvdWxkIG1lYW4gZGlmZmVyZW50IHRoaW5ncyBvbg0KPiBkaWZmZXJlbnQgR1BVcywg
YW5kIHdvdWxkIGVtcGhhc2l6ZSBjb21tb24gR1BVIGluZGVwZW5kZW50IGNvZGUNCj4gc2hvdWxk
DQo+IG5vdCB1c2UgdGhlbS4NCj4gDQo+IFRoZSBDUlRDIGluZGV4IG51bWJlcmluZyBpcyBhbHdh
eXMgdGhlIGtlcm5lbCBDUlRDIHJlZ2lzdHJhdGlvbg0KPiBvcmRlciwNCj4gYW5kIHRoZSBudW1i
ZXJzIGFyZSBjb25zZWN1dGl2ZS4gT24gSW50ZWwgaGFyZHdhcmUsIHBpcGVzIGNvdWxkIGJlDQo+
IGZ1c2VkDQo+IG9mZiwgbWFraW5nIHRoZSBwaXBlIG51bWJlcnMgbm9uLWNvbnNlY3V0aXZlLCBh
bmQgKGluIHRoZSBpbW1lZGlhdGUNCj4gZnV0dXJlLCBwcm9tcHRpbmcgdGhlIHdvcmsgVmlsbGUg
YW5kIEkgaGF2ZSBiZWVuIGRvaW5nKSB0aGUgcGlwZXMNCj4gY291bGQNCj4gYmUgYWxsb2NhdGVk
IGluIGEgZGlmZmVyZW50IG9yZGVyIGZyb20gdGhlIENSVEMgbnVtYmVyaW5nLg0KPiANCj4gDQoN
ClRoYW5rIHlvdSBmb3IgeW91ciBkZXRhaWxlZCBmZWVkYmFjayBhbmQgYmFja2dyb3VuZCBleHBs
YW5hdGlvbi4NCkkgYXBwcmVjaWF0ZSB0aGUgb25nb2luZyBlZmZvcnQgdG8gc2VwYXJhdGUgcGlw
ZXMgZnJvbSBDUlRDIGluZGV4ZXMgaW4NCnRoZSBJR1QgY29kZWJhc2UuDQpJIHdpbGwgdXBkYXRl
IHRoZSBjb2RlIHRvIHBhc3MgaWd0X2NydGNfdCogYW5kIHVzZSBjcnRjLT5jcnRjX2luZGV4IGFz
DQpzdWdnZXN0ZWQsIGFuZCBhdm9pZCByZWZlcmVuY2luZyBwaXBlcyB3aGVyZSBwb3NzaWJsZSB0
byBhbGlnbiB3aXRoIHRoZQ0KbmV3IGRldmVsb3BtZW50IG1pbmRzZXQuDQoNClRoYW5rcyBhZ2Fp
biBmb3IgeW91ciBndWlkYW5jZSENCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IEJSLA0K
PiBKYW5pLg0KPiANCg0K
