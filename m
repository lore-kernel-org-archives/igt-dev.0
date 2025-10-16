Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E31CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 22:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17A610E0DE;
	Thu, 16 Oct 2025 22:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9km6zyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2778710E0DE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760653313; x=1792189313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2qS9ztSL4ELN9kXsNb6lVtykY+DixXFMzgS5t1suYNg=;
 b=V9km6zyNAJ116MpFD7kHPKmWBuJz8HwcnmBfEGWvqkbE0Txd12GFWN0E
 yQeAIT8d+hBysx4/0zyyfwYgT5N6/d6foC1/MuEYZRk23WMx1WxPqFA5J
 3KdoXGz+H4NgSdHm3VV25iZdFvsKZ9Xh1BznZvw8f4/HxDgD4RBCFYhDj
 DOXNhX9ruLAE08C7ptNhzi/DMFSomOABuVTSWi9SbXjwx7ZrEKA8lQNPt
 R8OfjXGli0FTTg/kig8Nau047U4BCbPto+fIObGx17mK0ckVBPe2+n0/u
 HM5YiTV4yw26WmthoBVM4LBi5h+C8uWDdaNjbaStxkuNbXRMVt8IwDXqA g==;
X-CSE-ConnectionGUID: P35teLjRQ1yuR7vzkA28zw==
X-CSE-MsgGUID: BFlGtRSAT8y/zlk42dDgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74205365"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="74205365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:21:53 -0700
X-CSE-ConnectionGUID: bAvxTV7NShOsXMI4OG4g5g==
X-CSE-MsgGUID: Qzsqps1BRT+NCQCdS1+lDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213154268"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:21:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:21:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:21:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca9KATj8BVryeg2mRNA83GKZeeCdEsReUHUPEfZDXd+vq1m04/9ZUnPQcVwO/5vfeeyEsbbCzlQgN7M4MvZyjv0fqlcq/T/RHBbRGdlzvJ65ijTfJRiEEaAuTWchaBsS9iifuyfVEWZeCXdbC3US1bpuAgEFrbQXpyeyYwFoXaOJfJS5PJ8BsDnaXxxnsXy/KBeWfQcDXPo7+jyH8dNORl40ZbAc1T54dgjHid1kNl29gG6Y3YqD3SLW2/AycZ1h6oo437R/P50c5FaMUM5or8BnghtYfEuAfRb8+GLDHsFOXVUt72mOumQlSIvApS9SULmQqYFHHjxX6CJg8HWMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkLdmRI0x2tGbDA9thvFn+Xp8pijz4LcQBK0bv3D6Cw=;
 b=ZB2/oQP+LR96VlF2EmaSWzaMXtNgV424agYL4Y1ZArxkZ5jsfnszOmAcIgMHC+xJffOkJTKf6x7+SOzCY7ImTUwd9aEWkexJ2VulOIivyTdlo/vxEXFqDpZVUhlIUKbpCZ35ngj1BnGUg92EQEpPoyflBmQ3ero8G/RLxWFwkS4JDKesJXZFsimkp/ZDhiVrHQ25TNhLfy9wGp5oezmsQERx3wAjtrOZpXzz59r4+MC5fWxxDbcQmV2S2CNs2bWG+t44nwliJV+961sleHbvwM1rGx7yUYaBDBaHH95Mu6UG0l/ZE9Ji8HCY9ArfxJXj1FwJyKgs/t5zJwgyGEHgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:21:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 22:21:49 +0000
