Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F42E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 09:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17DE10E5F0;
	Mon,  6 Jan 2025 09:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcviIfXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678710E5F0
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736155922; x=1767691922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=70mucfxQSonZ/ruFBXDyX4Bk6gecoZc279CJ/Wg9KHs=;
 b=bcviIfXnFCOB9JxPFoMWTcK9iNz4mUN+LrYacG7pSmSKK/gICnhr/zg9
 dYS3Lbb7Ay6daRgvGQmzCkHbdvF0o9sl3fnyHUV7dpPh6Wr5jlgpdquGr
 gCPRM2PLiVUpmt892PoavBpVDCLWUY9JWJL1f+GamIoFIgxb7km6fJyP+
 GXyJ/JOBU3JLLzx/Mz4+/Tog+wR8Cs1zzg7WiWsiMjXe+AgmFeSBgx0aG
 MumojA4nsqZ6fc7PwJZ0DHeVR+6aPJyUq4baUAzIrtLcdtUDphZ5c3m4I
 Nw/5qTJVfmCB+DCT1M5O2NxP4aC+ZbbYkuIU3LzfR9PB/Gs/14HyCTYi/ A==;
X-CSE-ConnectionGUID: czXf+SiFQ/iuzBG7Vvn8XQ==
X-CSE-MsgGUID: YiI2wBW7RBGRRQue8sAuaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40068169"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="40068169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:32:01 -0800
X-CSE-ConnectionGUID: QkvRrdokTAimXnT+1ymdfw==
X-CSE-MsgGUID: UIlK50cYQXy0ARAHlOu4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102471093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 01:32:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 01:32:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 01:32:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 01:31:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrKBEVEl14PHcBJ2iAwjnwfy8XWs7HywW2JxG7M+DOijjBQZLArfbqXw+++hV0zLSfycH9BpN2eg+aK1vaJ0VxxRQ2aX66613BaItt4ecPdZ7enol942YYJ2Sci0pBAVJxbKnIjmfmdsJ40zH6auXiBRLY5jvaqYCSeVWiRT6aEwh1iAv8XMLxFLlQ6u3h04YH5KQuw1RWJwRGE6du50GT017raOqwe4ku5+vx9FkvEWdMu2uBhMIxMpWStUV/wQRUnyyy5tTA4zBC3tvqkRa0BUc1YlyTJ2CfkPm9akuG8azR9o85cKQZa5R9tmxzxgL9wafMtytvCE1kuatFJOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUjHDUGPfFH9IUCUn2yYDDO4bWodGFV3fHYjl7v3LIY=;
 b=nWdZVvK7t/Qx62dTKqvMWyw+Qf6DCs0F+hyhY+uFn9RMJASuUdPzlOJ5xILmxn/3kCM/U1ep1BwooPtz1Ys0KwmQFhoKoRoBFFEIJTJLcU432ZOtBdauwGfgStW6F3zR0jtgoX8rXzOakE0bN56afuOUB1p5FpHQUn2mPPGlCNr1VEbhtEV+5cXMTpUQjJHKl1c7vJ1OP0SVJGxKq2oUCYkBffWIgN2mF+TvB1AYP6JA6p2BRRTnvSyWpLUJSpOJTh5T7CVTOJHKJUvY9qOVqhNIZwMV2yOjDwSyyHg2yoTx45UMW1so5KaoxkbEB49MuieEGRtj+bqyEidmts8d6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Mon, 6 Jan
 2025 09:31:53 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 09:31:53 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 2/4] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
Thread-Topic: [PATCH i-g-t 2/4] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
Thread-Index: AQHbW4xPsL5zb52u3Eyv5PeiS/Ln4LMJhBTQ
Date: Mon, 6 Jan 2025 09:31:53 +0000
Message-ID: <DM4PR11MB63127BB87EBBD6B73B90B6A090102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
 <20241231141518.765212-3-kunal1.joshi@intel.com>
