Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BACD65559
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 21:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67110E176;
	Tue, 26 Nov 2024 21:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYQUFyUJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFE010E176
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732657178; x=1764193178;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GIsM4ah/pWAYD9B1DWs5My1pa+25kiXJifgQDJF3rXI=;
 b=PYQUFyUJqY0eS7bqISj0ErjTE6BYgC93EFwZUDI+JyQC870PalHrY/wo
 jSR8FCNlAtphXsQZWbF7aW4bqv+f6XwWLE2C91HYwJ4GW/Siu7FTNrXJu
 yAerMODnM1bsnQzqWsRJ2f4mpkzTR3tFCtZ3Tzyw47y9VrlgS+dUeHTNB
 VqhxV3KoAXanWZHsbpnGFoLHy2deYSUMpX7izR2cDN6L7P+XbhDfBOHOy
 LGnuYw+LnWhDt2cGQ9Iqa5ZTAGZiDu/V653m6wEnBAu/5SWCF35png7uN
 xifh7kKxFicCYWVJt2e11myZL4vy1zcEBR46DrlNl6t0RYQ/P74usZT5G Q==;
X-CSE-ConnectionGUID: aM/nngMjTW6VD+6B7dKKPA==
X-CSE-MsgGUID: v7fDgXusTaOP7t0Z2b39xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32216394"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="32216394"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 13:39:38 -0800
X-CSE-ConnectionGUID: jr7nrL+XSd6OLfkriNpzKg==
X-CSE-MsgGUID: En4OZx7JT7aGJXqx0NwypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="122717779"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 13:39:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 13:39:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 13:39:38 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 13:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrGj7aoEBP6HgOw4aX85SmUEusLlPcJze7YEEGs2Ek/2P5UZ/rQKU5erGWPoYyHT1/6Y4O6W2ctUt0ZdwpbKDso7MweIRCbRoQ9pqJ+nUrk+AbRdzMTb1fF5OaJ6Xh+pLYuld8YqKIOiuNoJP1fH0FONtZLcuHdeLu7G5CXPS4+DU8YMHQuOhgm2OKuI8g/zVHqsytVy8oHs5sDDzatrffp7Y3hFF5koKIxoZ3z6Ep8b1uSX5UWOk1+SubSM7M+rUcCkVwlhb7yiI5wGrQmka/wpdZ2XSmAw4R2d7GF8AnOByik7wuVQomjLNSCzJao1wmNIY23Sa81Wcv96O5aJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJYevxhqips82JGdU82qa13do+xXEFgpHwctLW57Sak=;
 b=jK6fhw+qSYbmcKMDaELlU903y2FOt0riEd06H5JPwGgSt0yiuwO9gyul08k8RZQJFnAi7Wm6XmfihoDwGydUtfF4KC4ncAnttSXLeG+x+oW63gBDBCzInqTPz9fpguhZUbSZIFenUwguPxIsrTzVmh4Sv2H9fYPBfYEI1Nr7dpBQm8PzCYv5Hm4vX8LSBU4OxcqHqGBsc35NvJ+qJB1gdorB/zJ2aoox5cyJ8OgTqwNkFjFv7ztMrxDdSVmaGyikMxvc3WipAbvBAoMTVNiLjSVeaXO/fviPGIDHOLJSltLQLJKtYlYD5lx3dXsly/F2bSTPGLK4PVwCFq96r73mbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 21:39:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 21:39:35 +0000
Date: Tue, 26 Nov 2024 13:39:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <gustavo.sousa@intel.com>,
 <clinton.a.taylor@intel.com>, <matthew.s.atwood@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <haridhar.kalvala@intel.com>,
 <shekhar.chauhan@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] tests/intel/perf_pmu: Fix Test Assertion Failure for
 semaphore-busy test