Date: Thu, 16 Oct 2025 15:21:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Message-ID: <20251016222147.GP5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015060144.6410-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015060144.6410-3-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: bec8f56c-30b7-4bc3-10c5-08de0d026688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IONkGg1i7vJxR6gods4vmHen6oDh7NKE8g4+77KSt+mbmnmFIYN7tQW6K6Sh?=
 =?us-ascii?Q?6Mi6OpgDBOoErZ3uaQAhMvh3AzKRr1+itAIsrL+07HtAPvRJF6hh+SU0Fu8u?=
 =?us-ascii?Q?fGdOVS2ril2v2oQuZYrDyT99i9yAcBotlApRq+rQRgop8QgAr0zoUn9ggNFQ?=
 =?us-ascii?Q?sbzejwQcr0cQm+GFx+RxgPQBHJR8wkHx2VG5dFwzq6/o+CAeUo1x/Uf7vYI2?=
 =?us-ascii?Q?2XusdO4whWfK0L3FrxVcwhtxUQ9oNtIPt2WE6ohYNY68BLdYtSnv3MdDZeQm?=
 =?us-ascii?Q?0Ob0qvbLzbRcHzoKub9bgCCJSGT5RvVI2qA2C+fOjvO2RKAx+zxyFiuUyHKU?=
 =?us-ascii?Q?XGoGkGueAvqrivm6vmACJu6fhA8+C6XPqS1PzrpIFZxVjE2r98BMFrH9RBPx?=
 =?us-ascii?Q?pU/AGQrJO7Hux/lUQK5vTrfqi93cOA4YohNz1PGFdd5KOHZBGx8Axw7zXl3C?=
 =?us-ascii?Q?H3hTRRi1mxAbZ9him0IOwdrlBbOGtq/yWthe58Xg67iyvkzGfcMsJQI4C/4M?=
 =?us-ascii?Q?ZpcaLqUiyl6doskj7vHzwd+HbK2YdaSXyzQhbzSZa7nvjuNgWO/c3s4fRSJ5?=
 =?us-ascii?Q?UIZbP6WiIQwi5XsIvnbvxSTCKs/p8SfDbEuutZGiNByhAqMW/TNpQIH+ImeL?=
 =?us-ascii?Q?z6cJZuhLSIJJjnzoWD0WFxhr6GmOFbR/Qo9G3GO5Uo7GEZyxkpP4LVgPxXBR?=
 =?us-ascii?Q?eqCDLulyBbFdpgCM0WYu/bK4MOOK3v2Cuq4cWaMkAdo4zE2aUst8m7V3BP3r?=
 =?us-ascii?Q?OgYo+AkgeLmaBZuRCrqh1ZxuooWGEEVGworosbJOUvp+QbpQqzwBrC2R5nzY?=
 =?us-ascii?Q?X/QfywCaGDaA1Li2Z5dCaxJAQG+O0m2Cdra9zHkAajjf6f9dTxSlDbXDn3HM?=
 =?us-ascii?Q?9i46EjJ5HT2kLrI9W4V3QYl7X+L85cZ9O7LEeiZSPZGdD/q2XmKoX8GbSxyb?=
 =?us-ascii?Q?7Yr5AbcAfR2mUna7zcbIPAKsjci4maCUJZUB9+rIc1mgdygmghvbzIOrnFLk?=
 =?us-ascii?Q?2SwjtjciPb612+BNIzQIZzGjnoXC4AfOpN6kCbhXRdZh/7Ffg5dRZPfd/tBN?=
 =?us-ascii?Q?fSrW623r0dqL7jlXVL8KmdYkE8KGOhksN8FPCQiHgw0CSFdHbFpqGJ1VtBXX?=
 =?us-ascii?Q?Ut/AhefYM3l9+hPk0o15ZhikdF/hNKEdP28KzcjGJRCWiTnD400p6zjc0Ik/?=
 =?us-ascii?Q?Ft82aVuhqUgjTlEY6Plfm7g8Pg5oMCWrSLazK2pXislfv6a3acgdSI7RshmJ?=
 =?us-ascii?Q?awTO8tpGtINesqm8soB5xuGkZSh+TSJ6IAnJgZuVUrnqDue+MxL4x7Ud9ckU?=
 =?us-ascii?Q?YHWyDZKQKTVHCgpdJXwuzYcY5GKnqbKx3MJebsa4NGLvrhoCKoTtBnELlv0R?=
 =?us-ascii?Q?Tp8w0k39TQ8ueD/0qkcUBxC2Peq51xN1zcm7KJpNXFvA6jGjAErNLEWUNpk7?=
 =?us-ascii?Q?9ZY8XoJadk0C8d3aXYEoSQCqgD0B+AM+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bBWuVbDkP3C/Zha+xb4oJVlB6lsAwIReR/l0JCudyeHP182ECvs5xk4gpIB?=
 =?us-ascii?Q?7u0QUONGzgdyUg0k1CZ1ouIy/7ZUeg62v7U8upQIXFMuGFJImx0yONclvj9K?=
 =?us-ascii?Q?88CALvXDChyez+71Xp4pBibCm0oJGAiXRZBcDQDE+kJbGHl5yaPp/CljeVel?=
 =?us-ascii?Q?+CyLgqeuYQnJK09FY+SiVmRVUKrWgGp1dNmhS3yXdZADIdoSVl6IyRSAQ3F2?=
 =?us-ascii?Q?V4WdEFqkvwOYs3j77qXgEqfUUzrL0Kwro09ovcDDoNwN7GSX4kJDaf2fm0fY?=
 =?us-ascii?Q?zu4lnMRE7mMxw0VZNMIdOYF+/a7iZtwLozujThETS2/2TdkTHPxDUFjCGVY1?=
 =?us-ascii?Q?BdZhXlH+ivyuueanrug20omeTo3zoZL+4OPGhnMtujvLZUTLvObwPN+ybpg1?=
 =?us-ascii?Q?wVPbHutOfspuYUMpYpumo8781i9Njw9ffTe1ETXC16IPOUOYztIMGZo1nvRT?=
 =?us-ascii?Q?MykOh/7DUMkH1h3kGxdnXpTavp0oAA4kwfYclDrSe6SU64B1KCBLI2ZrrurL?=
 =?us-ascii?Q?CEZjbXvhxDcV35P7cHgjX9Y8oxl2U78l2OsdN9jFbQpI+3qAcxnOqw+LGyjw?=
 =?us-ascii?Q?edvvDlpr7PjvZKnqgTdm4iZsXbQtT0YbPRSEOHW+bjhMDHidwvQI3N9xpKBl?=
 =?us-ascii?Q?fx6d8zSx6VAnPNjIMwYI1K2sCi9jEFN6seJH9T97msVOqmjxlAInmOoVZM++?=
 =?us-ascii?Q?Sm/V2GTDtC6dvCH43bvZlGCvB3x4zmmBju2wVIkAhWQqJol3xtX63MmAJuSj?=
 =?us-ascii?Q?tCT7hSfQ2awE86Z0rtMrV07DR4K4ur0IBWd0sOKb5JHQwnZKeQtcl/zrzA5B?=
 =?us-ascii?Q?ah8uV5sxxnIkAeWbLbz8z98Kv9ntwhxQM9pQKkph9niUMz0KR3khdPZ5beD3?=
 =?us-ascii?Q?DhBy/mUZp9y2HAurpGLbdNnRNtQFY3twipwfHwK2qn3HsvMjeN3/dRUSxBRE?=
 =?us-ascii?Q?64dEqtdUKtc4xJB8Isa1rk1QYe4roMBhYEoUBDVC9QZiRN202IvQdFVo0BkN?=
 =?us-ascii?Q?redfnWCv5E5PMNbabL2Vv8c+Qh1PSjoYMMRyiVhvwcRgMaFl8CTXWisXH2rz?=
 =?us-ascii?Q?iE4MSCSCMmn6fb0nKlt7IVyZ08m8KWrQWN6F23Lps7gg61dwsSaVKQiB440v?=
 =?us-ascii?Q?ip/nJeQ5oWF7jE9hU3PPqnfWlJkvQF62k4SW+6pW50ncU5/ZGUYA0KSM3bCm?=
 =?us-ascii?Q?njPo+OjYXKEv24GhGjke/kSlyuZO4YjCzLR0J/pEWsYtB4Xi1nC/xbI26Zev?=
 =?us-ascii?Q?keZ1UgNTQYqadvYR3BBZcWLLSG4NWc2+3WL+mYkKBQkQBBAa6vE5Vu1Ql8xZ?=
 =?us-ascii?Q?zSCSx1L+Z2wBwsNKSVxO82FdfdmrlqQPti2EvNBuu9pwbtGEReIpQEDXWIKN?=
 =?us-ascii?Q?OdPlHdUid3c3llru+PWJTMAeBUXw/OcCZO7o8H6CNOTLcrryBI6LQJZ1mwsI?=
 =?us-ascii?Q?qMb2LoiMzXDe907XKDAHVUZUHRpbsKPxA9SX5Z7XYoi357BJgKredd4fmH7b?=
 =?us-ascii?Q?vYXX5e0iyElv+YOvneq+Ci1Fw7/YRcTpu3COENygur48G7y3DTxSgkyJakUe?=
 =?us-ascii?Q?OVMBkHO4CwIyqCBa9YJJEGqIjFEJ/9qnvKq62naEIkjegQQ6xqRPW37hEtB/?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec8f56c-30b7-4bc3-10c5-08de0d026688
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:21:49.6471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj9FUojJQemaybSUCi3TignNVaKAFkSgQH/Kyhqki+oOImR4dqLUJh5deB/Spav3NdblEjvtmM+ZE01Meg5a9BTILIIHD8myNC2pYq+ZNVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

