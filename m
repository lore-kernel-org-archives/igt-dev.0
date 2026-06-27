Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6F9C43458
	for <igt-dev@archiver.kernel.org>; Sat, 27 Jun 2026 17:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F058A10E023;
	Sat, 27 Jun 2026 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ueZ6uVO6";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="u2uVfhSo";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B071F10E515
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Jun 2026 17:16:30 +0000 (UTC)
X-UUID: ec92f4f8724b11f18dc8c9802ae25ab1-20260628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qGD3aDQkH+fZT9k6Proe039vwrrVTB0D9/UGzna77lw=; 
 b=ueZ6uVO6B0Gn404lOxf6vPpERQuP1GOWxcAS4OC2kyVpyY8AY2qCUm6wvcXJHAlgUkw0DDD0V8JGtXzwcsJJZMmD3D4c4v7cAqEDtnQOU9HsrW0/pqniWZ+BnTmoblgacY8p6+QdhZVMbndHQGBvTgZeVomy3LCQQXL4GK9SAn8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:6b2297f6-0e16-4183-a3ea-cba402304298, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:65f8ecfc-4e5b-4880-a751-e09c9abb260d,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:
 -1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec92f4f8724b11f18dc8c9802ae25ab1-20260628
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 162272234; Sun, 28 Jun 2026 01:16:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 28 Jun 2026 01:16:23 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 28 Jun 2026 01:16:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlZdZDIP6LmM1nqAKoO+HW0pHjdu8V+gUw5Um6/IjXovF8qeI6p/U+GxXt//fDoXY6BsybMikiey2HMeH71V2uWtDtOSOtM282jEYitvqVnLVH/ydgr2tBAdrC5Pel0CEcI9xIHT7ED6J7Il/yfp4zJ3PrrRS7X7e5RH9sQMANhBm/2N3/b69FOB+WY+vHp4CJhKqLL2jzsLD9QdzuMlVBKURW3yj47zx0k6bb3SdCfPr9FkNu1om25vOkbM0YEvtI0RfB5FRf9S+irdiixOnBLbyRSgsIKlyO3o5kkD2LRBxq/pKGJJCHWZ9LanUUOJiZC/xluNm56aFdpEu+sCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGD3aDQkH+fZT9k6Proe039vwrrVTB0D9/UGzna77lw=;
 b=xTYu/aX8fu3mPfVUABwcjClJjFEHtLUYsms7N7q3wTNydevZAMJFWUV/pjnqdze45iHaSdm3sY70c51dNKEVwJENZlCZZH3p2QW6U+vejFJcSSd7la5g5FRn87EsjTNu7XWPpPW8ffoB5UkEpDP64rqwp4GupNQgl3cEmAcjCheLMijySg5RZtRpkJ39Vg3ciIV/ycnsg1Ax9PuEZBG4EvckQob1ydzcGpv/0tmTp0OuGtHSP3taPGP5/VOhpbUVg3Cp7uGWDvbhTk5bV+Cwu+kDKDU84812MGCaz/8M7Ccy0fY6K9gfioYhKOCc5Z+vw2NPHqxOnVIpS8qXRduDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGD3aDQkH+fZT9k6Proe039vwrrVTB0D9/UGzna77lw=;
 b=u2uVfhSo9At5PT5fNiBvnKU2ZrNKqMxS4Mt1kCJgyA1c56EJb0QKYczD82dTgZSRi+G3/pJDHZpjoeorPit6kzB5pY4svLES6aDxT6jyyn15n0Yqf5uq+TYe4ad7449sq5xlzMvDjXK5oaYGNZ3rOxQfgVXWJHY4UGVSXBMN8MU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI4PR03MB10319.apcprd03.prod.outlook.com (2603:1096:4:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sat, 27 Jun
 2026 17:15:16 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0181.008; Sat, 27 Jun 2026
 17:15:16 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>, =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
 <Lancelot.Wu@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Topic: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Index: AQHdAVV9F5AhXflWfEiY7iw5xcNBxbZSrl+A
Date: Sat, 27 Jun 2026 17:15:16 +0000
Message-ID: <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI4PR03MB10319:EE_
x-ms-office365-filtering-correlation-id: 56d4f568-a9fd-4144-67e0-08ded46fa849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|3023799007|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: vlzdVCeIyj/dBdyJkUx01NNIoioPSJ+Z3EqN0FkHepVV+bGO8mPGjSJ6jPD9w05oEc9KN4ZOubo0BjkEpoGkVLMtOZG+DVNLV9Byhkh5u2tSSwB7CZsp/WH4OSIfPKvtEFGpx5tjfV/Xtzt0KexK0ZA8Sw32NiaM62TI2/O3JmJrb+92pX4yxaLCVcfI78XFB4tSsd1NU5iRDbPbWIuvtf5mzLh7ieX4z4LXn9Yfeve6Wq/sKWjMbgE6K2MP69zEvubgYsEZlix/Qu5tWVQuUC6AKUGXSO7ewBjq5e9HAismiewcfbAzlWCHVwk/XWsiajYnXAnOywAoaDAj7GCAtVCB9xchrhkRd3EQUJCQZ35p52sYgLKxCcCk3X1Hy3H4rVyCEILy7cEDWqiY25BsWAN46iiDtAPDHb+H8A51wVKbFtUXWTnSh254X39xLVS6u28DMKvcxRPBYHvgGMtl4hXtTysDyFNSIGucRh/9bmNWKLoMG0O5PL9bILkc/dK3dl8lKxRfqFdpBVGxueh0oPxm7IJY2MUDWg/0hbKYjNEvJwLNh0mzupqZFIwpi0f3Va8Ma9MSYFRk/aWezqGIcPFxQLGt5Fyyn4X9OJ+YvbrTyrM6zRiBqLYMPI0q4kS3+UF8Y/6jQu6oqSz+vi+0OvY7LZ9iKhrXkvxGgti/tyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUV6Y0hFVXZrR0VvTXJZb3RJcWt3dVBGZWdET29SMDduYW5IWDJXbzFVTEFv?=
 =?utf-8?B?UXA4MXIvK0ZRRzJkZWFUOUxTZFpQckZuWjR3dERKVmszVkFrYVAvS2ZUNTNN?=
 =?utf-8?B?aG9iTWpwbm82dGR3Vk5MUTFmM2dWZlhiRkwvakdZbjYrVG02MkFWQ2xNWVk1?=
 =?utf-8?B?WjZ3anUvMEVWUDZMK1RKNjV5dDBZRDdWbi95ekR1dlp0QWZoMU9IdHMrYWFs?=
 =?utf-8?B?ci9XT2RwVTZydysxRS8xaXFOWGM0eHNaOGpQaWJCd2k4L2RxbmtGYTJWSUVO?=
 =?utf-8?B?TDdTanliRHIyTjcyWU9ZYVVPUk5vYk1lWmhWNUk4TEMyMXNUSjY4R3BEOGc5?=
 =?utf-8?B?Z21ZTXZDVFk0MnFsb2NreW1Mb1hCTEY0TStCSEJxUTZKb3E1a1JaOVFXNlQ2?=
 =?utf-8?B?aU1Wa2lOTFRVc2dMeEFudWNPT0FDMUZNaGVwbHEwMlIvVGxydnJNVEFLYi9X?=
 =?utf-8?B?ZjViUW1PSmdLMjc4czl2ZkRuc2dzd3VEUHRXaFRZZHdIMWFiUEJmbmUxbm05?=
 =?utf-8?B?U1BlUFljNXV2ZFoxOWNmNmY5dUYrVFl3OW1kbzAyR0EyMkoxbis3VFRtdFJz?=
 =?utf-8?B?R0hwdDlkSUpWNE9OQWFqZER5WUZpeTU2cUdON1JUcXY3YkFobGdIT01jd2xo?=
 =?utf-8?B?eTRxNGc1N0dUTDV3UG9UZUw4aCtmYitvYWdId0NJb0JWWHR0UGFTbTIweE1N?=
 =?utf-8?B?Rm93bk5KYzByTUZFbHJaMUdiTVpmRTI2OFlRZmpXbHhYWHZEQXgxcjhQRUpo?=
 =?utf-8?B?dXl2WW15c1VTczdBVTNsRWlnWm1hS2hRSVQwNWpydEpsOFNnQ201OXlOVk1n?=
 =?utf-8?B?MkdQSXJTUUp4VUE1MVNaZWRQMEZ3RHZFVXhtekx4YnZJT1pPVGFZcW9VcGlS?=
 =?utf-8?B?TlBqSEE0SmVSanJpYlFOc3NlUHRjQkhWc3hhTVNVaUhjMDRGZTk3MU5nZFhw?=
 =?utf-8?B?cjBaTHM5RzBsREw1TW0xTFJTcDlKVWR1VXZGeWxNL0NRZ3pyQVZhOGxzSkdT?=
 =?utf-8?B?TnR4cnpIRWlHdTliMGw4QjNDa0hNNXNtMG05ZVFiUk5HcFowWlhoMGtSSkIy?=
 =?utf-8?B?RTZTZmg0bEp3VGUxNHVrOTVRTVVqWWxybmhiN0Q4TkZBb09QeE9oZm56dGly?=
 =?utf-8?B?b25aWUczZGRhc29ISm1vUlZQWUx4T0h3ZGNpUklwKzlEQ011NWZpTHlia2tp?=
 =?utf-8?B?SHNnRkJZN2d3TnhRTUtYK0NyMmdnaXpFSldJUUxmQkMwRkNxSmJ6bEdKZkdy?=
 =?utf-8?B?cElKU20xNzd1b0IxZjdNbDU4UGRaOE5VR2VZRGNFYjV3Y2svNlVMRmhuME9J?=
 =?utf-8?B?U2p4OHkrckVrZ0xTOXRhNEVVQjJNUVZ5VmZqem1LWDVzUVBMU0YrOHByZmhD?=
 =?utf-8?B?VzQ0Tm1FZjY2RDZPZEFHUTVic1l2S2FiRHg4cTZrVUhobXZFZUNwbm4yamti?=
 =?utf-8?B?ZWhNdUxXVnNLbHlRanNPSThLQzhIVGFib3AwWDFROGlUOHpLUjV1UnI2Y2d0?=
 =?utf-8?B?K1dZY29Hc1g0akhTeElpQTFTcVRvZkFIOVJQRXQ3V1c1WXQrUXBSY2JVODJI?=
 =?utf-8?B?Qzl5ZFo3bllzZWltL3lwdzY0L0Y4TTVTT1M4QTBVUTJRaWs4MHFUa0t6ZS9B?=
 =?utf-8?B?NkZZVDlmNnhqdmdZTHp5VjhtYzFpZkYwL2Z2NHgvS3NJd1FpMWgxcTBqY1or?=
 =?utf-8?B?TTg1akVlQmh1ZFEwTW9yR2t6TnU0WHpGSkVMNkN3T3NCRi9GVFp3NUFKNWdQ?=
 =?utf-8?B?bWVJMXFOU2NPenZOM1hHSVhuR0VJeEczMHVRNUs0aUpheVgzMG1kWGdoUWlB?=
 =?utf-8?B?dHVTenN5Ylh1a3VIRmdpYVFVeDh3S3NFQjlWbXBIbHFUR3Y5N2diWTBhaWhS?=
 =?utf-8?B?SDlKYlVvQ3RSNmI2em1qdVZJbVF5aE1qRjV3bmxxVnludFpWeHZycHBOQUF6?=
 =?utf-8?B?L1dkWVhHKzRSRkJubXQwM3VaRDE0d3d2em5zSmhON3FJcTdXaUthUVVaNXFG?=
 =?utf-8?B?OGZ1bkt1bWFFcU13N3k3RkMxamI0TGlXVDZJcGZQSVQ3Q0VqOC9VZThJUUJI?=
 =?utf-8?B?dktiVGVsZE9tUlZWR0tOVW1mRUJXL2VOSFp1ZHJvYjJnRkxIYmlBdzc2c1Zo?=
 =?utf-8?B?Nkp2TmREWUs2b1d6eEttY1VPRCtKb1JiNU9NcWtNQm81RTlFN05BaXBYSzFN?=
 =?utf-8?B?Z2RNMk5rOXBIZGkrNkFEVUJnOWZoVS8xM1V3SGhVZ1I4VXZ4TmR5MHhpZHFh?=
 =?utf-8?B?MGdRa3RMbW9zL3RhUkd1OE12em93a2d6eElnTHl2Mnl6SWhYalBLZXVCWTVr?=
 =?utf-8?B?VzYwUGNLcSs1dmpmVzk3QkMrcUJQRm5MRldnVVpUempYQ1VwZ203VTVtdzFt?=
 =?utf-8?Q?KzZEGPbGzPiiDOic=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20ECFA29937D6C4DBC5821A223E803BA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SVVgdmIOIcTq3BRc9iCcwteRtTi15Bt7z7xpKRJVoueR5QzxcgeGKSVtW+l/pf6LC0LmXVCaA2i7httdsHyUV9ObjpqbD58EJtjpCuOi7bBpbb69krsmZsM6XWeVx2icQnic9yOpMuJP4wAOIMb/8DLMmZ8douUXj5AI8HgBLDszOrHrNWe78ft6qDYppPCHM5jsbvB1r3kjuabhc89+Rv2nOwPFqOJgkul1QUBJQaaOilv9T2JZVweCkd/dhZk21qKnYDVmAbbbg7g6RFfquJ+dKY3Cns8vkLxcLAUWGKmfrqNb1R9p4PjUB6LP1YBy95ftsk9JO8veAhknho4p1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d4f568-a9fd-4144-67e0-08ded46fa849
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2026 17:15:16.2908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0vCbnlOORqAiJJVsO6XPSSFYCwxF3Tq6pm7FIYvyW8p5QCEIlXFPC1L2LMbrWs7t+vDgtGiRtZ1EeOqT70tk/RSsO3nCyWKQuYWfk9H9C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB10319
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

T24gU3VuLCAyMDI2LTA2LTIxIGF0IDE2OjA3ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IENoZWNrIGlmIHRoZSBwcmltYXJ5IHBsYW5lIHN1cHBvcnRzIHRoZSB0ZXN0IGZvcm1hdCBiZWZv
cmUgYXR0ZW1wdGluZw0KPiB0byBjcmVhdGUgZnJhbWVidWZmZXIuIFRoaXMgYWxsb3dzIHRoZSB0
ZXN0IHRvIGdyYWNlZnVsbHkgc2tpcA0KPiBmb3JtYXRzDQo+IG5vdCBzdXBwb3J0ZWQgYnkgdGhl
IGhhcmR3YXJlIChlLmcuLCBGUDE2IGZvcm1hdHMgb24gTWVkaWFUZWspDQo+IGluc3RlYWQNCj4g
b2YgZmFpbGluZyB3aXRoIGFzc2VydGlvbiBlcnJvcnMuDQo+IA0KPiBGaXhlczogNWQ0NjYyNWNm
YjIxICgidGVzdHMva21zX2hkcjogYWRkIEZQMTYgZm9ybWF0IGNvdmVyYWdlIikNCj4gU2lnbmVk
LW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
LS0tDQo+IA0KPiBDaGFuZ2UgaW4gdjI6DQo+IDEuIEZpeCBncmFtbWF0aWNhbCBlcnJvciAibm90
IiAtPiAiZG9zZW4ndCINCj4gMi4gUmViYXNlZCBvbjogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xNjg3NTkNCj4gDQoNCkhpIFN3YXRpLA0KDQpJJ3ZlIG1vZGlmaWVk
IHlvdXIgY29tbWVudHMgaW4gdGhlIHByZXZpb3VzIHZlcnNpb246DQpodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzI2NDE0Lw0KDQpDb3VsZCB5b3UgcGxlYXNlIGhlbHAg
cmV2aWV3IGFuZCBhZGQgYSBSZXZpZXdlZC1ieSB0YWc/DQpUaGFuayB5b3UgdmVyeSBtdWNoLg0K
DQpSZWdhcmRzDQpKYXNvbi1KSCBMaW4NCg0KPiAtLS0NCj4gwqB0ZXN0cy9rbXNfaGRyLmMgfCAx
MCArKysrKysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19oZHIuYyBiL3Rlc3RzL2ttc19o
ZHIuYw0KPiBpbmRleCAyMDc5YmMxNTQ0MTIuLmFjNzVmNjZmMzRhMCAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMva21zX2hkci5jDQo+ICsrKyBiL3Rlc3RzL2ttc19oZHIuYw0KPiBAQCAtMjk4LDkgKzI5
OCwxNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2JwY19zd2l0Y2goZGF0YV90ICpkYXRhLA0KPiB1aW50
MzJfdCBmbGFncykNCj4gwqANCj4gwqAJCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcy0lcyIs
DQo+IMKgCQkJCQnCoMKgwqDCoMKgIGlndF9jcnRjX25hbWUoY3J0YyksDQo+IG91dHB1dC0+bmFt
ZSwNCj4gLQkJCQkJwqDCoMKgwqDCoA0KPiBpZ3RfZm9ybWF0X3N0cihoZHJfdGVzdF9mb3JtYXRz
W2ldKSkNCj4gKwkJCQkJwqDCoMKgwqDCoA0KPiBpZ3RfZm9ybWF0X3N0cihoZHJfdGVzdF9mb3Jt
YXRzW2ldKSkgew0KPiArCQkJCQlpZ3RfcmVxdWlyZV9mKGlndF9wbGFuZV9oYXNfDQo+IGZvcm1h
dF9tb2QoZGF0YS0+cHJpbWFyeSwNCj4gKwkJCQkJCQkJDQo+IAnCoMKgwqDCoMKgwqAgaGRyX3Rl
c3RfZm9ybWF0c1tpXSwNCj4gKwkJCQkJCQkJDQo+IAnCoMKgwqDCoMKgwqAgRFJNX0ZPUk1BVF9N
T0RfTElORUFSKSwNCj4gKwkJCQkJCcKgwqDCoMKgwqAgIiVzOiBQcmltYXJ5DQo+IHBsYW5lIGRv
ZXNuJ3Qgc3VwcG9ydCBmb3JtYXQgJXMuXG4iLA0KPiArCQkJCQkJwqDCoMKgwqDCoA0KPiBpZ3Rf
b3V0cHV0X25hbWUob3V0cHV0KSwNCj4gKwkJCQkJCcKgwqDCoMKgwqANCj4gaWd0X2Zvcm1hdF9z
dHIoaGRyX3Rlc3RfZm9ybWF0c1tpXSkpOw0KPiArDQo+IMKgCQkJCQl0ZXN0X2JwY19zd2l0Y2hf
b25fb3V0cHV0KGRhDQo+IHRhLCBjcnRjLCBvdXRwdXQsDQo+IMKgCQkJCQkJCQnCoA0KPiBoZHJf
dGVzdF9mb3JtYXRzW2ldLCBmbGFncyk7DQo+ICsJCQkJfQ0KPiDCoA0KPiDCoAkJCQl0ZXN0X2Zp
bmkoZGF0YSk7DQo+IMKgCQkJfQ0KDQo=
