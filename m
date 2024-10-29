Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3370D7494D
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 23:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F18E10E1A6;
	Tue, 29 Oct 2024 23:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfHIkgMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B9710E1A6
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 23:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730245123; x=1761781123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3zpL24UXzQFje3cc9+J6cDWrt/gFvQk+bOlhtTwEPgE=;
 b=nfHIkgMNRRSh23jEKGvARq8TyPJP7BJhC2LeukgqWfi+q4lq1/mRsx8n
 zSfudKOMNeMCm3qX972/IDDX5d4gLEmSm6WYOdujafi5QWBxHsGrvDjVd
 RIcazN/VEqiuv+A5up9VSuLjysyf5/eVe7o6TpPSoNfoWbEou90os+gOF
 2BcJXlHE8gAPRMI9AaNF6nOXr3T4ivBpu7B/3XqkcHBt3uqlqXfNN86AR
 3PmhKt3ZrbeLJp27wtLUrIefhH0dM2nzY314MDWwVhCqBNCv8cHKhbzDD
 LfgpxRHumyH3MqtZoPFobqE98jftAfNEnFcssaXmGiw4YXSWEPmp+Iu4h g==;
X-CSE-ConnectionGUID: C2jlfLexTVSFh8AESZTG/g==
X-CSE-MsgGUID: mN6VvESGS66QgegpSW1pgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40534331"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40534331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 16:38:42 -0700
X-CSE-ConnectionGUID: OgOwegoQSYGpx+HnHMPNzA==
X-CSE-MsgGUID: cql6UljASw+auBgVFNBrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="86731869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 16:38:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 16:38:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 16:38:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 16:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KemHupjgyjmnXG3iJTnBr5vd1vZPsOOGX4wmFTpVFy78gTMMh5PhDbE1uBiL5Zk+LqL81dgr0dv2Y5ULCALaHzuX00yY8pfo5+BE2ifoGXVZX/eZElYtLU9J8u+18EX52eaHgyE7Wz/9eB5WeJp9MU+/nvfyUyHSwFv+H81GlcXDbz25//RdEgHGyKC+KReScUG3NUZix+hncHEycaggz8f9Mov9ckSqXz1p4IKi2OntCE3+aXTqH/7Y9/QK1/KkSksR3mwsnIPAWWJGW1Q9LHndWrAXACKcvGyqyL0MXPGbOMFfSbvxfgwjz5EJuzfFz/iE1Xv9gkb3Jynob76pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4aNQw9CwiNf1uRsTfHhKTJL2c16vUO7aVpz4FoB8fc=;
 b=ZrN1Ji5EqDGsUapvS0d86VAj9P1GadH64YAwAdqp0e3VN5lVlMqrcxx5da1ECw86Ox9gSBo7XNmUIfSLfVI8lbzKXP+fnl5Tv+3zg2KBND0v792ZfBML4A6ojSXRrUjwSauhoI9yb0qEwggmV902hPUSbVjguX+B967XpxsO0ckcqyduMbn/osv0Ib8bR7DbE7SRFsasrZTR7nR8J/NDwFywAvras1F5ZGxd4/q2GlN4ixQ+IbdCUuljuiJ20bCbE+EZ253u5JYD8f++c4b52NLJgJmiaxvhhHOF30NcJtgJxGpKuhrMFYKO2TyIEdHJNSr/8k44eZDUmFQO0Mcp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 23:38:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 23:38:37 +0000
Date: Tue, 29 Oct 2024 16:38:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t, v2, 1/1] tests/intel/xe_exec_threads: wait for all
 submissions to complete
