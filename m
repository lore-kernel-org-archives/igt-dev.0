Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B7C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 04:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76E610E6CC;
	Wed, 30 Apr 2025 04:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+Dq/6Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4310E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745987209; x=1777523209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LKOXf5OlGp0rUrtaSD9ZhnyrMbqWlg0qlHwdaCDGK0I=;
 b=I+Dq/6MjeacdYIY68g4OEPILNT+LlUU1GsR+8h1RgnfPnAMZYJ/DfrN1
 iP/9vPVdTAasRomjxKmBWEk3rWzXsq7/oDHxfuY9MYTmKM3z0zRrJNRhW
 O/KDvr7DHLvuKlhRP5GIZrhysPbsp6Y3YApP8PkARYB/EP7eaDa8Z7fL+
 JdWEr8DzewZ3zvvTr10cLIwXs7/MIK26M3EC4bPCPWtR+Ckllw5WKWvcS
 /+bh1OCOTyu9Wg//T0g13CmcvQJHjqB+pZdeFe7QwoAU/MhbqmdamnATc
 kNZjoOb6r1SIQhcZRNopxXlLAD4xHOaHKTy7HKN+MkFiOBQtT7kRhHo8H A==;
X-CSE-ConnectionGUID: yMdeo6cYRC2AHYVTTPTQow==
X-CSE-MsgGUID: Y2NY5LyURvK43It3yWa+aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65170253"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="65170253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:26:48 -0700
X-CSE-ConnectionGUID: w4Gm/8BISa+S+ei2Er7m8w==
X-CSE-MsgGUID: LCDlnBapSXyTjWOnAuqm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134958098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:26:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 21:26:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 21:26:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 21:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFcnG5ZPD3vnoTqU6TuiJKrfS39pyMhzQTyglswfrqWmPUu1WE3BPlyRrrQO2Y9m5AbaPqBrE1upNH/jxmw2bJXBo68DgShlFsG9EnLc/Zfke6lcRiKgYRSLP6ef3di1spBzX5K/Fz/jTrz5cwBOxZ+8aN5aBokgaOGT7F33bgI+aNFzUsx1Kc45R6CCpQfo+I33e75lRDW69TPKyneUfsSchoaxREELM9bJYMXqm/lrL6aZduvtehSnD3mPyqXf9Lmw/THSDrEdskvxGt3OHI2N7QmLWsgDxCKUGf6m0/jadqgzxnvuFKyVrvdRui/Gzsz6BEve4Di0+NKNQSPKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImUrOmHiD3Yr1B7qfehT9zHOHyhPGCFrhsG35uf7QC4=;
 b=VjNZDodf/k9AojCg0lIZDOXARehH4iwNqVXsWDaHKm/RT5zc2KCDuehsR1eXt6leU6wMPSzmwVL4dmKWpy3dLyayEJGra4+AWy3raixBaWPNIRt/7k5v7zSA+HikEwG/BkHaLQKRRLkJtWcy4qkkVxIfpbwPDdexCyR3sRC4m/K2yU4fXWCM6mTKUhQfTsWSiwRKELsVc/tmxu1aPMMYuGAgs1QBKQ9R1nN9CcPvoybWvU6doDF7u1VoRmIsXhw++Za99dMau8Z04H/hhebTvYiBRDzK+wUPBI+0Tvih982leQAO/juyhi4od4cPCBbwNOVn1Stv95WPK43Cp9Uotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 04:26:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 04:26:45 +0000
Date: Tue, 29 Apr 2025 21:28:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix 32-bit
 compilation
