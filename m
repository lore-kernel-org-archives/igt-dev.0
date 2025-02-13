Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD6C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 23:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388CB10E16F;
	Thu, 13 Feb 2025 23:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdsgrwDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB110E16F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 23:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739488688; x=1771024688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+n/u7rBEQ3RjJwJIpBnuuNNXWQkN6rLKcrLwrai6YAE=;
 b=XdsgrwDk2V70UfoK9p0Frq9gm0swP9QZVPQo+mHqJlNW21Py/hMesQn5
 cgoJe02TO2yDIM2aWYnjYhdpBmxUwtg2pjYnUnOyFWYhx/eVwbOyCosL7
 +yksEzoiD/MQwvD/x+W9zo+VqGevOYsr5NPd5l1RegkT7Pthm/KFhJMuN
 kVcgIx2qXsZ3qpx9b68GEWTN1ryjuomAuIbVUhoFeOK3qF+vrBkMozimd
 LD5GOJ44Xy8CFwoqbh34V3isvKVUtdYsFCtNFimEBcrTDXETkL2DX56uT
 60XOXhYhaLa6Hap5RaidmPdcuGmdBDSAZcbKwycpMq0UtLbdmqD7awtnX w==;
X-CSE-ConnectionGUID: IRoi+MlWQiKs55/CLUdBTg==
X-CSE-MsgGUID: 8TufjEJCQLyJ7GhOAzi1rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51652445"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51652445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:18:06 -0800
X-CSE-ConnectionGUID: 4dALEhXoQSOukSGL66ntCg==
X-CSE-MsgGUID: gfQ1g/nIT8exzftB1syN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118494981"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 15:18:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 15:18:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 15:18:05 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 15:18:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw51DOpqjr8JL18fctp538ymtI17iaHlq+zfIyy8197cvX5Wfmo/Db/7gln9RfeTKRgz7NmNWIlqei6Q4TttLyt/Fx8XJWdylEST2RLaGHAIMVuBYvIGoeAIyuWjfUIpuzzckYmPjXlHwnEzcBpFBJz4OXfHt4kQWgy6Bkfsg+YWsBKfJfhebl9i26s2jWgmADT3ZMRLWMoyC/Ivkr8T+gqgVs/bsjXFMsd85PVYUQgyhdSKfWKNqQgGrnBUOr5kwu5h4kTv72DMHIwBzURqhhmkBq7+/Z3eiMStG5LABOWkHiMsfXylXKKu0CrHLO7T29h3iChpOTKerz98xMRGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D21bieQeji3IKFSp/TuuGAqfhc1hhfGcVyjVkp2I1mQ=;
 b=Wzx9EKO/9R5TgJQ9INlhj/0tlYwipzbRZQx4CBATC59GNsf9vkaddyNFPu17E2zynu1H/Xz0vrR2glXLGMOpiiLKrWFZapHYSufS7PUEcUiB7lIyyzuIn+Biud21WQDo+yMll2ctJoF8+L0SVzRJCFjZNOYnlgJI5Esjr9KxLD0HlbQp6HuA6Qe82+BSycRAZYoaGbxRINaIuujpAAmUBfOHUa0rSZAH5I0qwBfkGCdGnKXF4eqpw67jvv2U4M3DR2Wag2Ken+BIiT4e62pRasPfdAAc9aelb1BQjjT36560xuq3wZwbZMK6zppAiDH0zAQn55/o8YOjHZh9jWKu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 23:17:35 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 23:17:35 +0000
Date: Thu, 13 Feb 2025 18:17:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>, <jari.tahvanainen@intel.com>,
 <ramadevi.gandi@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel: Update sub-category of Xe power
 management tests
