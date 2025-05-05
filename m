Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B7C3ABB6
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 21:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC4010E027;
	Mon,  5 May 2025 21:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U21BZdK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4677E10E027
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 21:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746482278; x=1778018278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j/C2BX+qrWp+CFkyD+N+302Xg+hcN/Wuaz79HnOQlAY=;
 b=U21BZdK/FLLQmzsy4KKeVgbD7jYztycOfckUclRF+gr6qj3OqYQvWAFU
 7PvcN4v/v6N7Yh2AdRSD8+HNHDHjVQ17vjvQ7uN+u+/qKUbE4lVVeyFv+
 UzOy08ROuFOJWCZoB2iryiBlpgySwAEFQwh8aQumk6HzFyad8a5CaCAYN
 ck1BCC5UiXI8JlrujmpRz3Kgc4iHq5uAycxgAA+BO7pLK/CSO3M8wehNf
 XQ/BMlGKL2VbYdbxaJguz87POCMF5ifXc/rGh3jdtPKOalTBJCfnI0PCa
 HzLxxmcPuk+5uzC+qppkyp1gbOPJ2w/DaWq6dyQ9VU6dyYqdArkU0Yktx w==;
X-CSE-ConnectionGUID: UvPZSo9LSLuUXfhsHC5FHA==
X-CSE-MsgGUID: o+G1m65ORSqdS3TcLTpQDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59464021"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="59464021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 14:57:58 -0700
X-CSE-ConnectionGUID: NaXVYRq+RfOVKOQXWFjSPQ==
X-CSE-MsgGUID: GyFiZ+v6RkazEP5Jo9pxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="140211903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 14:57:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 14:57:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 14:57:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 14:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG4Pei9UMy8CmzS8WHSkr5YS027DE1RPSY49lN5tYUZH1vpgaep2GI8CtApwOdDN+tq4/oweO1XodZY8gCGojkMTixPY8LIcCCFX63iIf6se053LFadAzBlVYQPHQD2a5F7qHaZ5TL+6szSbN8tp9/DTgs/txp5RNgje1NpM/WARnGvxF45jSRTxN0Ozw4LM5RLZDDhQ5OHj9yX027MtUxIilRx2Qz7U2s5vcY38HtRGqFOqtv8BDVpiMEA9A0+bq9C9dwItzENX/zTtG1d73bFzkiqZxtvqGJuMrvBEqwaINexx8Nfl6PLROAzbv/KsqFkPRYE3suJPcpKRiGQu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUu8Km/yV9RDh12Q8CP85OSteTzvjUMvnVY1XzPnCAY=;
 b=PIXSvxPsJL5pHU3zDcD6hcMOMPXEkwz5GrtMuB8gdrs94HkfkCCoLv14UD0/ByoG2Odu3/WyVPd8HF7F7ik1F9fnCXipLyN4gmPc3YcppESz6EN7WLS8RRmhQi6UKxgxoA79/sYegnnidxcVyardi2f1VKrP640CbxHq8x2mK6utze0c31zu5ScTp9HcvS06AsmSByhnEwh/WSm3RW+sytYbIWrILXHX0ejgKoRDyLk/be6JvUTuGTj4M6vAGtCyXeB5LNmWQ87i33TjzI2Dm9y+TAjxL6LjYHzWz5Pf37wHofTaE3g/fX+RJfpXSPjcm05LBGEMxSopzHn5iAOgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 21:57:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 21:57:51 +0000
Date: Mon, 5 May 2025 14:59:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Check huge pages
 free in thp tests
