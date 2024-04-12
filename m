Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 02:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7568910E4F4;
	Fri, 12 Apr 2024 02:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBllj2xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAD710EDB4
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 02:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712887221; x=1744423221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dcpUAJEHFn1kL0sjr7iP+C+2zIBVV0Cjv9/U/b6Nmy4=;
 b=jBllj2xYAzzasox6Fhq72zvp7AGiwiJRaWNV/9R0gHlhbWRtC6x1SotL
 OU1Ohs3qumyaqLsJEE4KFp4tFYPs+EhusuY6rlvuunRFo3qFaNAqvXmfG
 Zvf5F/VQ8FI9jJh2o4hxNbrZYZZ4CiBrYL00a0zGg4uJlc1n/r1S7B2j0
 Rjc6/xZjrSJltkV+4fDBqnQZ6HDOJHTlycqgEggWLaRC41meUpi5hJNi3
 cchKLTt5gj9h/Fd9QJgCGPO4DJ15MnaloeQBM7Prz1q3XS1Gvb9oNw00G
 bXnIbQg8LWY6+pd/YaTJ80RE0hfbyHFOQBc7PlUyKAu/OQNpNN4jEkVef Q==;
X-CSE-ConnectionGUID: ja4W6qlHRu+9mbCUXDfShQ==
X-CSE-MsgGUID: PqWQyhu9ShqfFTFREfbz2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8191108"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8191108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 19:00:20 -0700
X-CSE-ConnectionGUID: EFvsQ6FiTCGoKaFXuWII8A==
X-CSE-MsgGUID: 9FLL6TkVS0WKjTm+dvD54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="52053625"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 19:00:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 19:00:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 19:00:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 19:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJKsdu2i46VFCQfFPLOFp/yd+fncxaaYdoiO8OZWYsy8wO+qQGW+SDrsV9EMaZXJHxGhSeGWO8Sp6gVr6KCDaw2UZ5jKOTEThen9bppVOKHvnBxsSHvkIwXy9vwtJgEifyUJvc4aAjJ+1eu5ZrS9VVNr18HOMhmiS8jp3TtTgwfDGEdpKoiamatkQxrcZYZu2Rw5E36vJyY0T+RssBUxCkc2e7q0p86T9ebmsWps669M65djZea95eZGzcGGjZ0RY35MmHUl2eRvwyvtztCXAe57Nu7RdWQWVmZCP+smWDIDcd0FRh9vgvT4s3BrwZecgoYVbkkqt4U8/NVf+acIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNoJpBlnvKAI8VRszZJHn+EMimIXzYvEgc1ik/tmKAU=;
 b=VMK10K9HcVAcG+ZihSzN36iZ08queGXnPuH++1I2e7w3s1/jjFAckDyhYiuUC7KSXOH0hOIasbkskRamPfjdmDiE8UvH7n+QlmG7pkhfrMDXBp26ik+eVCEXg0+uCWG+BoHC+mrJ3ugMaRQVWeiaDZprZrwzR/E4SyDD/KedIPMO3HE3XcUbaVmpAzGwxiYc1bLtvDwUgCb3xR8lMpn/ac970U3oSo98/6uqKXO4ZEFKeVs/SviyyHBt+RoHaogXbcAYp9kcMJ+XvawU6WibBun8xGThf4ICYR99It/2irpi/PwsdijAu/i6vabL6XTTDdQblNLN+GZrbwouDXxTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 02:00:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 02:00:07 +0000
Date: Fri, 12 Apr 2024 01:58:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2] tests/intel/xe_vm: Always have at least 2 pages bound
 in hammer sections