Message-ID: <Z659i7WFEcPS8qbQ@intel.com>
References: <20250213155740.361646-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213155740.361646-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MW2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:907::22)
 To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: f08ef9ff-3b1e-4f4e-ab47-08dd4c84997f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?63v/Vfd964xVpEho88/t9k4cgPGgZRvrFM0QeI8ZjJ6ijETzxLymot4FcxAN?=
 =?us-ascii?Q?BY8EZADgXmeuMjynI/JN0w1NgRLQlgIDWVWqa1UpgQsa12daoztHuHik55J+?=
 =?us-ascii?Q?mPof4kXWsM/zcXRTwMyBtGQ523jtMpFK2wGS/PyAbzVMZlBmGwmjZAdK23vg?=
 =?us-ascii?Q?uslf6VWdciksDQXRvPyo38SKqnJni7XnYSWB1FyskifD/q1eRGdvgLq9c9i5?=
 =?us-ascii?Q?ydP55bp0xGI2kRiOU1vXWW9WH8ZaTqHwJqNuUpGumeludg5LckVJYo5J4TCL?=
 =?us-ascii?Q?zo171bFiF351UHJNsZn4Eq9ADbwOCaWt5gexMAi0pw/Vx/PSpDVurpGdMc7f?=
 =?us-ascii?Q?uBHr3p6ctLlMxs0ZOiYIl1pzpG5gaN7R94nCVB6qFjJFEHUxoYmkM+lEymw1?=
 =?us-ascii?Q?KyuSv1hzKW7L4L2pEpEHtxQlGJZwNdDbybQLsjnyCO1+1ICq38R1BmkuL0D7?=
 =?us-ascii?Q?qsA6d1VAIYPW6ITtSgKxpgfQdXobSfnPLRwsUgpU+zuRokRCYtIam4tqZQXz?=
 =?us-ascii?Q?abetSrGHg0I/nxmyqnLZyOSO69Hq7EYI7b94W7iUcPbZPXeqDW3w0nxr7MKe?=
 =?us-ascii?Q?CL5IuKpeIjXAw0FXauX1/wmPGGtuT5Bn7QoMZrfh/gPGQg47OPy1iA7Nt3uJ?=
 =?us-ascii?Q?nBb19KF2qQH9qpVIae4gobgAjdRWxhG+EzZOETsP9Lqnsa2VkcDxPMWAmsI4?=
 =?us-ascii?Q?fHftZFt/pBUpWBJhdgphBpN10XP/8faeNOencQ8HH+Lsduxox4D1Ktb1d8pe?=
 =?us-ascii?Q?8myLZ8586siONfv3SIJg6dZqOsmY5/m9iZ9P9x+u2UEWvW+GS0NfIyZgmKuW?=
 =?us-ascii?Q?V9/WLSkvwF5rGRk1zNhWvDkhZL5u9VidNiqhVmU08/B9rDMMkvFsQvwd6zPi?=
 =?us-ascii?Q?WtP99iAEx51K6EqIhtrt22AnRV+ilKHQxmIsYSW9ikbn8AndQP5A8aFPbpE9?=
 =?us-ascii?Q?c6dg8mLU/f52rQNX+Ne3E3MdsBsdSCunAF8Zi4GExFyxLSdNqb28JLmomCn1?=
 =?us-ascii?Q?DPU8Mj39JCz99Jt/afG5ve2TuQt388KM9kxS2klrPkGRcXtmMIHmbLZJxsQn?=
 =?us-ascii?Q?s/U84fTj9FEMwyRCpEZf9jOtXGzi9Utwy+2GGiT6U6AO6gUjb7ZXIpceTtZ8?=
 =?us-ascii?Q?vXhLJc9kCht/dhd9DfwsVgEcqANQsiZgJMR0wbuYeGLw1qB+FofoZrjdQSng?=
 =?us-ascii?Q?6Ndvp3cQvMbQeGsTPDisuQca5YLwjnvFm9kEMoUVqhnLnEbyohA6wwq0PpCv?=
 =?us-ascii?Q?lEkYela/ufKTHXRWBKdBwvHF+DvUWassLIn3O2jQEOgveDd4HWlqkUQC8Mqc?=
 =?us-ascii?Q?v+RmPQaIOt5S2ew37ljb+Vd8/h46ez0g2hHU2rhwCtdJdVHbmvvNVculKZdM?=
 =?us-ascii?Q?f2ycjLeJZ8DUdVNi+oe+DLCdBIiP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vwNZ01KNUv1ZNpG7mYGUVTQLzi8kAaZ+fkIJ7FJNK9L9/xU6eJobx2hHvbLM?=
 =?us-ascii?Q?LmwZAk38OfNgcOAUNuHO1ZIn6bEZF5Rp6zTC74nk0F07i3sRAxqmz3iqqPNd?=
 =?us-ascii?Q?PdwmVLlYwXsewH26V/BkfdkeNu7WXhpMY4qve6aRZqh/lsdVbd0rccJgoZjT?=
 =?us-ascii?Q?dl2e7+5Ys9N+71D1s7EabPZnfZbtiZ2DpcP4/ak2MXmODRp9cAxxuT0cmFSm?=
 =?us-ascii?Q?y1h8GTSbJz8pmWkf5kWghoJcoOhn/ZK59mSpWcAtRHaVjYRmy6dqgDn3nhtb?=
 =?us-ascii?Q?X1sLOOb8Ngo9JwbYHRjmSspZrN2msbW3CAToHmhNBQy2+SeEibKhMTtXyoTL?=
 =?us-ascii?Q?chevSPHNgXopG/Z1pN0AjpA0YGl9eKTvc4xWj0zMjg3WIybHjpHxbWge8pcz?=
 =?us-ascii?Q?Mbg5KOM3bih2DXX4zvQRgQm4d42cb13o+0xb0+O9xa5ss+OvThqpK9yH3CvK?=
 =?us-ascii?Q?QWzfMlpXsXTfpvL4PLNxsCTq75WxGWPqUG/FRoVvpRC8yVqlbcDLR8X1x+to?=
 =?us-ascii?Q?XiNoMznFvSRLQbOI7j2ljCZmy2v8uC5gYJXigy20UYLEnSBrw0FVCSumKTJr?=
 =?us-ascii?Q?PR+JOLUjEVpkF0a5dBMGr+JlN7CnmXBf2sD/TZXVdV9w9f82ctCKUCwWElft?=
 =?us-ascii?Q?r8yacMO249lzRA75W5kywTh0/NBezN0rPtce1xTsH17CiVAqRY1IVp2LwbZE?=
 =?us-ascii?Q?Lzj9eSaPM8NnMV5RcIf7d2u3DYgeQbRfDQ4CC6Edwp93Og6yJ8Z4yzqe4QY/?=
 =?us-ascii?Q?2/32f9QV4aAriIAYYFJFcVFtqD86ARPyKNzninLT7Il71PvTUzf+1BZVsJJh?=
 =?us-ascii?Q?hHCH09unxQRh11r1HihG/s2HbtxwyKMQwdENVDpf++XghVT+y4Y5Ezte+kk/?=
 =?us-ascii?Q?dVfSYdsHUMbXIzPBtVH9LwQ338y+mB5Y61mgL2ejSnTvvzS+E0ArNG0LKg0H?=
 =?us-ascii?Q?6efVeBCRMJwx9nKINDB2D1kldNrgzxfGwuqpGDHAD4shVpHKwRBjAjwKH+3e?=
 =?us-ascii?Q?qdJ4ep4jbkatN8UPeivjs/0aMBQ9OyKSgq3/GAa1FH9sobAbMxGvK8Hh7Ere?=
 =?us-ascii?Q?OA7xS0nkEW0/WZUGRFjGoi3CZCdoSaNvyRSzy85AyVCNOb98VPfeHLaimQnU?=
 =?us-ascii?Q?q/LTwtpPBtraI/Yo7fx0rDu2xCCsmsIvUSsJmCs+aybL06k9aWwVNWR7u1QD?=
 =?us-ascii?Q?ZhAic1JD59MvvEs90LaeQOum+I9fLF8qWtNhiqM4Q0qEIF7w+zz+a5196K54?=
 =?us-ascii?Q?7XQ/hZf6usnRGAKqM2gmCcaBSHL+Edw/oxA8PiqmVcmOw6Hdt6P6Pwo5SORc?=
 =?us-ascii?Q?zPgp4pl7Eztg0Q8wYAp/F97H/CAbKzv1nhHogvHRoM5wtWtA2xPp77mkjwpb?=
 =?us-ascii?Q?JZcWzOO5d1DlFLPeVTIM2Aa3R36Ix6bqYyIJatZQtMsNMog+8sLQxDpYMrBC?=
 =?us-ascii?Q?8jxSTp2vpY/4W+hETcgbNpiY+XArPOxlG4mW+zVMoE/CgQl5GXbPO4jYd9iT?=
 =?us-ascii?Q?S21Pct/rEpmbVic3/pUxyQYagvGqh6BPuBxiNfeIIhqKm9tvxgOrIMOICr9t?=
 =?us-ascii?Q?cPHAZW3QRp7rozeXfzA0V8joJvOzlk1nt5cbDtrf2TwQ0CwvfbiSI7alXmhG?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f08ef9ff-3b1e-4f4e-ab47-08dd4c84997f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 23:17:35.3069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQXPan3+SBi+wbIIH/DHCaApoUbCZbRiEUDQDedcxAcNXJip5ZVb705dBIx+wRv1ZsxgQsh+HzxaPpEdkqxajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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

