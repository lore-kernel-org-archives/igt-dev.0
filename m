Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F1AC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78A10E279;
	Tue, 29 Apr 2025 19:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx5VD6pO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09110E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745955138; x=1777491138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PabqL/7Fz5iagjDSzHCoeW06G90DwIq72nSto7up6fw=;
 b=Kx5VD6pOoBRoXzo8pGGrgDuvCGxOnITryEON2mqQeZ5A1Z6E5bPs58Vn
 zr3JZRKaGlZdRHzeqFYSydZ1+mjMntw1OOf0PzJprLOLIz3s+6tb80Ldl
 rSZ2qEbRyGdnG+glBsWPd3HbU+Q5lnL6naxrW6XhT6b/9uJlIfS7TkAXT
 q+TJae4aEMoK9QpKOpElBbVaSvrr3AfUwlv7Nuca2QaR6PlI/tVrXjbQQ
 /Sk3AsGLhD5kGyQDEMblrZ7t6j8Dm5PR/FVp798w9Cwo+3p78hGiyA6sZ
 oHBa2W3hbQ7U0BpvveOf9MS0l1k55Ywu+ZI7UvKNIvUguMC0k500jst/U Q==;
X-CSE-ConnectionGUID: LNQUMEboQ6GAYPMx2xAALQ==
X-CSE-MsgGUID: tzXgm0r2QQC9UGxza5OVrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58252387"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="58252387"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:32:16 -0700
X-CSE-ConnectionGUID: o4LPt3LPRzu7pb1CNZgqvA==
X-CSE-MsgGUID: Q80Aacs/T8eFHZgIRyklVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="165005024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:32:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 12:32:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 12:32:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 12:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxknA1+bfpIvKhZtPxfWOorikCTo0kbaNQIiyyglSVbiXzpIAAFfE7yCWJtJGqEwsK+hGJE1AGLnvkinImBfb+I3YfqRPbWji7UBXlKorRFUDoSNSTrB3XREskGUleNHe4QD9yj6CEmETCuICKWPjQOH/WsQTXBQfFinwsG/zUKxx3N5bNBDrn7swpKjESFoo3XBb5D5sUJ95PwAZohi66RZ3Y5EwRHM8PlvC4j4Fnwsr8uAkn3OwxUwWJyMuJWL7+0I/5/kyC5XeTRbptgH4xGXKRIzdXoDGZc8T4kYMhOe5FUv/ooQ+m+q3yl5FPkpJ7SlkJ53QXUjTDra+MECwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J5DWT4Ys6N3qvTk59O5VQjVx6vXS/UA14ElWw+fvew=;
 b=YGekHVRbcvxY0rAyAGbZm8AH/h1emeKGbBZTCbd6S57JwARkLEqI4NtzzfR2PgNrzX9XWPnGo46PmfBN5t0wu6Qi3Dr4jjT8Q2ekZO6mUhDudLZ3XOOYTKbha4oHIhtBLtoF0a3J1LQXJ8GB/Ir0jFCSEKzOjxfMTB6a3kO1nzCNA3tTCSxLTaDUxi7sXMvZACXDuPjPjaiddJxpnKv5I/iAWa/WbBrqsjAmT0Vpw7rRmjpGv6g1fz87cx2cxoq/CWxKF+5BwlyOXt0Lk3+GmLkS0OPo05vm9hO063n18/IPDoBNbbZmfJeLNam7PGs6R2dzLpPHjCdS4Xe5vL/HDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 19:32:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 19:32:03 +0000
Date: Tue, 29 Apr 2025 12:33:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH 2/2] xe_exec_system_allocator: Require huge pages
 reserved for huge page tests
