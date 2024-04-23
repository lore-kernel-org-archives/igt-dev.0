Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A4C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 04:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7E5113094;
	Tue, 23 Apr 2024 04:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnQoPHB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901A2113094
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713847014; x=1745383014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qhimCb2B3Z8+jHrRhp6V1qIHZNlRsPXM9SFSYr1rWQg=;
 b=GnQoPHB9WCxkGAHTCagf+bIwBzBj4uhd2VEarGer3wkJyotavaersAkT
 VHNW4snU440xt9L8vuy4/AFzfCE5AVUM4ePg/XAYLka3hCtznQR7et1dB
 iyDaQBG5PrqQs3uU+BpuAhMVqpN878lRUECS3SXLFW0h5hn0Deei0/q31
 3KV6ywQWqrQQeVY8hSz2060AGkpDsLU+RcHG/dHNsCVEgsYpjLvp+Go4h
 nh+sA9HzVvjDnyCUZM+s0N9jczZmyM6vdCplTHVVZE3wa4Gfi+/gyA+VF
 mBAFCNASQlAongmb168n/5VdZFE1cYGbR3WgwPT2xAnNuRXlBoslhHlOZ A==;
X-CSE-ConnectionGUID: Pqa/9NTVRIqEM3IO/OPWsA==
X-CSE-MsgGUID: gxFQX0qQQE6peT6IBYCCww==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9331479"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9331479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 21:36:54 -0700
X-CSE-ConnectionGUID: S9/WQyOwQxmoiLKHBZI2Og==
X-CSE-MsgGUID: VVjU5yxtRBym3DMxw8VLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24299036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 21:36:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 21:36:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 21:36:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 21:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXFddMf2hJXGQvXbScKShVvXw3rAX15GB7SGVPqXgKVipJXbngh1/mXn87f+RpUhgTtA3PZRHKt924t1+d4Jz3fxQZiGVlll2cDdcvGoYy+ZYyImdjQrbWgDOETFOID0t2oxZp+Gizdev0XSP4SzE6p6O2HyOW+6RhwjpoF++FG1Nt+vL7MBvE86XVKHCjaILHYaUwnqd9s5iUSVRVvah/yKPd40przAkXMxLmQCZiwVgIRcCd3m1dcVSAK0EBo2oLHw9d2oQ1GxGoKMsHEIKei7aKQatFbBbyha0cOu76UUgZiEk5TL8gD0P5yTE51JnTWyutAHjVWMhtASeZ+OlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwZUuR2qnF0nHxQzLNIcrS0Gi0XT1sFuqiJBYcfI/NE=;
 b=XKugRIjjv0xReD2TB4/lzMyG4GRmIqGRdOYQFw48oXyu0K42Hai1AJt09A5RexAQkxdu83ZMt85/9XntEOHGUVO3v4Qb+rgUa8rBN02so2Rwqe+RZjND7wTdWj8nClXdDuxvb1ct0BW56SiFPS57rd815w+K31rrRYQ3GZtDviZPot/hX7ibSNxlKCs8UpgaeZv8upNdf5pfahuG9vBKv0b903Ww2FFRANaEnfTfHao44p5DTy79kLoQcxQuRa2LuYIllVYZTE8+GmT58joRklqpk/YugF8Cfcus8EVfVX3JgVJTXx4ATht6wXhUr/Wsd99UvBMBgJhBIjsPK8enPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 04:36:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 04:36:51 +0000
Date: Mon, 22 Apr 2024 21:36:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Brian Welty <brian.welty@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Fix misuse of
 __xe_wait_ufence
