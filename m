Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64384C54FCD
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 21:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C2D10E0A8;
	Wed, 29 Jul 2026 21:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S42mcSD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCDA10E0A8
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785362298; x=1816898298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=opmq66VFc0irZmyBQVTHoWN0x61eZ49C7bNVie3YCgc=;
 b=S42mcSD+nX59a/sPnhNbM73Y+1CMF37z70JE9V31SNHKwpPhuTDZiwTm
 GfSkToLa6zLtc6fJGqdlkfEULjbF1T2jyekISFRuxPtmtCUvKsVFy9C1F
 Z4fwpyrdjWOeHoPnyi+k5O49mI9bmU/rTrBgGDzI7ySb5ngixSoSjBut5
 MN54kA/7RMbF30WzjiDs80K9u5HTXJ+PySfxvyVLWwwU+lV2RM3ydfYHP
 k10bPh9Fbk90fxyNedYhPhrRF/JtV1tvf9LgqiYKrsaJ+uM84arzd2PKo
 e9eKdeslfA9R+qrMGTrwIIrFRO9DWVtXFXeehUiSYM3T7GDlOp6/lzCkm g==;
X-CSE-ConnectionGUID: 9mdSp5tSSDiz/CjKB5jcyg==
X-CSE-MsgGUID: 5/nhkp12Q2KKhQToxWfxFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97352736"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97352736"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:58:18 -0700
X-CSE-ConnectionGUID: LvBFpY0jTimbx7e5wLiTeg==
X-CSE-MsgGUID: eVTYsoiHTcSTMdM0MNudNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="284699356"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:58:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:58:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:58:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmYssDpZC7A4LgnXDOt9yharSk9f2v3dRGSBKvHejFoQh5XgPz8KGQy2So3HPRJwT6I+5xJNGmgsAR7RJrhz15p8zXSCNXsTNePmGVe5e85SayYEcLQXKNRzUC8MBEdlYapIOrEePp8Kiuc7WVP+krDFUNsdERD6oKEuUNWxUKE83WSitUcWoR2guG+0LTKtMx40exMpNWOuPHb+Gt3a9HxUqW4RaWyFlDR6vMFmFaZTJt7qtZn1NcFl8/gcahUDPrzvCsUzvIT7j/CwopoRNIXECqUIwQ8XGcj0A6AgfZgZ2YXke+2C+BMVsckGnyf8HOZaxAur3GQ8h9aPeluHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKJw5GTHk0WAQKRFCW5i0lEqWAxive7AXwDk95bPDv0=;
 b=TmUFGJVQosaULRc5BX6e0dNW8EB8sOBBjkWttXRJRfT2GP1yAkfJttJn896tuTHVcA7gntuUV52G/a5ttqcSZ5eQey+qj58q/dbgNZ5dRCGG8XytjNir2pu3pP1WCyXYBZYKQCGes6+dejXSSmzu/2tAxRszFUMdV7OHiuHdSLcBwLfEdlYveB8t1W1Z+tGxuimppGLsGc22m0rlqQY22qH6zb1OL+R7tLYwk3s4AU0+NRWzD2HMMhXlfWT3dWK8oQMRQOHqTiAUNTWy4fCLBQwEk18LOCMtOKzieUvoX/Gz9WT2Xc0eUlE4u7ju6yal9nndZXHLxyzxz+UIF+rbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFCB5A2AEE2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:58:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:58:15 +0000
Date: Wed, 29 Jul 2026 14:58:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/10] lib/xe: Cache workaround information in
 xe_device
