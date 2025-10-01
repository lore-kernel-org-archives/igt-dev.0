Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7476FCAC5B8
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 02:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7A10E659;
	Wed,  1 Oct 2025 02:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfqHROsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8F410E659
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 02:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759285468; x=1790821468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Knsxw4/5mK0Pod82VG/PbOU79OizgUBO34Jb+Ij6as=;
 b=bfqHROsUPhDawYc77Mu+iPwR1rE9YCq41aDYJkGOsoR85EX0Z7BywNne
 nc3vq3ySo5mn69MxKyTX12m8SjviaJ4oBRViSt8zoZMNdDkrl2ZDgCG73
 mjcN3EXug2TPXmZPkw0ETP+IE9S1r7O7at79kIsBgnv5btdSYJPy+67K3
 FD8C3DBCmExb3ce4IfqWVUC9foJT07RcF0tZI8UMMlJvYZEcN2pcZ0NZ9
 RC4gbDpVhvRv/hbssHoXKDZdfyNz8ifocTWLIKyZ0dr63I12tENvMwoNP
 hHkNpMfGyNVFTTnrrpYwOrR4QPO+ToJOykAVsBzsVbi4nmnQmAxKCTa1w g==;
X-CSE-ConnectionGUID: IwWm3XeIQjC7yZ/Uc3Sk+w==
X-CSE-MsgGUID: bF03JrOYTAq5oQuJyX5bjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84175653"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="84175653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:24:27 -0700
X-CSE-ConnectionGUID: Hi03sP+uQkWRf/dPD6ZZWw==
X-CSE-MsgGUID: RFReejsjS3OjntN3zJZ3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178271111"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:24:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:24:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 19:24:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTzuQ4vVNNJB4TfQfTFpSSYTS2gc3xvr5+TtgD1o4FPY7xiQd02jASGUBNJyWzFwh1oj2KbXZY7ahei5uIQ9twS4zZP4UvZHPTYUYKvW4VQzJ7ZVlwcxlhf07X8rCGyra09DVGz34uFdypCehmVsV24n+KR0cRwlarqldTIJdMhhm0iHv/F+VTy4HO9vBF2cPRLMudtYgB60CAzmu+Ra8sZSjFKh02EoIMDBmZoKOtBcccCUBW89bI9beI26lHbp2B75slKXMebcjYR80PmxSZamDI4/rh7mU7xldhvB/OgHrkGw8r/EXOHEoUT3L6dtx+cf4Xtzf18s5LYIe5ocTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oUOqho8oxq8k54vefhoQPQMfLUWdiDIeWvIL3VEqEc=;
 b=yY4v1U20SDTZhq6Ij+lmwYVermqZ9Jy7JK05QrDFePmSj2AHYnmIijV+EXHPYKMNElb+eLqUNcwUo4nSyjnpN8x6tGRuBxpL60+EjVdx2DonDWzK7bzOgCXGvPQ7kcoy/GGAviWWoBV+Z30uVh4PL99KjeO5OdfplXyBk40iofmPxf2njtpfbsDZzOzSw0fsZmpgfV3AvU8hFPIR4K2QiyZYPRo+ZXHSBipa4neBrN2PLWAs6C1fRajfbJo0bbE14+rRcKEYxGvYpvP+dGgKcJ+tZhhuWGLAOFErSi6zJ6dSF2rXwNCqogtzOSRTzx2plPnkfpU2c3XcdBzqjaS4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFACFC9C99E.namprd11.prod.outlook.com (2603:10b6:f:fc02::47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 02:24:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 02:24:25 +0000
Date: Tue, 30 Sep 2025 19:24:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
Message-ID: <aNyQ1tPuegzSaDSx@lstrano-desk.jf.intel.com>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <aae3e970-18d1-4aba-8c15-305ee9ce8425@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aae3e970-18d1-4aba-8c15-305ee9ce8425@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFACFC9C99E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cde4803-6736-44f1-3bdc-08de0091a3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q/iCHzhFqBfArwEYi4br9nyRgE7LNUIitkzsRHBi5/JljQeEZ46GCqPbe+Dl?=
 =?us-ascii?Q?g+Knu7UHFsgc9D56A6aPO8809Z7c8xsCCab0hTX7rElXvhlOFC2qruCHZyQT?=
 =?us-ascii?Q?nW2s98l9EKv/vXQfPkgskEvlXZ9cgdVzRajKnvBPdomg+sUdegvXalobTetY?=
 =?us-ascii?Q?CaFRl/MbeGypBuCzc8H9iQebxF1PMx83CmKsqKfX6orQjMMpwkcsH7Nwo7Cv?=
 =?us-ascii?Q?9RC8/khcFEEEU55qOpJzXoC67wjjTnRLSiZDJK0XZ7rRMQ/Rtbm2s3cQQnIi?=
 =?us-ascii?Q?5q+bsRU52HtZXH6UTyamyfIV1lSluutPhgN/z3j9lvzDT25ApwAywhqgd321?=
 =?us-ascii?Q?RtGGAty2psB7VMLmy0OzekhyKigGTj6mq0rbBJHJGlYqJpdRjaA64NgI1xm4?=
 =?us-ascii?Q?2KJmTIxbQqeUj5Yvo2sPRou55s5RSzwAcUDZ82T0hNHIW37xxpO7XAciggim?=
 =?us-ascii?Q?zdcH/g83zqAr20TP/JDmFm8JceEXMu4KsLTFAq14W7iTl8kPbHsv70Tcg5xa?=
 =?us-ascii?Q?60Z8G7lmmS7duPUDL0BBBRnbq0ad+ABc7s0N/itk2/snwoYtmjx21AVRlqO0?=
 =?us-ascii?Q?0AMBzjgL9BnysYMqTSSs5QnTwqzSeguly6cfqqwGhfajMl+5jCDr5ZOQIESd?=
 =?us-ascii?Q?3+sY4FnR7o0oVH31Dtw3Ro+gV2WFaD7F7WHk3cL+LeAJjNelcBOZtzRXcXQZ?=
 =?us-ascii?Q?uG/nLWE9VJsNYuLr/4W8beBjc27EnTAns0gMLVxBCl2qFt7PZE4Ho9/5jSF1?=
 =?us-ascii?Q?EqXza5dyhdNpcXNsVeOfdvlUzIYNclSeHih9kCSG+JdZLrt63BOdDx16+H7s?=
 =?us-ascii?Q?c8C+31LXx6Vhn8MaU1ImfxUCQ89/a9O+9S1rauC1oE/wqd4jZqaxLPZJ7K33?=
 =?us-ascii?Q?l8ktJwS/ixrv9gK7HeuWsztAe63NUk4xZi5BLw/d5jvA8xPi4w5JR2SdFFfa?=
 =?us-ascii?Q?HF4aygZq8kCl5k8Fc2g+fRKH7ahUO0WFSwRBxXuNEw5Wi9nw47s1OoqwpVHR?=
 =?us-ascii?Q?76USWPLQixqrG9VVlloXBhBcEOtDDnxR7JNcejAlIKn4OwdikpcChv+TwjKF?=
 =?us-ascii?Q?uB0lktKvAsNYiApNdnvLRxeaPktXG/oWsKvxYi9On4Qnnkb33AAZm3vZZKiJ?=
 =?us-ascii?Q?QKypQM+5ZJDya2jI2DDhK8RTI9SP0uDSlAwPeirDHuVNs3r7UE/Z+Tg/GJ6I?=
 =?us-ascii?Q?Jxhe/mAG+X9lJn3R9tAP698gCLjrfFi3Lylv3tSNpC3DjzETOBfHEZxlVeKV?=
 =?us-ascii?Q?RW2y8mYPDF2ovxmkv0SCG0Hmxc9mr2hVEwDCxpKFtQPljtaMvHKyOIfP/Aa4?=
 =?us-ascii?Q?glW9y9/5K3etlolcep2ENoe5OQSQczxGcufrxHNL4qMygany4m2467AWS0eS?=
 =?us-ascii?Q?Sgs3FDVHwPx0t0gtiE/TFb9n9JFksjV0RkU3IJwHpWR3kAgn8eFVAMyM/Dem?=
 =?us-ascii?Q?96oTbMkJv8qTc6480jirbnIyjrzlam03?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZZHa42u7lkMCniR11u101zqES4/7E7PehdC8IRu0/HZxBJyuGhWGSKRdB/30?=
 =?us-ascii?Q?WrecvE5osRkvpxyqM0s86aDqWpYAH1cjgTRwxVB9R65wU902JsyqQa8S2uCP?=
 =?us-ascii?Q?6kL5xiGMEZM0H3yyxtZZr1nme4aMyk+EOZthxw7CApyv9ipJ3/770BNgi9bK?=
 =?us-ascii?Q?K+0SfxXdembu3bgt1RPB1lqUhflR1+y91ARy80AyeI9rdY6WIaESEMO+aKYD?=
 =?us-ascii?Q?Bwc1UYGNWWYzfc4RQNeLDkSxpAmVjbfAR7QVItao/pwoO6OPNuFD8pybh3sZ?=
 =?us-ascii?Q?iSxH23oxsvQwOaLbiH1dQXVY5R8bqBoGukFT0sc7nOJdHS8iui9NyCt6ZnSs?=
 =?us-ascii?Q?oTMYXmx14TOr15ZB7YD7PMJGOq5un3FDpl779a01zCACRUc/eMwmpNtvpUKw?=
 =?us-ascii?Q?nk+Pse/alsuN8Bd2EtFsgmcHtgbWH2mzTOXD+jTldaY/VcqWpuXDxxlN3oqr?=
 =?us-ascii?Q?c9zXTvNU0MTU1ckFqKLg7+XomnlVsMVSa4xllwuWEWZ0zVww4BGGs5UcP8f+?=
 =?us-ascii?Q?5ve8MxyreirYVmqgN5Vrj9/cRNQMzuka/zxVYM3iDtfzSU2HeHQziidoOu0m?=
 =?us-ascii?Q?ZpUME7fWm9mTgE/cAh2KyqWGmV0FTkOpHbx9YLfQFBddR1rEk4XKxPOzKL0p?=
 =?us-ascii?Q?Bua2Gr55aDixepq4EUo99ZQF6ptWpQPs/PlqAKBsikPD0qEdwgsM+Kv+hOzt?=
 =?us-ascii?Q?LaPw5eZHmX4T3I9iVMAb0ZbiLCuMRpNJ8OqHF2Wxbxm8tzs67dC7lnifltGS?=
 =?us-ascii?Q?pe8sy6dRYWUDuN4sHqM0vbiZeaWZGMnYMIKccLuzRvlb+yc6+eB7QU6CazaI?=
 =?us-ascii?Q?27V3Otwfj+F8QxcId2iqgH+60TUIcHpkgFDaNwUujwRCjy21ngsE9Ge36uYV?=
 =?us-ascii?Q?zc1bWJnSTlJz2lq6y33PWq9VYREAs28jP9GN32w+2NIie5cdFGfP6zK3mudL?=
 =?us-ascii?Q?jQfMfEZAdaKXOl4lvd1+17ellXRPZns1aB9tpEgZfF9n4vgzboskrlcvsm1v?=
 =?us-ascii?Q?Z8mpHtPZMx/AdZjvALzwveV4+HGF5W3T8VF6RvU2eQYjhg/QEQ6hE6yPWzav?=
 =?us-ascii?Q?QGB7Hx/VL9DUiOHeWJR045kyiGUoL+8OqhePPsSFuEiYmuMbcC8zS6Jwczdu?=
 =?us-ascii?Q?/jm7uedyq0rFJ2RdtSC8lfEv4+bslz6AtgEJ3cLHLUSALnsbr0z4lgUsfaCW?=
 =?us-ascii?Q?7HvP1nqk7ys2+mOx75VTRyoUoo0m7fgH/ZQCNtkah2btM53E4vs8UNEfk3pn?=
 =?us-ascii?Q?IzxExJF+3+Xcd48fxHyh0c7IC2+BPRUEjr9Pu0LDTFw0Bm9O4TQUjdLpHnQq?=
 =?us-ascii?Q?Yoj9D4ygQe8tVgVNHT7BrXHuW6JQ9R5p4P0xSQxl8BI3BOZAijcCty9+2Igj?=
 =?us-ascii?Q?dNlesW6ZWRuChtIwTC5uU2FXXWp+X+ZlhDvXe8KEeBR0W8cmm8e/qnkZSu/m?=
 =?us-ascii?Q?ia+DYjmufiCxCZSE/OHc5UK21Ndr/jzzhAwRmVWr5WAQ1UCT3BYIx9j7qm5t?=
 =?us-ascii?Q?EbJmy9gT6uCCxruoU0l3Aly0n2BnRVTwIz61Czm4k23mXh+HY/HZt5kU3fT1?=
 =?us-ascii?Q?Mqs85pG3qmFF5JhuxOCpQtnrU+3mh/DmEL21ziUWDOmxVH8ff90iWFZq/cGr?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cde4803-6736-44f1-3bdc-08de0091a3b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:24:25.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy9Y5AUjJ9aZCRUWpRVz38UGXXuwdo+zD8rrqDOL2ffm155CDqWOZKPvOvPTz63U1bIn4dQYFcn5vS5nOTpnbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFACFC9C99E
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

On Tue, Sep 30, 2025 at 04:29:13PM +0200, Bernatowicz, Marcin wrote:
> 
> 
> On 9/23/2025 11:13 PM, Matthew Brost wrote:
> > Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
> > memory can be used during this test. Useful to test VF migration.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
> >   tests/intel/xe_exec_reset.c |  8 ++++++++
> >   2 files changed, 38 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> > index cb53a8cfc8..74432a4b3a 100644
> > --- a/lib/xe/xe_legacy.c
> > +++ b/lib/xe/xe_legacy.c
> > @@ -9,9 +9,11 @@
> >   #include "xe/xe_ioctl.h"
> >   #include "xe/xe_legacy.h"
> >   #include "xe/xe_spin.h"
> > +#include "intel_pat.h"
> >   /* Batch buffer element count, in number of dwords(u32) */
> >   #define BATCH_DW_COUNT			16
> > +#define COMPRESSION			(0x1 << 13)
> >   #define SYSTEM				(0x1 << 12)
> >   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >   #define LONG_SPIN			(0x1 << 8)
> > @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> > +	if (flags & COMPRESSION)
> > +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
> > +
> >   	if (flags & CLOSE_FD)
> >   		fd = drm_open_driver(DRIVER_XE);
> > @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	bo_size = sizeof(*data) * (n_execs + extra_execs);
> >   	bo_size = xe_bb_size(fd, bo_size);
> > -	bo = xe_bo_create(fd, vm, bo_size,
> > -			  flags & SYSTEM ?
> > -			  system_memory(fd) :
> > -			  vram_if_possible(fd, eci->gt_id),
> > -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	if (flags & COMPRESSION) {
> > +		bo = xe_bo_create_caching(fd, vm, bo_size,
> > +					  flags & SYSTEM ?
> > +					  system_memory(fd) :
> > +					  vram_if_possible(fd, eci->gt_id),
> > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> > +					  DRM_XE_GEM_CPU_CACHING_WC);
> > +	} else {
> > +		bo = xe_bo_create(fd, vm, bo_size,
> > +				  flags & SYSTEM ?
> > +				  system_memory(fd) :
> > +				  vram_if_possible(fd, eci->gt_id),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	}
> >   	data = xe_bo_map(fd, bo, bo_size);
> >   	for (i = 0; i < n_exec_queues; i++) {
> > @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	sync[0].handle = syncobj_create(fd, 0);
> >   	/* Binding mechanism based on use_capture_mode */
> > -	if (use_capture_mode) {
> > +	if (flags & COMPRESSION) {
> > +		int ret;
> > +
> > +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
> > +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> > +				   intel_get_pat_idx_uc_comp(fd), 0);
> > +		igt_assert(!ret);
> > +	} else if (use_capture_mode) {
> >   		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> >   				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> >   	} else {
> > @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   		xe_exec(fd, &exec);
> > -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> > +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
> > +		    !(flags & COMPRESSION))
> >   			xe_spin_wait_started(&data[i].spin);
> >   	}
> > @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> >   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
> > +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
> >   		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> >   		     i < n_execs + extra_execs; i++)
> >   			igt_assert_eq(data[i].data, 0xc0ffee);
> 
> I'm not that familiar with compression, IIUC we are not able to access data
> when compressed so we do not do any checks ?

Yes, the data will read out as compressed until our hardware supports a
PCIe bar which does the uncompression or we'd have to copy the data with
a BCS engine that triggers an uncompresion.

> I can see the engines are busy while executing so assume that's enough
> for basic check.
> 

That is the intent. This test quickly failed on BMG / PTL when migrating
a VF as compression handling had bugs in VF migration. The intent of the
test to include this in VM test benchmark to catch bugs like that.
Checking job completion is sufficient to detect these types of bugs.

Matt

> Acked-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> 
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index 113ceb2178..f5db1ff8ba 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> >   #define GT1				(0x1 << 10)
> >   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >   #define SYSTEM				(0x1 << 12)
> > +#define COMPRESSION			(0x1 << 13)
> >   /**
> >    * SUBTEST: %s-cat-error
> > @@ -702,6 +703,9 @@ static void *thread(void *data)
> >    * SUBTEST: long-spin-sys-reuse-many-preempt-threads
> >    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
> >    *
> > + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
> > + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
> > + *
> >    * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
> >    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
> >    *
> > @@ -878,6 +882,10 @@ igt_main
> >   		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
> >   			LONG_SPIN_REUSE_QUEUE);
> > +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
> > +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
> > +			LONG_SPIN_REUSE_QUEUE);
> > +
> >   	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
> >   		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
> >   			LONG_SPIN_REUSE_QUEUE);
> 
