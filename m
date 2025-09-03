Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F76CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 18:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD2010E1AE;
	Wed,  3 Sep 2025 18:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgUBjh3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7DC10E1AE
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756923287; x=1788459287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S5R8OQUMP83rTIrvXQ1mXjNkLKbxbBeVdq4jluoUHlE=;
 b=cgUBjh3/Z9gdDTEI7GFS8weNdPdSCfsUAMAItIHX07Y9yyJog701wL76
 9eLqXFlzv/qTxoJ47CByVY23aIySF5kFFVuRgI1wsvnBhn3d4Q7S//vRp
 m9ejaYrZS5T0v2C5v1kqI1ZfAhn4V+jpmXIiHB2uHfmMDwdWiSW84j+vQ
 7ABOFrRTsmXcX9f+DYIcGCX0VWFY2HJ7b+Qg+3Llzwwtewi358WmeLX2Y
 +FnE5MV7zK3okPiC2gtlNjl8n1HhcJei49XRnJHI2hK6pcuMEN3xDhzid
 9t2f5L+ZquoS7pj21/8iyKA5qveopjqbvvs/btSq5upr8+BJC5rsdFDA5 Q==;
X-CSE-ConnectionGUID: ugLARbRcQE6VL5Lqb4ikAw==
X-CSE-MsgGUID: 7fttvdS4TJSDU4tC5Qei4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59105262"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59105262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:14:46 -0700
X-CSE-ConnectionGUID: VK7e2Ku5RQahuZO4BP3nKA==
X-CSE-MsgGUID: J/6sijhPST+a9VqZ3rjLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172104797"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:14:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:14:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 11:14:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym6yhw5ai8KAGshIkqRpJ+iMT5Ts60hiKwIxhRMN4SPfv4s2lcYhhr5zZbZWDowGxg6ppPi71+qdFmbSEJRioyVNiPDk1cZDwSvJ82tuT9JyiLw+vS5Iy+3GriNVj7qsav/uoo05CfH0VtHlpE7+b/+mbSZAAN8g7MoFW3YAdmvla8NZ3zUgko2trjfzoElaWXlsbGXP6gYCthT48DQb+LWPnVUoE5QuCHQG1Eas2Mn9yzE5tjBlYcbcWRiwNTf9om8JyTRAeBvR/LzQJy4dowWXRt57GOaHjPerYOaZQF8ZU1juFVgD3mDoz7nu/7G2UFw6S87QyLd/XsqffgzinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvlCZDSVpxL2KD8rZIkAv5cwE5Qv4Cq2ygqmYKuei6o=;
 b=vbOSD4Nze1rnCGh3B84S6+cnPggk8+WYbNDUZWlvWMvkmJjIQ3vOdUlRJr1wOJoUS7uXman8pjo3PsoRrxbjAlVKdAs2I8KnUlmWd6lLfo8SOZaWVijZXHOAZYBELsE1ljPj/bhauvkdrupzkuSGz4h3f8G001Myvvvwd+IV1Ni6KyUMUZJBy2d+vACsvRs/ImoorysBm2YvSa0o8ABxpGy45fihXjcIkJj9GJU1u//7gwP8f2UDg42a/9JJW7tLdbHfDqo6fMn24oBZy18f4I/n9GVaMlpbmsLevUP2QMqgrHD/pcU6hJu8beGwXoH9BCuJgsyIttpEV9Hp8VAyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.17; Wed, 3 Sep 2025 18:14:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 18:14:41 +0000
Date: Wed, 3 Sep 2025 11:14:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t v11 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Message-ID: <aLiFjwXMmsTAvdRF@lstrano-desk.jf.intel.com>
References: <20250903141339.1859497-1-nishit.sharma@intel.com>
 <20250903141339.1859497-5-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903141339.1859497-5-nishit.sharma@intel.com>