Message-ID: <aBk0tH6WrNiLCoKn@lstrano-desk.jf.intel.com>
References: <20250505214152.315363-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505214152.315363-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd43ed5-c957-46f2-361f-08dd8c1fe1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sjWMCRPEMxkhybnGU9opZLD2jFFSEI+z2Th7t03bGU6q7aJl4P53glmw6xin?=
 =?us-ascii?Q?amXj1hEdSlfujFQSx/jdDBrKlwV4p2oNJlVosR6M6k7ICFxrMd3SO8XC7HKK?=
 =?us-ascii?Q?HUOeyuY8+AH94a7ThynnEa4HM8thpGfyn6QClH57Igw58WBpevxt9542OU5h?=
 =?us-ascii?Q?tKwHlJXaOe0FvE1NEGbWJAdyYuUpikfy6+CYnU6xqoX2vOmQTg2RPGlIoiP8?=
 =?us-ascii?Q?8kjda9tj3dUdiUv6uwLYYNBDmM0eoBo7VDQWC3QhWGso2+UuYJ+A28NDC79/?=
 =?us-ascii?Q?sYLXrstkXC1JQjTV3A2t9OwZkyaCDMKBBBC2bWOUrlSuFRiCKgKpVaVM4YwQ?=
 =?us-ascii?Q?1yk1jGyfw8p6qhoy2dkMZvhtw9yxtRml4jM8eaXMpYMCm9QzYvPDx2i2UzWv?=
 =?us-ascii?Q?klxu3FaAWXTi/0yZpq8dukBHvLT7AE6/f2wH2bk5pbfPvG0aWkimRYclKhP1?=
 =?us-ascii?Q?F/SRhVTUnJgjvNo/EUbTjSMS0Pg2sZC4H240glMXMnPiSsKlmuRR0UeQSzvW?=
 =?us-ascii?Q?vrxfWlD2ne3AT2YXZdQEthLBS5mX0mzYesgoPQCM9laS2WQRGSqKda+Ayc+i?=
 =?us-ascii?Q?QLzEZ2gOSvSQRheTKgRvTI5ExHOh0Ya3FxF+ruLUeZJTXNhBQRt6XxLJWIhT?=
 =?us-ascii?Q?bSHQSGAR+5k3WmPnDiwQ9Vc8Xf2BIG3mgE0jvJG2yPQkasRyOu2SEV6pnf9N?=
 =?us-ascii?Q?5BFIolDTILU9PRVoGriJcRJA2A1hDcDffUDt/Ew4TXrTMhqLyOUqMHiO81zy?=
 =?us-ascii?Q?+fhhuNEyJ966kei6lT194lGRhmpLSE0sJtrvCzzrWJY29AmK6psE7fueoQdr?=
 =?us-ascii?Q?LSW5MggBaT2zM3/XBD4YIFRqA5nTHCJ5tn6yw5nm+uLXybhNW9HVZKWxl70e?=
 =?us-ascii?Q?zCMG6gx6h2GE3Njc4gsMCjofYKtjhbynpNCbtFH+2VKUiuhiFkvUc0d8eEWr?=
 =?us-ascii?Q?4RxZuA+1jx/b6JUbVSR0osEJSCuks2awDfpFLOCIjq1ZMx0csCMy0DepcdQM?=
 =?us-ascii?Q?h0OAj7cS95zrY9HuZcJYixK3cBeHP8pw+fT/O5VRvwV6SW6+dAo9wB4wYdH7?=
 =?us-ascii?Q?NBkQDXpu+s+aoOvF93XM8k/1OR+mguCsk566P30hjCBYr3uhcJo64CO8icE2?=
 =?us-ascii?Q?o4vRQ02fEz+tUYzCs81KmB0G2YQHnxXKgaXbNxmJxJhvn0Jicg7agx+Waq7o?=
 =?us-ascii?Q?oy1c49P9vl6KKcaZwkYG2xCnkZTNbeMCOgLxIuB7gjC3eSU3LedkSWOTAiq7?=
 =?us-ascii?Q?8fgfOvW+iuSrdL5hhM9emo+aIaQgVflppgjA+M7f4SCB62zCeHTn4+emoIwU?=
 =?us-ascii?Q?jkFPnFzD866oDMFb8akyBjPnHKIXPKl7YE60ZRYG5GMR3IND8d84n8fgJO7e?=
 =?us-ascii?Q?nlTHGnD+u20xzscPIv3nNbTLCq+08/CJXWz2WyAmk/6lKKheG5/QzPoQEPSw?=
 =?us-ascii?Q?/Si5p06OKU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6rMMT9vzkALWo3x/D7OxVLUbEJHwaJO44P7BYLk+xi6+uEhNz8yJlr7CYCh2?=
 =?us-ascii?Q?Awzo4QfL5HDkxDsbq5NIWRES1kj4ujP7jbpsVubZ6o7r4lWiSriD21Acv79l?=
 =?us-ascii?Q?Avs16lovODwFP0gWJeUS6aPZTo3Ky0FYz/fBJgiWOb9alhfhGx+Cru3ti4ye?=
 =?us-ascii?Q?WVv+U16jXihbU4WQTw1GlCLn7l27y6JHOhNFCdZbPvme4NN55MjbmmR22S6R?=
 =?us-ascii?Q?Aww3cnDVNHv5XRnXlx4W43MJcJGgXFpAId+pKJ/IL3xqpj8Oa9Mh7oGJQQFF?=
 =?us-ascii?Q?UO67LanooC3TeGBXYbyYOjQxi/Tw2JlK50GFa+KeENaZFtYfv6IqalwJslEj?=
 =?us-ascii?Q?44WC1D51w0DxGA1swuvTIaFax/uSrVt37BlXHaxX7ORA8TSxDUO741BsMBZ+?=
 =?us-ascii?Q?5iG6UDug4Scudhlk9iIE/KBVOYruKAudQT38R8RPT3EZe3o/wOrkDJ7RypsD?=
 =?us-ascii?Q?KZdFbtBdvXj/LrN7sAMY5VETZL19J1TWfvSCAjA7+S8qX9m925JSBQ3G1AEQ?=
 =?us-ascii?Q?6Gz+H+hB5n+zZUET3LMLSOVwE5kX86C2mqE8FZ+TXBxSlGWNnDAijp9c8Kyg?=
 =?us-ascii?Q?6b/hqlt9sSPweLhW9TrMNJwCT/IKiHdq72F8oFCslKMqR7sheMJ+ytaL/iJV?=
 =?us-ascii?Q?MBuef/p8Ua/q90VSirw9q5aB8kAqnOEHwQuW+pRxMv6WqnAF+DDtxgzmsRpd?=
 =?us-ascii?Q?OK7eIy1g1UOJtrOGD8DqyMfEF+VK38uVUsdjNDDVD8/aDSg52MRxUvSeZqzQ?=
 =?us-ascii?Q?HLCotkqcNasoamzUEqECKnAGUTNn8TionwJPBIxwpfQFhVhSGiI0x+Xe+sob?=
 =?us-ascii?Q?XwsBde5t5bTNIuwz+RWVX7JZgvxc/h1kk52KfZ2/QXhEHY0TdM0SZJ99hkYz?=
 =?us-ascii?Q?sfF8lqgNRC6CVEbqusL54MW2v26lnL/Ha3RAbEKzK95x9dAm8VgVtFL+lF+S?=
 =?us-ascii?Q?XK44mWlQWUeHQNlqgwlE8eu92NFcJ8QDlmjzCrSGjliRdO5bu165s2jLLHOK?=
 =?us-ascii?Q?xUjsHYRfzasDnZ+ba+L7VBbt3OcqxWecl4gLvPLe93WIBvU3Yw0JI2KgZXCf?=
 =?us-ascii?Q?wG+I6n91JTuHEq+mpFgQWHqhLciCq93/edZrY6Jf53WidUgCJ3UaoM5DpE8j?=
 =?us-ascii?Q?4VutKPTkFYtF65BZQukWfMaRml6nunEyCtOT6Ka8wiwnsSgrZ5yJm+XL9N1C?=
 =?us-ascii?Q?7Pq+9peprLFTwc6GtFUJqYQ/uoXpibZOHNOHetEIvtdCK5zHuMH35jKzUJ8j?=
 =?us-ascii?Q?9tfeaq6i1gxH7DjejDxr3Qp4av+TlHT2KqpMFrC53UDT9OYSmwmyZ+ltP3O4?=
 =?us-ascii?Q?szyvY09aU1p/E+gECzcj9/LJMnKLvqRZEJQ05S3CZai+7PyDqskuGf/o/4jt?=
 =?us-ascii?Q?oQTFs4EtNV4qX2Duz3NQWn/pWhfr/1nyJJHu/5hrOyYc13UrQhLw8D+3MPas?=
 =?us-ascii?Q?+9icYuqNapbyRWCCcbdCayJ0IgqiIe28kuOnw2JqrK/TBG9/qsAIawIyHXGI?=
 =?us-ascii?Q?Y/IFRHyKURyoEnCVcMOXjcY26ibSJWlm6VOaja5Od9l2FYoaXV7e8/dT2Cip?=
 =?us-ascii?Q?A+QyYAsbj5DDWme5rnIQphTPvkI4QnixDwSejlxfLKXJJfe5TrIcaTDg4Iar?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd43ed5-c957-46f2-361f-08dd8c1fe1a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 21:57:51.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lbcnf6suSG/1FmEY3qnUP3HMFyNI+j8jmRLDvzmEL3h2+8glA2n30VMeFaiBTPqfcV1Y6AovCgdIb02WW/Xgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
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

On Mon, May 05, 2025 at 09:41:52PM +0000, Jonathan Cavitt wrote:
> In a previous patch, various subtests in xe_exec_system_allocator that
> rely on the MAP_HUGETLB flag for mmap were skipped in the event that no
> huge pages were reserved by the kernel.  These tests should also be
> skipped if all the huge pages are currently in use, which is indicated
> by HugePages_Free being 0 in /proc/meminfo.
> 
> Fixes: df3036da ("tests/intel/xe_exec_system_allocator: Check for huge pages before thp tests")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c2daf37121..9528c94495 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -971,6 +971,8 @@ static void igt_require_hugepages(void)
>  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
>  		      "Huge pages not reserved by the kernel!\n");
> +	igt_skip_on_f(!igt_get_meminfo("HugePages_Free"),
> +		      "No huge pages available!\n");

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  }
>  
>  static void
> -- 
> 2.43.0
> 
