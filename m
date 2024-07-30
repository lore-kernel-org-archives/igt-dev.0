Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D34C3DA70
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 15:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A310E056;
	Tue, 30 Jul 2024 15:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8lYdjLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2E10E056
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722354316; x=1753890316;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=NO+ruc1T3/Paknf0gpKxW0d1l2rcT+oxog/eXGgmPsE=;
 b=K8lYdjLArM4Ft1LxwCn80ZJ1uY7o7pvxihbCQCJqOBm+zmkO93Te6JsF
 BsHMiYfF6ebQDwfs/XWIDFkX96LJlfpGRtcazBQh249sxtQEufufDgHMg
 B6vE2owsbCQ2RdmHRf/ZW0yJObcyUivOILLtrc7tynb6ccRuTidspPZ46
 qkNN7O3gXFt/1ar7VcvhJQI5lzHi1k8iox1WQQY+alAHfbt4iMyAdQOjT
 Lcwg7CoCiimDzGFotooS/o3tBWEXyDbEQVpRi1+vm1OZedpvzyhs4OvV3
 hibD3VT88f7M+FThcfokEWTwu5U5JqMnX/haYmTYqY3WJ0fDi3rAMDHbc Q==;
X-CSE-ConnectionGUID: 1lYry55hQ0e2p4dht32lNw==
X-CSE-MsgGUID: OHYOrxX8Qzi3cDOebNWydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20021635"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20021635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 08:45:14 -0700
X-CSE-ConnectionGUID: NTzLvbV6SGuIlyOG1ORDAg==
X-CSE-MsgGUID: YLv9gcFeRmSR+c9rIAb0hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58703075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 08:45:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 08:45:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 08:45:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 08:45:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 08:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcyComVx3bi/jUCKddssOrOJRnAzzMkKL69mpKsEbtcs4P9dbD/bJnjgeE+sa4F4HFawNSOtny4tZy1B5Gq4PR+2CJJ/b5X9dvaITT29WCI/+XbEMZEQb5FWEvZAFudH0itMA340cBaNp36AXdUuk9/IdveQRHPUgfQ/snMUIrGGfFIcFfFCzxpuYNcGi2OU+P951Muq7UM4Q7O+/CYbrDEQ9wNHWJ1kvZHiLJc2uhz4ASbV6iQmtaXX/0WaoZwx8VmiskojaWbVMfun7mh7IT9gMOROWej7GAufx7iqbw90FLf6Y46gxpmdytZJfk1NvsPpERIPcTYGvb0mfI90hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK9CAjqHO0AWgVQu2MXv1hCYKXAdUuWKJArSPffazMw=;
 b=sReT113+Fm+GQsBCr3zcP8wLE/y6BX8XzCbRW4tgxQzaToRiwzAhMIoFRPsFyxWwQINRPuUFmjpvL/Ga/tpI1eUQH5d873VMBIAFNpK8wIHbaIQDltEEPAIawfUdxM9k5mBsS9UnxweuOzH6ZsG86Kf+4tchLunoZlbLhP7j0VaqX9beVGVGv5/0Zb4rgl+XZw1CILsFrCq9uCyte1o4d/w0Bb+VvG0za6IvCUzxoknXo5yNr0X3IXzFggH0294K9RVWE5V/HnCqkSfeuZUPNoWltx9FmGhQ9mIbT6mBUUV2raSy3Ajuru9rBomP2mlWGfNu3+6zD6oNiH7cSclJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 30 Jul
 2024 15:44:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 15:44:33 +0000
Date: Tue, 30 Jul 2024 08:44:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?=
 =?utf-8?Q?e_for_series_startin?= =?utf-8?Q?g?= with [i-g-t,1/2] lib: Add u32
 variants of igt_assert_{lt,lte}