On Wed, Oct 15, 2025 at 06:01:44AM +0000, Xin Wang wrote:
> For platforms with graphics_ver >= 20, query the runtime xe device ver
> instead of relying solely on hardcoded values from the PCI device table.
> This enables accurate IP minor version (graphics_rel) detection for
> platforms like Xe2 where different steppings have different IP versions.
> 
> Implementation details:
> - Use weak symbol linkage for xe_device_get_info() to handle static
>   library compilation (libigt_chipset.a, libigt_device_scan.a) without
>   xe_query.c dependencies which are used for i915 tools (i915_perf and
>   intel_gpu_top)
> - Provide a weak stub that returns NULL when xe_query is not linked
> - For Gen20+ platforms, prefer runtime xe device versions over static data
> - Fall back to PCI table if xe device info is unavailable
> - Reset cache on query failure to allow retry
> 
> Remove hardcoded graphics_rel from static table entries for xe devices
> as they will be populated at runtime from GMD_ID.
> 
> This unifies device info handling between i915 and xe drivers, enabling:
> - Platform-specific workarounds based on accurate IP versions
> - Consistent device info API across both drivers
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_device_info.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a853f9ab4..ba4611aff 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,16 @@
>  #include "i915_pciids_local.h"
>  
>  #include <strings.h> /* ffs() */
> +#include <stddef.h>
> +#include <string.h>
> +
> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
> +struct intel_device_info *xe_device_get_info(uint32_t devid) __attribute__((weak));
> +
> +struct intel_device_info *xe_device_get_info(uint32_t devid)
> +{
> +	return NULL;
> +}
>  
>  static const struct intel_device_info intel_generic_info = {
>  	.graphics_ver = 0,
> @@ -505,7 +515,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
>  
>  static const struct intel_device_info intel_lunarlake_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 4,

We need to be removing the major numbers (20, 30, etc.) from these
structures as well.  We need to be able to handle a case like a new SKU
of LNL showing up and suddenly having a graphics version of 21 or 30 or
something.

>  	.display_ver = 20,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -517,7 +526,6 @@ static const struct intel_device_info intel_lunarlake_info = {
>  
>  static const struct intel_device_info intel_battlemage_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 1,
>  	.display_ver = 14,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -529,7 +537,6 @@ static const struct intel_device_info intel_battlemage_info = {
>  
>  static const struct intel_device_info intel_pantherlake_info = {
>  	.graphics_ver = 30,
> -	.graphics_rel = 0,
>  	.display_ver = 30,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -675,6 +682,8 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  {
>  	static __thread const struct intel_device_info *cache = &intel_generic_info;
>  	static __thread uint16_t cached_devid;
> +	static __thread struct intel_device_info xe_dev_info;
> +	struct intel_device_info *info;
>  	int i;
>  
>  	if (cached_devid == devid)
> @@ -689,6 +698,16 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  	cached_devid = devid;
>  	cache = (void *)intel_device_match[i].match_data;
>  
> +	if (cache->graphics_ver >= 20) {

Once we address the comment above, then when we get to this point we're
not going to know what the major version number is; cache->graphics_ver
will still be 0 and we won't have any idea of what it actually is until
we do an ioctl lookup.

Also, even with the current code it looks like we have a race condition
if another thread comes in and looks up the same device ID while we're
sitting here (i.e., while cache is still pointing at one of the const
structures that lacks the full version and hasn't been redirected to
point at xe_dev_info yet.  So we probably need some locking as well.


Matt

> +		info = xe_device_get_info(devid);
> +		if (info && info->graphics_ver == cache->graphics_ver) {
> +			memcpy(&xe_dev_info, cache, sizeof(struct intel_device_info));
> +			xe_dev_info.graphics_rel = info->graphics_rel;
> +			cache = &xe_dev_info;
> +		} else {
> +			cached_devid = 0;
> +		}
> +	}
>  out:
>  	return cache;
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
