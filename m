Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBCACA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 21:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1B310E0A1;
	Fri, 15 Aug 2025 21:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQcrWrMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2210E0A1
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755294231; x=1786830231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6i07URHgLW7N+3txS6mT0sksbTy4dpwb9wyEKo6hvqc=;
 b=hQcrWrMz/bJu0Zo8njwtpMsHENanMYVRXdeBWCz1alqN2Js/m6w6zu77
 hMTrIFuLvox3yApU/LcfFX7fKV7eSoOtsunQ9gnF0qffgO2k0YPK164uq
 q48Prapxe0YWwd+8a43sRBKhqm2luMi4zzvO0hYmw2ucHGXV+xZUvdxne
 xJS4ql1DWmnrrL7kK+bWysywZe9evzbRBgJDnh1rRQVk1TVdBTHldG573
 H0b9UkPIKXA0La3APXO9IjHK57SMdlxUVfVPyUwklyB8U/MBn/OCr0W6H
 kPeNFn6v6KK+EFmOdZRy4mpdmH88eK88lq7Mgbogxc/JRyynzc21fY1Vw w==;
X-CSE-ConnectionGUID: YqOKfFFxTzaoau3bcY6NWw==
X-CSE-MsgGUID: UUO5+GrgRDGcc9cBdsu9hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83045203"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83045203"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:43:50 -0700
X-CSE-ConnectionGUID: WS+FeN8OSCmupcAW2uv3HQ==
X-CSE-MsgGUID: 1jr6z7F7RYKyqHG5pcgisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171299307"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:43:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:43:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:43:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA45GGRdPGKafwYvk4u5COp4bZqc6dSFOzZD8BGm4bd/aiF9iFRUgiLxivmV2umfIfzX2WM0/ioM4vKr2Q32ttIMRoRTqbeLMjIKw8EVtuK6FL8ijCPKSAAEEFSmZimZCTSUIQ9ohB+qAXFSpEakad/dri5Ne5mx23cjG62OSUOGyslDmi+M2jAOY4TWIpOjxcaRYXWvKibB2rasR+mTDBC8w8RgXNHQR6SAeoT4t08uZwBjjoqOCOwiuDcYh23ZvWjYKtbbuWoRbLIPPXak/Nb+jGKqjB32f6aFBA5BOnxh69elQOJd9HqsAmNBqNjpIBTGJreTJJJNA+6UcdBT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PBPMYtufg3qS5WVdoQYpg3Swr+8bBJoW423Lt1qets=;
 b=BKP+Nqu+XSl+1sAi9dgOTYXznQ61G2HGVNb9c+leg2ueVEA58hEBMrsxwZIjppP4/xobH2qh2ftY/JZa4xor8zKUm/JwBztM75jfdTzIV1ouKgl5a1fkJ8yEw+gJzVrAVSDIhmspJrGzOE/jboYp+LYMdrviR8udYy7flhAzRm8QejFpRvMiTUXmBKDw8KJmNt68qMrSImvqGC0akgzBxGffD6N4RRqicQhxKgIQWVh+Fdm9em8CeEtC5G6K0YlOf/5K5S7COu0mCJH3ecZLc70IrRlnke4nugEdltVAtOl2/MRYTZCnW+y4TzDYD6E+OTuW8E+EEuzGcnDnXI8ZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9207.namprd11.prod.outlook.com (2603:10b6:208:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 21:43:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 21:43:47 +0000
Date: Fri, 15 Aug 2025 14:43:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Message-ID: <aJ+qEJ1QkvdOQy6N@lstrano-desk.jf.intel.com>
References: <20250713054102.408779-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250713054102.408779-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba26196-42ab-452f-eada-08dddc44d0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PzNLlM5UwFay85TPpne4Nsn3p8jGKZ5MZJqOyfTziAOsJJINu2rJDIo/qbgj?=
 =?us-ascii?Q?Gopnkz0aZim3N1851gfV+VuJuDd2rrvZVIUlib3IMVpEyYrfEzWx0VEnIUw/?=
 =?us-ascii?Q?EMaoEOm+3SZY3GjIdKlueVMMPwo+syPCWs1ylUjG/3MwID4KFiQYZnOU148W?=
 =?us-ascii?Q?qTxiL3RQsKpv6aDEW8wZ/AKwqAKZHcM+cnjAkjSH35iYIfBYM05QpEyeZSZO?=
 =?us-ascii?Q?zkjapRqpzLsEwSzFeg6Ol8fC8sBW5bjK1x+D6MLdjEXXGYOtI7tuI2et2/Xd?=
 =?us-ascii?Q?yBkBEm0WheeAy+2nbhFT6oXc937YcNdQ8rZvlMzTHNDZLoNGC50Oyos66te3?=
 =?us-ascii?Q?vEqDwCc0SN3e3zB5zLxrgfwucNnNm6wHeDRFA2jEOaRm5AHR1mmL/rjCIRw1?=
 =?us-ascii?Q?yYBaZL/dACZvOuMsgjjbEY5nlI1bMKX18YOe68hAEkROY8y5v9uaRJD0TpQE?=
 =?us-ascii?Q?9n9/wcTCkQm5U1UDJ8Rk32jxhg4UP/LOJHkGyZOe2MJN1SYZaUUz7DQa41RC?=
 =?us-ascii?Q?mloDDI1aWpTKeZ8uRhdtpt4HXwptK30tnRub8R0qQWB+JrRSfXRIUmC1fk3d?=
 =?us-ascii?Q?3yG/Oo5APyFroAZVfhUnPa5kma1V4fxgwBN83MGyl02FlxgkGlovb7D9XW1A?=
 =?us-ascii?Q?tPiiHnITFqXH95HFp1lgumiZHeNeLZ9TcdYvdJeFj8OLmmGhEXePMztcSPr0?=
 =?us-ascii?Q?pAOAPeToRYtF+x7MM4sq3I3cGnn7AUDzsEpmdIjorlVU0qde1U5Rxgnp1JSA?=
 =?us-ascii?Q?JPZMvBG5/+NLmcK+o+fak1E5r3AHyNKfMfKytaj4TcBfbT/YrkPfyAQpgqBj?=
 =?us-ascii?Q?ZwhA168vVToClT5g8UtFuWUxHu9GcboZuBSbr2jHvJrrXC/CgmU9+Vjmc1tw?=
 =?us-ascii?Q?UoTprI7rQ1OvGbwG8xNKJSmhDooH+CrxGufIOuYNi/s1VbXvieImQvRS0Gg4?=
 =?us-ascii?Q?26NpWS3iJZEc9Ud7NyrKZHfmD2Eq3fzr+733iM0lRYaQZJcLK/bjdZXUjfpy?=
 =?us-ascii?Q?UvBJM9tSb99ofH+SP5kJRaOWvef98ZpJekxac8BH4VgNo8zWPUtIi0nryb7Y?=
 =?us-ascii?Q?3tDjztmXyWC6IA/gMsXc/FJjk5fNXFTQK8Nv2iYe+qZFDtJpY0l6pEU9aN6D?=
 =?us-ascii?Q?U5Egv6PJ2QyKihKiVoKCgtxJXqlOSn069otTZHnjzllzcEBRSprZeHwyXRTm?=
 =?us-ascii?Q?AYnOexG7zocrRWT/9DUkllxHaHcIXFGmP0VU2rrvqdPUH0CyxCGE1vNCpQyl?=
 =?us-ascii?Q?QMAsDBtfqCxw8dcA7ebmav6rQ5LZ3iLCzITHOvlPX8PVrnxLb+BHrFF7Dxd9?=
 =?us-ascii?Q?Eb0ovqyryJJH+WMv5/o163nNydYBF39+pC5DKMvCzSjuOqRXb7z5KZuob2OF?=
 =?us-ascii?Q?67bnFOgZJ5OqG1KYKyEAAHiRuXZtBjoaK6jNIIx43VSmpgTRmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1wQi89nUU36iFPWgviwabnCxRBJUMwHF33ic0NE7Ui393+pIx/P0a0H4B8Js?=
 =?us-ascii?Q?iHsIoR1cDPOvpCp5GNddcgwcxWuGRol2h58RpoaQqop1LB0cjUe0r54YfWeM?=
 =?us-ascii?Q?I+4BjLTShUyvl6li1hxLCNHL8g+Ybjcn/UZmV6D1Zv17yJYrogrx6coIYzyM?=
 =?us-ascii?Q?ghoMTb5H8yX3cMZvwNY4kUssxq1vQn6qTQbhqozqVZ5lUXVl8QSZqa+GdRV3?=
 =?us-ascii?Q?lp/5KIKNbLBqQnelbEuF/8zZ0mUEqK4md4iW1+5rXqnqmWHMH0Cqiuapn90u?=
 =?us-ascii?Q?tzsnn1IeoRF1pRP17w/xnCHaYR4wcvfvqwgBrqU38dBsqiZt3l3MEQLxkSCb?=
 =?us-ascii?Q?XZOGFUyrLnwPxgermXpWFCnHvcOjJqExs30qgs0F1wkPSoPG2qQWtpYzI/6D?=
 =?us-ascii?Q?/OqhwtzqlUhT5MATq0pwc6UOVYmIo6oWkToejumNYde8PQOTQ+4ZDsHRBp9N?=
 =?us-ascii?Q?YPQydYRG4u0j/hiq3xxVEDbT8wciwcmS135o3iDpg7GKF1KRtfco0888ux4i?=
 =?us-ascii?Q?Slby3B9Ov0ma5a9sRYwIfwMStGpip2LUa/2NVLXLfGy2/DGt50cf9nR9C/c/?=
 =?us-ascii?Q?DcbiuUh5yfJzaqHSVwOG3lyZfbPoACpJ7pu0n0t7bsn97lEWMXj1uP6mpaHM?=
 =?us-ascii?Q?97QnF2wptv7oLArzhDQiJYgkjtWPzGedtP1ZFTfSgjZ+LKseQyrm9jtlcXnP?=
 =?us-ascii?Q?bWCwuFT529XnW3t2LYz+pZShRs+9GfGKq5FZm83AJa2gMA3vO6MC7P7kz8Yd?=
 =?us-ascii?Q?1vFg1fMEihZ9uUP9in9drONjzNmHO2b06xUGEceBA5RqePI+KSKEvy5SMy03?=
 =?us-ascii?Q?J+M+9ciz3nn4gUbsZOsvx1yJ01dd90EcJzRMDUkP2ifcqae4tdIAX1KsyCgA?=
 =?us-ascii?Q?x2d+6h8IdB3gXyWhprMc0/rIL3H9QuoHvp11mff1efKcemjeXM4LbEPrdTm5?=
 =?us-ascii?Q?p6UJZlat0owESlWmKVEbJQgFZ0T0CFEsp7ynfvn9L1J39NjAeH5hUFky1023?=
 =?us-ascii?Q?S4HL6xzEgx3bTf4bXVBISmCXFSYuaABaXHaohFIorKWg4+++n2TejOHPSZXO?=
 =?us-ascii?Q?P3b/+CggXWy844/cLo+w2WM2dcgD3baLQh1S7Tw9pQ4Bl3gGjyMCh88dSAO/?=
 =?us-ascii?Q?mO7roQM6HHBIJpBW8L36Amx1P3EeNAhkGHua3kWgqWz3lWVs7uSxUqLF/sgA?=
 =?us-ascii?Q?mcMdMP7gJatYAZi47UEap/otud+2sqhu8NckGe36KrLc5wRMWhN44uIKGviE?=
 =?us-ascii?Q?hSk4ZwAzFiRDs+7Iacbjjlv+ov61ZjwI3WvgR9toZCc1N6LMIlkWx+bipJ8c?=
 =?us-ascii?Q?FiOxfcwtIgdLjVTbjjUXe8UWnbGwNqYcCWZu+QUzruZsvw12R2dIlcflLZCp?=
 =?us-ascii?Q?Nm84r4BdwBxzEYAZn/U+RE99O7aXb2IL/4r3zv66iBb/bDH6yC6ZvH0fh6Y9?=
 =?us-ascii?Q?Czdfd4JaSggwywXNFeeJW52NbRzNMdVhmwbzB6Sfp9DDbUlalDBNl3V3c8HX?=
 =?us-ascii?Q?BwXs6TbP/23NOqbvv+UBNzT7DvVNFH/7qOJyxt4wIzRQfRdNK72Iw0TpdiIK?=
 =?us-ascii?Q?qex69rOvD9dkxTcdBvZZVbyeSxs4btqxj4P+arBM9tqr+x0qubJFar9bPXNn?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba26196-42ab-452f-eada-08dddc44d0d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:43:47.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF+QCGJpj5rd87eui1Pab8mHthzAWNnvwOkynPFlYV/wb2rK0vn1YbofIy7J+y7s1u2AGG3Pwcw4TW+WAuku+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9207
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

On Sun, Jul 13, 2025 at 05:41:02AM +0000, Zongyao Bai wrote:
>     In the test_cm() function, for cases with the INVALIDATE flag,
>     use sleep 0.25 seconds to allow all tasks to complete their jobs.
>     However, this time is sometimes insufficient.
> 
>     In this patch, xe_wait_ufence (referred to as "fence" for short) actions are added
>     for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
>     The changes are as follows:
>         When flags hit nothing: => No change
>              -- all n_exec tasks operate with a fence.
>         When flags include INVALIDATE but do not include RACE: => No change
>              -- the last n_exec task operates with a fence.
>         When flags include both INVALIDATE and RACE => New in this patch
>              -- n_execs/2 + 1 tasks operate with a fence.
>              -- at least the last n_exec task operates with a fence
>     Furthermore, modify the xe_wait_ufence timeout value from 1s to INT64_MAX.

This is questionable. If we have bugs the test will just hang forever.

Maybe increase it like 5s or something if you want be paranoid.

Matt

>     It helps avoid the fence timetout error.
> 
>     With the above changes, all n_exec tasks operate with a fence,
>     allowing us to remove the sleep part.
> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_exec_balancer.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 1747e207c..8b397038a 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -527,14 +527,17 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		}
>  	}
>  
> -	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> +	/* Wait for all execs to complete, and the xe_wait_ufence need to be run at least once. */
> +	if (flags & INVALIDATE && n_execs) {
> +		j = flags & RACE ? (n_execs/2 + 1) : n_execs-1;
> +		if (j >= n_execs)
> +			j = n_execs - 1;
> +	} else {
> +		j = 0;
> +	}
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
> -
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		usleep(250000);
> +			       exec_queues[i % n_exec_queues], INT64_MAX);
>  
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -- 
> 2.43.0
> 