Message-ID: <20241029233834.GA4891@mdroper-desk1.amr.corp.intel.com>
References: <20241028225349.1596237-1-fei.yang@intel.com>
 <20241028225349.1596237-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028225349.1596237-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 037d366d-1623-4964-3cd6-08dcf872cfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fVOrGbjOFyk/Ay6TrWlCg4t9dFn/JndVygUHk6w5AIBfNm3pFu7UJZb0Lvrc?=
 =?us-ascii?Q?7zMuaHDbYtHVskfYPqMpcOBA8M5DJ0h1A+We1oIsiltWQ/ZC+YEwEL2EN7QQ?=
 =?us-ascii?Q?zLEMK3Yqyhqp4UFfu6DOHYKjzqqPh6RhbLTmLHCFCXAXIsOjVCNeQHi7kEsq?=
 =?us-ascii?Q?AgsPyjw9CE0BNKPmObZxMXoXSDFq9hy+suzzMX/FkimhPPzqJmTm4prEA6PZ?=
 =?us-ascii?Q?vdPjLwpsmINQLPwHyRk7SwAOVqJE3Lnxu5wvqU1d0JC5W4+YSKh4C2k/Pt7B?=
 =?us-ascii?Q?R7KTGy3NdIhmBaSR3+SY2xliLGWGHKWkMMV5ib8JEzty2CVuOfzZiA5cR02B?=
 =?us-ascii?Q?41OdRY6OzbQSRJQ8VxRzV9su1P6B7TaHIgskQj4rhO9Cv/ZCd8cwrKoSeZDH?=
 =?us-ascii?Q?KPqAYAymBFbJncPvqFqHBafPWIqQE50iDJm/k4l/I3JptecjPkikwtNww/lt?=
 =?us-ascii?Q?Ehts8/MAvD6FwBqHryo6BIKNxXPg5LHdk7tAVar6KnhPCmgqKUwMfE3cWVuI?=
 =?us-ascii?Q?LFefmHaC/+rlyK1Cp5MymoVVEKbIty0LdXURncaeMiC1E96+exo8idTyKaKJ?=
 =?us-ascii?Q?GPfgjGeGn6pUZ4B705fPTuR9Y1B0IajxjpppT8AmqgyO1cZl3qPurSFDIkJK?=
 =?us-ascii?Q?wEDFAobF4wrHEHzUz/W44625Og3VUoZKPmjVCX8aZiKsPcmKm7+fYHdx9CWV?=
 =?us-ascii?Q?64mKx/vhDjUe9bjXJT0birVf6pVKeH8Pkjqf0LhaQd6zzdYo5OYgIVRXXkvO?=
 =?us-ascii?Q?jPwITNjWymAMfkAkTv1WBRJhrgOdOWNx+DibgCSf7wbguIDKUGxxUsBUNvFd?=
 =?us-ascii?Q?/UGwFWOFYdHFIlaCgyAFOHOrfi8YqqhLskhAd3D7kKR8ZJOCCP1yoWvvZgwF?=
 =?us-ascii?Q?SlV5/x4ViO9Xf8T5K/SxxEh8tdBbGEhZWCxeoD6MnjCWVsOj4p1AJEW/GOn0?=
 =?us-ascii?Q?o0eRMjGvHAHYzYW6N+ThvE7duh0BhZ6TPoil14Ofamo3Oa9LYGxv1qGw2wWi?=
 =?us-ascii?Q?i0aiIr+LS7fzlGNel/WM//TgRe2W0Qt7bcPTOnMwl9jJQITRaxbVsrLu18dK?=
 =?us-ascii?Q?LmR55Zi2jvu1uOuu1f6AIUs8LiPkJDuiP0cpA8XHr4sM1ziaEaeipmUZE7cE?=
 =?us-ascii?Q?nzE0LKtjev1FIQCp45HM13gOmZt3j7vq/n/gkfCko+RJfuZ7H3/tm+PqcyY6?=
 =?us-ascii?Q?je4wIcbQMZAJy4lD5/Wsk/KW4R11aDJTNubEKY/cKdXeJqQGWr+VdB48eduG?=
 =?us-ascii?Q?7kXrqoZqgJDyNg73G/LPEo7DuoJZIQ6RNhuETb/YAec5GVfbx0ZDJ7QNSYDw?=
 =?us-ascii?Q?psufvIWWbAt7CAB/EJ+K6oEi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HgzXZT1bH4+iDkVzXEavCeUj+SRltEmSi0wHCUnAxlrQqw+CaMyR9T591b9C?=
 =?us-ascii?Q?zM/kV7UT7BuzHyU7KUwTlSWzDBDO6qWwGQaOFAHU1sg5jhjJeKWLm8VHPtOw?=
 =?us-ascii?Q?KjWOxSataxqaO26kBzWhAm89iArt6mo00Kz4g56elUXXVyMza522yqQRAepj?=
 =?us-ascii?Q?0ViO43TXwcbr1M0R1sp+CJlWaTmYnOR8ussSPkKax5PFYw2Jq2UnVxHdfX6e?=
 =?us-ascii?Q?Hpcnr5RkVf61e7Gpi1b9TuxhZ9DYM+bDdqyXKSgBoTm9hEnIeQvp+tg8YT1s?=
 =?us-ascii?Q?twLMA8rkyNh9Oz+IaetAjp3u7+GvPWal4S75FFs/5YIV48BUa7oaCrK5/CVY?=
 =?us-ascii?Q?S66zMKdCaa+W+ZJsXwF82yZU70PP4UQcPQ4ADPs2gzrg+tHo85D7oBOnw/sE?=
 =?us-ascii?Q?r35pCM3J0c+tGJD2OMjk7Rv+bHzEw/RgLOLs3s2Mlbfx/nN+I7Kzt3MRt7Ve?=
 =?us-ascii?Q?0OgQAdw7O5kKfTrxOdCvn4NpcMW5mqiz/r7NiXssr38dJT/kFoB+CrVCjwf4?=
 =?us-ascii?Q?bnBZpYYgII/KmpHqK8rfdMiEPbCDUcl8UmQGp9gKfmucO1Kg5Uh5eeeeQuHX?=
 =?us-ascii?Q?p7c54ZIzsK7lbcDnWB0jJ+1v0p9hefrXvlM/mM7psXbO3ZhmBf6GLNOedkJr?=
 =?us-ascii?Q?Qcz6P0VbTxCI/M1DkwvTMg3CmBd+KjNVj2cAmnf4QsoW9NBy43kfoIQts44L?=
 =?us-ascii?Q?Ew4BMxre0OzL/0dLmEoPi0hm+iAIlCwThVzoYP+e6EiL4qj45stk5HFETCnl?=
 =?us-ascii?Q?XTDLhDed4q8XQiON4NIQQDvnsTX+nFscIsep1n9rI1f6qhu2uwGkSKUzGq7o?=
 =?us-ascii?Q?FDFKIyY/XX+OpbElFd9CCVh42wPA1fiamFmESkgiRogyf+u9t48k2tQjAW6/?=
 =?us-ascii?Q?XuO5wXsAqoVocdjUKPNFrjHBZVEuq3phm1K5C0v+K2RpAtbQ44H+BEgsym1n?=
 =?us-ascii?Q?PEgt5fT34vWGeXXvWL8eQ3vwnuXNzzRBT99rPjU6vO6eJ9Y+13dDjb54fOp8?=
 =?us-ascii?Q?juzKMDKorH/L1NG8kc6H0Fams/CP9WbuXItWwveOCSjxI8IO+DzRFCXaOKSC?=
 =?us-ascii?Q?uVaiatHclg5rVEsJOoCoaH1W5iZFgDqtBW9gbiNVLEbD1KHiGeAa+fciKUCZ?=
 =?us-ascii?Q?pdoKNSB1dieuMi/6L32i+9xmd+ozkY50o+nT2ochNjEPpOM6KZdPtdrkcdiG?=
 =?us-ascii?Q?T9HGhsuSEZCvs6tnMbhf2ZVoTyBdUB4q/BiLr7LNn3ZzP1JUTewQYrJgtJ74?=
 =?us-ascii?Q?oPjfx8O5vkzu3twbkKDKuvnbm+MDR75hiP6gBrbtg8WTnpol5SPEHCOo5zcV?=
 =?us-ascii?Q?2xPqmSRkqNaS/cxUwwTjjyAgY4gLsI4cDnyaABrmEGt3fMZe8B8F9Oy9WCbF?=
 =?us-ascii?Q?FL68x9rQdW9dcntU/b4/cgrJv/0DVE6lwETctEZsmZSQGWLqr1EsFgeDJCDi?=
 =?us-ascii?Q?2PW7BWII4KfEN/3NJR2ri9J37tiTJYqIAMNd6gTer17N58MMhOe2jYOKhD3h?=
 =?us-ascii?Q?14Jf16aVvB4HruNh31l1xw4o/ho1cIWybyuPOvoE10xyDfTTVSbTNn/odynI?=
 =?us-ascii?Q?d/YW5weGASZx/kgWrmN2AXiMpFJ9ycflygrNxqylr9wIRSMtRgwkwj2m4Ok+?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 037d366d-1623-4964-3cd6-08dcf872cfa5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 23:38:37.7347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U5fUJsEjYHAvuG9Zs0pZL6HhTYBtRQ8EuR1ClKJqst4b31XcVL3lrt0yFd/3B+G5REdKJuQ89G6Qw9e1Mav/g5wEmJs2oIqAMyd8Jt+7v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
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