X-ClientProxiedBy: MW4PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:303:16d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 253b82ee-4cfd-4d93-d3f3-08ddeb15c0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZfpwbLPpGhETa6i1LTQaVI/OXATJhZ2yO2aurRJlsXsjrTqt3IT5bxBsa4VN?=
 =?us-ascii?Q?jW9wIxeXFus0pUsKC73rspwpxWkyX5WEzwVM6JDH88KL00ArHKluz8Ga6dYz?=
 =?us-ascii?Q?4TjWFJ9BwesuwbkTM8wwSe741IgSdqwTaQHqToGVDIm0obY+/v3u5c/mybO+?=
 =?us-ascii?Q?8drOgibQDSsLa+PC7nPopQSGY4nlfRHjPA9oatVjdXMqgNnU5TtOP3w0Uv/7?=
 =?us-ascii?Q?sbPOGmOgZNfsgafaafkKc4+xtT6mnqtfDXais4vZEvV7rQdobHtVGMBOCgFU?=
 =?us-ascii?Q?7Xtv6tRPhb2HAbaJiAqxC4IL1slLAJKf6FElsPer1sgdXaeQg81zpskcFm94?=
 =?us-ascii?Q?lTJDe2p6eMNfFC2y83BQIF9sJ2jeOIw4+RxzOFiOOHa8VPvpGUiBgJVD5yx5?=
 =?us-ascii?Q?mxNj6RfJCwj1/zoN9BZN8JRdcor4VJYVbVXwSx2aYKVez+FIfon0ALtzznZJ?=
 =?us-ascii?Q?nBAXbskczrCocNzbov3OHpT24XO6Zfc5B608dXXMYp0Kc+qR7nnVcOPrIvIb?=
 =?us-ascii?Q?GbaDgvPo7H/epTvVMfO1Kk4whXzxGqrn6TsJ/iRAAiNCPNyPr0msdwnLcFwB?=
 =?us-ascii?Q?3/8ZJE1iq5rU3zbdkoNU5inp6/Xj0uaCLNXroTF67/rmM0YC2OYC0nKtlOb0?=
 =?us-ascii?Q?QyHmPv9Z5/aZgrFRFuuu36fp4bigAVwknaKYhSAKfac/x05v2uKCspjtSXKr?=
 =?us-ascii?Q?cG95O9UpoWp78sqXdMbOHn5Gydx8AvyeHjawbtow5MaM9svW8Ro1yZD6AcqM?=
 =?us-ascii?Q?kkZighYc9fvJtgVhQie4nlKJta4kHEu0FHt6BBGHmwua2H9cq6EwF/jmstmf?=
 =?us-ascii?Q?HiFotIyp8wCTlj5f9Id7KZnOvKN939uHRjbuXcMK/VjoO6qXBY6Pp+yfFCw1?=
 =?us-ascii?Q?pOZUVzf/fa+Rwmhzeb2DrZlHvMCL33MA9SZSyb15uR0GeHYNEhj6kUO32ZiX?=
 =?us-ascii?Q?DyRPTvONMgptTA4I3DbwJ0tustFAww13+o52NBDsxQIhnHkCiYpM5jX7XF1u?=
 =?us-ascii?Q?7JTkPyv1z9uCOPkfoKuRoLkcTCZBPuSzKQYikMvo2DQs43Unc1TfbmQOpZQ8?=
 =?us-ascii?Q?Rmr27zdldd+yT2g7qzGQeUVaw5GSNIMjQorHbZ5OeTnYDvQRvo1a8xosMAET?=
 =?us-ascii?Q?t+MHw9uwmROSm9Zbda49mJXO1yBReY5P/gkD4Jy55WjrNmzlpllMLFaniRym?=
 =?us-ascii?Q?I/Px1i92G4q4uibJANOjD+m9XvA77PmJU6EeZdSvM9YyGPu8e6JcYmFZdD8J?=
 =?us-ascii?Q?ihMMC9XkUFk43W2f7IRLNLsXts8zhJcRQJptmGKMUT/aRuLqr7coeBqIMqj2?=
 =?us-ascii?Q?v7gsv/+3blFyyH2wraRKiT8LuMhvH7MFMsuncxsr4nAcslGMlnSGgyGkaiew?=
 =?us-ascii?Q?tJkX27mSYfJbw6s2cbg8uwJ9a8JsGZHOQ4QfwS4vF0sseZ8LDXc3JHeNgPb6?=
 =?us-ascii?Q?tl5kTPUVU5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nawl3xWmQJ5yo2I6VCJeKCXcyGlLu30u2tqwlbc9p1JRp7fYBLnPuq+sO+ms?=
 =?us-ascii?Q?u205lbJJ9UHwBOmvhzfrMu6C1y3McMBcWgGBTGhrBsTJxhHj9A6bsxS747vx?=
 =?us-ascii?Q?I9WmIiB+mRG2qXO8QK27wSCLBWqaZ1ahYFnK65buD1XOhmBsLqcE7Z/NXoNR?=
 =?us-ascii?Q?WQkCop56ok/wxY6O1uem/8sr68r5dG5uC/E77PRo1cx1JNGTFFLZz1UX0lP2?=
 =?us-ascii?Q?ysphh94HKcKZz8Q/kLuxj70lZOsNRCPVsqHUdAWhPqbjfaBt/2GCjr0jnKP+?=
 =?us-ascii?Q?S9pnQP2Uv4N5j9oK3wN9FQMe2imv8lThNspMdvLI1Q0cjMfPy/1jIWT1J9mW?=
 =?us-ascii?Q?5Z8SfJHiYSKa8bO2t/zbZpRo3RPGfalKoRwROwOJ28S9K86EgwK2QLQHModd?=
 =?us-ascii?Q?bejO37ujCYGcS219hVgNHVuJQsOvNZvX7poB64OBn8ztmmlUEDQlnxkMbUHC?=
 =?us-ascii?Q?nx32/I94EXYviAEC9mPLWph09pRZh+PjAL9fMFUdY15mkQGtJN8KlC1j2Ify?=
 =?us-ascii?Q?0Lw7cgYygCFuoL+Ngj5Ngyd744DtN8Nm7IHd4BfiqPYw01vwkIHhBfUHiHKl?=
 =?us-ascii?Q?TadtPl5VIxTuaDG9YjMvnqxh+dJDVJ4K31gprU4ocELu7hePjidBvvpv2Zkg?=
 =?us-ascii?Q?vnUt2EkZokxcTvoj32omxL4NKtY8idk9ibYHg3RMJ7RBif93XfpNhc1ftihG?=
 =?us-ascii?Q?OGHfHg4wrCa90AcTUzDcz2anoyU0bIrNAmUQduSWdi9QM0v6pn0aMJdZYNk4?=
 =?us-ascii?Q?GDItL8S+E+IHz9WDKjySynzBHxtHl/OQY4ZL67eywMuGyvsBYQkP6+oBUpny?=
 =?us-ascii?Q?nha8dVjP0MO6LXX66sUmsNOY57bZwpuJE3QcD/smbew21mIP1v4cAq1N2qdl?=
 =?us-ascii?Q?0XAbGPMKGgxk60TA9HikeQA0ao+jZWHI2Cs5GGkSYggVy448heiEPkuvfaew?=
 =?us-ascii?Q?kI/MwTTghCLRoNP6vh8vzwYuzuVmnEmT/3zpYLR90KaRyjFGbJvrckX38nIs?=
 =?us-ascii?Q?I3zEcfsGa7glnAVnN5qSyg+CokoUURPvWgTT5ExK80y3DMu0eJ6T/F2fDgOo?=
 =?us-ascii?Q?3kZObsf3lvHRu3kh35jxoe5U6pT1xrSWSZJqRmyaU28OyoyRLt95cvDJygtt?=
 =?us-ascii?Q?rsOCksE8SqCjK72R0DhFke/mSrDCiX1y52v5vBZSUHtAGh7P/C2Xvdth+TX9?=
 =?us-ascii?Q?wqWpUHL9E/P7wEjBxNBVkLyvpKKOj2QHj7ijXqGme5doM44MZL9cEDPlq+AO?=
 =?us-ascii?Q?ortBV380fUE1bmrUWi5oUBXp8mVWvD4u41uMycu160fU2KDirngFGhG/6y+O?=
 =?us-ascii?Q?paQ340yCKxMuvdh7iPGxjifiOLrVmKZ4TbxX8RZKlHDMzlYrET/PXWk1d4T5?=
 =?us-ascii?Q?4/ld0V0MY7YZb9GPGgVEHaY+zkk0kW54S/xymNJOuqFkWEmAECABLo4zkPKY?=
 =?us-ascii?Q?r9Ooh3W2Dug1aKEYb6WtF1b4ByFhDLeVfX1RD+EglWhc4r4URf1XLf7A98jr?=
 =?us-ascii?Q?sBKZD6aa9If8tArY1k9k573c3XzKkFa8yXo7f0TN9ucb3OravOS8qVzpibwz?=
 =?us-ascii?Q?6HnCeESE6eah0qSBoNYfbAPPskNAr6YRUDCPMTpjxi7Swsq0YrML9ZC/3o2/?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253b82ee-4cfd-4d93-d3f3-08ddeb15c0b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 18:14:41.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWFAMT13uZtwRUIrV3hWW8DErTntsXrU7PbLA+FkU/s5JDVotLB8N1LfL+XE/1QTb2Me5Nf2L/eEpVpntNS8Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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

