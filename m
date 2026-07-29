Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3FDC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 21:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30A10E0A2;
	Wed, 29 Jul 2026 21:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRXE4IsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53F210E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785359077; x=1816895077;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nfS388sKzoS9kuDn7xHcQOv/0yen2djjRYkzVwhNjKY=;
 b=dRXE4IsXzjPttL+xA80gezT8vZt1R2wu7Roqm7C3wupxJ08SS1Dek/CE
 2dEZVWU7yTI+JaUT+QO9iawYI6YOERiuEXWsBz0Ih5ZSMttYW0mEqcc+D
 TWAncSv/YlMxFsXqoLJ46OVzNgNG7r3WDVpoNbggjCnfW/IsUcYgxCvfN
 v8egup2TZzkR9weby0vc0A+qI90sjvMdBHKQKVo2wX3Ie/kdcLbuJ7ugq
 +qanHM6O09S1Iz6FGdS6/3eDpzZrd2nEtFAhS8Cekmegrqf/4sh/52bwb
 /VqPhldBtbBA5q2Z8r0VqvFnfnn4VMXPDHsrFrpAS8Xte2T2HF7/3WU5n A==;
X-CSE-ConnectionGUID: O5Mhvd06S/S6FP67AMzXkQ==
X-CSE-MsgGUID: T0gk3ufCSSaqgUvpwwxW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86053101"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86053101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:04:37 -0700
X-CSE-ConnectionGUID: 1xnRZnK/RH+fymWlRYX8+A==
X-CSE-MsgGUID: oKW3dByZRxuKND7rhtVxSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="256782770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:04:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:04:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:04:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUaGM75KTjjp6Pt341Y5dhqlG8PVo66d7JJsVzxLhaKa5EjW281X+dqFYnlRi7cqWKjo+4uJdJeCGGCNH6NNGBt4xK/12OiJoaQXNIm441IAhuW9b3LCK2i6esn9yCzHj0px3MjuETa5EVgnRcAQu3/ts0f1sTaKgZODl6zOc5AyrrejMvft5a/i6f+5EwHhL2VzdE663/sqzpO9UC+ZWW12wJd6TfI5Wxz6QlSkjTi/rk8oibeyevwCbw/DzM+rJ67yX7G14V59ejz7rGaRucoN8rzgbqRgUOynVxYh5vCVKHVwFZ5l4jYv2uCeU5EcHWxOo9y/lsN8TxelP+qrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7W9yszrrZp2BYcQofJFz0n8cg+NSlSxs86KRWH5Edc=;
 b=naW5izYt9uT3BssJQCWq312Cj2KBh4E4j9pICLJkLHl4wog5uV3irYWvOzBVP7pknAvA8vUohtfEbVkBVlbEetLb8/tDLqqfe26ivSJxYpRnJMS0zScH1AJLUc52W5JjiIlbhz8vALDzOGDPsNH5oKv+XWXbc2i2oO8WVBWCPj0s3b4JmXj21ENIqcUMNUt4zJ+8m2/oZDa6vfmAvu/uQw0VuZAUgKOjTgqw8TvR4LkKz15qKEquAgclLk7IwL9RizokeYGd8MO2HZIRuhXi2zPFsfIDUQAHoD6epA9Rt0j/hkARougjr2IqSA/D7DHVQ+HTXTIN/MwVVFd4ykTXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB9854.namprd11.prod.outlook.com (2603:10b6:510:3c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 21:04:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:04:33 +0000
Date: Wed, 29 Jul 2026 14:04:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/10] lib/xe: Move lib/intel_wa to lib/xe/xe_wa
Message-ID: <20260729210427.GA7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-1-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-wa_14026539277-v1-1-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fd309d-9ddb-4bf5-20be-08deedb4fd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 17LI0W9TReLLA2dp1TESOEfCdbcSYpYvXVmpHQDzXQK+D59juRPaY+P6yeXDzVu9DgIVQ5e4FkjWfzisLK69Al9rg4COAzlx9fUPMLGy///HWe/FmSZLXk8EYzBqcKQHs+PfVDHHPmKEdrRW38zWH90C6rqxduNrorkDFSQ82mvq5iySUPFyt+Epu7OGXPqINNKnC/YorlNaHseNmwFcfGaR1mjOyD+PjaX92R0xWMALU2NHES1fk6woi4nuwqdCib7C+m5Ta4is1qCEpZJk6HxsKDfjvNjqyhiBQD3d6fsymVd5IjgSLngpTJV+vTQdH0Ppto3s8EUvxqVopL81Mop9kCSKljFggruxPLiclESTZszTrRAs9QMrxcCUdRYVH6UYI99u5saJfAU+EOqm3i+r33MDX+Dpe3VV94lBP1NRdX/pnJ19oSsCfAeXFJvyxjPhFqqbZOMBOG4VxfGMyKeq8TaNGeXvabG9SjUvnHxQ89z75+G1H8uqvZCqc99iibr4h7Znzh8KihNEOVG3aLdxGpXCaBfyTThc0arCauAYKkZ2aZ5yeV9TTU3BvtQHUQiZToqvIGI0s5tU9Hw4eeTRSRf6ZyCvw4EarIB/u4oRKvoLL/1swrEjyLDNtMIjHSDidhQu9neSN2H7orsPochvAEgnnupjafO0a9vioGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zs+uxhj0zeXlNUzp3wTgHS0vCNutZEefn4nBVRiko/MAq88yR+AVCvXCvr?=
 =?iso-8859-1?Q?J8wPAw4MvEjo678YSNApdTBUwo/XVnrm1sYEQmFCqnW+sbX0fVQXYNy/FR?=
 =?iso-8859-1?Q?7cU4jUEI8D2KSyNjWoz9BHaA1szAfBTjCOH3ku6wgHjoR2pyIUaTNBDgOd?=
 =?iso-8859-1?Q?d8wF71bKu4tsjjsLLf9LUye6DpSX2BfPqrY1VPi34mHK5TXGoSbQS7TNlo?=
 =?iso-8859-1?Q?TCUNgRplil+8B50YHtb7oZ9xz1ErES5d4lLJcYQRK15oFsvoX0Rl3sbEdA?=
 =?iso-8859-1?Q?VlzWleH08OeUuu3ONIzxXCB13EyLKR593OpSwMut2sdsNeCKfaPHYPASQb?=
 =?iso-8859-1?Q?XZEFIMgEXOs/I1KDn5kKGfxOQVtdSvEGvsWyxfSE+TThSLEopBEUWyoZKz?=
 =?iso-8859-1?Q?+8giWiyKycZL6vp0mkiqBgqjuybKuyS9pVseCgLiWpeqeYN1SlVdWem1ro?=
 =?iso-8859-1?Q?K1WPV+DqGQPhwkJSzYErQ1UVBxhAN2krn4ZsswU2aAb5Ux7HAodfULNr3e?=
 =?iso-8859-1?Q?ICwY4UU7taRaOzrEeKUwZQ1XH9y7EG4Ti+1s7dH8INotn6jw3/BXuDlj0K?=
 =?iso-8859-1?Q?PEISPnUeCfSiMormaRhUMhuoISSBZsjsDJfjVyIwwg82xZZpzTj5f635qA?=
 =?iso-8859-1?Q?YqtXl9zJGU/FvxzPm68FRgo1ROhVAAlFGZXJZc7Q5tOHVhq/niqS/Wgsre?=
 =?iso-8859-1?Q?UYFzPSRx5Xct6o4PzNcqUZRliF7jk1W0BzfXiGLsH+RX81cr1UeHQq9ft/?=
 =?iso-8859-1?Q?08lk3muT9rJuHD1DmOCtl8ViXkG2NIV07lEa1P72nK0cwEs2DxRZnZ5S/I?=
 =?iso-8859-1?Q?byHjjz7NGZxpkILvKvbwP9BsMO5l9fhfsG/MEuPm9MHessPo/y2axK1Cmy?=
 =?iso-8859-1?Q?l8+hp1VSv46GMri6OUYRWFCuFJDuv29mNU1MUtibGs+llSGosS88/1yDR6?=
 =?iso-8859-1?Q?PNC8JhKAb4XXSgx5wRr4N/aCFe0xG0cJoD0dxMgpACM8Xv/1pl9em88OrC?=
 =?iso-8859-1?Q?4xhvjOFBt/O22LB4VXtoZH5lYZUussEzpDTZPI+4ED5b8J9A1kCIEj/ajk?=
 =?iso-8859-1?Q?p6K+FlJGYMnTltD8TVYXyzValW6+Ep6nknK20vdooO0iY4lJKjm3g9Nip/?=
 =?iso-8859-1?Q?0sagq1YKI+oCjSH5OJnLnOuO4RI5q4t7c6cvwldehAN2zJr3Jqi0kRg5Cr?=
 =?iso-8859-1?Q?mGebFonekGDVMlyfCHeyNnVO7lZVY8D5JpD73tOtQEMnaJTaMB7HcEbfdW?=
 =?iso-8859-1?Q?cRoMlX8cEcR2xGsHCCX4H2kl6aNlJcFLti4VJNyfwVB1t1eJkqpK9khL9b?=
 =?iso-8859-1?Q?mVsnBSjdjE6hu548ZAzL6+lID7+fHPsbyBtWUsGuSplUUFEv4/27fsTxaA?=
 =?iso-8859-1?Q?Uge6nxpBgJbWX4KwXC3DsfSlt6eMNWZegiF/m3JhWmNoQ4fZ+AlGhq5COs?=
 =?iso-8859-1?Q?VL1+z/4290sy/5dXbbKd06ZQchseqKc6ELnzaDUN7JH6pfKHknXIIbGBvw?=
 =?iso-8859-1?Q?zhtfhu32WbVWynOwZ86lHYm1Frx+dMXJTBP4ARs88uOY/Wcejo33pbBimf?=
 =?iso-8859-1?Q?an7d/GgqQTN6QQoN5Qg6dA1rY9UZ2tDhKpem/fRLKHsOO/im6lDwYpftPx?=
 =?iso-8859-1?Q?tiJoP/LKAWV4a6Rrniu9Q/47r8LjrqAMPypQzB1x9CUmNSbu6LLkIsTmqV?=
 =?iso-8859-1?Q?VDZNrQ3uVQoLxoQK14uDmOACG+Tk/hNqmZrC72qSMNOdeHz5qXrJnzgzxs?=
 =?iso-8859-1?Q?8vGlf5zBa4AklXCRmlXTRn/Aj6Chjc/gWS1Qg+s9TW1Uy8wguBM2ytmdn3?=
 =?iso-8859-1?Q?zPJnOcDzKq/zBUyCvaMica2lV3yo8/U=3D?=
