Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DCBC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 22:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCF910E0B5;
	Wed, 29 Jul 2026 22:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzR6uQHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B97010E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785364540; x=1816900540;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZJfZUHNOxgdEUdj6Kubz8juQ3UlrB8Xjl68z+1ec3wk=;
 b=lzR6uQHlF2PDptIaVSnGrKfCxLjvmnnFOoPOCy82oyKmC7UGGKZzjEZ0
 /hk1bAGhN/S3+3RkwPeVxmcAp7LY3C8E27Ok06pzjTeJSKfBzDnx2Mtsx
 w7qBJZolv8A2C4HykGaIJ12buuq5epZuFw/f3svDgkQSHHPzgJR+Vqwv6
 0hWg/OGSmMIGcRkLftERnC1dQ4vVGisP8vTtJ2UL94VpQL0UUQ0nKowEj
 lIL0BqVdN0yXYTBhbLBgiJ6H7TaeVWYMFOOfDPWXeaauPkUaUg0zjWHzQ
 UyRk7tJmfEJMKMIRLgvaJMFpnOOHYezqwMFkyoX3HCAQqtYRRr5ZfMDeC g==;
X-CSE-ConnectionGUID: dmqQDIGzSRiZY1ZMqCk0zw==
X-CSE-MsgGUID: 1bNCkxg9QkyFweOdutuMSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97495866"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97495866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:35:39 -0700
X-CSE-ConnectionGUID: wHNnn/PFTLeJMUByB+uwzw==
X-CSE-MsgGUID: S2n5nLWcSu+pU0jfrdvfmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="257458353"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:35:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:35:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:35:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbBO/Fr8tZ2E0lgGv/ra/sBQEKG2pB5EdIj5oEjCf02WDOvMooBoiHLHqa0RTg4p2SWAvZv7u4BDKT9tyM9eT/dUoIaL+YtaHTUtcoLA/kfOGz0WqDNGlsHJNp6debATsVrlHAVN5Xfa/NPuBbI18vHknqZp7dLEYao/8v2QQ/HltmE1+Xq5n1BikCZGF0Rfx5SSxZl8GVsQ9gnJY1jPsBYHPiqZKd6ZyvpvIHLN4FyKX4p0p02Jwc0HWX87uvGBzkdehUFcWWBtoZNb54TBKVZb0GCCiYRxueETCevBzUWGJd2iL3nXCCeAOioe0VRVeFXLu61pG2w8YFtnQmYh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4JT+Ewkc/SM1zUG4+f1mONJjW5+uXupvFR2q3pTtP8=;
 b=Cnn60g2S4nLtcjyIjN9EXfE+iL2jdvFy4j+S4TXzSr5G153zODnNf1erDo9fSr814KEE61+uybdwfXQj/Xsp29Q8+7D4UlUTjR8irsB+PkdeqAGF8VLDf9JQSdi8meND0A2bYy1CzCdBY0T3G+2xWkcmewK8+c0HNh/TEb2SOdJowoKcIbndugVzidh9Xe6u7z8335USCqH64T8zuwbe+CjeLJAqfW4egNjppQyF8BAWq1QFO3BJX3ryPAg59P+5hyYlzzMHvyFP5L5PySJU4uPGV4/xbeAnBwHk66v7tTniLkEaRVOEACL2cv6qtd9mSE1fLYEcKzwVCDXCQ0Vhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:35:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 22:35:34 +0000
