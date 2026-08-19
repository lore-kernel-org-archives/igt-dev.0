Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC18C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F84710E184;
	Wed, 19 Aug 2026 20:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx+g7MA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B5E10E184
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787172211; x=1818708211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Zri/r5ERBY27Sfbhx732j0eccRY5SImP/VezxuTu70=;
 b=fx+g7MA19Y2jO9xyhu9B2Ph8NS6xaFkP0Ntxm6ov5+vTnbrxnloYtonF
 SI5P311ASfdOAQvPL4GJ9ffGS/eFQvx6R/uAbyMIO5DPG7ZN+6vTs+OYy
 5QoOoFlIaUtK/A22ELu0npaNICgRoyLZUAxh19yT0BxsovJJ7xoYh/2+j
 ysoK2IG9CFZ9MpE4cQgn69GKQQfr+/PEu/XoC97nGwoHrYRYXcljTY+yj
 VBRro/0MiRLTSo8i+nY1rbAkCn3xkaFQtoXu8s+Udqz6aKvQ5YE6t3rxx
 R4DOrAwtMgEP6asKbllF8c0uR+1JUUxWt65azVjGL+/D8WtQ4AwkJkbJT g==;
X-CSE-ConnectionGUID: xjKOBCZHStmVvk7/6FyTQA==
X-CSE-MsgGUID: WGKvJ2P0RxGoTYZNU08kvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87570776"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87570776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:43:31 -0700
X-CSE-ConnectionGUID: tNsgIT/jQWq13juQT3AX4Q==
X-CSE-MsgGUID: aCm8cQ+2QPCWcFfzQK/7gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="263021932"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:43:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:43:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 13:43:30 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:43:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUV3kFV6GuuWZzQoYANRwjgI+6xoXcAi+DovOy3NQeRqBBDUCVfQxL4jLhIkDO9Cz40TmnZvZXzfTn/Pu9mHXuZAAAP95JJiCrRQta2Q8Sq33RqK8DE5sFOJJDs+Dt61Fn3bUYqZuRJrnFek9azeJkyXI1H/0QuShLbcR/G+uKPo3fdDE/79qpK7Zit3KFVS9Hr+rVwi5DOZF1It+3Fd1RzUYEBHdXYE1NSFTVtRHJgc5MCMGRh6BmID0Tzn9mmLOSDNeL51gS1Ap5vbM3ilJZuEifdmDy8CrA2p7XI3NHeMb4DSmQZNBc50LUULFpop2obSBaGlsf6F0SCwzI+4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNitpGoCgghVqsE1eE4rt8LLiWrNqaxjE/F4/DKHAio=;
 b=n5w8/w+b3YKcXWxhKw4oVmY1G77g9vLJxx1UfOwMtLY8zEpQsUhe1fF6N938MLCcNGO1Cee+upFpUlBs8VKK+OfhyN6V/a949plNR76E8HAMJlIeg5tGO+5GhG/BhCq1My399osqH2YypDwM+iUUPO7xbt4Bwuzhs+6lR8Z0QDrvx+shm+Hdrk+H0kgp8YGYnYX67hxWjWiW4NpE94U+B+rY7+rofBIY9zXe4O7qeJ486oa/J9NOR/QkQul3OtZQR7qWaGNTReUsCgTN104OOSJp0TO4gczGKsKCjasR/DNk8vhfXsBIlDViWrsCwfVCnLvbzFgISdrZxd8nO23kaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:43:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 20:43:27 +0000
