Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D75C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361E10E137;
	Wed, 12 Feb 2025 14:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1QhcrRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C89910E137
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739369616; x=1770905616;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=0LmyLuJHzRaVraI0aF4EmbFN3q7hocUC4RGZfkbxuVY=;
 b=O1QhcrRlDkYP8bTQIGA1s0AdG4b+rEgv7x/jrEBBeNtRyghEU/8ytAM7
 /KncX5O8yly23OnflT6a0WC6ExpuYJsuOhxp89pcQ23W9bz8WMi7VaQbi
 c7XMe+xeq6JhkEOGklu7E+vj0gDhjj44A/9OFlPVHk4mfnpd8OsXV/Mxs
 J7pfqRwegW/ziKHHNrnkOKEHgPB3tx+/tgHQ3Nxfmpa76hn8qjy7u66Xn
 DYGgMvo0S8KEo6J+74LJ2erDbtrxxR+F/uy04bCSBQ5VL8vQ/6RLda6I3
 nQ9zS7Wam0JUXG5MQMKxE4MQTxXNKxUlbh87gaI9vomf+Tw5dkhWa4lRL g==;
X-CSE-ConnectionGUID: kGiLu6lGTQWzIr/xs+KNlQ==
X-CSE-MsgGUID: g8oP1BX2QeSJA0TJHpT3JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39729272"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39729272"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:13:36 -0800
X-CSE-ConnectionGUID: 92sk4ENjTnaNrgH9I5Vx7A==
X-CSE-MsgGUID: DNxQKyO7R9i48p78HrqmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112689930"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 06:13:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 06:13:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 06:13:35 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 06:13:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqJTikQh8vpLRP59i2JbI4+xl751wooMom4u/H70t/0K3vjVmjnPo6xOR+AhL9kQvgj7sovEJcpTsHCzbAepI2kjOE+12rn0mrGpXaENxHIs+LStOoRmrWnmqPn5M1QNusXjJZN4Dp3Wz/zllQWsu+RoUORUD84XOgILRXu4SLiZKmTYX+RzuX4XblOwhV/Cl3qGxrM5hFPeT51Tt/cjZQUTacFob2SdBsA9Ycy6VJ/GcrsTalrW24YF2saVnldazmTtA0/5yinTwnZqRrA6YS4MLdt2+eLwbiudNVLvbWV7C9V8ek54BOKwsKJGjkBSEXSXqOto0+gRaTGbacjk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBfh/yCJPyO44mskiyjuJWNgyhpcjWn83SzJbIQywME=;
 b=AeuzVzHH+KmVh3z5VOzlob9B0NjGyiFkYm4GTzvveM5S/w+N7OduzrQMuYPNqtsq8JToKpM8WZCA8ULj1gcEcSdRQQ/RsN3KVKcEVxqxy59n7BxLOYdL8BdQOkXlHiulFRQ6hJgz0x/lfNXz5Ve3OrbJCXhkp4U+C/11tG3lJDcUSKjb4g7NCA+24QUlGVgo5304lII4Pbzi3YGefATesx5tFJTygwa/6Eny8wmGLANuF8hJXWhHgg0wtUOI/ilQuoqXRk++mcMBQ/IELsyJ2nwd1eAwmb7jmQ97WNuA2Algx8byzOwrSLM2TgvlZ6JcdOdOdz/BLmngEwNgSyl7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 14:13:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 14:13:32 +0000
Date: Wed, 12 Feb 2025 08:13:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_kmod: Stop unloading drm (rev3)
Message-ID: <qtoetanlzeu5ywlsmrzp5m7edhelfm6iw3vqpgsa5oq4ggcelt@jhdgn6nz3rem>
References: <20250205030948.1965423-1-lucas.demarchi@intel.com>
 <173936766590.1309134.17418546452388381803@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <173936766590.1309134.17418546452388381803@b555e5b46a47>