Message-ID: <aBEphri3izQnlHke@lstrano-desk.jf.intel.com>
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
 <20250429192956.275280-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429192956.275280-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: df2373a8-fe8e-41ab-8d4a-08dd8754850d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZOfTcoIlsUpqRkR+FkcvCqsHVfjouBz7ASENzenOnOcqQPZZf+TUFE2sqqBz?=
 =?us-ascii?Q?pQNvoG4t+6nrqpO1upzt4TP0pQwu2dPGn99w5M0AlBVOeO5RhOjq04bMxwnu?=
 =?us-ascii?Q?KIOfSMhuCKoNYD1ySgjJWe8RBGfOTPqTOL8ybSgl6z4+t6XLhJy5Ror2WGLv?=
 =?us-ascii?Q?LBqzcO7cn0QZuYeADhu+M128si8teidfY5pHmXmmyTvKLXIGIZ/+9MWhPIpn?=
 =?us-ascii?Q?rsiTBn+VhjNcwYiM+eurA0JHfDPJBLUMD+YbnNKDHdzcDS4HKWt4Y/4mIza3?=
 =?us-ascii?Q?m4Bu0P+1xXC6Ha5fmkVqCNVVzcwTca9F+DXEQ1AKrUYt5vx5uz3D0arsJ/zC?=
 =?us-ascii?Q?yD0BdYIRGslqJfFmpV5Ot29rT8fTQvNgp6u6mbwQjbS5cr1UnxcbaQlJYJZJ?=
 =?us-ascii?Q?zsgYrghgJjL0aApc/AKv/leR88PwD3IVj/nCk+WInzd07t+lQuYUYfOqd6OI?=
 =?us-ascii?Q?JUmoeVmA/gfFxQ0HKM5DLE1rx+CrTI5igbFmfP2q8dKWOgVVqaT5jTQl3nvQ?=
 =?us-ascii?Q?6pIMVdg/NZMYV3kRaQD152SzMvn/lYGthYn2HXCFGkycl9xQaC/TNvMwllNt?=
 =?us-ascii?Q?hoQmGa/ErkoMR4FIrb7Ybk0LiIFwGObxck07osZ9IGFi6djTXrsmwKVpE20R?=
 =?us-ascii?Q?w1EDoROrqls3AV0OREhz8jKuloISGLs3awWEwLb4NECJ9YIcgv2jPz3S87mA?=
 =?us-ascii?Q?W8h+0s03lnBu/rcc7XUlGDevglJ4iTVMq4spq4fLl9kAiV6AGhguKYTQjMzG?=
 =?us-ascii?Q?U9qFCGiDd1p+TR8AebQBeCptb4MmF9+O4TSRMVrSWJJ4bDKLtI3ydDqd5eDU?=
 =?us-ascii?Q?H5j0QP4xgV7uoUq3VaQu5A1ysSy/wGsNeDXHEePok08dYL1nn0JUN2uele5/?=
 =?us-ascii?Q?GGI4FQV44OCl2cOlOmuO3mf3iK8OBEacC/Trr9HwB1cQSCioqrv4fLrj4Xmp?=
 =?us-ascii?Q?da9geT1TOPX8JAIWlwHbNQCbONfB9mg28W/AJFk6uB0k/ddl6Iou04g4ZqYB?=
 =?us-ascii?Q?EqEa/ktQKZp+DsZktc5Ca2vN0kpcVJ771VXbfPeTyp/G2FbeFU45knd5QndY?=
 =?us-ascii?Q?qr0HVJ04C0YYMGVWdfKDDeCNkAoukfo7ExnmWkzvooZUWq2+5DlDvAr53lMx?=
 =?us-ascii?Q?i6YdtWl3z37BYg14MSE4rQ8SU16Ud9oJgqSF9kKkcAbo3Zhm7Y/lQfdIS9rC?=
 =?us-ascii?Q?XPO7rhpz+jRKrk3IzcSO8hzxNC46KVrVBJo5LE206AJBXO7uBoF9K5I/wH3j?=
 =?us-ascii?Q?/R544E+/rJXtmJ6LSbYuF6McAquwtgz4/ER6GaSzsUNQ0zSfDGJtYkgwumt6?=
 =?us-ascii?Q?YeO/+nKdSw5jXc+yAco6bhdVQckyRmXsNMTna2ozMyiGxkiuUKuha2/8Sf6C?=
 =?us-ascii?Q?5ZbbNpdnSJVJSKlrO2bs12OcfdYW+ABr4Q8Dg2HYvGjBjX8WpRqLaKbdbunu?=
 =?us-ascii?Q?ohPWnDE2iwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hKEG6rdTC/KUb/R6+DfRAxhK9Ofs/rFtc318cEjH9CdZxrkEr6iJe52p6U8C?=
 =?us-ascii?Q?SpM7ExIGpdcyi7er4zLMU3O5qsI62/Vn40F2pRgDxssKKxVFTNNf9rvLtQvC?=
 =?us-ascii?Q?Ic8dBK13WH2GVokYzzwWdUWQmWuy82v+QSUPouzm4nV+6I6QP9GaXR4NVvsk?=
 =?us-ascii?Q?dyYRUb/QrCz1oNrPUFOzrPSiHBEfhQYh+vYvE5yyY03hAhvJgfO9PZitZodn?=
 =?us-ascii?Q?x4PQUYMZ2e+/3c3VaZttgU2HK1OwYJCDbwF/dET/LLvqtNG92hkZGEJzFc6v?=
 =?us-ascii?Q?l2DOS7T/vewHQ4zV3zbLEIzsJz1hLNqYowg9EN8wYDv9zUmPKAcqJsfhNk1M?=
 =?us-ascii?Q?rGiphSVCiVUcqtYc6HOGKcjYh4K1oW1LwWrzMA9UjLIqY2h9M0WnB0CHCRJQ?=
 =?us-ascii?Q?eihqvWUHW9dH0ElFm7KDiWQCxbRFVMiIfTV9meIZ1udZEAhH0CLBHQofgIFF?=
 =?us-ascii?Q?+R1NtELJ8ozT3ZRPB95ebZtO9XjKI3CwSg3LlxbEOd4dDsxkcGs6qlhlPvyJ?=
 =?us-ascii?Q?ok1PDq1oWdB65UB7sBQM6yaBLZcUI2SXA55dy4uGWf+eIvkTx2PB0+6VJ6y0?=
 =?us-ascii?Q?f8ZSHxjzs5oMWtFFIsAEav/Y59QYdH9nkTGuZtcfmnYSCpHf7/PMC7z1Ln8O?=
 =?us-ascii?Q?hDeW74zQ6Q2KYxQyuyVZM9mr9alyFhbXGdG7OlvBcaHYgWr88QnG3qOgWb2T?=
 =?us-ascii?Q?htWzr/bGSAtTR+pHPfIz7nIOQbb12DmvNw7+mCps0wDrui1Ii9eP+6FkFckF?=
 =?us-ascii?Q?3dAR2txyHzFjAGcWKWl3Ib6Yk29laLntl3uK6UZDWZ0WIkBqDKSIvWVbgy+w?=
 =?us-ascii?Q?lcYbbBc+7aUCwBFCtkZSbvc5VfZ3Xy2E8AmNHr23n1gY4synsp7ZucFOzpIX?=
 =?us-ascii?Q?rbxGE2WsCtv/X7PcvzxtkGk3baGcD13t9oB8WfPzaO+RxFA3sG3/EE42cjy0?=
 =?us-ascii?Q?dZGitx4Lp64TcICBRR/UgtLY/2Q1svNgV7X+LOm0/Fn4ucKwlCOnLkIGM2Si?=
 =?us-ascii?Q?YITvW+wnBUWnswCc0hie1yn1VzPH1x34q3//7HXkp1fQVnSz3TwJowNKTJUK?=
 =?us-ascii?Q?Hr+x3LbxBLDom+hMJg1WgOFjOT2XciKO4JT/1mIfKqX2mc83GpUSSTyE5zYX?=
 =?us-ascii?Q?qZuRLtShHCtgvsA6lMJHNoSIC3wfPvxGVa7ZmXxZi3JGHFbY1Dos88bP9Yok?=
 =?us-ascii?Q?6tzbDCJW0GRDWBY9c3xyKqO6Jh5kvccL0UZVymRWlmOxXeGuJPMB9IMJR7DO?=
 =?us-ascii?Q?5g10TdIStCtWn9OOtU4E8EeVQHHPo32N6PCNJ0p1d2r3w5BlOCAlGUhgamCw?=
 =?us-ascii?Q?ZS3BHsB3ybU8E6JPe9+q5SgTqe7YJPjPa9FuuFoNOeDjX8LV50i3aHEuIrwN?=
 =?us-ascii?Q?DedfMzRE0ej1GxMaQ7aT6dcYYNCmSiRcGnljzBNhen2ebRkjKQqQl1vEsumb?=
 =?us-ascii?Q?1fSvO3JCB6RkYcG+OrU36NH5jJzIY5qR20msIVHbpTiH4MVJqSFr27pw78jR?=
 =?us-ascii?Q?b6HlbxBjGzZzDrbtsodOZKyKmboqFGV/VCiL7lu2tPrOm0xMathG7VK/Eh9e?=
 =?us-ascii?Q?VUZIpUyCsirvswMasAZ+H3dOC3ywfS7YxIy9KvOKxCWy6igPAS1C+7lisEF4?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df2373a8-fe8e-41ab-8d4a-08dd8754850d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 19:32:03.7617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glYQGAMedpxEdjo4jG66pAreunZVXNCz/fZhmrFxKKxbpUgMExl4IwhyeE2etXXGjmllrrnXa6BkPe9cQIjB6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