Date: Wed, 19 Aug 2026 13:43:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
Message-ID: <20260819204325.GP8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
 <20260729223532.GH7790@mdroper-desk1.amr.corp.intel.com>
 <87pkzfb80x.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87pkzfb80x.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab912da-d2bc-4842-9d8e-08defe328595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|56012099006|4143699003|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uSNvgxgvzz0W8Qa5AiZ2GcLnRC/LBRrVCEK6JyLmHt2vK0F7WXNbRCHQbNqHa9s/icCr+PqziI4cUnl4wtJ4Kj+S/ZPTS7zwXqL4j0O+uPWG5THwCBVEBRNTsO/dg44Oe0c0Yfui9z4rZrEo/sjcXjfLSL/D4rns708GCDDPvuAuUzyf+IH/Riq/I4hFc8izXX0TDL7nYvGZknSlY8QAFFprqykH04JM6y56YE6Pk/OZ2LLq9ivPIzcxVfLmGtKBH+YzdA9c95yPhosqW10ncffX6qKXK6j8GbXnOpwSGSTH6uqvDNGSUh2E8P/d0cQZcSbuNTViO7I86gPagY0syN+O4uxy/kFz8iNy2im40gKF+oU25qO7V89zgyrSADJwxCmVNf2IQnU/WdNRbNy+CGY8ssz0AoLYUOeWVUt5L0n00FrIzy/gPBtep125TVvrQRD9tqu4pZsWgxCUeUNwaYcNSgHqzQ2lU9UDTmsX4zXYrBAfkEbskvPEq6WRVYCqT8OCSgi1ishVtwSkE2eilh4SXTTGc7/K2dKgfb0MDOOAW4khN5K61u15e+9qB+oqJZ/eYfCGeKzd2Jv8qipNwrsOVEazyPEMHwetVTOOsT5vG2JqoK+iAYdKOUAOHgRm6vjdwEsjviEcntYqatDmh6BAkaRisqlGSK+OZIuChJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(4143699003)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8PwGb6tkVILcz4IUvV5lPq2b2CPJN1oOEsdrtQgpU+JASs9oaZN13khLw9B?=
 =?us-ascii?Q?olNFOS2Il5FQ63Z+VQj9olOC3GEHhkSag0VTWQ5wa9ASeo/nOZPFv4pHuI7j?=
 =?us-ascii?Q?yDGTZPkP6mueNNCPvzQZELpodWyYmD8gOqDGyivi93DV9fnae+NuFi86Mnfd?=
 =?us-ascii?Q?9xS6RWVF82x0Od+VvmR5PDFSiIhY/fi2WtSQn0sgVTmrQKfRcvYhjd6lfana?=
 =?us-ascii?Q?q/qTrjMtFIsWzmDTGUvcM9/xNon97ziQ6sMYob5HjbgkxEY/8HdwF/LyZ0c7?=
 =?us-ascii?Q?vBBrvX84N+GJoW2gFQylSmBzrE+hoiH+dhCybdhldpxRnexk1dPpN3D7QeD2?=
 =?us-ascii?Q?RKNXP+aHFnhFbkvlniIVS/mNMul9nlU0/febNKAlSKpfthEFtnurLFOATO4/?=
 =?us-ascii?Q?N3BmLbiwpLEypcJDc9cfrTNkGax0pNCIsmdJlMYIZFo/E1mwHi/CRTsmBfGB?=
 =?us-ascii?Q?L2MaDetUofz8xmGa32NDhn9NtYvH4la+geLulC9MzKvHuYnmuEPAQ5/Qqk6V?=
 =?us-ascii?Q?3HzBKh/UWZ2GSKS5iQksJ4ZuOrLcmk0/LFs3ySrn4fXJo8D3dvgqa3iXSmJ7?=
 =?us-ascii?Q?RJpbsKYY+dm05PasF4XHcbER1bDxoO+zf2K0nSJmgruMx3GErXa4CbEqPRHP?=
 =?us-ascii?Q?FBSgYLX6jYywe0Q1dJDEcav8lvLLbuwEqtSSWm6E+Li6j60iQOeSmGYWUO+C?=
 =?us-ascii?Q?ylQTb28GePQinlQ77AgqtsKtyhx6yB0A2dCkFGOb+jLpZarWJE9Kjn114vQP?=
 =?us-ascii?Q?qkG2W4TtKW6ZJ5vauWwD7uuDsZWblrONAE6XiJr6bcAKQI51+ZNPIgsSxGG0?=
 =?us-ascii?Q?BjnL4CXd0RtZ+EbFGygxtdEGGyUvp/YLR6i2CEH38PV013YLhrIocCfLGyWw?=
 =?us-ascii?Q?HQC3H9mTGkSStbzf9lCwSyHTpd17VQOmZOwN0ESKLEbW0KT0uD5CtW9dXOlb?=
 =?us-ascii?Q?fdl2fXAPQnfg6+BmyCtAZvORjMJudFBv81d+CLU4OH0Cdvn1JVPRtXfph+Gh?=
 =?us-ascii?Q?1+aatR/FenovyK3iNk5TkgPH2jl59wps3NspFv/PWW0yGgjo2vb9nqyxAqpB?=
 =?us-ascii?Q?tW2lsLEDOsixRsYDC6jA+arMR0NV2zXA3OCGcFkJ/Qkfz1acmCFhhR+EIaB9?=
 =?us-ascii?Q?RLbq1aUREuc0jm4lCFFK01+DDFJDpSDjs7hlgth8uqmXLOAC/p9xSuB+Q6k9?=
 =?us-ascii?Q?gCd5oYDI6G2US81vG7GDI3vUdxGy8eWz2/Css5wHPRKTxQeuVBNo0sabnJh8?=
 =?us-ascii?Q?OVKsoonjz+dUEGWSR0pWBbhthafTsqISasH4TqTxmTSPLZE2E0HHgxd+Yrx1?=
 =?us-ascii?Q?4qCdwKbBFzlxPQxcczMKaSf24rmoJTxYlw9bg0NdAGLyFFvGjUMfC9c3NFlY?=
 =?us-ascii?Q?zu+lBvy5Epnj9uWNMp/PE3jwgIRD57iLQP7zjUw/Gnr8Yml72ofXW6tzKERB?=
 =?us-ascii?Q?x9mCgG/ji+tYVWA/Rn56bweZAWrFbvztjrjo40+lT1UCByW1JTh9Fbh88PRe?=
 =?us-ascii?Q?+2WlVgiTtKzTMTrUIMjrcPaFDjjPDCBugwTUN36RIkuhbAK2EguOakzDVFLc?=
 =?us-ascii?Q?gaL/xI1T32efyNVZr+3a0W5VOnVmqYx91VxXR8POY4FUItU0TUJwBWI4CELJ?=
 =?us-ascii?Q?gDRSIIuZkykrRu8WtFcuiydAj/W/3bdXzbH3joTRc7FX8LtQJcTpIAUhpcWQ?=
 =?us-ascii?Q?6PA43eCWDC8STYfl44YpKDcYVBWHsJuUvRFjoycN5GqOZIGo5qwHUXE6a31x?=
 =?us-ascii?Q?G2tGgNn8jf1Vse6JX9lmOcURnNpPMrM=3D?=