Date: Wed, 29 Jul 2026 15:35:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
Message-ID: <20260729223532.GH7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: cc80e6d2-b85e-492c-bf58-08deedc1b431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: nEbAMvqAJOEArQMnyTDDyv26D4b6x4ar1XF9DXnb1kGQ3fkzd+c48XsnjO9+KqS6aHfRJrBCRL2luaTtn7Ryl/gdKmBkawYkJXSs30olx/7X0TmwxRXW39oVlZRaQ6knaOqsajTPJE+zU9OZqoC6VPJmnyimUwb6syjGQuSjKBbHikBhdjTI8xMOfAtxq8STots1BY/wPj7WDGNV/DOM5T5/uSf5Lfe8t/njTTw/y4qbMCv7xw7iIXfr1o+DsM+t0TqhVT6p0/iYBp28BvhfvX+eqfoM2eb0oGwjlT+PIdFSBdGcvmqyyArGu+0IO917tJ7Tn7uDnmz4gpPVUE+zl7REJ5+ntzUltl/lvrMcHPe26e6bjbnjZnhKI2ZlGKKpzMFEUYPPunW9YSMVTGYwCvv2sXOx2DdylZtkXE1PfUh4+dWG0+F5MF+7xbSRNPYBpu7BE1dlW4WVn3/lU2ghUNXrbYm8OwPdsMqjh2BMHD7DL/LpKnToEUHGAh9UZ2Ybrh6nXqeXE/in5V7hs7rPaMJQgBm32yPjUH802LPiBJ8GMFs3TajMAkGN/95P+9QMpP7q5IZK5d/O0yw7/m/2CrYBdBESyvRADzOSqDW2CyQv3PYLzzsHqsnYytsjHGy5abLiodCRaHyzQyn4Q4SMwLlAKPkmH9p6WXnfAHiw5Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cZLxlzw05OU0jYsZ6TBZKgCsUn/ZtpmaXt79Tp2P1DQIeFYd1F4YuNp/mmn?=
 =?us-ascii?Q?mX+KRpcA+8QO1xHmROH7R07vCxAIL1loVnYkbNBeOl6qUFlvneNacKpy8iC6?=
 =?us-ascii?Q?rfnMltCisKBrMQzQmiIx6ZXv7H7kL2WOqAQj1iJ6ZJvRJBx6Mqb/oNrTc1yd?=
 =?us-ascii?Q?pSfJMmI3VHg06UwJq3pnn3kzKrPqEdDGjWnTBVHJyHCZzHnYVMFsf9ZDieIL?=
 =?us-ascii?Q?dtsOXlxN7r02DFIJyCAXD4s8o/DvZAM0AeVWZKI2ByDAIEwGCBnPtvC8xGjJ?=
 =?us-ascii?Q?RLAfBbwcHof/tb03cP7AcUIztbkLU8G5zoISBnSENIkDvkmr0+MuZrNzMN/h?=
 =?us-ascii?Q?47OLQ/6qMz8FfPYGV5tIxQGZPqG3UEyGbnOnfNmBxWFlCn4u8Zxl4oZ9SIr3?=
 =?us-ascii?Q?EFYVTZMZl8rDLxyUhNU2MmiRg5EM9BC/hClEgLP1mqugDYz4pGmjAq06boYg?=
 =?us-ascii?Q?ypRvpMUMOdycQZrvzpyZdVKBsHoR63pgllbqw7pUSspsay7f+x8NNEQeQ6sj?=
 =?us-ascii?Q?MpU7tGL8U2+XqOxaT0C16fantjCOwLPO7ZLEypjmKkjhSCyjyTUBlOFS+YBj?=
 =?us-ascii?Q?s6rTRZ2XBW3TTBiCHX31U9j2K50F4F8zPFRNpMu2czxoqlZ9o8lVSwY/sBVx?=
 =?us-ascii?Q?mkUEDCFd1XvFgBwFl7+8uQtKO2knB7wjxvfjTycwkdY52rDW4C33Szepr54R?=
 =?us-ascii?Q?hwbqFqF/ahpw81H/K3l63swE1aXIvGArgnolXOpU1OuHvmcKneLtOpAdPPj5?=
 =?us-ascii?Q?HWns3tmFQqVq+OZl2x5mfzl+R6bAeNqW4CVzNUbobnfN/RETB0k4qZKGBK6z?=
 =?us-ascii?Q?10rJM7b4g3pHucmW1pZT4b2RtQl9D7INqq8Jkr4/l83w/uosnfuawfXtgSPp?=
 =?us-ascii?Q?jNusYsyJTz1v4Tf8NvSq0iBEJWXCsbm5Sk67UDYtrpNvHW36QFB1OsBpczFC?=
 =?us-ascii?Q?BRiNQjvrCeLLQXQ3Ne9Bx2hRPJCp8LgXfsAzRLYrs621Xi75j5zvGRubM3P9?=
 =?us-ascii?Q?gKG/r7/BZsak3P+MNpdjv/Fcc8F51kpwbxtbAj8JjWHs6juYCvNx9UT2Wla9?=
 =?us-ascii?Q?v/PH7jCibKt1ACzTGBn5n+Ac30dKEp3AUFceo1z60EWWFso+3DA2xqSqIr2h?=
 =?us-ascii?Q?XgZlVUBELUf7DBlqfjA+QVRyED1aiPQCzONFG/+mAZLv83txd0d128Gwfn7a?=
 =?us-ascii?Q?23XuOhZVOzT2tMAF5RxhsVVZII5a1ZnKF5vqvSQuNwOJM7RSVZwpHbqcfV+U?=
 =?us-ascii?Q?nnSO3ImkELi/FrVfKf0k2k+CivXmcNxXCwj6anJ4G9kDINjscofwKrPkIT47?=
 =?us-ascii?Q?OhxVj/aNRfZPutfhmXwfTmBnXt3bDtMhMN2sPhkAbTdCngc/Fz5v5G/jsElt?=
 =?us-ascii?Q?xYONDpgwfo5aJa+1UgQkMVjVRA92DwiCgF2yuC7fNWHQ88Za+6IKdxlg2bpb?=
 =?us-ascii?Q?ARLJrACU2CZfwJorgkUUFLyzpbjtOlqdgrEPhFB1Rnpei7cfb7MDqzQqyg1F?=
 =?us-ascii?Q?TUBryerPGilRN3pVXGMei7bLaKCM1Kso/ayRMXyyVhLF+oMaxYVqRxZHfFOB?=
 =?us-ascii?Q?bsNSswH3jXKRGG7/NICor3/hQjxfZuPpU2o6LL9zYfwHSxbnUQ+xk2nCxqOt?=
 =?us-ascii?Q?dBk61fFc9W+T+8klXyfCNGoy1mEBuZGifyX5Wvr/2erCHtr9sCs6v431kbBT?=
 =?us-ascii?Q?hZPx+9MhQSANye4g4DsK2eNg5FtqprpA7ai1qrs5K/zEhHNB+wEyjeAwic5f?=
 =?us-ascii?Q?12Tz4yslSTl6/kxH/BX2CmMXTuxa/Fo=3D?=