X-ClientProxiedBy: MW4PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:303:8c::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 87bf0129-53cd-4fa1-efdd-08dd4b6f6e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?otN3gUlhRcwdyJwZ81n1HiChcqcTvqqXbDqzsJvqkawyNppnl2EsjCV9SuNl?=
 =?us-ascii?Q?eNQGVhixdLvszfMzhjHPb1Ze5AS78CnWTsOCRru1TeUpSnm4OZbBtFYOaBXm?=
 =?us-ascii?Q?o6AFprN+8gs/CdscoqfFWuoPbP8GULTBKS07+18h+hOn1enqn8xBySEER6kz?=
 =?us-ascii?Q?gAaOXcU/jdCMsVPKLG4c5smMYqJ0CRkqDK7sovNEBAbxqy+dT4DLA8ShtBqL?=
 =?us-ascii?Q?Yd/HKL0jXRW5YxOsPvSDL+3+LO5ZY/xJt76VT+vs7FkcO7bY2dT1LwOlWVHQ?=
 =?us-ascii?Q?b2Vu6yGRETSjPowqjwx9AwLvYokvhuc0oaVcdW4WpeOCMCkYQmqqWVT8x8AG?=
 =?us-ascii?Q?e3/hu4RywnOuP4QKruEXGE9k0xTCc5K0W25+a5MPdiXTJSeMiBEJDuS90G74?=
 =?us-ascii?Q?Dh8vEcwSTyroZDbrqhgL/4BcVPn2cI9rKZi+FeTC+vKd3euXQu6n2EoF9waX?=
 =?us-ascii?Q?SRO0c06eIOOFLOMbRO4FQKzxjO5i/a9L9f1gnTjfEOavhf/Ka2pAgSu/4vqN?=
 =?us-ascii?Q?/6Qn8GuATZxfzucVKgigdKOQoop8MKVPZ5bvj9H8mjPGKKtagSOweF8kVCdA?=
 =?us-ascii?Q?o+zSvoKPp61v1GX7ZeWR4s6KhnSdIfaqAOygYTNDnM0igZxEGPSp/bohREhY?=
 =?us-ascii?Q?Q324+auK+AXvYw1u9dDhgS4FcO7WLFjLgDY5SwLomdsGo1+lmJFgpIuE57X6?=
 =?us-ascii?Q?Wz3Zr4GSpxpojHQG5827FTOEUzNXPmiX1mgXhx5R+ozzD9PCpkfD1Fx7aztV?=
 =?us-ascii?Q?2Hc9Vf4379S0m5cVUALbgg0ZkbVJHFeX60vN3EbS8es2WFEScRUuJVa1/LqA?=
 =?us-ascii?Q?aYx2EHcV0Mjt7gA3YST29eFNwvrj4z1pVLaG4ts5+oMGJJXpMZ2yMQuqmf4f?=
 =?us-ascii?Q?7GcL8bW3NdNIN4eR/Fj1JbOYsb4Wsqej9OxigW89ckQyKwA8bakE9kON0Hmy?=
 =?us-ascii?Q?xU3aY+9jMZFM1LSVUDUD3pFELo90s8LHIGK1HJrUXwcSyW1kxnDfuoHYlfp3?=
 =?us-ascii?Q?xhlfsj6uvp+1XlcIaatiO3tH+nsk4axMbpb/qfwITD93/ElxdNW5IrQuKhbI?=
 =?us-ascii?Q?KHUqaGWVJeRBZhPdw0AgcBy4raNegy3ONUQt98hiZ4jwp2REiLD7e+XyuaeH?=
 =?us-ascii?Q?At2wp8eNUuHAKSzNHi0m2hXdu9rH3rQK8HRlRMu10R8Lok3eB+7eqkGbufSm?=
 =?us-ascii?Q?0+33+nVA//nQ0Q+jodaAnRoyZt4ggWszjJgvMAlqzJzAcbO6cBoY19EI9oky?=
 =?us-ascii?Q?oEJ8U892zn44chDOdEY8qywpXEHCG1HJ5IrWLVSauSwEY18HpiXbY8godevn?=
 =?us-ascii?Q?uKtCzYBiuxcO7IvQpCFQ97EXX9DaeLYU/HFIT+ri/FFEKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eRao8VnzrUtBGdUcEgFYbnEvgf2/vaf4RRDD4ZQ6o7tzgvbruL0lc590IgM?=
 =?us-ascii?Q?B6K576HtjcuWe4X9rVV2tyXd2o+NemtTtQtgWejy87AFQ00bE+Xc5+YfSSIJ?=
 =?us-ascii?Q?y2DFQVROUSOfZG3ni9yFgU2jNVIqV7R9QubPTy/s5MF7MhBiFlvmRiU4rfce?=
 =?us-ascii?Q?1He27oWsWQMBUZyjcFXDW5QOM5nES+mnBXB+Kp5RGjGU6mvp1VfPK6kY2Ckx?=
 =?us-ascii?Q?iiPwM/knukE9x3OdbFlnG4rICIgjkPL3zW/mErh0Tu3s2Yv1dlI98wyasZOr?=
 =?us-ascii?Q?1bCmJ9kA/1VlyB7compwDRPEvMeVKlWOs28CO8tR7jjJDY74QXv629M2Z9Uw?=
 =?us-ascii?Q?OXaYMe67ijT98guY3DoPcAUp79MtAHM7TYjBvD5cXQKYDQGrsY4+mNul0bZY?=
 =?us-ascii?Q?P/hCuG8K9dglAmZz+vUuXofFBtuawcakTKNLhhkCz8MzyNC6PHzSz58uy7KS?=
 =?us-ascii?Q?l9oWV8DJrsOHjZVuTfCrxiUTrd29pJXt06qOnqdYKTviRuHQs1L1TSoh0GY2?=
 =?us-ascii?Q?UAzsnorVUTxE1SYEJx7POGA1A+Q6s6ZgZxlvvoxsZO+dfkjA3dQJbxwdfrgp?=
 =?us-ascii?Q?cAECv2Oh7s55ir41oeidD5AO13VMw0QWsHq71lJn9K37+PUDTNECznFkTgEI?=
 =?us-ascii?Q?J+jbrWbiZ/cicORgKEFvr0JZqEN98uCgClKLhEEo2W43n8NKZx57an0kpfXv?=
 =?us-ascii?Q?F8owPOSIbmGCqE6q0sWQtNwX1oeHXQZb0nTRkE6ZTgbKJe80kMGTlCBhAKq2?=
 =?us-ascii?Q?W3L2DV5DcUrKgWRzLHy9cfgAZvGzVaSa5TEao6eABSTRitIdiIJ/NkKf9KGi?=
 =?us-ascii?Q?MPyef+Go7jYmyGr88VLgzknZiY17aCd6gczFTctbQ/OMBxieo6rtm0IP+Ln3?=
 =?us-ascii?Q?54AE/BH14Ok7u43yZGIq3pCT/zq48/OR5KUhccxlsaj32QFlTHGA4GKADMdU?=
 =?us-ascii?Q?2s131tT0o+Nv8gHvQ2qzpueZ4VyphBZ7XPJdfkeA9uLZHNw4AwdHLwVzt/ut?=
 =?us-ascii?Q?nFER+Bfz/wYCPx6BrVheiCiwH4d4/00CZwFO6/GIKUQMNhH0hUMgbGDO9tot?=
 =?us-ascii?Q?H2xAIkjInJZ9zuinveVUFv06fjjSQGz14oRVOoCAn05+L1NQwspWOIHtdJSh?=
 =?us-ascii?Q?Lm8tLRU/GnEvE/woh8W+r3bXO2o63LNT0BUYT8Ky5aVkaYayAcu1XQ3PmwEX?=
 =?us-ascii?Q?5N8Ks8sFh7OHm8TCZG3Ib6klso47cfj/pcJAHixyCNNiNyk/RGWR25/zhBRP?=
 =?us-ascii?Q?fftVrZVT3o9iDW9oH61qZc86b89Lukv9Zqg3gcjAYT1ceJ0ARILl9WxBBOCs?=
 =?us-ascii?Q?/WGShoItSSc/a3EBoX96a51R1i8trt4BvgdL5atPhLmIbrwARGfDYzrzGkAN?=
 =?us-ascii?Q?k/wYZHVKrNS4bXM2DC5q9vW0ofg64WOBm9dyEHihtqba0xTJ4MMp79nRg6D3?=
 =?us-ascii?Q?f0odmwZJvdnJyqoM/2YtcKysgLBa0scS9M62AXZV3nSkW4Us3SFQKpqBl1K8?=
 =?us-ascii?Q?J5Fs3SymqulptsvnFT0gqp/qh7Di5shzDA3PH3XeAfLE/O2T2m5IYQvJhzHo?=
 =?us-ascii?Q?oXA7hr1wqvkAaotQblZ4ZU6GPNt+YLsSWeGwlvZhXZFs5ivditWxQRwiewXv?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bf0129-53cd-4fa1-efdd-08dd4b6f6e4c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 14:13:32.2237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7SL0HHm6M/OfN4Z3/pMRe0GdAPA0uDSq6CipVOsDSQquqGenXRbuE89nwKTE5P+hSXPrTizw7nUEu4GA/T9oeVPp4GwiqNzHHxx9ZMXoqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