Message-ID: <aBGm2OFT2GuKsInU@lstrano-desk.jf.intel.com>
References: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 1967255e-b1d0-4cbe-4407-08dd879f3773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?so0NC2VzBg0j62Z194ejRWtw6+zznaeNX9FE/DaOX3QDzFQ50wmGOO+CXSnU?=
 =?us-ascii?Q?PVZuJgpGtcuRtgP3cT9G1hZfTFxqNmD8DbWojRvHl4epp+l2i4yy6NvwL5av?=
 =?us-ascii?Q?t/kuUzbEyLa1xSdCNsr+aAXMaJqZhK4rBM8fox0jdS86Tlfe5Yr0E0RuG+7T?=
 =?us-ascii?Q?TfQFpvIVEE4siz/jTrN9eaksiQISr52z1mj9zWiJ1k7iiSaNS4HhSFU/DtD5?=
 =?us-ascii?Q?IIN0KIA4Q+VaI2j7yQnShySoyuwC1Kv5VYgYJeHizv8cL9cHOL/czldT0NZ3?=
 =?us-ascii?Q?Bm7snpmsUzsl/AfKk/dN0u/FQA7ij7BCjodKD76zyPEEKFdAzhPl6PzC8D+h?=
 =?us-ascii?Q?qsWIbqr/lEreyu8nOeRogyxIGbOBDmoa5X6xL1l5xFz4bf7OJuBBY7NDn9Oy?=
 =?us-ascii?Q?T2ns9vOLjn4UvwKk9YbPwOddWV9HowI9TbH1DTeqa3cYg/Zv7uEX7qjMGOmo?=
 =?us-ascii?Q?mvMmQ++d+MhTAjrkkjQnpyLeH97TTMCADYaozvD7myX2p2NI3A4oHbjekCTd?=
 =?us-ascii?Q?7gUbSiS52d7yGJDLSNreifi75AsD8e5OdxrMzwpL6qDLuG9UismuZPlT/dF+?=
 =?us-ascii?Q?75Czer2xhJ4teF9yFEmlwvKLrjbbO2pUmEDkfHR8zQ8jxMM7ylF59Egu71q8?=
 =?us-ascii?Q?NIAzQ5yGgqj9v8SHwmFRmFtYP6qzUtAiweTfZzOaKfQV5hjrnn4MZy6/q23q?=
 =?us-ascii?Q?3d69Q+jotin8Sz8M/R7kzEqxaIYx2bls8lHeikW5ZbW6lOC2nUi6l+H/R9Dh?=
 =?us-ascii?Q?r8Y3WkLvXfr2TlRfizGVFAWFErxb9x7RvyrJyaGcaBdJ3pRHkby8doFWy4wE?=
 =?us-ascii?Q?njN8WYTwOG/pshwPalphL5EAum/zYv/CfOtWsIam3GLUaIZl6H49bd+zV/v8?=
 =?us-ascii?Q?k2sHf6bGaE++Txz3WR3ygj2dQudhkLNyoKvsk88Bu8zPxGtIFBqXBsNIxeid?=
 =?us-ascii?Q?RsFt5h/5we11nRLFr0eXa1U0sJRA7+ivTgXPWsL9fs7Xl5lZf3YsKmG+Vxeq?=
 =?us-ascii?Q?xQN3AgglIebSSR3y3LXQQ2bDIQRN8TYP0Jvvn7o50a4D6uVF0Tkt52HIDqAi?=
 =?us-ascii?Q?hL1qXqZHmItdkgJcDZmNAdTqZ9lQuPJ1K7tmzUpVcLxcU+I8/wtdDPJ2QTXI?=
 =?us-ascii?Q?Qks3ZuQrZ4QqhGD8wDcfqwqedmeZn8/2mvrp+lurN/1x38C744XIBPrnu+2H?=
 =?us-ascii?Q?YWTlt+mH1VovAWLePKRSjRb/k7FQwZnU6xuZr4q3D6XjTeLDG757l5sWhIS3?=
 =?us-ascii?Q?6R6Gdk+hdpgrFQ/WnmP6CAAvvJBT6rFFpgTRAeF+7WqUMey62q9g0HNaYiiy?=
 =?us-ascii?Q?wJ4Bi+0MRblhw44wiCnQbD1kjxb+3A/t7ktBBfByQPYfNmycO4fq2IBIT7G6?=
 =?us-ascii?Q?pIlNnakl/Lu2aHR0EfG/g1wyV2gUrYhFp6xqYwak0Hu9tE9NLEwbLTPgkA0L?=
 =?us-ascii?Q?J5SvaLVJF5A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucvQG07zENTo+2xBRJ+Z/Bq1jEiQxCxnuEkHjQ6Jk69Z8uj07ybLUUO7F/OZ?=
 =?us-ascii?Q?yxkwv1h4U3hJIzGjxF2Gw4bWKjXsytCy4GGByytiCm6YjbHLluWLzH9ldbai?=
 =?us-ascii?Q?B57KYYP/PzFQJrrUkaN4nonws5t8nBZX01X1SoHj4S4xb5zPrrZw0Dq33Wpo?=
 =?us-ascii?Q?cgSo2p32XPenpoMP2n5Vkoy6DRv3ispBdRok7kUScl9ZFiQJz5ZWIdbGzr7h?=
 =?us-ascii?Q?7v41fgf/GdEi4kwRQkZu1kS7InzIDUpJ2T/z/6GHtSdplba1BS7xM7+wZfOa?=
 =?us-ascii?Q?H7sLKDcvs3hckAlGGZLfLhSas+wqoG+MU3yWR0CTIkRc4ZZp7/AxqQLRyWzh?=
 =?us-ascii?Q?ZuPxxbTN6AKTWg2s5v7LCTTtUwguwym3JXWh7s60Z8rGmnl4Nj068LUh53rN?=
 =?us-ascii?Q?PLykkNCYEYjxn6x4QSJQDISjdO6TripcDi2DgJ7+5ARfP4cUPVMrdrUlhslX?=
 =?us-ascii?Q?Z4rpfivKHdJzsC6ovS/Q4ODIwkoJfTlP3RxWqSpKbsofPrXMM0A2F1U/y2ZB?=
 =?us-ascii?Q?nkEzo0Etn0MvXRJhfef6nj3+ZrFSqvn8yWaqPVMfttrSj/01w7GiSnGl66jk?=
 =?us-ascii?Q?mlzSKuPobgBYZGBQfoE4qy+WnyUffwc1NtJO9m9L0bq35haX9DD/MkzRYGsm?=
 =?us-ascii?Q?g0AiOdlb40C0OhXXfdb+dyvm6Yoj5MtE/8T0tI5vJZyjPdzbjZYkR1tHRgfZ?=
 =?us-ascii?Q?p6NRjIr8gh7bUQAHcs5YfkAwEdQ9GCzvWDomxWdqqTBUc9jRbCUeu7JlF1Iv?=
 =?us-ascii?Q?2roP+5+puJpWrAoQ4x7GPPJdNXwgnv1g18cV/sbsKWEFrdrjU3rLNzU84xBh?=
 =?us-ascii?Q?T4GaEbM3GZNz0RkldEGjqHdzR08aq+kV1hzqF9Lp+V/OMW8A2dVt+5hroXMI?=
 =?us-ascii?Q?Y44POBle0P1bSox+k9oQn9oJy1GtmXSMWGOYGXINWYVrW9iLTQ0BBs81H0FH?=
 =?us-ascii?Q?qVQVXavJeYWrHzhrpm09dTAr1bDm/m729nqQMuDZ5dBlLN8wM9kQUjairHOM?=
 =?us-ascii?Q?Fjp5FNSY9qzcuXgwNNWYNkgUF8ejgPAmRmP4HmDk/NHsorsvHOAzULyBqrxF?=
 =?us-ascii?Q?W7ptTI7/lAEOqmSncO9tQ/nb5LAP6IkmxJhUS7GGitKdK1dcaxrLsVe8Muty?=
 =?us-ascii?Q?MuSb4BE44ZxD4hzpHl0c9+ZhjzLeBCwwlr12Fiph3c81c3gZfOSnZyJOb2zF?=
 =?us-ascii?Q?84wUhfr+dzXPPdW7JSSX9PeJXs1+zsCB+I7FPOh3vCyXOgM301CSgCkJE89K?=
 =?us-ascii?Q?1sjPZnwYafisf9DHHdQP8rAVzG/z+WbRXRRd3SYXbFF4SNJ+Zm9YyI1cm+Uk?=
 =?us-ascii?Q?qMb4qU1ENdEGGlTcTje5sc8HlyWuYA1VZb9Iar3U2xSH/HafEmU6QtYum/My?=
 =?us-ascii?Q?+TlofuO/gxKQw0nCF0w7n1dBfWfpMnK3kqVSADd5jc1mq82duU3YuZEh5IUB?=
 =?us-ascii?Q?QSD424eMTxnQY/XYAszTJPDcmYWNOyv0jsz2jRCv9RKELvZb8TSH6Bab/PAa?=
 =?us-ascii?Q?JjHY0KWS6mLDo/R2fM9yrGwAlezPllKv16l/gyd87bOwO3xZW5hbkMy+ys1S?=
 =?us-ascii?Q?TIrmjRgy8b4B7A1coPpmyAHOd7pREsZ5+iFn8+zSGOySLcKxNRkvmIVqM+If?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1967255e-b1d0-4cbe-4407-08dd879f3773
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 04:26:45.7862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdoiKFCJ9i+EV6/n4ZAVAGk3nvN1VdSQXdBt3T6vCib+qoaVXegdb5J9fe18ZjiCYHYxWeROzvWRsUGcNUfqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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