On Thu, Feb 13, 2025 at 09:27:40PM +0530, Karthik Poosa wrote:
> Change sub-category of below tests from Power management tests to below:

Why?

>  * tests/intel/xe_gt_freq.c to Power DFS tests.
>  * tests/intel/xe_pm.c to Power suspend-resume tests.
>  * tests/intel/xe_pm_residency.c to Power RC6 residency tests.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/xe_gt_freq.c      | 2 +-
>  tests/intel/xe_pm.c           | 2 +-
>  tests/intel/xe_pm_residency.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 1fb6d2b53..e97195b1e 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -7,7 +7,7 @@
>   * TEST: Test Xe GT frequency request functionality
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: Power DFS tests

well, I know that we are not changing voltage, but DVFS seems more
used.
Or in other words, why DFS?
Why not Frequency management?

What are these categories getting used for?

>   * Functionality: frequency request
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..644680893 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -7,7 +7,7 @@
>   * TEST: Check Power Management functionality
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: Power suspend-resume tests
>   * Test category: functionality test
>   */
>  
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index f9e96d608..f0833eb0a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -7,7 +7,7 @@
>   * TEST: Test gtidle properties
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: Power RC6 residency tests

RC6 is old terminology... It doesn't make sense on the Media GT.

GT-C6 seems better...

>   * Functionality: GT C States
>   * Test category: functionality test
>   */
> -- 
> 2.25.1
> 