In-Reply-To: <20241231141518.765212-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: a8006ec3-ea69-45be-bc11-08dd2e34f493
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hRB7UVAU6uxYpZ5BKho8W7p8fxQ6KAbcDJbppPNbDp98qQjPhm8hMXAGT5sK?=
 =?us-ascii?Q?KurZ+GPH6YoEZPxAyPjBtOUAsg/AQTmdrJPjB89AeGVK1x4m5QBfhe3QQiHX?=
 =?us-ascii?Q?S415e6tW07o5ib1lSsqqDayoJjWOQf59Eowx/qqtN6cjAY4Dk56WQpNyqHdq?=
 =?us-ascii?Q?JV2O/OfhA2aruwSprVoxdlO/qQTh22Zho/pD6PqrDKTvsR6XTUFbyS5gwvVG?=
 =?us-ascii?Q?sBbztnVGKlFDylA60DHXtNCptzxvbKGiDdbRqAWiQJKQUpGOdcJYhmJ9EXyE?=
 =?us-ascii?Q?gPGcDFvrsgplxq42Lpbgy4r2BRvFktCTojP6XiXrJ/xZWqHpkC3xgwRY8iOI?=
 =?us-ascii?Q?5+gVJRDBgieA5JuzVsUBopJqx2G0Zbx75ckUvHZP5NM2TXmd/K6o8q1phtAD?=
 =?us-ascii?Q?W2blHKdsXixaIzSddN2MJU9c2aZfALaNpLis16l/NKH/X20zjX/JHDk1Ipu6?=
 =?us-ascii?Q?RzuM2218lDRGAzk4IktPJzRe1K8ObpSTKJRGgGQtJajUlJwXJCO5/QfsEq3T?=
 =?us-ascii?Q?mM4wXPeVN/q6NeHyBqsavh2ybTWUdvDuZiI8hgQD3n7jLuHXc227avYwgFCL?=
 =?us-ascii?Q?pBCQfeXwTqeT7gI2icnbwnOzgiyAYoaUlhHyP9ASUf+YUw3hNTUVWOpHxbli?=
 =?us-ascii?Q?I4lnbNnt13zkdliPUksBvgk4qt+8oLuRE3Epdp12UPlBCnPHXXN5H8YxibWp?=
 =?us-ascii?Q?PUo3ZhJyP9DCPjp4O83Kx3yA64kyvaQVb8TeNydpjCSLErMAcJerOfbE4T+U?=
 =?us-ascii?Q?iSz6u1uTbSbjuz0viaYjQGjqFu0vTYCEtNVfEujoe4GGgCpIPCeHi/x85CuI?=
 =?us-ascii?Q?PTQbc7P1gvplqhsIvkCBVrZ5X/+ys3vPUgChS1q3v/+XDEvqEIAlF49Z1P6R?=
 =?us-ascii?Q?aLSC0NdNdAiuyGHpw99SnR3V2gfcq7m6Vvfe9i1y/E+D4PGzaVKJBOUaDU0k?=
 =?us-ascii?Q?VwADvCyqVijhB4ay2QmaEDoMM85TLe8JuWNwBULUjaQDb0lG1CQWZtPketj4?=
 =?us-ascii?Q?RJsJ+cRPsCOQTDgDB/YN1SwXugCr67FG09lIjGlCMex8PA9mZvNW5ciGY7ic?=
 =?us-ascii?Q?ldIeomAEtwkUR8N6vd3RVfXVn5j7JwNwQVdW3BS0WupdbnohtfpBwZqN8r1l?=
 =?us-ascii?Q?SogArIVz6qYu86OKuFsR5XiaoQB9ln29iFk0GdTu95STZeHMlIZYnYFobxoE?=
 =?us-ascii?Q?fIzfhLfMc7PQgKjW16F9A7BiLE9SBqKzVlURuI4YKDr/NhjLyip+KC4aNQ0o?=
 =?us-ascii?Q?1GQw4b/Giy2y2a0tHQtZPzGrHZStsfzrsat79GRhaoPLv8O8TIggwgBMFWDc?=
 =?us-ascii?Q?JsmwsxUR6JXJgRdXtcCT355iiZBOVJy+6dBKlRaob4klAiGj7da+i3rirRaA?=
 =?us-ascii?Q?6DkHDeNpVD1cZd8bGkvAabcZGxkpbwxmCF3EHqFPTrAqZfUZFau0te2uENAx?=
 =?us-ascii?Q?pofYK494lWQRsXGrU6j2fzPS3SKiSA5xvYRtuWBpdWTJqmDv6bH7tQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(7055299003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KGDlmIbCerhcdAmhvjNpuZW62f5sXkE3TwC8PAMfnDjjU8E3UYaFWcQstPAM?=
 =?us-ascii?Q?jP9YIcIlHC2QMUb7zIIr/MggML6U5x3b2Onv28/xR7MgI8CDN8nFboIxZ9V1?=
 =?us-ascii?Q?3ASic4i0CcKsGgOqU7+p93SQxCDmqpWnxDJEP7AMK3YCsu1gaQVzL9HP0NzN?=
 =?us-ascii?Q?y5jlhLYb8wDN35dUH+KF6SKTTfwEqGDEm92ZxrEBsvqQbybPpllzFRhO1y6H?=
 =?us-ascii?Q?IWVuIMIcP1HvjgUuYRv9nXZmD3UxJycVqNhXXHH0VVSQjP0L1tmtuUL0pavf?=
 =?us-ascii?Q?TlVZormqFm/3jxpEUTYGUL7TgXW3Ub5d7XJT8ddOb2CeurTlb8GFe/XmE41P?=
 =?us-ascii?Q?E20cew5QPZAnMxR0W+Y2jiL99zjXJ6/JWZKgDuCtzUlqy915+XFdy1yFc0fv?=
 =?us-ascii?Q?+dLJNwgKsgDq9m0hv/wbE1MpLJklnv45qlXAtWztYPIZfL1QFtwr8tzNmTbs?=
 =?us-ascii?Q?gVAiJv9Sg+eTZv7rHGAqkxrG//FOf+laQ9Bs3mDPvWykW9edHkKfjDlhbqis?=
 =?us-ascii?Q?isQVqYvuKPzHT4p9Xqy+dAk9QeMYqst+E3vGItblx8MwRbvMkNyDwNGge4Ld?=
 =?us-ascii?Q?hvPzXO4NQAg/2D9JQJq3GnTdc24HETgPmr5TUr+5VL7ZIUR3SIUxssEPDSJa?=
 =?us-ascii?Q?NMPFcCsbw5TC6rBSJeMEtoif0KMIW7iFzxSWHZPd5E47FooVManc7rVoxFa5?=
 =?us-ascii?Q?nd7ckhXqJjsLN0nA7JxNj8F/DIaCnhSoDoy03duNc7W/V2HuVeKGPajhu5H4?=
 =?us-ascii?Q?zuRsyApoFv2TAcKDfEpAYLq+JtUc3EGO85pp6/ESD+8ZxNuk/kKWBhkLGrju?=
 =?us-ascii?Q?ftuuJ1FK6GcH52rW5+WX+gj4ggJvTRWE6DspeTxgQOh6LEcPo16+4vcZrcPm?=
 =?us-ascii?Q?FsrERhyeEaIERCCZIJ+Qyq4flNwPafBr19Yznn6gFxRoPFXpmNjLXUGEyR3O?=
 =?us-ascii?Q?Czv1PMwEFM6yisbK10zNGkn4K6WAZfO3EbqJ9hmeFelVKODbVz9POLPeg/3W?=
 =?us-ascii?Q?WePhAE4x0kI/2AH6SNmJoE+HeOqmFQFfdVAH98Ye+ikfoGTgr82JmHuiz9Vf?=
 =?us-ascii?Q?+DAR2p+lLMDLehdj9X84SpTPllV0E8NczDncZ6pzPr63NCJcESnL5g5IdwiD?=
 =?us-ascii?Q?PnC3IEqzT/KiYl2lJb8skSXpYA0cn/29mv8+kn/ElQfvO7lXczYFhmIxgORo?=
 =?us-ascii?Q?POrrqo3cPAmOWr48nChUHi+FqACVCE2YXaBcg+JSrpvUWEqMDbelOmHfQTjr?=
 =?us-ascii?Q?SuZCckUZ/bkst6EbwEPRP1ryxVSkzYVDP2HX32aX8p6lBjNAbaCiO72UisKW?=
 =?us-ascii?Q?0j8fTXiKLtgZXyZwwq5eh2kdmXuU27boPFqSqYtcPF2MyGJWR/SUrN50xk2o?=
 =?us-ascii?Q?5kMwPsXzsKFquUYs7XeJuM+OKMIzRbG8DjAP2P1ZBUS3dAuVhedbJpwKNnko?=
 =?us-ascii?Q?TCVPRemMnUJrFHWy8CS5hGILOYPqzDTsCzDVWkqUCH73E5tNFcRNG0n9HUGw?=
 =?us-ascii?Q?07Wr99Tc8BI4fZ8diwfsrVoPY7yJ+rBjvY2x6ZfAELU/Ogp7m67ZkoC62t6H?=
 =?us-ascii?Q?XUrC/dDmySBl4BWIwpY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8006ec3-ea69-45be-bc11-08dd2e34f493
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 09:31:53.2436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roFkg081lguv/Yx97iQr9FFCI5JoVMTpP0CWzRVfixRyQvuA2aIg+McUFJW1QOJ0B6RaxkDQamEE7p5Tb4SwzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
X-OriginatorOrg: intel.com
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, December 31, 2024 7:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 2/4] tests/intel/kms_mst_helper: Add helper for MST=
-
> related functions
>=20
> This patch introduces kms_mst_helper.c and kms_mst_helper.h to centralize
> commonly used MST-related logic.
> The new function igt_find_all_mst_output_in_topology()
> enumerates MST outputs that share the same root connector, simplifying
> code reuse across tests needing outputs on same MST topology. The existin=
g
> MST-related code in kms_dp_linktrain_fallback.c is updated to use the new
> helper, removing duplication. Additionally, meson.build is modified to in=
clude
> kms_mst_helper.c in the build process.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
>  tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>  tests/intel/kms_mst_helper.h            | 10 ++++++
>  tests/meson.build                       |  1 +
>  4 files changed, 63 insertions(+), 24 deletions(-)  create mode 100644
> tests/intel/kms_mst_helper.c  create mode 100644
> tests/intel/kms_mst_helper.h
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..b10946781 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>  #include <sys/types.h>
>=20
>  #include "igt.h"
> +#include "kms_mst_helper.h"
>=20
>  /**
>   * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd,
> igt_output_t *output);
>=20
>  IGT_TEST_DESCRIPTION("Test link training fallback");
>=20
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id =3D igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id =3D igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id =3D=3D
> output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] =3D
> connector_output;
> -	}
> -}
> -
>  static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>  			      int *output_count)
>  {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data,
> igt_output_t *mst_output[],
>  		    traversed_mst_outputs[i] =3D=3D data->output-
> >config.connector->connector_id)
>  			return false;
>=20
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &d=
ata-
> >display, data->output,
> +							mst_output,
> output_count),
> +		    "Unable to find mst outputs\n");
>=20
>  	for (i =3D 0; i < *output_count; i++) {
>  		output =3D mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c =
new
> file mode 100644 index 000000000..9d52068f7
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to an #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used
> +pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output=
.
> + * It will also mark the used pipes in the bitmask.
> + *
> + * Returns: true if all outputs can be assigned successfully; false othe=
rwise.
> + */
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *disp=
lay,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs)
> +{
> +	int output_root_id, root_id;
> +	igt_output_t *connector_output;
> +
> +	if (!igt_check_output_is_dp_mst(output))
> +		return false;
> +
> +	output_root_id =3D igt_get_dp_mst_connector_id(output);
> +	if (output_root_id =3D=3D -EINVAL)
> +		return false;
> +
> +	/*
> +	 * If output is MST, check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(display, connector_output) {
> +		if (!igt_check_output_is_dp_mst(connector_output))
> +			continue;
> +
> +		root_id =3D igt_get_dp_mst_connector_id(connector_output);
> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id =3D=3D
> output_root_id)
> +			mst_outputs[(*num_mst_outputs)++] =3D
> connector_output;
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h =
new
> file mode 100644 index 000000000..291fcebfe
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,10 @@
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *disp=
lay,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build index
> 4bc68d659..ffbe1211e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ extra_sources =3D {
>  	'kms_chamelium_hpd': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
> +	'kms_dp_linktrain_fallback': [join_paths ('intel',
> +'kms_mst_helper.c')],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.25.1