Message-ID: <20241126213932.GQ5725@mdroper-desk1.amr.corp.intel.com>
References: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 92836812-9851-43af-edf4-08dd0e62d1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/CLdcNRyLGHfX60/SDR5DUsHs+46Dco6uFbISJpOvTqODu6ywjEIqWEWb1Sw?=
 =?us-ascii?Q?sh2Okfo22ufQQackUw5gqng8+EtgjPfWavlK8vJPUgt58snBSZh6zwwYZm/z?=
 =?us-ascii?Q?7sZ0WTJTtMDo/S2ko4qH5XDedWq05h9yImFLh1jvBpprhSjAPY9T9zcezQp0?=
 =?us-ascii?Q?9jn6MZ4xe4V819n6Lb0Lc+HA+WaUH27heCkIoP0vYVxKmk13uTpTx/wLBu47?=
 =?us-ascii?Q?uVdwKjI4P2p/dBOg2LhLX8gdgT/CGYagzZzIH2lGfz0b0vTkUBVz06awROFX?=
 =?us-ascii?Q?6os6kK3tXgFYYy0IcYzDXo4UjOb5AG3qHHWcUxZWTpXdzqoqCD5MkFZfmqzl?=
 =?us-ascii?Q?rLxeyKtZA59Nz/MUHZAw8TtyWfZZbVjikbRw16FuujpNknsReqamR1BxKqmR?=
 =?us-ascii?Q?q5dG5BUBNXtaLnOEmD4kjpsbbFnbpbyzDINjekHPM3FWXSTJSbPbSWpEE8hH?=
 =?us-ascii?Q?gFQR70J54DttXoA7k6d/ysgG/83mlKGTiHQy/M6Jp+GEME4T1uzNIi3k1wde?=
 =?us-ascii?Q?xFdtuLXdbqX35BiIZ24cUakW/rC/xXZh7D3G7yciyiZaEGym3ps7V7f675hV?=
 =?us-ascii?Q?xAqb40yE/BoeH0Vmj9jgmCxHFZgr9cTf+rnUwvW9VAelswyz/Br3Cx/Y3Ta5?=
 =?us-ascii?Q?YM+JDO+eijtS6KZ529Hq9snGLHFgliWqdwd4fGfekpN2NwaZ0TY5g/U60tDr?=
 =?us-ascii?Q?GkQnSKB2QZSEZDto0sw9xtGmCgWLfT/c3eEmrzNd284olc2uaWmd5KpNgz27?=
 =?us-ascii?Q?JCNWaVTutWO1GaAnDMv4Br04nIKaEAdPrpbxzRDNJcCJ9BQIMFpeX+LWvwPs?=
 =?us-ascii?Q?/2dUfEO8kZTLQEZHmmLoApy7NCZBfNRfohy6QTFNw1fd5GEiyHG5lTu0Z9xH?=
 =?us-ascii?Q?ql4ATBXLkoPVkyYUHYowhGeAjZxcgEYgvBTxmr+6GxGFLp+2WZJLlGcp+SzP?=
 =?us-ascii?Q?yB1YMRM+q1zdahDKp+axnjedUoWaSMyS4HLV5DG5RJLYFgqT2c8YanReyXKY?=
 =?us-ascii?Q?vJqf3dSUDl3SVgGr9vsU+OfBOhiuUnq5JUZb80KupBjx7PHm7ck51hGtHj99?=
 =?us-ascii?Q?OMjlXtQMrwdZk3SK2Ilp2+tlFAiZv/b2V4ta8YSx595x0pm9Nx7yUwCPq0s6?=
 =?us-ascii?Q?uj9KSSX1TPpowVW6MQanWJnOjO6Wy838PrKlV0ay+EJ1XWE2ipatgeNA6V3c?=
 =?us-ascii?Q?0oEfUE5r3oETOJZmw59UIzpkFHjEgmac9OAIATcJwhm1120Yp0RBnt51vRFh?=
 =?us-ascii?Q?7AoXFPcfd85Qi8CuBqav4TmPkreR0i3vJe2z2A6Mo6au70pzYi5kWZI+9DFk?=
 =?us-ascii?Q?Djh+LMIeVDchO51ySrMHYrb4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7af6paHJYuwjsdCgbwGF2V8bnwoNhGVWUcw+UVp+kUC11PbdhCGQJamw7Rfi?=
 =?us-ascii?Q?zIQkuzU6Pq+UT215MCKEmPcPff7kaWIP/p95RjU3SjVvApXLsS5YnEbqlloY?=
 =?us-ascii?Q?hyz/vYLLn4/V4snqu0tJpWRM6DhOL7t7pXbQ/7OyMp9KqMDbwnBQi7p/Sivd?=
 =?us-ascii?Q?XMw/hpT+u/LiQgwoN9dCaNSNtrz1tFHhgpUlzXc8mll92Fc6RAuV+KyoCi3l?=
 =?us-ascii?Q?ZJaAoAWFNAY+zJ5yqTp3gom2Zwd++UelrlU2On1D8oFkdxkp/hzwov8O9/S5?=
 =?us-ascii?Q?5iNNrpG93LiW7X/1+ginj1U4b5PI3vYikRtUIqv496Qh+2ymEUUDqRIxLMS+?=
 =?us-ascii?Q?0mJYG8RkhvqMYolXlEbJvkmqIr1rzQ6EwSUSVp1S4nvbwl0mhoJ508B6W0TP?=
 =?us-ascii?Q?l5haDSJm1cse2IMR/dVSSpTm/Uci3wnYqbWFqZ60cujQo7eojka1wTQyuE3/?=
 =?us-ascii?Q?/WP0F4X11ujZcHn+iijcZKzagDlECXPR0HyfzPuRQ1GoLGFvWwKQDewdq3Ze?=
 =?us-ascii?Q?cPSPdIh4o8qm4gY+dAiFGtYjEsyPLozM5Q6inSLyZ+dPgaktKFHC7gNXTvdk?=
 =?us-ascii?Q?RznV7N0xlg8y+7LGuKLefzieHuXnVzV80EWgRb9FtdpZFAZrCKz9PRDBoCHM?=
 =?us-ascii?Q?ACmQ14xraw3s/L+wjrHBniyA8FH1V04InTsRct6U921ZeYpqAU7SQRbRTqns?=
 =?us-ascii?Q?xm0p1n4E9EN8K6F/F9uvweaYjTr+apk6hJ8Rh0wB1JloYwYocScYMZn4+Nph?=
 =?us-ascii?Q?Qz7Lyqejba9F58TbGvY7Y2H/eG0XBOeOCh5UBQYLi1OMa6Aybc7X010bg3gq?=
 =?us-ascii?Q?JyWkhoas+Px+i289yhgY6Zfhv2t1iK7tM8fhVqX+td+HSyp6YuyR4pUbF1kz?=
 =?us-ascii?Q?nyVHgSZcySW8+Lk28vMLwd4GOA2Nrz3S2tU9zeUI3Fp4U05ytDIC3IxSHHLi?=
 =?us-ascii?Q?nbTCYLJOV4zqTyEZybndkw7xoRUfdgIUEnUXAQ18kNqogGHGLxt6ia4qe2jd?=
 =?us-ascii?Q?95KTZa5dpotJP+2CIV+ziKFTGmArx50lRq2iOwRYr88vVBZgrpqPqVx6NsB+?=
 =?us-ascii?Q?pVwqiGDXlrRAaJuVXmheUEMQDJSwW1l9pW555b2sGlcqxYSsuKzEhPcHcRdR?=
 =?us-ascii?Q?wVxrAArxHdgT+FS8Tw9bL6sYZZCIm+yKUHtyNx1f010SO55tRlrqHdsI94ya?=
 =?us-ascii?Q?+PddvdIttI76W2laNcc12sRpJBq3o/4ZI/z3cidOirFzkR1XM8IInWbb/WSX?=
 =?us-ascii?Q?0RLgRKd/tJ8kNf/LeQDyqr38a0IUzh5UejfxFvQmyuYdo1mv2ymF635k6iSW?=
 =?us-ascii?Q?opi9SP+SuEW/NAf/wnQnPFkf+C+5xEqyzj8In8G90OcBPx60vO/ZQ16CgjTM?=
 =?us-ascii?Q?lyLInH1omiY8ji46obCO8utoBrBSxCCeEW8gaCFz91nzzqkcl6p8DRf8aHGf?=
 =?us-ascii?Q?sXadMuhTM4I4gANWG6IUeChCqWvM9iiRhILCCMZlK7Tmq/kFOpZT4klbnt5Q?=
 =?us-ascii?Q?h3hi1X54aiSGN7StpBiqsOfXYI0BONAZo9rp5BeuJkS4vnzH4PVyOlwTORn0?=
 =?us-ascii?Q?zcHbKWzwRQ9H7YhKvWq4C2IHlnz/5IlgTRAByrXku+2rbqLrfzTytKdaO0gR?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92836812-9851-43af-edf4-08dd0e62d1f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 21:39:35.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6YDjgovm66ovMiwjYiEDz2I2JySsfYVaZnQxXRh5lQzzX4pDoQvMHYj4G1ntJ/8oS58gjjf/JxmhWsgB5JUBbBfXaReMLU8OD9W3DKH1mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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