On Tue, Apr 29, 2025 at 07:29:56PM +0000, Jonathan Cavitt wrote:
> Various subtests in xe_exec_system_allocator attempt to use the
> MAP_HUGETLB flag for mmap.  Doing so will result in an ENOMEM error if
> there are no available huge pages, which can occur if none are reserved
> before boot time.  So, skip the tests if no huge pages have been
> reserved by the kernel.
> 
> Fixes: 41ee4d698fd8 ("tests/xe: Add system_allocator test")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Thanks Jonathan I was wondering if we could do something like this.

LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e1121a8627..8a55e0ff64 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -964,6 +964,12 @@ struct test_exec_data {
>  	uint32_t expected_data;
>  };
>  
> +static void igt_require_hugepages(void)
> +{
> +	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> +		      "Huge pages not reserved by the kernel!\n");
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1005,6 +1011,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	if (flags & EVERY_OTHER_CHECK)
>  		igt_assert(flags & MREMAP);
>  
> @@ -1439,6 +1448,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	xe_for_each_engine(fd, hwe)
>  		++n_engines;
>  
> @@ -1550,6 +1562,9 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	if (flags & FORK_READ)
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
>  	posix_fallocate(map_fd, 0, sizeof(*pdata));
>  	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> -- 
> 2.43.0
> 