Message-ID: <20240730154430.GE2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240729220251.3353533-1-matthew.d.roper@intel.com>
 <172230576078.426621.7309539529561356030@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172230576078.426621.7309539529561356030@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e27bad-2cea-494b-2df0-08dcb0ae81f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vD4ybITbDGAXhb/PeZZMWGopViFZ0t3A2HulnUyuEXG0EslbJu/41C/cANvZ?=
 =?us-ascii?Q?O8QhjyouVNhvh2RCxL4Xv9ZIC8ZKQ2QMRULxxtqVbeS5n7jE32z+jMIqDCYa?=
 =?us-ascii?Q?jPc1wZb0sWAGX/V8VPMtp5jXfhiurwnnyR2k26t4BYRayc3BJU2C9IUzzjk0?=
 =?us-ascii?Q?jdR/FdEx17Lk83Kn6vjHyFI8pf7oIErAJy3eyDRQ5Oj+TSFfxQEK7/mSuEUk?=
 =?us-ascii?Q?N+0DOfvHBC+2iy2Fmd69JBAJRKTViSDdkcSoZJfdRveTYevSZc8ZHMwM1tRm?=
 =?us-ascii?Q?75SdJo1vFWQIWmNQ7XUtuiFdBHa41qUl07mJgTmwjBQuZL1cq7a9Nx9xSI8x?=
 =?us-ascii?Q?cs8NocCg14AqeYQehHQvmap0OmQjXG5Iw0wcLzLbi0DyX7mve1GLOypPvXES?=
 =?us-ascii?Q?M4XUxKB4MzKHI8Qj1RneyR9Hf4IdPXNO0VljMWwTzHNYuhBmS9XOhPImDzL3?=
 =?us-ascii?Q?gLcEmF1wPNfo8NiJ0cYE89dl1VxUTae6CeWKmQYYIYjkJLJML/2HziB0I/+P?=
 =?us-ascii?Q?+XlFKgf/vkHXXvzZI3mPH+xz8FIs43Ca+JeqXCnDtQ0yQ5MebYkXsPeTL5E+?=
 =?us-ascii?Q?/0UgXfBcec9r8KGP1jUwkIWcl40fKCHg0IbObVGDZ5UHVeenql+ut7o2czAr?=
 =?us-ascii?Q?hUDsGIYdEcWdQGZDN6GysPouYsCcDmbe61Vvu4mzPZtzHaSiTkNNHQJXnVUz?=
 =?us-ascii?Q?e6fhLOpB4Fnx0OwFwnx4MMQUBYFUnB7IN7yxeOqg0LfLcT9hyQlSw9wXF+SL?=
 =?us-ascii?Q?3tjL0q0HB1TMro481SytEDFd8yvNyXThNbpH3VuVmEgV8iv1rO7Gc+aKhR3t?=
 =?us-ascii?Q?Jfpf7zsZ2QXAaj/FQPJL7wFIJJEyVEbPawsefkMAnet/nwUSUheuygQZixGK?=
 =?us-ascii?Q?qFvmgsYmW5jvyoxNMRft+IfN5YQGE/VAhn3UrW2Bq08vKRBHB6fKaDEivEXA?=
 =?us-ascii?Q?uf18Nlbps9Hd3yFaZAhBRP5Z22XMvieuJC5zWWDJjiCYsYGBFSKK0hQTguBb?=
 =?us-ascii?Q?Vd6LmZVmBlUGCr9KJxhYBDPtaSZnw948SzQWJpaJox0UIrEGzGzzqJJojEwK?=
 =?us-ascii?Q?pJpk8+BQEm4DD2TdlPdHjkF7JmdxVUj8UOxOOzoiVJ1yFs4C0NCyaJcjVqRN?=
 =?us-ascii?Q?qq5LKbyspj182smMLfnYdvqzRbnUn7JtlKjl8wH+LpTcgZYnM/OTvOvg7ZJY?=
 =?us-ascii?Q?3CISocJlCX+aOlW99qFhBMV0YxJRNxXKhOd4aNJViAJtOX0iSKk3CXYoewM7?=
 =?us-ascii?Q?2vxmfWtZGhAIm/i394B94aLOfJcMAloTaFIFzUkMvYQkUox/81qEg2Cyfu5P?=
 =?us-ascii?Q?SUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?chFqBqJtPjt8po9BgagcFVEELxNw/iUqHGNsSSx/2SgH4siFxLoDx0hiHMn3?=
 =?us-ascii?Q?N1Ry4er0sjLXbuJ6boSwQwakeNhtuPqlqOCKBXwxlj+lfq1L5+jycVcwm3+T?=
 =?us-ascii?Q?AkxYOdSDswI1CAXtdF49OlgWguPcUsH+wRHXP1sqIgw0QN4gScQVkaWV2Aft?=
 =?us-ascii?Q?UDm676oajUdjzwZcFRinyTnfau9vePF5UrnTmLYKxpIfnz22vhKA3fdELJQn?=
 =?us-ascii?Q?X6gE3gC833LXNUZ3q0RrFiIbGZ3UPjbMjjFjntUi2RWzpLR4QzUfm+EXWbu8?=
 =?us-ascii?Q?WfdBoxGdkhtBcEnCwfUEGzelKaLs3cdoZ7t2uojc4JxGcB3ZQHNpOxLRNzob?=
 =?us-ascii?Q?OG84M7ZusxqDIARO6z63SVstLHO00MFbGhfv0QB7stiOrL9n/ecytE81pPcd?=
 =?us-ascii?Q?93vFTeX03jR12RNe7gliMMA60v9qg2moiG4SM7aDjxKG5SR1gznhE6BFxMRV?=
 =?us-ascii?Q?NY0QiWRAeie7fhG7y16j9GVoH/4tg2cCVUHWNrUblyeL59nsM3sIG1J6PdUL?=
 =?us-ascii?Q?+x7Fe351aVN4J9VPiTPc5Wp1McyHl6MjGL8DCAtsnmWCL4BQDcCGiKlXZ2Zo?=
 =?us-ascii?Q?gYvtgyIojoJH0fbOKPuvXpM8C5QUnJ1EidgYhROx2gTyF3p/N12AI6eCoh49?=
 =?us-ascii?Q?psNytewrHftSj2Ebkz9F7Y7D+hhCZUABE/SJD8awRg87J7pbHDCb+Uoec+pE?=
 =?us-ascii?Q?hZTI2SOfG7foN1BTy3oq0quwiS5HIOWJXAlptKjr6puk1teBilNun/73Ud87?=
 =?us-ascii?Q?0fZukZJRZTGBBMFnJWory7p0/H0vYo/sDAdoBG44/gamjUq7abJah6DI3kvz?=
 =?us-ascii?Q?u8n3tOaOfayH5HOlka+om6ByHU8UNUaKx8M9BQLd+mrW1Fxb2yZ+CUxkd2i4?=
 =?us-ascii?Q?zazSoldlQt00/oItqcn8d4iEfqJocNWDxs6ewDLUpixA5l2nYdy04ZQV1/BB?=
 =?us-ascii?Q?syCVzpUoLUCGw/pB42bgxGYPEhNxtVFZaIN4AnChzhSJdsEBTPABMeVb4h8t?=
 =?us-ascii?Q?szNaPCvfvXUuBaj+K0akqOTp3JdSBZz9bCu8S/x98/P1dG7d9s+HSot5vtdx?=
 =?us-ascii?Q?C5dnYooRLxNpPyFlqgUBZ7GRKSOqMtsr27iQNAlg/ghhVQLXd+8xEOaKsbrO?=
 =?us-ascii?Q?Bw8aa25/0nnENbthejzyqNsCPvl19hHhqsZjbyffLPJjNL0LLmcawQZbWqPy?=
 =?us-ascii?Q?g8LNkP83HHyEjDOpWsPfVxZKCnaGSGggK67p+aasp7SJkckVDpixhsh9JOx6?=
 =?us-ascii?Q?NH74t9URofmT6JawhCYeMgoo4t2ssbWOvd+iU8mYw89W+PRYCAO0Dhpj3ntV?=
 =?us-ascii?Q?VVMBD+QpQl52fuVJ/XZBte2GY5+4bRcxPKiW6VJXmmeg2tJxzuyWk1LgKyme?=
 =?us-ascii?Q?jrcjuclMts9zxiwVECjm69koy16PGLXLpGuIVxl/8raDPfQnUmbKlEb/XhiT?=
 =?us-ascii?Q?rIBJ0al0B9XACl1H0ZQTn+nubMYpm2eyAYeDjkiwBBCiH3/42EGmYy7lLtpV?=
 =?us-ascii?Q?8lJVbD4W8TuXi7TRuv1UV+4m/FbzC1ZWJsUR6woh6FX64MaFli95Lu3Jd1+Z?=
 =?us-ascii?Q?xxXSohFQV+CyZtgy9gbG2Ud4DbcxtQas2lqqhnbef7dov36fAhNxmOvRQxjW?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e27bad-2cea-494b-2df0-08dcb0ae81f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 15:44:33.7051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1ALg+msutXPA3CvMDn6b/c51gdksm9S4dGgGkMAAPzhnkOwYEtHcAqjOZZr7iRcFnLCe/20rcmvIZiS+9LHZU4EYXJsdrhYWtSepIpV5z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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