On Tue, Nov 26, 2024 at 07:39:13PM +0530, Ravi Kumar Vodapalli wrote:
> The tolerance limit exceeds the threshold values sometimes for test
> igt@perf_pmu@semaphore-busy, bump up the limits slightly.
> Also print the log in readable format in percentage instead of nanosec.

But why is it exceeding the limits?  We're already giving 5% wiggle room
(which seems like a lot); bumping that up to 10% will hide CI failures,
but it doesn't really explain why the numbers are so inaccurate to begin
with.  If there's a real bug causing the mismatch, then we should figure
out how to fix that bug rather than just making IGT more willing to
ignore the problem.

BTW, looking through some of the results for this test in cibuglog, it
seems like there are still cases where even the larger 10% tolerance
still doesn't cover the gap.  E.g.,

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/shard-dg2-10/igt@perf_pmu@semaphore-busy.html
(87.2% vs 100%)

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15748/shard-dg2-4/igt@perf_pmu@semaphore-busy.html
(88.1% vs 100%)

So I think we need to understand what's actually going on here and
causing these results.  If there's a known, legitimate reason why the
numbers are way off on specific platform(s) (e.g., some kind of
workaround in the kernel or GuC) then it would be better to blacklist
the test on platforms where we can't expect reliable results than to
relax the test itself (and possibly let bugs go unnoticed on other
platforms).


Matt

> 
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  tests/intel/perf_pmu.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index bfa2d501a..7f43354fd 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -189,7 +189,7 @@
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>  
> -const double tolerance = 0.05f;
> +const double tolerance = 0.1f;
>  const unsigned long batch_duration_ns = 500e6;
>  
>  char *drpc;
> @@ -287,10 +287,9 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>  #define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
>  	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
>  		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> -		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
> -		     #x, #ref, (double)(x), \
> -		     (tol_up) * 100.0, (tol_down) * 100.0, \
> -		     (double)(ref), debug_data)
> +		     "%.3f%% is not within tolerance limits of +%.1f%%/-%.1f%%\n%s\n", \
> +		     (((double)((double)(x) - (double)(ref)) * 100.0) / (double)(ref)), \
> +		     (tol_up) * 100.0, (tol_down) * 100.0, debug_data)
>  
>  #define assert_within_epsilon(x, ref, tolerance) \
>  	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