X-Exchange-RoutingPolicyChecked: oHPMNyQgsLgjXMQPOd0povupHUvsgat65q264oGweNlNpT1ah7PCRESUUT/hGsvLdPLpFuDG4fo7rJM1L9YnLcNwMHJ3lHJzwo68rwyFws0/70z8ZE5qy9PzTANoLNiYr/yv0cFh2ezv4DKnDMYJY7jYBBMfnFZqbKA9t8y+7RdjG4NHEQoW6rB0QgJqDEyUhztVXsziTjQIBLRHPB5v+cecrE20Uo6RRdls9cvJjWf4Yh2qfpWo0mRAj5dc0SERAhs5uxyf7TWgD8QGd57WixlBjpfemtqO+JjYJn8EUb5xPRZmoi4P6B7fv7cDMLSm+DLQr/WnW8UpgOAyusYcsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fd309d-9ddb-4bf5-20be-08deedb4fd00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:04:32.9366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uI42uZlfHKNOsGf+vWcUQXYrHUu9ZTpFWN6nMPqJpfR9c6i/437PkChF0vSnPQe3pVxRmCwiNlloHKn9YrvTFzfk+hLeLhVKW8kE7LsX5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9854
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

On Tue, Jul 21, 2026 at 03:59:54PM -0300, Gustavo Sousa wrote:
> The functionality provided by intel_wa is specific devices managed by
> the xe driver, so move that module to belong to the lib/xe folder.
> 
> While at it, change the function signature to match the adopted
> standard for lib/xe (used xe_query.h as example).
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/intel_wa.h                 | 11 -----------
>  lib/meson.build                |  2 +-
>  lib/{intel_wa.c => xe/xe_wa.c} | 21 +++++++++++----------
>  lib/xe/xe_wa.h                 | 11 +++++++++++
>  tests/intel/xe_oa.c            |  4 ++--
>  5 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> deleted file mode 100644
> index 765a5948ef88..000000000000
> --- a/lib/intel_wa.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2025 Intel Corporation
> - */
> -
> -#ifndef __INTEL_WA_H__
> -#define __INTEL_WA_H__
> -
> -int igt_has_intel_wa(int drm_fd, const char *check_wa);
> -
> -#endif /* __INTEL_WA_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8db9fffdecec..b31936d6c3fd 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -93,7 +93,6 @@ lib_sources = [
>  	'intel_aux_pgtable.c',
>  	'intel_reg_map.c',
>  	'intel_iosf.c',
> -        'intel_wa.c',
>  	'igt_kms.c',
>  	'igt_fb.c',
>  	'igt_core.c',
> @@ -135,6 +134,7 @@ lib_sources = [
>  	'xe/xe_sriov_debugfs.c',
>  	'xe/xe_sriov_provisioning.c',
>  	'xe/xe_util.c',
> +	'xe/xe_wa.c',
>  
>  	# Vendored libraries:
>  	'vendor/uwildmat/uwildmat.c',
> diff --git a/lib/intel_wa.c b/lib/xe/xe_wa.c
> similarity index 66%
> rename from lib/intel_wa.c
> rename to lib/xe/xe_wa.c
> index 727dd6c988df..ff5daf529831 100644
> --- a/lib/intel_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -9,7 +9,8 @@
>  
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
> -#include "intel_wa.h"
> +
> +#include "xe/xe_wa.h"
>  #include "xe/xe_query.h"

Nitpick:  These aren't sorted.

>  
>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> @@ -34,32 +35,32 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  }
>  
>  /**
> - * igt_has_intel_wa:
> - * @drm_fd:	A drm file descriptor
> - * @check_wa:	Workaround to be checked
> + * xe_wa: Check if a workaround is enabled for the device.
> + * @fd: A drm file descriptor.
> + * @wa: Name of the workaround to be checked.
>   *
> - * Returns:	0 if no WA, 1 if WA present, -1 on error
> + * Returns 1 if enabled, 0 if disabled, -1 on error.
>   */
> -int igt_has_intel_wa(int drm_fd, const char *check_wa)
> +int xe_wa(int fd, const char *wa)
>  {
>  	int ret = 0;
>  	int debugfs_fd;
>  	unsigned int xe;
>  	char name[256];
>  
> -	debugfs_fd = igt_debugfs_dir(drm_fd);
> +	debugfs_fd = igt_debugfs_dir(fd);
>  	if (debugfs_fd == -1)
>  		return -1;
>  
> -	xe_for_each_gt(drm_fd, xe) {
> +	xe_for_each_gt(fd, xe) {
>  		sprintf(name, "gt%d/workarounds", xe);
> -		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, name, check_wa);
> +		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
>  		if (ret)
>  			break;
>  	}
>  
>  	if (!ret)
> -		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_wa);
> +		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
>  
>  	close(debugfs_fd);
>  	return ret;
> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> new file mode 100644
> index 000000000000..4ff897196545
> --- /dev/null
> +++ b/lib/xe/xe_wa.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation

Nitpick:  This should say 2026.


Aside from those two minor things,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> + */
> +
> +#ifndef XE_WA_H
> +#define XE_WA_H
> +
> +int xe_wa(int fd, const char *wa);
> +
> +#endif /* XE_WA_H */
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 68c7537d3888..fcf1d71a167f 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -24,10 +24,10 @@
>  #include "igt_device.h"
>  #include "igt_syncobj.h"
>  #include "igt_sysfs.h"
> -#include "intel_wa.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_oa.h"
> +#include "xe/xe_wa.h"
>  
>  /**
>   * TEST: perf
> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  	 * can result in buffer overflows.
>  	 */
>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> -		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
> +	    xe_wa(drm_fd, "14026633728") > 0) {
>  		oa_exponent = max(oa_exponent, 8);
>  		properties[9] = oa_exponent;
>  	}
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