On Tue, Apr 29, 2025 at 04:30:51PM +0200, Kamil Konieczny wrote:
> There is one more place which needs fixing of Xe test
> compilation for 32-bit platforms, reported errors are:
> 
> ../tests/intel/xe_exec_system_allocator.c:382:41: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
>                                          ^
> ../tests/intel/xe_exec_system_allocator.c:382:27: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
>                            ^
> cc1: some warnings being treated as errors
> 
> Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
> Cc: Matthew Brost <matthew.brost@intel.com>

Sorry for the trouble and thanks for the fix:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e1121a862..30b99f3ed 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -374,12 +374,15 @@ struct aligned_alloc_type {
>  static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_t size)
>  {
>  	struct aligned_alloc_type aligned_alloc_type;
> +	uint64_t addr;
>  
>  	aligned_alloc_type.__ptr = mmap(NULL, alignment + size, PROT_NONE, MAP_PRIVATE |
>  					MAP_ANONYMOUS, -1, 0);
>  	igt_assert(aligned_alloc_type.__ptr != MAP_FAILED);
>  
> -	aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
> +	addr = to_user_pointer(aligned_alloc_type.__ptr);
> +	addr = ALIGN(addr, (uint64_t)alignment);
> +	aligned_alloc_type.ptr = from_user_pointer(addr);
>  	aligned_alloc_type.size = size;
>  	aligned_alloc_type.__size = size + alignment;
>  
> -- 
> 2.49.0
> 
