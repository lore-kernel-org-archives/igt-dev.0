Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0A4CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 10:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79710EFD7;
	Wed, 20 May 2026 10:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SL1DWLQb";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pignj5ZL";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAE310EFD7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 10:05:11 +0000 (UTC)
X-UUID: 612bb91c543311f1b5a00d44d12bea5a-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=KGkuchEoS3yGbA/gvxJZnrl+9Lj6LJAOS4sQ1lBM+mk=; 
 b=SL1DWLQbVZkJqB0lA9+/TSNcke8IeJLHFZFZGKIK8kT4YwSG/VAf5ZdLfk1RomuLTVedxpsNKgLxN6XFTCi1SNRrRn36nCWe6M7zlkOpzqsKZRni+/dhgJ8rEFWVIMjQ30StK1YqndEhWNe9hLwyvpUaV9O9iSjNfH6h6dourqk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:3d4e3972-cba8-4e93-bc45-f9b99d9a4eb9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:1b7f071f-023f-4f87-9e9c-6c116c694fb3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 612bb91c543311f1b5a00d44d12bea5a-20260520
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1911881656; Wed, 20 May 2026 18:05:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 18:05:06 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 18:05:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wy7eG/zSklRfQWzL1moj0UK+ampL3/FxaJHs3ZFfELJ5Fcof09ZJgrVQ4ARP1Y7aVH/V704DbOUIz6Dit8PJAR4ocb/3AKNFeTSU480OBIOnnAwEzaK9SucNHdWIK/mM7qwxfQXdJvdKb7jStNjaFIIoRQLrm/puZU6aRw2DFg7LGky4Jan8KlGi1zYGsCEKF2y633ZS8feNamUQKIgJUzfEaXEuqUeAT3FYO0gznLcnhtKckJIBu07MHizzY5nj751KgrugduQwVPNsq45FZWK2woycz6LZlkGO2AKUQwcYpSemcDkbJg8H6ZVFqcxDvq77vu+0WvDv7cg88Uabdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGkuchEoS3yGbA/gvxJZnrl+9Lj6LJAOS4sQ1lBM+mk=;
 b=NiOfEzBhpmMTS01pSp+/ONVD1h3YviDxy4BcHkXcbFN9mHehGcZXp9IIHYuQ0mmf+qArmTfLB3S2VCadjidSbwXVK7O9qTkCwcdxLtH80LzYJUbVyjt5jVrtFSihxF2hRk1sTkTNpIToKqCufoVtV7a5FmBYuupl7UBanoofdMEKeq3h3qIHHnM1thRriSbP0Fo8Bwaj2+sABwzOX27rMemJzqC9OeUaTH2nWvuwdBThmCEMTmttUU80bWM6X88JploZGRM5MYDtawoTIf0Yo1mw4mGgTWdDbjOib/K/05dUgokchzg3BpF6wp/z/OseA+oge7nntKRwJxwe+oppOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGkuchEoS3yGbA/gvxJZnrl+9Lj6LJAOS4sQ1lBM+mk=;
 b=pignj5ZLnrcGM4oyLwTxV0BwuFtbh0bVQHKukeVUdBrA4QED/PJkF3Yl3kKWdJhIFF0lwVttwvQrSq3f9jgVnGAIVK7edCzBWPIo8pQbiU5mOTkDMwrb/6CgI+G/zUu3sYPsrxfSm/gCk0gXJxSzab5C27chmQDERWUmfK7Vq8U=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8360.apcprd03.prod.outlook.com (2603:1096:101:19f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 10:05:03 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.016; Wed, 20 May 2026
 10:05:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YWqmeAgAAFjYA=
Date: Wed, 20 May 2026 10:05:02 +0000
Message-ID: <bc05e337724f63bb5072f000dd49f35735aad9e8.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <20260520094509.zhxjlzditdjbzfuq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260520094509.zhxjlzditdjbzfuq@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8360:EE_
x-ms-office365-filtering-correlation-id: 8a9cac05-6905-4ccc-56c0-08deb6574282
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799006|38070700021|921020;
x-microsoft-antispam-message-info: SDAy86CVmySehrrOYezCGJuSqMp4GZgYNbcYszgEqV1PDiyeNMGhPMFH93f8ZqlDedtGDZPfHU0fusjF0hu0PH5OfN7PtzejU4/URj6KFRfD6a7HVSGi1iK32P+kgkT2sOawv4yAmnvW9C7U943nZ/y05ghbuIfPC1rqE8bBWAwwqQSOqgeMBIKpNDIhSRntz+tDsMzxHl6UuuN3ucEKL0jApTPpbgQ1lrxyHBac6n2dSAidXz8a8zCeCRpNWiBvH4CtndUnoZ0zZNOW07XcxUOZN4GW8dA1KkVgAwF9mDMaJL1XbBHZ9PQ1xmvbtxr9aAuo8YufrsI3R1ndGxbUEFIbE6UR7Dk5SuPkqbUgqsWn/uNGSAQITQtHOYfSfr3VBusGhakQjvkZQXmJqN1eAh/RxGXolknImCKyQqjT/tYbjTfJ2/pvklE9BiOc4KcmR2zlyUViHUaBS60USkQfPKEHszb/n1SCq5+BNYxLiU4PMtNNLXFfFx/dPlOdLh9+1aCA50FFlCokhYuzhIgFByg+pmuuz3JKposUsLVoBB9me1s5dFW1aSHKc+jJVb8ZehyB8LBYftYOeRKarRJRVlCCv01ftoWnZ+zQlhHme9NIFB49jqDtnxpozRDz7H1iuDRcjFQKTN99XQ1Ou+w4iMc4jMAGG/49U7h/Dvaj3MfkApnsRAc/iix1Vs3Cc+4ppsFQsStyMcWnUAZxO868/MaTasH7etevuff5/T+s+dkQpyEknD8/1YJHqWYbb7p1wvRZgogQTuIZrzk/YeXwCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1VBU0l5am5XMlBWSVNLTjY2ZmZBcGVZYmkxVmJ2K2tacmsyMytsSU95RlNF?=
 =?utf-8?B?RkpPTEZoRFlDNGFKb1REclpTZXl4eUdQMFNaOFhPVGMyVERPMTg1emlMc05C?=
 =?utf-8?B?SlQrSDlwNWJ5bFRGWGd1blNjOHZPMmVhOXRiQ0lUUjZjeHN1aE9ENFBuMlVW?=
 =?utf-8?B?bEMrNnMwMi9SN2txb21veVlRcHhhR253bHl1MUhQQXo2OEdZbzFrazVqZ2pP?=
 =?utf-8?B?VXhIbkhEWUV0T1ByUXJ0dkNKMFhsdFdRMkVEcXlaUXNxSVMxMzBoUzFteW1t?=
 =?utf-8?B?ZjUwTkJVYkFDajRnbmN5UEtNWWRPZlhZZ2hSNkliSG1OWGhHMXo2QUkvaWE4?=
 =?utf-8?B?WVBYRWpIMldnOGhKSmtPaFhNT0Z0M3VXZGIvaWJES21yOU91bWhCUXRHb0kw?=
 =?utf-8?B?NVBQQmNBQ2g0VU9JWjBkUWw2U1k0N2dGYnZaVWp5QmVaV0hnd0x4a0JzMGxw?=
 =?utf-8?B?NGFGRWtXZzdlSk4wMGppUW05M2l3cVFNd1hqSkZJQmhRZzVYenQ5WE15N1R5?=
 =?utf-8?B?UkF6RllMdUhUcWRmNUJ0S3dvRUVOSEU4d2dZM3QzOVM4bFdRQ3UybWhDejYw?=
 =?utf-8?B?bFZTeFJkUVArTG8ydHNXWGJtY05QekJGeGxLa0haNldYeWZPd1kwYXByaDlK?=
 =?utf-8?B?QndURHN5YjNUTjZTMG42WnFKbjV5SmRUZTczb0pjbnV3eG1iSkJBb0ZmS0Nl?=
 =?utf-8?B?V1hkOWNzOG42Zi9ra1YySElZeGNLVjlYanI3ZXMwQ0VXTkNLZys2NEloRzBr?=
 =?utf-8?B?UUNXUmkwNnBRM1pWUzh5eXVTL01CbXV2NTlnd3R2d3hBN2lsSHEwNEVFMldz?=
 =?utf-8?B?V1lEVWxoWUozc2YyamE3K3o3TVFKbWRwYU1VWnhXN1FJbWN2UlhOc3U3K2xI?=
 =?utf-8?B?UjVRZE9nQU1pUHUwTjR2YjF4VC8xMWQyQjRKSVNFUDZvRXZFN3pmQ0hTSmgr?=
 =?utf-8?B?dHArdnBWY1FYbXlJNUZlOFJQbmZNN3hneGlxY3kzMkFCZTk5NlRVU0FlRlEx?=
 =?utf-8?B?ME4wY0NIYmJBaTF6Q2kybHNNM3B1NDlaVXIyN0xaMUg5RElyb3hZME4ralMw?=
 =?utf-8?B?dXIvNFFvZHVQQ2xWZ01ZUXNKT0lmTHRPSU93OWhVQjV4Zzl4Qm95WmtIejVR?=
 =?utf-8?B?NzFHM3dzRTBING55ajlQaS9md00zUlhPUmx1YVRVaTVQZEE1QmRHdXA3UjQ2?=
 =?utf-8?B?ZklhcHdRSFhPTVV0QnJQZTVyd0VyVjRvVE9vM1Z6VG12cDBOd0ZvVS9RMUdT?=
 =?utf-8?B?ZS9HOTd5STlBUEZOc0RMNGV4cTNiM211cFJXQUlBbzBTUStoZ04wd2hnSG9i?=
 =?utf-8?B?c0kzdmRtWXNhb2k3QmJ2RUh4QmUxenFFSnNiSDJRZ0NJS2YzSEdzcDNKaFd1?=
 =?utf-8?B?TTZoeSs4ODdaWWNMVnMzRVJEa2tTQU1LcnFSbWRVMjluNm1hdzUrdHNETHR5?=
 =?utf-8?B?RllHdVg5ZERTeVVqMmFEQ2g0NUVGeVRDT3lNSDRwa2xhWnA1V0ZOcHZRQm55?=
 =?utf-8?B?c0MzT0VQK3c0Mk0yZXRQQitQdVJvMkg0czEwVnZocStJaGJYU3hUN09ocEp0?=
 =?utf-8?B?dkpuTko2cW1wM0ZZQWdzeXhJcTR4KzhEK2V0UG1zRlFZbW5VNlowZmRtc2h2?=
 =?utf-8?B?cC9idVllL3ZYSS9FUUQweEk3ZC9YdktXeDlMRFpxSDREY1R6OVFKRitJVjZI?=
 =?utf-8?B?U201N2V3U2lzUEtQdGVxQ05vUjdMQnljMUVnU3hKK040VUQzU3owYXFocURJ?=
 =?utf-8?B?S3lDc1N4b0dtV2tkK2hBbVFWT3Y1cEducFpmb01XVWpDQmRZc1UxREVnYTNQ?=
 =?utf-8?B?UzFaR1ZaWTNEUzFlVWNjSy9pVk5kOWpBNGg2RzNxYm5QbzlpbVFLWmRlcHVj?=
 =?utf-8?B?UEYwSTFJRGZLS2NWVlp6Q2pYUG5oSmxtU0l5QVlhREN3a0hzRDBRcXg4NUFP?=
 =?utf-8?B?YnA2WHBaKzBtWkt3YVZVWHJPR1FISlkwK25sVHFMYlF3eUdqeFowVmtlODJl?=
 =?utf-8?B?d2haaHc2ZUdyZHdVdVllbXZsdUpsUHF2VmRKT0hPUXhqT2ZZbUNPeGg5VmY5?=
 =?utf-8?B?TFdpVUFaY29HbEhZaENGT3MvOVAydUh6L3grUlJxUXh1ak10KzIwaDhnZG4z?=
 =?utf-8?B?UVJqc3JtOGtZR1JFWWRkelNUZ0czZWZZRnpSRmJDbzBRYitIRUs0SmUwb1Fu?=
 =?utf-8?B?Wm9rc1RDMS9QYVpQT0N6MXZSVkZGYjJ5TExNckFGWEV5ZGE5YldITUNsLzdU?=
 =?utf-8?B?dERHdWR3UjRFVlMrVzl6cXZhV0RSTGJaWGtoMUZkanBUS1Q5d1BqbVNpclY4?=
 =?utf-8?B?UXY5TlYvdzQ5ZkhwcUswNSszL0dxLzFPUFkzZnpUVGpQUnRmK3NDU2JLOVNv?=
 =?utf-8?Q?FzvhjLGT1KauuFKo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BF448DC516C214EB47FDD4450B6D562@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BeFewdYfj3YA+wFge9G9/+C/betDqsTc01Ywvz6L4gDiqHmh1T02gI9gyP2x6eVdNtXTqj402BpwCZMloGvZ60pDIhHDLgEfgIGhPKNlrHHLIjtwn1CHaaE2YfLY/2d6GytpKNk5yx7JNAxSVLaPMlIFRR0eVcJTaEYC6vTb0oPBXJcI46pdJbGFm7kaCx+5w23NqYs5K2Hl2Bj5Y1wwbRiOiYB89BoJusIkovby6JbcEHFQ3Gvnd4f9if3y/ZkqMJV2Wj3KKd40FKFpy6Xr43z/r6R/+C1QJ1xmFhglxWIZ5dLhQSC4kvvJCalXZdKxKx6/8AMXyC4NHlFwB31U3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9cac05-6905-4ccc-56c0-08deb6574282
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 10:05:02.6949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zh5iBhX43nSxsuH6K3OHSmUt+hH3bWmL89ARkUC+Zzr/o11SktY+TmqMQPmByX2d2xOrbEWKOQ8+04Bjt/LJT9yw+RrMGTWOK+OiWN5E9GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8360
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

SGkgS2FtaWwsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyBjb21tZW50cy4NCg0KW3NuaXBdDQoN
Cj4gPiArKysgYi90ZXN0cy9rbXNfc2V0bW9kZS5jDQo+ID4gQEAgLTEwNjAsNiArMTA2MCw5IEBA
IGludCBpZ3RfbWFpbl9hcmdzKCJkZXQ6IiwgTlVMTCwgaGVscF9zdHIsDQo+ID4gb3B0X2hhbmRs
ZXIsIE5VTEwpDQo+ID4gwqAJCWlndF9yZXF1aXJlKGRybV9yZXNvdXJjZXMpOw0KPiA+IMKgDQo+
ID4gwqAJCW1heF9kb3RjbG9jayA9IGlndF9nZXRfbWF4X2RvdGNsb2NrKGRybV9mZCk7DQo+ID4g
Kw0KPiA+ICsJCS8qIERpc2FibGUgQ1BVIGRlZXAgc2xlZXAgdG8gZW5zdXJlIHN0YWJsZSB2Ymxh
bmsNCj4gPiB0aW1pbmcgKi8NCj4gPiArCQlpZ3RfZGlzYWJsZV9jcHVfZGVlcF9zbGVlcChkcm1f
ZmQsIHRydWUpOw0KPiANCj4gVGhpcyBzaG91bGQgYmU6DQo+IA0KPiAJCWlndF9kaXNhYmxlX2Nw
dV9kZWVwX3NsZWVwKGRybV9mZCk7DQo+IA0KPiA+IMKgCX0NCj4gPiDCoA0KPiA+IMKgCWZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RzKTsgaSsrKSB7DQo+ID4gQEAgLTEwNzUsNiArMTA3
OCw5IEBAIGludCBpZ3RfbWFpbl9hcmdzKCJkZXQ6IiwgTlVMTCwgaGVscF9zdHIsDQo+ID4gb3B0
X2hhbmRsZXIsIE5VTEwpDQo+ID4gwqAJfQ0KPiA+IMKgDQo+ID4gwqAJaWd0X2ZpeHR1cmUoKSB7
DQo+ID4gKwkJLyogUmVzdG9yZSBDUFUgaWRsZSBzdGF0ZXMgKi8NCj4gPiArCQlpZ3RfZGlzYWJs
ZV9jcHVfZGVlcF9zbGVlcChkcm1fZmQsIGZhbHNlKTsNCj4gDQo+IEFuZCB0aGlzIG9uZToNCj4g
DQo+IAkJaWd0X2VuYWJsZV9jcHVfZGVlcF9zbGVlcChkcm1fZmQpOw0KDQpUaGUgcmVhc29uIEkg
dXNlZCBhIHNpbmdsZSBBUEkgd2l0aCBhIGJvb2xlYW4gcGFyYW1ldGVyIGlzIHRvIHJldXNlDQp0
aGUgaW50ZXJuYWwgbG9naWMgc2hhcmVkIGJldHdlZW4gZW5hYmxlL2Rpc2FibGUgcGF0aHMgKGUu
Zy4sIGxvY2F0aW5nDQpzeXNmcyBwYXRoLCBlcnJvciBoYW5kbGluZyksIGF2b2lkaW5nIGNvZGUg
ZHVwbGljYXRpb24uIEJ1dCBJJ20gaGFwcHkNCnRvIHNwbGl0IGludG8gdHdvIHNlcGFyYXRlIGZ1
bmN0aW9ucyBpZiB0aGF0J3MgdGhlIHByZWZlcnJlZCBzdHlsZS4NClBsZWFzZSBsZXQgbWUga25v
dyB3aGljaCBzdHlsZSB5b3UnZCBsaWtlLg0KDQo+IA0KPiBCdHcgd2h5IGRvIHlvdSBuZWVkIGRy
bV9mZCBpbiBib3RoIG9mIHRoZXNlIGZ1bmN0aW9ucz8NCj4gV2h5IG5vdDoNCj4gCWlmIChkcm1f
ZmQgPj0gMCkNCj4gCQlpZ3RfZGlzYWJsZV9jcHVfZGVlcF9zbGVlcCgpOw0KPiANCj4gYW5kIHNp
bWlsYXIgZm9yIGVuYWJsZT8NCg0KVGhlIGZkIGlzIHVzZWQgaW50ZXJuYWxseSB0byBpZGVudGlm
eSB0aGUgcGxhdGZvcm0gZm9yIGFwcGx5aW5nIHRoZQ0KY29ycmVjdCBzeXNmcyBwYXRoIG9yIGJl
aGF2aW9yLiBJIHBhc3NlZCBpdCBpbnRvIHRoZSBmdW5jdGlvbiBmb3INCmZ1dHVyZSBleHRlbnNp
YmlsaXR5IOKAlCBkaWZmZXJlbnQgcGxhdGZvcm1zIG1heSByZXF1aXJlIGRpZmZlcmVudCBDUFUN
CmlkbGUgY29udHJvbCBsb2dpYywgc28ga2VlcGluZyBmZCBpbnNpZGUgdGhlIEFQSSBhdm9pZHMg
Y2hhbmdpbmdjYWxsDQpzaXRlcyBpbiB0aGUgZnV0dXJlLg0KDQpUaGF0IHNhaWQsIEkgY2FuIG1v
dmUgdGhlIHBsYXRmb3JtIGNoZWNrIHRvIHRoZSBjYWxsIHNpdGUgYW5kIHJlbW92ZQ0KdGhlIGZk
IHBhcmFtZXRlciBpZiB5b3UgcHJlZmVyIHRoZSBjbGVhbmVyIGFwcHJvYWNoLg0KUGxlYXNlIGxl
dCBtZSBrbm93IHdoaWNoIGRpcmVjdGlvbiB5b3UnZCBsaWtlLg0KDQpCZXN0IHJlZ2FyZHMsDQpK
YXNvbi1KSCBMaW4NCg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gKw0KPiA+IMKg
CQlkcm1Nb2RlRnJlZVJlc291cmNlcyhkcm1fcmVzb3VyY2VzKTsNCj4gPiDCoAkJZHJtX2Nsb3Nl
X2RyaXZlcihkcm1fZmQpOw0KPiA+IMKgCX0NCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg==