On Tue, Jul 30, 2024 at 02:16:00AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] lib: Add u32 variants of igt_assert_{lt,lte}
> URL   : https://patchwork.freedesktop.org/series/136636/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11488_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11488_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11488_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11488_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1426

> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][3] +21 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

The PCI device became unusable/unavailable after
igt@xe_module_load@unload was run.  Everything after that skipped
because the driver couldn't re-probe.

Unrelated to this IGT series.

> 
>   * igt@kms_invalid_mode@uint-max-clock:
>     - shard-lnl:          [PASS][4] -> [SKIP][5] +63 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_invalid_mode@uint-max-clock.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_invalid_mode@uint-max-clock.html

Similar to the above, the PCI device became unavailable/unusable after
igt@xe_module_load@reload-no-display.  None of the later tests can run
since the device is missing.

Unrelated to this IGT series.

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

"NMI backtrace for cpu 2 skipped: idling at intel_idle_s2idle+0x79/0xe0"

Comes from the intel_idle driver, not the graphics driver.  Appears to
be a general s0ix issue, not caused by Xe or by this IGT change.

> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2420

> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] +1 other test dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@s4-basic.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_pm@s4-basic.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2019

> 
>   
> #### Warnings ####

Spot checking these warnings, they seem to be more skips caused by the
xe_module_load behavior noted above (PCI device becomes unavailable).