On Wed, Feb 12, 2025 at 01:41:05PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: lib/igt_kmod: Stop unloading drm (rev3)
>URL   : https://patchwork.freedesktop.org/series/144350/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from IGT_8228_full -> IGTPW_12570_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_12570_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_12570_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/index.html
>
>Participating hosts (10 -> 10)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_12570_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@gem_softpin@noreloc-s3:
>    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-glk3/igt@gem_softpin@noreloc-s3.html
>
>  * igt@gem_tiled_swapping@non-threaded:
>    - shard-snb:          [PASS][2] -> [FAIL][3]
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
>   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
>
>  * igt@i915_selftest@live@ring_submission:
>    - shard-mtlp:         [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/shard-mtlp-6/igt@i915_selftest@live@ring_submission.html
>   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-mtlp-6/igt@i915_selftest@live@ring_submission.html
>
>  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>    - shard-tglu:         [PASS][6] -> [INCOMPLETE][7]
>   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/shard-tglu-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-tglu-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>
>  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>    - shard-dg2:          NOTRUN -> [FAIL][8]
>   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-dg2-10/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>
>  * igt@kms_scaling_modes@scaling-mode-center:
>    - shard-dg1:          NOTRUN -> [SKIP][9] +46 other tests skip
>   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-dg1-15/igt@kms_scaling_modes@scaling-mode-center.html
>
>  * igt@kms_sequence@get-busy:
>    - shard-dg1:          [PASS][10] -> [SKIP][11] +74 other tests skip
>   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/shard-dg1-17/igt@kms_sequence@get-busy.html
>   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12570/shard-dg1-15/igt@kms_sequence@get-busy.html

nothing related here, pushing it in a few minutes.

Lucas De Marchi