Message-ID: <20240423043649.GC5615@mdroper-desk1.amr.corp.intel.com>
References: <20240419185739.30993-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240419185739.30993-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c7dbfe-b812-4851-9c3a-08dc634efee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P8FYyK84KpI6LQKPMTLs3OPOlLPXNXBzNqGeCEEtxgjY/M7h/vQHhyZgQeBI?=
 =?us-ascii?Q?S7TiOVqf0OJpBtkU9czdEl4iwtTfHAUNsr0iFZv75d2sBnXmQBGV8WmJ0M/E?=
 =?us-ascii?Q?UMapDsg7SPOPino9BxTJzmZBKFV0zmvp/Yo+b2tcRpbAm4BIdHWEXyOLlATx?=
 =?us-ascii?Q?ujONcGgU36l/IGkBI37ezmSzafP3HvCmF6Rz542k4LoYiKUfqhd0LawW9BaN?=
 =?us-ascii?Q?5i9np01E7HODSkRmUIX9jlmH7wsZbvnSaSj6y8qr/AiATeExpAyBzFgNpszF?=
 =?us-ascii?Q?4OEyCidbLyxX+lcUP1C7DA92i72Z8jMszBetnbP9V5GSUesHzTxoKc7lzVX/?=
 =?us-ascii?Q?L9zNVE5FkcjQJ70lJNY0fR01i4CjC6FnNqn9fd+wr6b5rY3rRwBssnh3xVHF?=
 =?us-ascii?Q?cRluGQnaPDadIpaR4A0s7EAohRUPxyyt1uHL+wo5Jt4Ni/iY1TLwtXjLYX9r?=
 =?us-ascii?Q?x1Wvo4y5OlMFihbcNngDrzTwcVnMbyJA5cYBF9vT51Ey0Luv8brlB/SVPjUK?=
 =?us-ascii?Q?BoUL96OUgzeuCetlxzNetqE2/XJ8fGLWz/pILQ2XtRnzgvgkxnAiFm+4+3Xr?=
 =?us-ascii?Q?glwyFjQjS6Ls714SReR9KZum2qIUEl7PyA2zGPVic0piCgrgurmQSBm9TQ1l?=
 =?us-ascii?Q?Iep6we6ZaUFUd1MPNmDz7i6ehKeQz46CFB01jpwPdBqKH4QGDf5OfZqr4B50?=
 =?us-ascii?Q?rCcUhs3ei9DcoLyF4aJVoxtwJeXtnG/3t5wewZ8ktgJEkPsoT7fpdN7mTRJ4?=
 =?us-ascii?Q?7ZLg4ZM38dBpWd3EYD8FYaHIOeyEipdrWr2TI38pui8q9SmJQ2L5Wg365Jhu?=
 =?us-ascii?Q?qias3FWqMG32Ko6wCMkWKFw3JapOjysOiMIh7qrHJYagr6JvUiC5Jl25rlA3?=
 =?us-ascii?Q?4q9xOB9zfY9J/5FYJyflLuT+V1attnLa4Ia7hSPK7zxL67qP/DcvdmreEPVH?=
 =?us-ascii?Q?Z6jFn/aRqIl2ynR8SGsP9M8T+6roOnIFKuI8PktwWflz/J8ywxDp0dElPLMw?=
 =?us-ascii?Q?xX2utzi7JosQjHSCXhhWxk6W4d886ftAAm+NL/iorxVQNSeMD6hAfym4tgg0?=
 =?us-ascii?Q?mmRkrxu3Wn9dvYGISEPbJiv76GTzLja/Pkc013cH9YXlZvItGo4/uWj5WYNQ?=
 =?us-ascii?Q?Mq/aqRg4sfifKB12BLLSGImKOU5x1Bzwy0Eq7nTo+HIbpEGEcpmaftdviyBF?=
 =?us-ascii?Q?zb3Qj3UIbBAYG58ssAS/2YPBR3XNvWrlJGTCOs6q73/QwhFbp2dAjvcTFfwL?=
 =?us-ascii?Q?pmFa05cYKmvOhnCRMgUyT4HVb2gbvgUWWXvAiCcraw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7a+pr4uUaTDOUlLw3wIyjSHoOqELHo3vJVxQNF1gBkv+Fq1DMSR+OPbIIt8d?=
 =?us-ascii?Q?1QFJlJOxChFzoEEOcLk8I8VBGPjJONnsdGrabjL05+MIrwVehNxGHZiz8Med?=
 =?us-ascii?Q?fzOmTnbgOz/obxBlBF7H4PTfQLcEN8m+E05y3HwEWlvv0Sy8gUwHU+Zj7Y7s?=
 =?us-ascii?Q?ydlQhjL7Slh80z8FfQuXTQ+PM/6CBmG2nstgAC1VgSRre4SQ5629cU3g4xiq?=
 =?us-ascii?Q?XNk1xRkAUzyDm0HZhN3ZZ0jCMPeq/efKUjVikU7yL+lKiJCenqv63x9FQkfh?=
 =?us-ascii?Q?gHBB8lsWc19vY+FDxOWae+dckqkBFxSbWA7bb8s6RGhXuUfZNAsGcLdGS4A+?=
 =?us-ascii?Q?hstVAhKnX9CXTxFspCEI40oh6vFJCfbfajKkIYdlXZrm8k7sl55KiJ3+7z+q?=
 =?us-ascii?Q?xpibmdLCPZYQW/sHJiHtM1x+59c0+xYzQTKSkALs90SOdBlAF4R4xXB0VhOO?=
 =?us-ascii?Q?DiqPL5B+qqsGcwXn6ES6Zzfc5wLQUdiCzwfS6j/r7D2LH1ZZDWkAssCZ4zj+?=
 =?us-ascii?Q?T2TMtaD7FOFc12KpcbDkhEZ6k4iPZJb+6RZ+vk3SRSUNiOMNV9eTpA1iuDg1?=
 =?us-ascii?Q?/gCVXXVkf83gsWWKkdN7Wb0iX0KxLuPyV20e4WRGKFnaochf5bEwHoVJIlfs?=
 =?us-ascii?Q?SL8CpGIEjWdf5eCt6thds41hWFcgclcVOVfjnm6TaVKng6pgkXBo6nPZWHBe?=
 =?us-ascii?Q?IdYyAv0UtckLX49wP3wLqV8FDAtd07ReyLh78Il9xmBmTZn8Lar5SY8c/g6x?=
 =?us-ascii?Q?r79o6P7NSdYr8NlsDAIQ8ornbCv1YQ7IjYtFRREHmt/vDqfA6IyLT74alsf/?=
 =?us-ascii?Q?FUgGk3yvAN3wZSJ2cTsY/ykh8WAPHOLEKLeLSm9wDwDgMTByHwMDdg2We0bv?=
 =?us-ascii?Q?9gip+QyLB+J8M3VsfdCZBlQM5oO2hL6/LQjF00yozIWjTlFKQbzEl8p5mFql?=
 =?us-ascii?Q?QKL8N9CuJi+31F4V/AXDgHnceLRrJ7eDk/bHllJd6ppU2GvMhCd8nTLZ/0Ya?=
 =?us-ascii?Q?NV7om0YDY4SOFPctBJtYeiupJXzVz+GVtiX5SXdLKcDtBaiQu87lYjuMbVPh?=
 =?us-ascii?Q?L0ShGWhwLtgphvWEB8B1n1p/3mYhOkJIebxRmdkoFdRSVEXbtaOL3CGSCSVI?=
 =?us-ascii?Q?QurBICYp8Tp/42KoS4HCBPGj7/APYztRyW/xQl4vAlQ9mHBggddAYROhOUki?=
 =?us-ascii?Q?xWvaaPTS72hBJd/3dd2u0GF+avq9gGuNoShwhKa5/YLtk7bjJ15MVU8HmNeo?=
 =?us-ascii?Q?icg9aUePta6fYohn8RlMzgiaT9qiyyjQnXIM9jmUWeGGJo1aIuuES8seOniA?=
 =?us-ascii?Q?knSk8Ap2L7uhTNBHEdZa3oMVF54F74selq5h0+y6vZtJdHRSDSoD1LiJv+/+?=
 =?us-ascii?Q?utTu2wwOxJlZM2pKrelWuj8BhWgFeJbjaVrXgLJJqayhDbZ056DNd/JfWfap?=
 =?us-ascii?Q?L1wLbj4qUjg5mo75I2iaASo50Kt2MU27BkmyKfKkNlkG/nxNMKboVAmn/egu?=
 =?us-ascii?Q?9SdVzfD08YV43zETi6lhKrntSwiM2smTIkrIwftQY15IimFF2838y+yBE/v2?=
 =?us-ascii?Q?DWEWXyVnMMWEckN19dePCv1gcXCP80Y5b3xZfneKu9bdiPy5ldsfnwh6VYjD?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c7dbfe-b812-4851-9c3a-08dc634efee4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 04:36:51.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9BU/cIwUAmeJTfp1Ub2uJjtWj3wo4c8RFwVRhAs3ls+C/ErOyhhyrz0xXKxKO9Om0mRCWe58hnpLlYjc3ZcnOAUbP6zCA7x0OQtJstKblk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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

On Fri, Apr 19, 2024 at 11:57:39AM -0700, Brian Welty wrote:
> When confirming that xe_exec() user_fences completed, this is performed
> in a loop.  When using __xe_wait_ufence(), it returns an updated timeout
> value to reflect how much time was remaining.  As side-effect, when calling
> in a loop without resetting the timeout, the timeout value will get
> progressively smaller over many iterations.
> We don't want a smaller timeout to be used on each subsequent call to
> __xe_wait_ufence(), so fix here is to reset the timeout inside the loop.
> This issue is visible in simulation runs due to the slower execution time,
> where later iterations of the wait are failing due to timeout being too
> small.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 40fe1743e4..c0d082e7fa 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -273,11 +273,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		}
>  	}
>  	if (!(flags & INVALID_FAULT)) {
> -		int64_t timeout = ONE_SEC;
> +		int64_t timeout;

Should we just move the whole variable declaration down inside the loop?
There doesn't appear to be a need to declare it at this level.

Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  		j = flags & INVALIDATE ? n_execs - 1 : 0;
>  
>  		for (i = j; i < n_execs; i++) {
> +			timeout = ONE_SEC;
>  			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
>  				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>  							       exec_queues[i % n_exec_queues], &timeout), -EIO);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