On Wed, Sep 03, 2025 at 02:13:38PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> madvise-swizzle test introduced which is called in combination with other
> tests as well. In this test the buffer object preferred location is
> system memory. MADVISE_SWIZZLE called in main loop to toggle between
> SYSTEM/DEVICE on each pass.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 32 ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e7f3d423a..4a208f6d8 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -777,6 +777,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define MADVISE_SWIZZLE			(0x1 << 27)
>  
>  #define N_MULTI_FAULT		4
>  
> @@ -885,7 +886,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> + * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
>   * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>   * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> @@ -897,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap:				mmap single buffer for all execs
>   * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
>   * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
>   * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>   * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
>   * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> @@ -916,8 +920,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
>   * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
>   * @free:				malloc and free buffer for each exec
> + * @free-madvise:			malloc and free buffer for each exec, performs madvise operation
>   * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>   * @new:				malloc a new buffer for each exec
> + * @new-madvise:			malloc a new buffer for each exec, performs madvise operation

You have mismatches compare to the section names. Building the
IGTs should complain.

>   * @new-prefetch:			malloc a new buffer and prefetch for each exec
>   * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>   * @new-bo-map:				malloc a new buffer or map BO for each exec
> @@ -999,6 +1005,23 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +static void
> +madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
> +		size_t bo_size, uint64_t addr, int index)
> +{
> +	int preferred_loc;
> +
> +	if (index % 2 == 0)
> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
> +	else
> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +
> +	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			preferred_loc,
> +			0);
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1210,6 +1233,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>  
> +		if (flags & MADVISE_SWIZZLE)
> +			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
> +
>  		if (flags & MULTI_FAULT) {
>  			b = 0;
>  			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
> @@ -1790,7 +1816,9 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
> +		{ "malloc-madvise", MADVISE_SWIZZLE },
>  		{ "malloc-prefetch", PREFETCH },
> +		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
>  		{ "malloc-multi-fault", MULTI_FAULT },
>  		{ "malloc-fork-read", FORK_READ },
>  		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> @@ -1802,6 +1830,7 @@ igt_main
>  		{ "mmap", MMAP },
>  		{ "mmap-prefetch", MMAP | PREFETCH },
>  		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_SWIZZLE },
>  		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>  		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
>  		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> @@ -1828,13 +1857,16 @@ igt_main
>  		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
>  		{ "mmap-race", MMAP | RACE },
>  		{ "free", NEW | FREE },
> +		{ "free-madvise", NEW | FREE | MADVISE_SWIZZLE },
>  		{ "free-race", NEW | FREE | RACE },
>  		{ "new", NEW },
> +		{ "new-madvise", NEW | MADVISE_SWIZZLE },
>  		{ "new-prefetch", NEW | PREFETCH },
>  		{ "new-race", NEW | RACE },
>  		{ "new-bo-map", NEW | BO_MAP },
>  		{ "new-busy", NEW | BUSY },
>  		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free", MMAP | NEW | FREE | MADVISE_SWIZZLE },

mmap-free-madvise

>  		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
>  		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
>  		{ "mmap-new", MMAP | NEW },

Also I thought about this a bit more, 'mmap-new-madvise' would
be helpful too as malloc / free patterns are lazy (i.e.,
sometimes free doesn't call into the kernel) whereas mmap /
munmap are not lazy.

Otherwise LGTM.

Matt

> -- 
> 2.43.0
> 