Matt

> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-lnl:          [ABORT][12] -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@core_hotunplug@hotunbind-rebind.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][14] ([Intel XE#1659]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-lnl:          [SKIP][16] ([Intel XE#1407]) -> [SKIP][17] +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          [SKIP][18] ([Intel XE#1124]) -> [SKIP][19] +7 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-lnl:          [SKIP][20] ([Intel XE#1512]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [SKIP][22] ([Intel XE#1399]) -> [SKIP][23] +11 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-lnl:          [SKIP][24] ([Intel XE#306]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-lnl:          [SKIP][26] ([Intel XE#373]) -> [SKIP][27] +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          [SKIP][28] ([Intel XE#307]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-lnl:          [SKIP][30] ([Intel XE#1424]) -> [SKIP][31] +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-lnl:          [SKIP][32] ([Intel XE#1413]) -> [SKIP][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [SKIP][34] ([Intel XE#1201] / [i915#2575]) -> [INCOMPLETE][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-lnl:          [SKIP][36] ([Intel XE#309]) -> [SKIP][37] +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          [SKIP][38] ([Intel XE#702]) -> [SKIP][39]
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_feature_discovery@display-2x.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          [SKIP][40] ([Intel XE#703]) -> [SKIP][41]
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-lnl:          [SKIP][42] ([Intel XE#1421]) -> [SKIP][43] +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          [SKIP][44] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][45] +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          [SKIP][46] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][47]
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-lnl:          [SKIP][48] ([Intel XE#656]) -> [SKIP][49] +21 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          [SKIP][50] ([Intel XE#1469]) -> [SKIP][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          [SKIP][52] ([Intel XE#651]) -> [SKIP][53] +10 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-lnl:          [SKIP][54] ([Intel XE#599]) -> [SKIP][55] +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
>     - shard-lnl:          [SKIP][56] ([Intel XE#498]) -> [SKIP][57]
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5:
>     - shard-lnl:          [SKIP][58] ([Intel XE#2318]) -> [SKIP][59] +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [FAIL][60] ([Intel XE#2029]) -> [SKIP][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          [SKIP][62] ([Intel XE#1406]) -> [SKIP][63] +4 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_psr@pr-no-drrs.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          [SKIP][64] ([Intel XE#1437]) -> [SKIP][65] +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-lnl:          [SKIP][66] ([Intel XE#1499] / [Intel XE#599]) -> [SKIP][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-lnl:          [SKIP][68] ([Intel XE#756]) -> [SKIP][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_writeback@writeback-check-output.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_writeback@writeback-check-output.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p}:
>     - shard-lnl:          [SKIP][70] ([Intel XE#2191]) -> [SKIP][71]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * {igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p}:
>     - shard-lnl:          [SKIP][72] ([Intel XE#1512]) -> [SKIP][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * {igt@kms_vrr@cmrr}:
>     - shard-lnl:          [PASS][74] -> [SKIP][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_vrr@cmrr.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_vrr@cmrr.html
> 
>   * {igt@xe_oa@invalid-remove-userspace-config}:
>     - shard-lnl:          NOTRUN -> [SKIP][76] +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@xe_oa@invalid-remove-userspace-config.html
> 
>   * {igt@xe_oa@non-zero-reason}:
>     - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201]) -> [SKIP][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_oa@non-zero-reason.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_oa@non-zero-reason.html
> 
>   * {igt@xe_oa@oa-unit-concurrent-oa-buffer-read}:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11488_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][80] -> [FAIL][81] ([Intel XE#1426]) +2 other tests fail
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#1426]) +3 other tests fail
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1407]) +3 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#316])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#1201]) +23 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1124]) +6 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#610])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1124])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#367])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#367])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1399]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#787]) +6 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455] / [Intel XE#787])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +22 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#787]) +97 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_chamelium_color@degamma.html
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#306]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#373]) +5 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1413]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1424])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#323])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#309])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [i915#3804])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#776])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1421]) +2 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][112] -> [FAIL][113] ([Intel XE#886]) +2 other tests fail
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][114] ([Intel XE#1551]) +1 other test dmesg-warn
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1397] / [Intel XE#1745])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-lnl:          [PASS][116] -> [SKIP][117] ([Intel XE#2351])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1397]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1401]) +2 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#651]) +8 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#656]) +16 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#651])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#653]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2351])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#2028])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#417])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1470])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1201] / [i915#2575]) +10 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [PASS][133] -> [DMESG-WARN][134] ([Intel XE#1162])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#2019])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane@plane-position-hole-dpms:
>     - shard-lnl:          [PASS][137] -> [DMESG-WARN][138] ([Intel XE#324])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#599]) +3 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#498]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2318] / [Intel XE#455])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2318]) +2 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#455]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#2318]) +14 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1439])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#1489])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1122] / [Intel XE#1201])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
>     - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1128])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1201]) +23 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1406]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr2-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#929]) +2 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_psr@psr2-no-drrs.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][156] ([Intel XE#294])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>   * igt@kms_rmfb@close-fd@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][157] ([Intel XE#294]) +1 other test fail
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][158] ([Intel XE#2019]) +3 other tests dmesg-warn
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang:
>     - shard-dg2-set2:     [PASS][159] -> [SKIP][160] ([Intel XE#1201] / [i915#2575]) +45 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_vblank@wait-forked-busy-hang.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_vblank@wait-forked-busy-hang.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1201] / [Intel XE#756])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#756])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1123])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1126] / [Intel XE#1201])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][165] ([Intel XE#1473] / [Intel XE#392])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#688]) +4 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1130]) +12 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#1600])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][169] -> [TIMEOUT][170] ([Intel XE#1473] / [Intel XE#402])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1130] / [Intel XE#1201]) +24 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][172] -> [SKIP][173] ([Intel XE#1130] / [Intel XE#1201]) +81 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#1392]) +5 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@no-exec-null-defer-bind:
>     - shard-lnl:          [PASS][175] -> [SKIP][176] ([Intel XE#1130]) +95 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_exec_basic@no-exec-null-defer-bind.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@xe_exec_basic@no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#288]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1201] / [Intel XE#255])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1201] / [Intel XE#378])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#1201] / [Intel XE#1337])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1201] / [Intel XE#979])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
>     - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#979])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][184] ([Intel XE#1173])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-lnl:          [PASS][185] -> [FAIL][186] ([Intel XE#1924] / [Intel XE#2028])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@s2idle-basic-exec.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][187] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
>     - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#584])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>     - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#944]) +2 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][191] ([Intel XE#1659]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [DMESG-WARN][193] -> [PASS][194]
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [SKIP][195] ([Intel XE#2351]) -> [PASS][196] +1 other test pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [i915#2575]) -> [PASS][198] +43 other tests pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible:
>     - shard-lnl:          [SKIP][199] ([Intel XE#2366]) -> [PASS][200] +2 other tests pass
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201]) -> [PASS][202] +24 other tests pass
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          [SKIP][203] -> [PASS][204] +65 other tests pass
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][205] ([Intel XE#2028]) -> [PASS][206] +1 other test pass
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
> 
>   * {igt@kms_plane@plane-position-hole@pipe-a-plane-2}:
>     - shard-lnl:          [DMESG-FAIL][207] ([Intel XE#324]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
> 
>   * {igt@kms_plane@plane-position-hole@pipe-b-plane-4}:
>     - shard-lnl:          [DMESG-WARN][209] ([Intel XE#324]) -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][211] ([Intel XE#361]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-lnl:          [INCOMPLETE][213] -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][215] ([Intel XE#771] / [Intel XE#899]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][217] ([Intel XE#899]) -> [PASS][218] +1 other test pass
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][219] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][220] +1 other test pass
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][222] +64 other tests pass
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_threads@threads-userptr-rebind-err:
>     - shard-lnl:          [SKIP][223] ([Intel XE#1130]) -> [PASS][224] +79 other tests pass
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@xe_exec_threads@threads-userptr-rebind-err.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [FAIL][225] ([Intel XE#2262]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [INCOMPLETE][227] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-lnl:          [FAIL][231] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm@s2idle-basic.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][233] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][235] ([Intel XE#2019]) -> [PASS][236] +1 other test pass
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#2019] / [Intel XE#2280]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-dg2-set2:     [ABORT][239] -> [SKIP][240] ([Intel XE#1201])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#623]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#623])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][244] ([Intel XE#316])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#316]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#316]) -> [SKIP][248] ([Intel XE#1201])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-lnl:          [SKIP][251] -> [SKIP][252] ([Intel XE#1407]) +2 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][254] ([Intel XE#1201]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201]) -> [SKIP][256] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#619])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html
>     - shard-lnl:          [SKIP][259] -> [SKIP][260] ([Intel XE#1467])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1124]) -> [SKIP][262] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][264] ([Intel XE#1124]) +1 other test skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201]) -> [SKIP][266] ([Intel XE#1124])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>     - shard-lnl:          [SKIP][267] -> [SKIP][268] ([Intel XE#1124]) +3 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-lnl:          [SKIP][269] -> [SKIP][270] ([Intel XE#1428])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][272] ([Intel XE#1201]) +6 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#346])
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_joiner@basic.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_big_joiner@basic.html
>     - shard-lnl:          [SKIP][275] -> [SKIP][276] ([Intel XE#346])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_joiner@basic.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#367]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [i915#2575]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#367])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>     - shard-lnl:          [SKIP][281] -> [SKIP][282] ([Intel XE#367])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][284] ([Intel XE#367])
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][286] ([Intel XE#1201] / [i915#2575])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201]) -> [SKIP][288] ([Intel XE#455] / [Intel XE#787])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          [SKIP][289] -> [SKIP][290] ([Intel XE#1399]) +11 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][294] ([Intel XE#1201]) +1 other test skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][296] ([Intel XE#1201]) +6 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][298] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][300] ([Intel XE#787]) +20 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#787]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#1252]) -> [SKIP][306] ([Intel XE#1201])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#306]) -> [SKIP][308] ([Intel XE#1201] / [i915#2575])
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][310] ([Intel XE#306]) +1 other test skip
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_color@gamma.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][311] ([Intel XE#373]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][314] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          [SKIP][315] -> [SKIP][316] ([Intel XE#373]) +5 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [i915#2575]) -> [SKIP][318] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][320] ([Intel XE#373])
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [i915#2575]) -> [SKIP][322] ([Intel XE#373])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-single.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#373]) -> [SKIP][324] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
>     - shard-lnl:          [SKIP][325] ([Intel XE#373]) -> [SKIP][326] ([Intel XE#2366])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201] / [i915#2575]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#307])
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-lnl:          [SKIP][329] -> [SKIP][330] ([Intel XE#307])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][332] ([Intel XE#1201] / [i915#2575])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#455]) -> [SKIP][334] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_content_protection@lic-type-1.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_content_protection@lic-type-1.html
>     - shard-lnl:          [SKIP][335] ([Intel XE#599]) -> [SKIP][336] ([Intel XE#2366])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_content_protection@lic-type-1.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [i915#2575]) -> [SKIP][338] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>     - shard-lnl:          [SKIP][339] -> [SKIP][340] ([Intel XE#1413]) +1 other test skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>     - shard-lnl:          [SKIP][341] -> [SKIP][342] ([Intel XE#1424]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][344] ([Intel XE#1201] / [i915#2575])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#308]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-lnl:          [SKIP][347] -> [SKIP][348] ([Intel XE#309]) +3 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-lnl:          [SKIP][349] -> [SKIP][350] ([Intel XE#323])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-lnl:          [SKIP][351] ([Intel XE#309]) -> [SKIP][352] ([Intel XE#2366])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][354] ([Intel XE#455]) +3 other tests skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][357] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][358] ([Intel XE#1201]) +3 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][360] ([Intel XE#1201])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#701]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#701])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][364] ([Intel XE#1201] / [i915#2575])
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [i915#2575]) -> [SKIP][366] ([Intel XE#1138])
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>     - shard-lnl:          [SKIP][367] -> [SKIP][368] ([Intel XE#1138])
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [i915#2575]) -> [SKIP][370] ([Intel XE#1135] / [Intel XE#1201])
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [SKIP][371] -> [SKIP][372] ([Intel XE#1421]) +1 other test skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-lnl:          [SKIP][373] -> [SKIP][374] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-lnl:          [SKIP][375] -> [SKIP][376] ([Intel XE#1401] / [Intel XE#1745])
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#455]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201]) -> [SKIP][380] ([Intel XE#651]) +2 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#651]) -> [SKIP][382] ([Intel XE#1201]) +2 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          [SKIP][383] -> [SKIP][384] ([Intel XE#651]) +8 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][386] ([Intel XE#1201]) +14 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-lnl:          [SKIP][387] -> [SKIP][388] ([Intel XE#656]) +17 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][390] ([Intel XE#1201])
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          [SKIP][391] ([Intel XE#651]) -> [SKIP][392] ([Intel XE#2351])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201]) -> [SKIP][394] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
>     - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][396] ([Intel XE#651]) +6 other tests skip
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>     - shard-dg2-set2:     [SKIP][397] ([Intel XE#651]) -> [SKIP][398] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201]) -> [SKIP][400] ([Intel XE#653])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][402] ([Intel XE#1201]) +12 other tests skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][403] ([Intel XE#1201]) -> [SKIP][404] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][405] ([Intel XE#658]) -> [SKIP][406] ([Intel XE#1201] / [Intel XE#658])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#653]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#653]) -> [SKIP][410] ([Intel XE#1201]) +2 other tests skip
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][412] ([Intel XE#653]) +8 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          [SKIP][413] -> [SKIP][414] ([Intel XE#605])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [i915#2575]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#605])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-lnl:          [SKIP][417] ([Intel XE#2340]) -> [SKIP][418] ([Intel XE#2366])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_getfb@getfb2-accept-ccs.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201] / [i915#2575]) -> [SKIP][420] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][422] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          [SKIP][423] -> [SKIP][424] ([Intel XE#599]) +2 other tests skip
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-lnl:          [SKIP][425] -> [SKIP][426] ([Intel XE#2318])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#2318]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#870]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#870])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201]) -> [SKIP][434] ([Intel XE#1122] / [Intel XE#1201])
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-lnl:          [SKIP][435] -> [SKIP][436] ([Intel XE#736])
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][438] ([Intel XE#1129])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][440] ([Intel XE#1201])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][444] ([Intel XE#1201]) +1 other test skip
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#1489]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][448] ([Intel XE#1489]) +2 other tests skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html
>     - shard-lnl:          [SKIP][451] -> [SKIP][452] ([Intel XE#1406]) +2 other tests skip
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][454] ([Intel XE#1201]) +6 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#929]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-lnl:          [SKIP][457] ([Intel XE#2351]) -> [SKIP][458] ([Intel XE#1406])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@pr-basic.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#929]) +1 other test skip
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@psr-cursor-render.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#1201]) -> [SKIP][462] ([Intel XE#1149] / [Intel XE#1201])
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rmfb@close-fd:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [i915#2575]) -> [FAIL][464] ([Intel XE#294])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@kms_rmfb@close-fd.html
>     - shard-lnl:          [SKIP][465] -> [FAIL][466] ([Intel XE#294])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_rmfb@close-fd.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][467] ([Intel XE#1201] / [i915#2575]) -> [SKIP][468] ([Intel XE#327])
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
>     - shard-lnl:          [SKIP][469] -> [SKIP][470] ([Intel XE#1437])
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][472] ([Intel XE#327])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [i915#2575]) -> [SKIP][474] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][475] ([Intel XE#327]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          [SKIP][477] -> [SKIP][478] ([Intel XE#1127]) +1 other test skip
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][480] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][482] ([Intel XE#1201] / [i915#2575])
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-lnl:          [SKIP][483] -> [SKIP][484] ([Intel XE#756])
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#756]) -> [SKIP][486] ([Intel XE#1201] / [Intel XE#756])
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][488] ([Intel XE#1091])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][490] ([Intel XE#1050])
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
>     - shard-lnl:          [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#1447])
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][493] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][496] ([Intel XE#1130] / [Intel XE#1201])
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][497] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][498] ([Intel XE#1123])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][499] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][500] ([Intel XE#1130] / [Intel XE#1201])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
>     - shard-lnl:          [SKIP][501] ([Intel XE#688]) -> [SKIP][502] ([Intel XE#1130]) +6 other tests skip
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][503] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [SKIP][504] ([Intel XE#1130] / [Intel XE#1201])
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-lnl:          [SKIP][505] ([Intel XE#1130]) -> [SKIP][506] ([Intel XE#688]) +2 other tests skip
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-vm.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-4/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-lnl:          [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#1392]) +3 other tests skip
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-lnl:          [SKIP][509] ([Intel XE#1392]) -> [SKIP][510] ([Intel XE#1130]) +2 other tests skip
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][512] ([Intel XE#1130] / [Intel XE#1201]) +10 other tests skip
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-dg2-set2:     [SKIP][513] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][514] ([Intel XE#288])
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][517] ([Intel XE#288]) -> [SKIP][518] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][519] ([Intel XE#288]) -> [SKIP][520] ([Intel XE#1130] / [Intel XE#1201])
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][522] ([Intel XE#288]) +7 other tests skip
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][523] ([Intel XE#2105]) -> [INCOMPLETE][524] ([Intel XE#1195] / [Intel XE#2105])
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][525] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][526] ([Intel XE#512])
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_mmap@small-bar.html
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [DMESG-FAIL][527] -> [FAIL][528] ([Intel XE#2136])
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@many-reload.html
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [DMESG-FAIL][529] ([Intel XE#2019]) -> [FAIL][530] ([Intel XE#2136])
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_module_load@reload.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-lnl:          [SKIP][531] ([Intel XE#977]) -> [SKIP][532] ([Intel XE#1130])
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_pat@pat-index-xelp.html
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [SKIP][533] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][534] ([Intel XE#1173])
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-436/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          [SKIP][535] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][536] ([Intel XE#1130]) +2 other tests skip
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_pm@d3cold-basic.html
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-2/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][538] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
>     - shard-lnl:          [SKIP][539] ([Intel XE#1130]) -> [SKIP][540] ([Intel XE#2284] / [Intel XE#366])
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][541] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][542] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-lnl:          [SKIP][543] ([Intel XE#1130]) -> [SKIP][544] ([Intel XE#584])
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@s3-basic.html
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-1/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][545] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][546] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][547] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][548] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          [SKIP][549] ([Intel XE#1130]) -> [SKIP][550] ([Intel XE#944]) +1 other test skip
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][551] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][552] ([Intel XE#1130] / [Intel XE#1201])
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     [SKIP][553] ([Intel XE#944]) -> [SKIP][554] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
>    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-lnl:          [SKIP][555] ([Intel XE#944]) -> [SKIP][556] ([Intel XE#1130]) +2 other tests skip
>    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][557] ([Intel XE#1760]) -> [SKIP][558] ([Intel XE#1130] / [Intel XE#1201])
>    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-lnl:          [DMESG-FAIL][559] ([Intel XE#1760]) -> [SKIP][560] ([Intel XE#1130])
>    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7942 -> IGTPW_11488
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1686-b6f9528c7fffc2f65c8e4969d35d9346fd503c9b
> 
>   IGTPW_11488: 11488
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
>   xe-1686-b6f9528c7fffc2f65c8e4969d35d9346fd503c9b: b6f9528c7fffc2f65c8e4969d35d9346fd503c9b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11488/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