X-Exchange-RoutingPolicyChecked: D0Cu8Lgf5djay3yrQrwtb1B8DELH2PQrdb5DrLXxl1DFXI46JTmBOT6nxpMa6JLVbqyke1BkHMwUIVhTD567vQXlG0rRgs2a7OaZtUCxAkVAY5+Jg3wQXE85yuWBCg/9OoKFs0CoPbBZ0eihMe/qXpPkDe0RUf235xOacKEzM3VdIpEUipnn15mD2yoIWvOj2n5lN3FsN38RABdu2ZWib5CtriqpZF6iuchAE0AvO2ijP8F47KaPzLOXBAaWRA5IRO2+Dap3E/s0acp9EIKsVTStcTEbMUfPc6c4JbgSleGmAx5YkWGYgYhB1RspPTVAvX8D4aBKy9iUUr+xLzwnKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc80e6d2-b85e-492c-bf58-08deedc1b431
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:35:34.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdRLqCyECI4QUS0wNfAQis7JDk3aEPcUFef4aDUZ+TEaScIre2E/wCzvcCumvI3KpW6O0yTFUFIiDE7mXxojxyUpRWIsrF/sgYalXlB8erM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
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

On Tue, Jul 21, 2026 at 04:00:01PM -0300, Gustavo Sousa wrote:
> Currently xe_device_get() manages the PAT cached information
> information by itself, by doing the necessary memory
> allocation/deallocation and calling xe_get_pat_sw_config() to
> initialize the cached information.
> 
> Such management is arguably better suited to be implemented as part of
> the intel_pat module and encapsulated such that xe_query doesn't need
> to know the details.
> 
> We will introduce changes that will require an extra logic for
> initializing the cache and having such encapsulation makes it much
> easier to implement.  Since we will touch this area, take this
> opportunity to move the existing management to intel_pat.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
>  lib/intel_pat.h   |  5 +++++
>  lib/xe/xe_query.c |  9 ++-------
>  lib/xe/xe_query.h |  4 +---
>  4 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2f35bb77249f..14935e3c4692 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
>  	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
>  }
>  
> +void intel_pat_build_xe_cache(struct xe_device *xe_dev)
> +{
> +	struct intel_pat_cache *pat_cache;
> +
> +	pat_cache = calloc(1, sizeof(*pat_cache));
> +	igt_assert(pat_cache);
> +
> +	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
> +		free(pat_cache);
> +		return;
> +	}
> +
> +	xe_dev->pat_cache = pat_cache;
> +}
> +
> +void intel_pat_free_xe_cache(struct xe_device *xe_dev)
> +{
> +	if (!xe_dev->pat_cache)
> +		return;
> +
> +	free(xe_dev->pat_cache);
> +
> +	xe_dev->pat_cache = NULL;
> +}
> +
>  /*
>   * Hardcoded PAT indices for Xe platforms, used as a fallback when the
>   * kernel doesn't expose gt0/pat_sw_config in debugfs.
> @@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  		struct xe_device *xe_dev = xe_device_get(fd);
>  
>  		if (xe_dev->pat_cache) {
> -			*pat = *xe_dev->pat_cache;
> +			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
>  		} else if (xe_pat_fallback(fd, pat)) {
>  			igt_info("PAT sw_config debugfs not available, "
>  				 "using hardcoded fallback\n");
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index a31b60e86e2a..fc9ef9b650bf 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -13,6 +13,8 @@
>  #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
>  #define XE_PAT_MAX_ENTRIES 32
>  
> +struct xe_device;
> +
>  struct xe_pat_entry {
>  	uint32_t pat;
>  	bool rsvd;
> @@ -40,4 +42,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd);
>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>  
> +void intel_pat_build_xe_cache(struct xe_device *xe_dev);
> +void intel_pat_free_xe_cache(struct xe_device *xe_dev);
> +
>  #endif /* INTEL_PAT_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index ea095b207534..aa81db45a41a 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
>  	free(xe_dev->mem_regions);
>  	free(xe_dev->vram_size);
>  	free(xe_dev->eu_stall);
> -	free(xe_dev->pat_cache);
>  
> +	intel_pat_free_xe_cache(xe_dev);
>  	xe_wa_free_cache(xe_dev);
>  
>  	free(xe_dev);
> @@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
>  	 * should be extended to cache PAT entries by platform version/
>  	 * revision instead.
>  	 */
> -	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
> -	igt_assert(xe_dev->pat_cache);
> -	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
> -		free(xe_dev->pat_cache);
> -		xe_dev->pat_cache = NULL;
> -	}
> +	intel_pat_build_xe_cache(xe_dev);
>  
>  	/* We may get here from multiple threads, use first cached xe_dev */
>  	pthread_mutex_lock(&cache.cache_mutex);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index f70476945dee..82f72314f072 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -20,8 +20,6 @@
>  #define XE_DEFAULT_ALIGNMENT           SZ_4K
>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
>  
> -struct intel_pat_cache;
> -
>  struct xe_device {
>  	/** @fd: xe fd */
>  	int fd;
> @@ -78,7 +76,7 @@ struct xe_device {
>  	uint16_t dev_id;
>  
>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
> -	struct intel_pat_cache *pat_cache;
> +	void *pat_cache;

Is there a need to change this to a void pointer?  It seems like we can
just leave this as-is and avoid the cast earlier.


Matt

>  
>  	/** @wa_cache: cached data for xe_wa() and related functions. */
>  	void *wa_cache;
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