Message-ID: <ZhiVX4KFN9vs+OSk@DUT025-TGLU.fm.intel.com>
References: <20240410012148.409170-1-matthew.brost@intel.com>
 <165db5d9-b43a-45dc-bb66-4fc6436fb648@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <165db5d9-b43a-45dc-bb66-4fc6436fb648@intel.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe965b7-be0a-4da8-0c7b-08dc5a94467c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKjgV/0JTW8dI50j3B1PbX8VFAK9Sy4oTIjHjhj/6lROQakhl7MRfqu+7rFZgF7us5qu5sOpEcS/tTA54idm2lPUdl46Es63esdg9o5GYUIUR3Sne6B6h42bAMlLxRr3TK8+GifQjhB3ZMwQGcI1JXmDVV/V28dvn9VSOhikFWZ0yJdL39sZmrNwQ9MzftUZhHRROLhbXbdajrkxFDdGeT8qF7kulavnHqOhQPZnBhq9Py6mxqYUS2qBYJVV1fxtxSPhzXwFzCZ3aZkekDsXnaGF1dld43A5T5TAYN+gkYYDfuHBVnMCvTd/Gejhqf35T2H+LPSW57KRRVBOLdqnTSFo2BHgAonM4yjGBhnljyg6i3UTIM+3Pb6XQwtbzLB5K87+0AQQAYzT/UecENldkyxDlmeCqon8wFH58ytj8Uq0uKCexMJ6Q3vgkgz7HNxblxYBttwxsPZyLpvT/8FQEoJfihKUhVw8eaU3aHhXUwLzvYzB4QAswXhwTabOCZymOUNrVyu2KrJ8fDQbrmyyCI2ddBqSekhqWLw2nu8HIzTke4XRAkGOChuXN4i5QLVMeaT3z5+biXa1KgZv4tAQfuJrSRN6ZWT1NzmBpCmcF/V1RWkXR9HYhtRxXtWp1VjGlt6wEXw9Fk/oacJ7q1Ucf0CDhWHceYV/uus+MtlWsn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MS6YvDOCoMpG5OnKKj0EDLHZ2wKDBmWKyvJ112Hf7SYKD2EuHyTZ8XTQlXfm?=
 =?us-ascii?Q?/zhXEeAG67IySdNwlFc7q0CsWrN582DiBCYOpUQgJ9x7r86ZvOkGLc3XYxnS?=
 =?us-ascii?Q?0Xz8I98jYS8sVmRmLndZCe2qAJ5X5qwmz9BuWrBjtyQV+HOSW+6IZrTvnogD?=
 =?us-ascii?Q?IS5DKc1DGQ0VAjj8foECz+j+iJf4oj/XI8WiKKrkLPRxuAU1ybTeuiakvwth?=
 =?us-ascii?Q?HUyOznb0VagqbOgLndqmr+wi+w1rueBpTx0vW0d6gih9lXLRrHe/69gH8cGe?=
 =?us-ascii?Q?t30DPqPbkJGpU8+dJf/0uC/9zp4POHPFqxnAbrEMLHoZ6NV4oj15BJQwsnGw?=
 =?us-ascii?Q?KLVIOn21ZWkZZt+6Pcd75Du8NQJJlbDcKdW2QiZSQBCFuQwl9lzz37iyCT2z?=
 =?us-ascii?Q?x7a4SloolRUon9JCNxRu3aAWlBgnLILhU0MuK11iVmSSYM5/uMiSXwiKqpXb?=
 =?us-ascii?Q?rCnaisJddbIKxYJWsQix5lqL0soofkUjXCZnmwkkFrkjDioZRWL0kU+NrR6P?=
 =?us-ascii?Q?/V/Ikh8myAX53+hBi6LyPSRiqUZM+7wK28B4ZfxCOeFO1K+6Pq3XGbyFyrh8?=
 =?us-ascii?Q?SaSDWIfInJ06CWDUefof/Rhyw8y3CStzR8Ft2fiKbZm40M7vr55FL4uHYm1m?=
 =?us-ascii?Q?nVsWGQXySUfa5Wjg62dqxJx2Je5/czIt+OGq8erAReDhe/gY52ytMCnWIOmI?=
 =?us-ascii?Q?d2SJYBIeCPd8qb+c221HqSJlbyHYtfWqaO2lsckhXOCwKPUhnkGSJuugWoDo?=
 =?us-ascii?Q?IuzFx77KkvuToHsNkxdw9d0JsN4cvhtXJ27oGHfRE/dv8wVAEtj9ycGkyDFK?=
 =?us-ascii?Q?j5r4RrjYKzkvA0lhufPwQgIm35xoCW5F3GC5xqpAwtW/Al3e4Rmg4hu20iNf?=
 =?us-ascii?Q?0yRVnNWPWbSTrj/7Ugocd+RvBcwzcrwivLqArOF9wGnpLEq0Q/kqtlSabGdR?=
 =?us-ascii?Q?OIKmb7g7TbRXA/b0f/45VkxkErceGv3BIkhb46jpJH6EXk2BcVNNxMazkEzB?=
 =?us-ascii?Q?gZu3fBm/9it198StzASnxLGgdPHujeE0Iv4+8oin15jplv6yWIANxZT2rOtq?=
 =?us-ascii?Q?HOFI5xXCUdNy7zhG4I17BNVXPzSaXK9xYIib5wFqNZOBnKZl0r7mS7204PI3?=
 =?us-ascii?Q?20PvGFBEG8lJk/1VjzCRjgLNZ+miH3aPx+39mg5J3TpUy4QypVyiIHsPgErI?=
 =?us-ascii?Q?sBP3aD7TpwfOuHS28UQIcV9SJ7yUH2xbEajYDm5dmEKWy5U6OxUx5CM4j56M?=
 =?us-ascii?Q?ag67LkUpLLcqshIHxMh9RfYD3tMEd7Q5EvmSK0jwvra9ZJzeAXy+oK4t07qm?=
 =?us-ascii?Q?CLdHuqQKDnk5hmBwhWYli6imEegu3ldIZd1twBNpcDQQ2Vsu+sWSm+NJQN34?=
 =?us-ascii?Q?9gJ9zwvei16qwuus6UQ2fA/uDzsOj2QKEa75I/AIovyaXXWIzabSG3XcfpWc?=
 =?us-ascii?Q?xOPV8AsagyXwuX2CzLvdV1GFvkIf0fI2i0wGBLN0stOxNa3EfUVO6EbTfZRw?=
 =?us-ascii?Q?0kwe5c1N4xNF20NlFRbzdwZ22ucECFJuoFKjT4ArJAHwWymRHbn77lX8/DJi?=
 =?us-ascii?Q?suWOn42bsnh8dyQ3bSRVzHcDRsxT/Obq1UGQiL69bypow0f38JgLNu0rdMPY?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe965b7-be0a-4da8-0c7b-08dc5a94467c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 02:00:06.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbHsIHSFimskHiz3qMszi3oHogWzA2WaYjTmShGXsKxAQlUHucbdadw2uV1C2QKD1atzjxHk3EMYs8ZoMxZEPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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