Message-ID: <20260729215814.GD7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-4-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-4-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFCB5A2AEE2:EE_
X-MS-Office365-Filtering-Correlation-Id: 738c2dba-89dc-455b-8593-08deedbc7dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +w67tR0gNnsTc6Y5cPc9PAN2+EwE0ZW6UdsPQeDj0H+ioZd7pqdJPxO2rOz9v8wofhiXsAxIFQr1gpuyHb0HOaCw50HQmHScuViziB/IZsTmBTQjK9N2u/foE4DZbOot6gSnlReUTpDeLkcXftOMc9FwsYHFcxzFa+vJAF7X804DIVUghCGnVLxNJELvfEGFJ2K6pz930Z5+OqgwszllFr3x6R90lJivz/JGzkLxo/wishiYA5Qk/KxL7RzIXFMkwVgxewhG+OqGXsucPKQRUioZ0FxdELH0aWtTkz/W7Pjnb0W73tNbVY2Y2fwzf615Wu3wXzBVc0m9O7mZW11wZtHvwMuf8NElBZL2OXbbfsWQNI4kIXS8j026wT1cANPHshvK/1bFYiXV35O5T6IdHpx2rl9l3T/JlDX/hAHyKiXnhUXxklZFVo4ljJKeI4dcCclw/oq1LncmScdDIgpOKDqCK4Q0QKargtUgvywoddNeeASm8ObbSvUHQu5u3bTJX9bnJaTkqID/QaPqrLblsXLaFCOajv1MQYzlInaQU64v/0qeGUJ5VfCq71p+myh3x0Ye8IO6QMDWV8N7NtViMAYPG1K/34cYjI5J6xMNmQBtI+f0aruvJSSJo4ofwYp6lnPLwcZRRTTkFJa1eGAUGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V4KKzHLGcmN8K4Nc4taHohzaqPdfo4YKGqO3LbLXASx6zXpr/ghrktINlYAC?=
 =?us-ascii?Q?JJRXuFlBkLv+9LEoEXEGToYziUs0btoRjoqlyFMae3yZkptpwuNXj5oP4nMT?=
 =?us-ascii?Q?8xhI3rPwKXHV2JJVW5Kc8u/mqPC+E25e1mZYi4Gak+8lUCAERopOZABAVvz7?=
 =?us-ascii?Q?KG7V+KHE4loMXXmbvRrdI7q9LsuGvecaep/btwrUBK1R2CPymbM0aAYzKFLJ?=
 =?us-ascii?Q?N6yi5xzyCALajOUUCmS2yyL48uHF/rilDVYCPsmEJJuk8vcvUrpfbaDBnEA0?=
 =?us-ascii?Q?7oEDtssZduBNIZjZiA182mtYhETaY8ybMDJPtIxJnnGG+eS3FQtUzhIwKQP5?=
 =?us-ascii?Q?VHKOYy6Z5+lmlF9qOvBtf7k3/uunKHismSoetkBLjh9DGfdNujmsln9jBk98?=
 =?us-ascii?Q?P0suOalkL6mJ9YPctiYWktsF2EyF2oj9CHdJ1bIm4uYhDsUA43m0w3voFQQA?=
 =?us-ascii?Q?WKG0+J5DrbFR0oWm3t8LWC62d3lAZk0BaF2YkHu/3+uYjjrQfZQpL+h96w6s?=
 =?us-ascii?Q?qG26X60qVRIv6q9qt7dXJqPvJXeeBZkKAh0b0cCHHq3iFjelBdddzVTxJnyK?=
 =?us-ascii?Q?ZfwVfPvpxCRJ4Q8vtwPnC/AvBc9XNfDXPXbfyb530WX+h+duzDCpo/xmJbiQ?=
 =?us-ascii?Q?DlGXzT2pNsVVFjfOom5kQYS9wnNbRtK5bqLYBTvyjiK2IZg/R98ERPCAZwJa?=
 =?us-ascii?Q?ELq4910vCb8xAlaFdm8ctcwSmIt3vB2C1oRLDZTkqjAho5trAbw6PfB1LMI6?=
 =?us-ascii?Q?gM0zg7ktA7Guvf97F6fw/tJaq2OX0ppvl1oJPcyM8GbsWfIr53RnRONOOjcH?=
 =?us-ascii?Q?WwODoOcC8cBvUlH2/6CmpfV7y6sRB6ZYgteHNa1TLXrus24W5u1RRpDCvtMb?=
 =?us-ascii?Q?cSDiEctJoII8jzUdsEQWu3L8d4rRyZu/PNtDHufXDn1KOYmDuhbC+BtpUqa8?=
 =?us-ascii?Q?etgb29pu5ZIKlGRYSFLceDL+R9Poa8oUipfGo92N+PPLlSSdmm0Ms8sU2crK?=
 =?us-ascii?Q?WWq/fgqRdA1jgXqc1HjV4kcx9dz7nxpTZBpKmpuLWYGUawuOsafjXLUcOsJ7?=
 =?us-ascii?Q?EW1GWzvxfjbXUuqWtCNEdsHOw7I7a4hKmwXElrF43duN9yPzq1yzi4ba883p?=
 =?us-ascii?Q?a9FrMJwlHkWjgMXgQERBU+0FPbP5P9582NV0OBGtDs5scKfx0IHPnhWc6pS4?=
 =?us-ascii?Q?BGMaAGDoxVKxsXo9LB9q6RAYLVTVNrcXrnVIWiPcX7V1MCOiW93/m0O9iMnt?=
 =?us-ascii?Q?4ZQx6QE1vtN7GDwiKvzSOYwxoQlh11MrgrvTeGoHRanBTRtuKy2kXwqIuNuT?=
 =?us-ascii?Q?IsI0VmkHUdS7K/zKZ5G/BvZGEzUUOZa7Hdd5oo1Yacvy9dwNV3deKCFbL6WQ?=
 =?us-ascii?Q?afVwATC9kF7mRbC2f1N604d0og7PnYUTqfRO68WdbdgG5edR4DLtYgxspEia?=
 =?us-ascii?Q?kzUUimOLUySK9CwE4f07YS6iWeyMUNAGQYUXJ5Tz7tm1rNlXd3KwOTtVEJWV?=
 =?us-ascii?Q?QlYbt33vK3RQLsQB40tO5+/Ru7VzdTyEGYhBlaSehhh7Ni/LtQXsSnaUIfY+?=
 =?us-ascii?Q?1LgffM17K9LaCpeRY7cae8PXaR/sXTHLWmESuFH4t0lZHXS9tddMpJo2cIUb?=
 =?us-ascii?Q?Pmu36hY7W0GzEyfpeD+D7PJThIRc6FXWQ/15snzD3e6HvKXn1iBIKYxo3ss6?=
 =?us-ascii?Q?VtB6f0TRmYGGJh4p+WP4ljort628pLNuPxU7/xjH6xt3fPioq1RUX0hOVIV4?=
 =?us-ascii?Q?b6sEYKzArbze7k89l8l5AE87cLZ7BpU=3D?=