On Mon, Oct 28, 2024 at 03:53:49PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> In test_compute_mode, there is an one second sleep waiting for all
> the submissions to complete, but that is not reliable especially
> on pre-si platforms where the GPU could be a lot slower. Instead we
> should wait for the ufence to make sure the GPU is inactive before
> unbinding the BO.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 413d6626b..03043c53e 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		xe_exec(fd, &exec);
>  
>  		if (flags & REBIND && i && !(i & 0x1f)) {
> -			for (j = i - 0x20; j <= i; ++j)
> +			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)

The change here doesn't seem to be related to or explained in the commit
message as far as I can see.  Right now every time the outer loop is on
a non-zero iteration that's a multiple of 0x20, it does this inner loop
to wait for those last group of execs to complete.  As written today,
the test is accidentally waiting twice for some of the execs (e.g.,
after exec 0x20 the test waits for 0x0-0x20, but after exec 0x40 it
waits for 0x20-0x40, accidentally waiting on 0x20 a second time).  It
looks like this is an attempt to fix that by starting the inner loop
from i-0x1f instead of i-0x20, except for the special case first time to
ensure we don't miss out on 0x0.

The logic in this test is already pretty confusing and poorly explained.
Maybe it would be cleaner to replace loop variable j with a running
'last_wait' variable that we use to catch up with all necessary waits?
E.g.,

        int last_wait = -1;
        ...
        for (i = 0; i < n_execs; i++) {
                ...
                do { 
                        last_wait++;
                        xe_wait_ufence(... &data[last_wait].exec_sync ...);
                } while (last_wait < i);
                ...

That said, this change still seems unrelated to the change described in
the commit message, so maybe this should be a separate patch?


>  				xe_wait_ufence(fd, &data[j].exec_sync,
>  					       USER_FENCE_VALUE,
>  					       exec_queues[e], fence_timeout);
> @@ -404,16 +404,31 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	}
>  
> -	j = flags & INVALIDATE ?
> -		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
> +	j = 0; /* wait for all submissions to complete */
> +	if (flags & INVALIDATE)
> +		/*
> +		 * For !RACE cases xe_wait_ufence has been called in above for-loop
> +		 * except the last batch of submissions. For RACE cases we will need
> +		 * to wait for the second half of the submissions to complete. There
> +		 * is a potential race here because the first half submissions might
> +		 * have updated the fence in the old physical location while the test
> +		 * is remapping the buffer from a different physical location, but the
> +		 * wait_ufence only checks the fence from the new location which would
> +		 * never be updated. We have to assume the first half of the submissions
> +		 * complete before the second half.

Doesn't this assumption just bring us back to the same bug we were
trying to fix here?  We don't have any guarantees on scheduling order or
speed, so the earlier execs might just happen to get scheduled later
than the more recent ones, and we don't really know whether the work is
finished or not if the sync's aren't reliable.  We can't tell whether
they're still truly running, or whether our copying of data from the old
buffer to the new buffer read the pre-completion value a split second
before the GPU wrote out something new to the old buffer, so when we
switch to the new buffer we lose that racing GPU update.

It seems like the proper solution here is really to have a completely
separate bind at a separate location that doesn't move or get clobbered
that holds the syncs for all of the execs.  If there's a bug in the
driver, we'll still see it because we'll get faults from the 0xcoffee
data write.


Matt

> +		 */
> +		j = (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) & ~0x1f) + 1);
> +	else if (flags & REBIND)
> +		/*
> +		 * For REBIND cases xe_wait_ufence has been called in above for-loop
> +		 * except the last batch of submissions.
> +		 */
> +		j = ((n_execs - 1) & ~0x1f) + 1;
> +
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>  			       exec_queues[i % n_exec_queues], fence_timeout);
>  
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		sleep(1);
> -
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
