Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFBCC44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 02:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BC610E113;
	Wed, 15 Jul 2026 02:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="It5IE7o8";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JpK/qhQ/";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1010EE9C
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 02:51:06 +0000 (UTC)
X-UUID: 0489a69c7ff811f1b1788b6acf885367-20260715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=h1obWZQAhnW9oLaNtbe3CJ24DVNp1Pl8o1ncjE8AGQ4=; 
 b=It5IE7o8XmYogu2/LG7C1YQtAUrlXkqBZbjJvEOHDV9egPwTApytNC5Foo6nIBEXbW6icwvECtF8dvye+BNEfe5NZFsYRS5GgwDD4EDy71S/LqErmKSHPikLTIJx8RxPdB7/DmTwl4uAqwpflOigNiS+YHqG6rNurglcGUNNvo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:3810cb3b-e100-4253-a21d-9ff4d3e96d73, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:02dd6857-bd66-4718-bae2-b5cf68c331c4,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
 EC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0489a69c7ff811f1b1788b6acf885367-20260715
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 509810796; Wed, 15 Jul 2026 10:51:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Jul 2026 10:51:01 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Jul 2026 10:51:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh1u4+ccUQGmrbTE/70tLsT+9bWITYnco/mNSbgdQrtL/CQWD5G6SGNbn1uAM5fsBqNA7xqoIkKLE1NUqa7q4aNIXB6h8Dkcrl6XK9lHnIY/AQn7oRmHbgtoxI5ucqjwxvb+l1aWfV65zB/vYN0x6vWSl7Eeq33EdYTgFi38/9Pprf2ssmnvPrprckij7NoaM36uljZGmSSSOqSz8Ykq/Zko6AJHK6sseg/FwIJHXAk8s8wjbZ5NsPvz/OK5DGhrNz4H7kk3k5OSXne3tdt3V4t3Q/8CRunaue17QQszZztIiW/+I5PnN8sTm54hQeYMFEmbgTxplO7bPDHybH5a8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1obWZQAhnW9oLaNtbe3CJ24DVNp1Pl8o1ncjE8AGQ4=;
 b=XXvi2lPA5sm/4awILdualrJK/pOj6CQckEn30Lyob5HVjtQOwNN5wtru7R1zJRXTQfCI39qLofqpMqfNsJDVSaFTHqFVLRVYccCrO0DJ27v90JudSOZLWPtAZTHc8BrtTSEu7BFaTCmf6Y0V+jzQbhQ6cQ7RF11/aA8YqD/5qQAXe4mXqNOtdbZcC6SePn4d9KSNwRuPKCPOk1NBVEiH32aPWYhstSgyfhDs1zmLKpv5wdr40OmAfF8PpnbQFtHGIF1FhFGf9xGKYT9x0hag8Si6ehBEeqf92uOyuyddOK2COj9BTnoTw/4i/CDRRcv5WxaUBTjcAJyH1MHmWmr1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1obWZQAhnW9oLaNtbe3CJ24DVNp1Pl8o1ncjE8AGQ4=;
 b=JpK/qhQ/+uP5Isj0e4zlsGuO0JpnS61GYOnUOxcPGN+IgbQi9Q63TR/KfK7bA4/z4FVtu9mA4lpinxjtVbk0ybE7Ki5idOpxcMY2bZm84zjr8qT72ACutl2tL4rAejs+Rj/VfHqGZn8X3W2GctjMIqoecvvx9sXR7/xP31G9CVI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYPPR03MB9724.apcprd03.prod.outlook.com (2603:1096:405:394::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 02:50:58 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 02:50:58 +0000
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
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Thread-Index: AQHdEFIv0fFUgV50F0OowNOZVeQjwLZrX/wAgAFLIQCAAJI9AIAAq4eA
Date: Wed, 15 Jul 2026 02:50:57 +0000
Message-ID: <e94929c0ce8c29b5ec61f94975583d270e08ece2.camel@mediatek.com>
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
 <20260710095358.2518446-2-jason-jh.lin@mediatek.com>
 <20260713120828.afnxibf3ct4hteea@kamilkon-DESK.igk.intel.com>
 <f2ccf5de8b8f1ae3ec0d7198ef4ce29534f85afc.camel@mediatek.com>
 <20260714163702.sz6pwsve7ormawdg@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260714163702.sz6pwsve7ormawdg@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYPPR03MB9724:EE_
x-ms-office365-filtering-correlation-id: 068ec74f-a6d2-49d4-d389-08dee21be5c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|23010399003|1800799024|921020|38070700021|18002099003|22082099003|11063799006|5023799004|56012099006|4143699003;
x-microsoft-antispam-message-info: y0qRVwQqzbjpcqyFiZy81fMhD3W9t9oytZ6blzCEo1qYJFwmT8K37a+dGEiRynwelTBgAcpVN6VSxelCBf5PQ9qhIGo26/LM1cwJVEVtoohrEKeEe0zq//uKz7sNGYqoj4UHx2qBO397zoIIKI/fJrlyFfq1SMtEY0GY9oagT4Mg7t/obkKjrEhyPwyxHQKj3B4p4oE+vpAAeOtO/7gqtzfi0nVnMascz8aLcWymsV3kaOG8NB44J0UgbAVPUFNxparhSLniA2+wWlPLmveX8eA0PY8Fy+71m5nX0sXMDnJi7l41zTIOmB6VIJbirXpk7rLrN2quYtvXRtv5ZEG06mUwQbybepwc2cquFjj/Gn6hth9+x2qF22ZsgEHZP+F7PQvrYZDoG+H/rtP3aedKvJZMx+d9hwyAjDvSaoapQbndblG/KqaxLsM0uT6Nb38IPxFx/26Ps5WU3I6t9ILaYZX6F2BX0IX0LVU6ID9qXYsRTkGdciJBJmK24Bl6/FEqBTXwMQ8S+LUgGyRAWvJKgTgH1AIVvxJ4R1eX1WE9Ytul/rVexpCHJjF450GXZpCxXuJKImyvvaODo40schZcf0cichpwynjhQOXSpcL5dhYyoXBlraa2pgGi0IWze25vRZgww4C0esYyKhDzyIPveAHFd7ZoyO2D5fnu0SYbW5CH41TGOQ8h98DGPrKykwjmx00ZoxCerReGvHyfVbeSKb9lHqe1qf90ImWeUtnWdEvMBMG2s5Wb4R7pgVxPIii6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(38070700021)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0w1Si9raTVJZ3dnY2c3aHVuaTRPSlBGLzBUbGFJL1pNeEpJUnBwUWZ5R1Q1?=
 =?utf-8?B?OGZRTjdGOXY1aEVvdE1Oc1dnbndwSWQ4RHBLVExMMHdMRXJDU2hPNjh4UllC?=
 =?utf-8?B?dEN2Z2Y0OVpMNDNVV0d1bXk2aTZaei9iT1JLWGNKU3hlZE1lYnFXaWptdDR1?=
 =?utf-8?B?Q090eGVlZ2FldytOeXJmM2dkOGZvYWR2VjVTU1djbzJVMm9kcVJ6RVY1cUxi?=
 =?utf-8?B?OFh3LzFDUlBLcFd6amhFb3grR3RRQ2tkNU9HVzkyNFZ5UTJ5YUdaTkptWDNU?=
 =?utf-8?B?OXdEakZsSGZydDhRanFMS0FrUHV3V3JlRk5pcUdRRVVtQ2pLbE9GTVBtNkwv?=
 =?utf-8?B?ZTBzVHlYaCtTNFhTK281aUF4VEhJNVVhRnd5ZG5EaXRTd1E3WC83TWtKMU5H?=
 =?utf-8?B?bHZtNzRZZzNjV3Z6b0NCNGhZcnhwRGp3TEMycGo2ZUdKM2k3a0hua2VUT2wx?=
 =?utf-8?B?dHUwTVcvSHhPdnh5SEhjR3JoVVphdG16S2dJZGxST2VoSWtYMThrTGUzYld0?=
 =?utf-8?B?Y3ZOd1F3QjVBcE1TQTFwSnZWeTk2T3VHT2FCREIzZjFUSnl3NFp1UjV1OU9F?=
 =?utf-8?B?N1JmOWZnWTZramI0Qzc5NWdObXBIWHBPeVlnS3N5UjZYQktPNUgrdXRoaG5p?=
 =?utf-8?B?NjNpOHFOamJudThaampnY3dIbzROZUpuRFRQbmJxQUgzWTFXbXc1Z2tDYWEw?=
 =?utf-8?B?ZHcvUGRFZUg5QkxKdlNHaTJoa3RZbVZXOU1Eb2gzMGpaM0ErTG5DZjJWcWJi?=
 =?utf-8?B?RFc0S3FpQVZBWHlqb2NlUlZFQmx6ZllyQ0JVTXNrMmMyVDdnQ2VlaUJ5MnB5?=
 =?utf-8?B?R2xpTG5mWVQwc2VWKzlHWnJWeW1oNGYrdldBN2xmdGpsc0ZCdXM5dEVHZWJj?=
 =?utf-8?B?U3NoTUo2b1lDZk5iQVhzMXNNYy80Tzh3UGVlcmF6ejhhRGZOQmRKMHp3dVB1?=
 =?utf-8?B?cC9hRDJlYXdGdTVsRXBpYmVVMXQ4OGhhV1hVSTE0b1BPcndEdWQ3RE5uYUVa?=
 =?utf-8?B?QlFHWmhiSkx3L3JpZExZZjJNRmlBbHJvWjJzQWhaYUZIaW5Oc3k2dEFLUjlI?=
 =?utf-8?B?MFZCa2VPVGEzT0xuaU5DYkNUUU1hSUJ4MHNpbzV5bGc4V0NTWlVML2dNalRB?=
 =?utf-8?B?aEplUjRJbW5ia1JkZXBCVjFFNTZwZkNudHJmRmgrNDdGT2lCRHRvdFJYSmlM?=
 =?utf-8?B?YVI0TC9wVllySnZlUUpyM3c2TlEyMnlMa3pwZFIzRGdWU2xxSEhsN3JnanQr?=
 =?utf-8?B?cDYrR2JWcGhzK1FGeE5SbGNxWFEyOWtyclRkbWFXUENwZUlXVnhQQTY5WkFH?=
 =?utf-8?B?Yk5KODBualpidCtLRHpnbU9haVY2R0RCRzIwY1kwK2NwUk1md1o2eEN1UW1t?=
 =?utf-8?B?elRhcTd6bnFHWFRDeEY1UVlhRWs1blJYV2xQOTFKU211cmFMR3c1SGhCY1B0?=
 =?utf-8?B?aTl0Y0ZhSGh1T3RUVzM2TlZ3NGJ2NnNOemhZbW55blpnVUMxbzVVRWx2NHhP?=
 =?utf-8?B?WmN5b1gwREpSWEVxaGgzM2pZaTFnWGdoMlJ6bEpOREJMQ01LNUl0N0o2dHo4?=
 =?utf-8?B?cVU2MDJ2M0JueG9VT3V5V0FxUDNDNFJBMjBiSjR4YVNSdHhnYmVIWkM5WkZU?=
 =?utf-8?B?WUczOEJMd1JsS1YyWGtPdFhjZmJBMWlFUmxhTU5tT0U2VHVGRjcrenNqSXpo?=
 =?utf-8?B?ejFZN3QrNUduaGNDc2Y0OWQ4c1lQZmJ6Y0hxRytrRGlaSUFCNGN0WC9McXk3?=
 =?utf-8?B?a25LdWYwaTczeWlOME4vdXVkbE1KOFZBZ3QrSElIQVM1N2t6d0RTa3dubGpu?=
 =?utf-8?B?MFdMeFlGRkU0c0NVaGR0MVNwNmNhSGp5Wll1Q3BqUkgzZ1FFUllQZitYMEVH?=
 =?utf-8?B?VkFVZHZyRmJTcEpmQmprMVFRaTFmaVFzN1JNci8zQVpndXBSaHQ5ZGQvd0Fp?=
 =?utf-8?B?S2I1a2FNTmZ3MUYrWnN5eW5xRkltOTlzZXczYU42VjZ0clVzMHQycWIwSmRP?=
 =?utf-8?B?c0xpa1VwVndiVGZtMDFaR2h1UUd4a0hiUWRab2FLcGhobkZHdmdycXBnV0lH?=
 =?utf-8?B?eDJLM05pRFpIZmlvdG1pM1N1Y3YycVZ4S0VsV1RpY2c3d1NzelhsVTZ6RCtF?=
 =?utf-8?B?RWc2MVJveTBUeDRwWExvUDN1ZS9nVGEySkpkTlNEUDZnWVJYM0VubEx3anZM?=
 =?utf-8?B?OGxBdHBDV2NsYitocE1MdVlKRGo2MWhJVHVwOHh1UFNFRWlzOCs1SkJJSm9C?=
 =?utf-8?B?R0x4QWJQb0pHUkE5WlVUSEVEQUVJMjc1UUNWZnhmWjQ3T0lGQy9kZHhCOUtC?=
 =?utf-8?B?UHlmNmt1UzZRSEEzWldDaE1uenI2U3hwT3NWb0dEajVBZ1AxamFPMExpcVRK?=
 =?utf-8?Q?yspQNtVfsA7qjEMM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7772EA9BFC5604A86191CF769948FE0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q1Z7VXULhfWj8rH84tqh6e6upX2W/iPpvD223gMB1DZMTd3rp+NgGUF4xHUkVw/imJS5BvmmQclPwgntvA0VHqbn85btK7D65KeAfV3xa5ERiUwNM8LvL5qv3pHw/yTeGOhls4k+xofYYhtOt+/NRGjWv6FHqWmkJHcXU+kXuGVaBVRQmsWfGWRBrMidRXLNBFc9W5D/+H1WT/V0GjAKEJaJtG/sNAactMPjJ4n34Xf4Tcb2CUnSVBlkDP+GaKR/MgxWrS+7mqbHTu04ccY7KKZoTxyxlsvWFAFlgPKhAeeLELMOCZZf1tFNSl1CyO/MTgSTi0PRDEXB3Q/Z8UcfNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068ec74f-a6d2-49d4-d389-08dee21be5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 02:50:57.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bkh9PKCn5gk4ylUsqhOV3HLwKGnmt0ToAIi5Z0CAKiu6zlNEmCQLn2WSUU912x/H9YfzfJGrGJcFAZPcZ3QEaDoCBq/wPL2L8UXpoM+s9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9724
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

W3NuaXBdDQoNCj4gPiA+ID4gK2Jvb2wgaWd0X3BtX2VuYWJsZV9jcHVfZGVlcF9zbGVlcCh2b2lk
KQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCXJldHVybiBpZ3RfcG1fY3B1X2RlZXBfc2xlZXBfY29u
dHJvbChmYWxzZSk7DQo+ID4gPiANCj4gPiA+IGlndF9wbV9jcHVfZGVlcF9zbGVlcF9jb250cm9s
KCIwIiwgIkVuYWJsZWQiKQ0KPiA+ID4gDQo+ID4gDQo+ID4gSSB0aGluayB3ZSBjYW4gdXNlIG9u
ZSBwYXJhbWV0ZXIgdG8gbWFrZSBpdCBzaW1wbGVyIGFuZCByZWR1Y2UNCj4gPiBjb25mdXNpb24u
DQo+ID4gDQo+ID4gRSxnLg0KPiA+IGlndF9wbV9jcHVfZGVlcF9zbGVlcF9jb250cm9sKCJFbmFi
bGVkIik7DQo+IA0KPiBJZiB5b3UgY291bGQgd3JpdGUgdGhpcyBhcyBhIHN0cmluZyB0byBjcHUg
c3lzZnMgZmlsZQ0KPiB0aGVuIHllcywgaWYgbm90IHJhdGhlciBhdm9pZCBpdC4gRS5nLiB0aGlz
IGxvb2tzIGJhZDoNCj4gaWYgKHN0cmNtcChwYXJhbSwgIkVuYWJsZWQiKSkNCj4gCXcgPSAiMCI7
DQo+IGVsc2UNCj4gCXcgPSAiMSI7DQo+IA0KDQpHb3QgaXQsIEknbGwgd3JpdGUgYSBwYXJhbWV0
ZXIgc3RyaW5nIHRvIGNwdSBzeXNmcyBmaWxlIGRpcmVjdGx5DQp3aXRob3V0IHVzaW5nIGFueSBz
dHJjbXAoKSBpbiBBUEkuDQoNClJlZ2FyZHMsDQpKYXNkb24tSkggTGluDQoNCj4gUmVnYXJkcywN
Cj4gS2FtaWwNCj4gDQo=