On Wed, Apr 10, 2024 at 09:42:37AM +0100, Matthew Auld wrote:
> On 10/04/2024 02:21, Matthew Brost wrote:
> > If the prefetch buffer is 2k or larger the hammer sections will prefetch
> > the next page, if the page is unbound a fault will occur. Account for
> > larger prefetchs by always having at least 2 pages bound for the hammer
> > thread.
> 
> Is this referring to bb_start pre-fetch? It should be + 4K at most for xe2.

Yes.

> Is it possible to make the test consider xe_cs_prefetch_size() somehow
> instead of hardcoding? Or perhaps that is tricky here? Otherwise maybe we

That's tricky.

> can add an assert that xe_cs_prefetch_size() remains <= 4K for this test,

Will add an assert to the test.

> with comment explaining what needs to change if we start triggering the
> assert? Thinking is that would be easier to debug and fix than seeing CAT
> errors, faults etc. if the pre-fetch changes again.

Will also add a comment.

Thanks,
Matt

> 
> > 
> > v2:
> >   - Missed table entry
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/intel/xe_vm.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index bd4973cc38..9f9f61b7ef 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -1843,12 +1843,12 @@ igt_main
> >   		{ "all", 4, 2, 0, 4, 0 },
> >   		{ "one-partial", 4, 1, 1, 2, 0 },
> >   		{ "either-side-partial", 4, 2, 1, 2, 0 },
> > -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE },
> > -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE |
> >   			MAP_FLAG_LARGE_PAGE },
> > -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE |
> >   			MAP_FLAG_LARGE_PAGE |
> >   			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> > @@ -1857,7 +1857,7 @@ igt_main
> >   		{ "front", 4, 2, 1, 3, 0 },
> >   		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
> >   		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> > -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> > +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE },
> >   		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
> >   		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
> > @@ -1902,12 +1902,12 @@ igt_main
> >   		{ "one-partial", 4, 1, 1, 2, 0 },
> >   		{ "either-side-partial", 4, 2, 1, 2, 0 },
> >   		{ "either-side-full", 4, 4, 1, 2, 0 },
> > -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE },
> > -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE |
> >   			MAP_FLAG_LARGE_PAGE },
> > -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE |
> >   			MAP_FLAG_LARGE_PAGE |
> >   			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> > @@ -1915,7 +1915,7 @@ igt_main
> >   		{ "front", 4, 2, 1, 3, 0 },
> >   		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
> >   		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> > -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> > +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
> >   			MAP_FLAG_HAMMER_FIRST_PAGE },
> >   		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
> >   		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