X-Exchange-RoutingPolicyChecked: VctoY7wckvVT2Txt/ZYjGLPDKz+ogquQ5SAhZDUtr0n5FBycvTOLYGTHEfPXsGQINiWIuIbdFnER6F/itHD+cDrpciVLktFLtj3yhBhlyG92L7r/E+hwZ9YR0Trgi3No8nHHp3W2lR+n0H+Pbw8BaX6um8JMjH45AUlW65qBPpvc6I67MyO9L8e3u0wOkniewg1Gl4tBfCj6rWl+HztkszJFH+auaS3+TV1tL/uNedgbghCQRxBC6LPpyYmPZoLVjuWUraVAS9pa9rmM7Zhinbon+ZTuJoOnptYS8an2YfmjNIhbyhQXmAm1lPlHOYNFEo81igDQ3R+YFaLoo/tkig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab912da-d2bc-4842-9d8e-08defe328595
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:43:27.8022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttG6wRfSPVkqeb7TxnPFLXMSqOVhnQus6fUaTJNGDlAZp7cmfz9YWYyY/SBCMbQOpVMCliJfxCiI7Bh8Q4bg1fFe8bHckbkoW9FUZgEZnGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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

On Tue, Aug 18, 2026 at 03:25:34PM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Tue, Jul 21, 2026 at 04:00:01PM -0300, Gustavo Sousa wrote:
> >> Currently xe_device_get() manages the PAT cached information
> >> information by itself, by doing the necessary memory
> >> allocation/deallocation and calling xe_get_pat_sw_config() to
> >> initialize the cached information.
> >> 
> >> Such management is arguably better suited to be implemented as part of
> >> the intel_pat module and encapsulated such that xe_query doesn't need
> >> to know the details.
> >> 
> >> We will introduce changes that will require an extra logic for
> >> initializing the cache and having such encapsulation makes it much
> >> easier to implement.  Since we will touch this area, take this
> >> opportunity to move the existing management to intel_pat.
> >> 
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
> >>  lib/intel_pat.h   |  5 +++++
> >>  lib/xe/xe_query.c |  9 ++-------
> >>  lib/xe/xe_query.h |  4 +---
> >>  4 files changed, 34 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> >> index 2f35bb77249f..14935e3c4692 100644
> >> --- a/lib/intel_pat.c
> >> +++ b/lib/intel_pat.c
> >> @@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
> >>  	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
> >>  }
> >>  
> >> +void intel_pat_build_xe_cache(struct xe_device *xe_dev)
> >> +{
> >> +	struct intel_pat_cache *pat_cache;
> >> +
> >> +	pat_cache = calloc(1, sizeof(*pat_cache));
> >> +	igt_assert(pat_cache);
> >> +
> >> +	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
> >> +		free(pat_cache);
> >> +		return;
> >> +	}
> >> +
> >> +	xe_dev->pat_cache = pat_cache;
> >> +}
> >> +
> >> +void intel_pat_free_xe_cache(struct xe_device *xe_dev)
> >> +{
> >> +	if (!xe_dev->pat_cache)
> >> +		return;
> >> +
> >> +	free(xe_dev->pat_cache);
> >> +
> >> +	xe_dev->pat_cache = NULL;
> >> +}
> >> +
> >>  /*
> >>   * Hardcoded PAT indices for Xe platforms, used as a fallback when the
> >>   * kernel doesn't expose gt0/pat_sw_config in debugfs.
> >> @@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
> >>  		struct xe_device *xe_dev = xe_device_get(fd);
> >>  
> >>  		if (xe_dev->pat_cache) {
> >> -			*pat = *xe_dev->pat_cache;
> >> +			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
> >>  		} else if (xe_pat_fallback(fd, pat)) {
> >>  			igt_info("PAT sw_config debugfs not available, "
> >>  				 "using hardcoded fallback\n");
> >> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> >> index a31b60e86e2a..fc9ef9b650bf 100644
> >> --- a/lib/intel_pat.h
> >> +++ b/lib/intel_pat.h
> >> @@ -13,6 +13,8 @@
> >>  #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
> >>  #define XE_PAT_MAX_ENTRIES 32
> >>  
> >> +struct xe_device;
> >> +
> >>  struct xe_pat_entry {
> >>  	uint32_t pat;
> >>  	bool rsvd;
> >> @@ -40,4 +42,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd);
> >>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
> >>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
> >>  
> >> +void intel_pat_build_xe_cache(struct xe_device *xe_dev);
> >> +void intel_pat_free_xe_cache(struct xe_device *xe_dev);
> >> +
> >>  #endif /* INTEL_PAT_H */
> >> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> >> index ea095b207534..aa81db45a41a 100644
> >> --- a/lib/xe/xe_query.c
> >> +++ b/lib/xe/xe_query.c
> >> @@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
> >>  	free(xe_dev->mem_regions);
> >>  	free(xe_dev->vram_size);
> >>  	free(xe_dev->eu_stall);
> >> -	free(xe_dev->pat_cache);
> >>  
> >> +	intel_pat_free_xe_cache(xe_dev);
> >>  	xe_wa_free_cache(xe_dev);
> >>  
> >>  	free(xe_dev);
> >> @@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
> >>  	 * should be extended to cache PAT entries by platform version/
> >>  	 * revision instead.
> >>  	 */
> >> -	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
> >> -	igt_assert(xe_dev->pat_cache);
> >> -	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
> >> -		free(xe_dev->pat_cache);
> >> -		xe_dev->pat_cache = NULL;
> >> -	}
> >> +	intel_pat_build_xe_cache(xe_dev);
> >>  
> >>  	/* We may get here from multiple threads, use first cached xe_dev */
> >>  	pthread_mutex_lock(&cache.cache_mutex);
> >> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> >> index f70476945dee..82f72314f072 100644
> >> --- a/lib/xe/xe_query.h
> >> +++ b/lib/xe/xe_query.h
> >> @@ -20,8 +20,6 @@
> >>  #define XE_DEFAULT_ALIGNMENT           SZ_4K
> >>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
> >>  
> >> -struct intel_pat_cache;
> >> -
> >>  struct xe_device {
> >>  	/** @fd: xe fd */
> >>  	int fd;
> >> @@ -78,7 +76,7 @@ struct xe_device {
> >>  	uint16_t dev_id;
> >>  
> >>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
> >> -	struct intel_pat_cache *pat_cache;
> >> +	void *pat_cache;
> >
> > Is there a need to change this to a void pointer?  It seems like we can
> > just leave this as-is and avoid the cast earlier.
> 
> The rationale here is that intel_pat is the only unit supposed to know
> the details of the cached information, so I think it is best to make
> this a void pointer to make it explicit and also to keep other units
> from using it in the future without going through the proper functions
> provided by intel_pat.

But using a void pointer with casting doesn't really address that
properly.  If we want the internal details of 'struct intel_pat_cache'
to be something that only intel_pat code can access, then we make sure
that the structure definition is inside the .c file (or inside a
"private" header if the intel_pat unit spans multiple files). Everything
outside of that unit will just see "struct intel_pat_cache;" on the line
you removed here, which declares it as an opaque structure for them.
They can pass around pointers to that freely, but can't access its
internals since they don't have the definition.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >
> > Matt
> >
> >>  
> >>  	/** @wa_cache: cached data for xe_wa() and related functions. */
> >>  	void *wa_cache;
> >> 
> >> -- 
> >> 2.55.0
> >> 
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