X-Exchange-RoutingPolicyChecked: OKCpLd6wBaQkEifxzRSi41GZTRpvBe4rPYiqm7AnVycOmSrKOoJ2nG9aDA1sgFeyWYTQngT2MyMKoOSIwisqYj5hqj1yJyVLSOZAhsSg9RBaxQh2IIiaKFbKNqhPeps9sRz8Qy9C5AEOpB/sNJ6qC5ay1OGtBFSewKVVafCOjwRnb3NWxTWHsWYxfD1zcmkfZKzpaKGq+ITjONL5pgkREDqeluHhR9qnGIOR08IG0dztcDQsysrzvjAIeEmBzeFkiaTXCKv6rXnJhduYSWjMTpK5UFv2zorozs6ayP8s4CwguSqPIEHD++C/6BP1aIpD2aQo3jyaW+NXac6bJ1Od+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c2dba-89dc-455b-8593-08deedbc7dd8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:58:15.5961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugghv6lCcSFPsoURwWqqN+hTDpFK/aRT+2M/SDkYCFascpGzJRygeDmPTQR/81dR5bYzfNB8vRXnRv+v4iuVvr/fhm80YCVwdqXUeu90w0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCB5A2AEE2
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

On Tue, Jul 21, 2026 at 03:59:57PM -0300, Gustavo Sousa wrote:
> One existing inconvenience with xe_wa() is that it needs to dump from
> debugfs every time it is called.  A more concerning issue is that the
> dump will fail if xe_wa() is called from a context without the
> required privileges.
> 
> We currently have only one user of xe_wa(), but shortly we will have
> another user that will need to check for a certain workaround in a
> non-root user context (in test cases that use igt_drop_root()).
> 
> Let's resolve those issues by ensuring that xe_device_get() caches the
> workaround information.  Tests that need to check for workarounds in
> underprivileged context will need to make sure to call xe_device_get()
> before dropping privileges.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_query.c |  6 ++++++
>  lib/xe/xe_query.h |  9 +++++++--
>  lib/xe/xe_wa.c    | 37 ++++++++++++++++++++++++++++---------
>  lib/xe/xe_wa.h    |  5 +++++
>  4 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 68e60ddc75a2..ea095b207534 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -28,6 +28,7 @@
>  
>  #include "xe_query.h"
>  #include "xe_ioctl.h"
> +#include "xe_wa.h"
>  
>  /**
>   * xe_query_device_may_fail:
> @@ -377,6 +378,9 @@ static void xe_device_free(struct xe_device *xe_dev)
>  	free(xe_dev->vram_size);
>  	free(xe_dev->eu_stall);
>  	free(xe_dev->pat_cache);
> +
> +	xe_wa_free_cache(xe_dev);
> +
>  	free(xe_dev);
>  }
>  
> @@ -441,6 +445,8 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>  
> +	xe_wa_build_cache(xe_dev);
> +
>  	/*
>  	 * Populate the PAT cache while we still have sufficient privileges
>  	 * to read debugfs.  Forked children that inherit this xe_device
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 59330d80fd1b..f70476945dee 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -80,6 +80,9 @@ struct xe_device {
>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>  	struct intel_pat_cache *pat_cache;
>  
> +	/** @wa_cache: cached data for xe_wa() and related functions. */
> +	void *wa_cache;
> +
>  	/**
>  	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
>  	 * UINT16_MAX if not available (older kernel).
> @@ -99,10 +102,12 @@ struct xe_device {
>  #define xe_for_each_engine_class(__class) \
>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>  	     ++__class)
> -#define xe_for_each_gt(__fd, __gt) \
> -	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
> +#define xe_for_each_gt_from_mask(__gt_mask, __gt) \

The gt_mask changes in this commit don't seem necessary/related to the
rest of the patch?  We still pass xe_dev->gt_mask to
get_wa_debugfs_dumps() so it doesn't seem like there's any change of
behavior related to this.


Matt

> +	for (uint64_t igt_unique(__mask) = __gt_mask; \
>  	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>  	     igt_unique(__mask) &= ~(1ull << __gt))
> +#define xe_for_each_gt(__fd, __gt) \
> +	xe_for_each_gt_from_mask(xe_device_get(__fd)->gt_mask, __gt)
>  #define xe_for_each_tile(__fd, __tile) \
>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
>  	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index e4e1b0bb7972..0f4d2edc0795 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -22,14 +22,14 @@ static void free_wa_debugfs_dumps(char **dumps)
>  	free(dumps);
>  }
>  
> -static char **get_wa_debugfs_dumps(int fd)
> +static char **get_wa_debugfs_dumps(int fd, uint64_t gt_mask)
>  {
>  	char **dumps;
>  	int gt;
>  	int debugfs_fd;
>  	int count = 1; /* Device workarounds */
>  
> -	xe_for_each_gt(fd, gt)
> +	xe_for_each_gt_from_mask(gt_mask, gt)
>  		count++;
>  
>  	dumps = calloc(count + 1, sizeof(*dumps));
> @@ -45,7 +45,7 @@ static char **get_wa_debugfs_dumps(int fd)
>  	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
>  		goto err;
>  
> -	xe_for_each_gt(fd, gt) {
> +	xe_for_each_gt_from_mask(gt_mask, gt) {
>  		char name[32];
>  
>  		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
> @@ -112,17 +112,36 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>   */
>  int xe_wa(int fd, const char *wa)
>  {
> -	char **dumps = get_wa_debugfs_dumps(fd);
> -	int ret = 0;
> +	char **dumps = xe_device_get(fd)->wa_cache;
>  
>  	if (igt_warn_on(!dumps))
>  		return -1;
>  
>  	for (char **dump = dumps; *dump; dump++)
> -		if ((ret = debugfs_dump_has_wa(*dump, wa)))
> -			break;
> +		if (debugfs_dump_has_wa(*dump, wa))
> +			return 1;
>  
> -	free_wa_debugfs_dumps(dumps);
> +	return 0;
> +}
> +
> +/**
> + * xe_wa_build_cache: Build cached data for xe_wa().
> + * @xe_dev: Xe device where the cache will be stashed.
> + */
> +void xe_wa_build_cache(struct xe_device *xe_dev)
> +{
> +	xe_dev->wa_cache = get_wa_debugfs_dumps(xe_dev->fd, xe_dev->gt_mask);
> +}
> +
> +/**
> + * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
> + * @xe_dev: Xe device where the cached data is stashed.
> + */
> +void xe_wa_free_cache(struct xe_device *xe_dev)
> +{
> +	if (!xe_dev->wa_cache)
> +		return;
>  
> -	return ret;
> +	free_wa_debugfs_dumps(xe_dev->wa_cache);
> +	xe_dev->wa_cache = NULL;
>  }
> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> index 4ff897196545..f0a826553df8 100644
> --- a/lib/xe/xe_wa.h
> +++ b/lib/xe/xe_wa.h
> @@ -6,6 +6,11 @@
>  #ifndef XE_WA_H
>  #define XE_WA_H
>  
> +struct xe_device;
> +
>  int xe_wa(int fd, const char *wa);
>  
> +void xe_wa_build_cache(struct xe_device *xe_dev);
> +void xe_wa_free_cache(struct xe_device *xe_dev);
> +
>  #endif /* XE_WA_H */
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
