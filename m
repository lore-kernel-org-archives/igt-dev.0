Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2F8C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128410E287;
	Wed, 14 May 2025 14:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwsuTlHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942410E26A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747232717; x=1778768717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oC/OWXdo1x3LOPs+DiH/CogCp6NK5QQe1Jzpr1WcbEY=;
 b=IwsuTlHaCBu4dpGA2rGIdeketVSAM+5wNXmaLaBHbduek1A9nEA0pVPl
 GsC5FWleXkVDKx6r/aSTlWqF9MZb4kBf+vJlQ7axlTTjYkgGEJt24pozF
 rgslGG8jppVjwpVv8Y+UADMx0cjN/ujnoWyhQkdX8hHA0jcIeqUd4jF12
 Bgz0cZJvWbG0bIEjNqiwbg+Pwb3BYbllL1BWOhyFXibnstIIU5tB3M3+T
 rhRu6pCeZ3sSolp35QnIY1fsw/QOumMxrWkhRc7VclIP3kn0XXc4m5Wur
 ndemD6R7rnG2kfilY20WxDin6DJXskwkRvl0CBYP0sPNRRPpPdyNVR8WR g==;
X-CSE-ConnectionGUID: F4qTY6sqTdGrocMrRocj5A==
X-CSE-MsgGUID: 0KgPmZIwSiCtYiJh3a9UMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51771513"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="51771513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:25:16 -0700
X-CSE-ConnectionGUID: XPwjJvwtRUGxdFB4agMspQ==
X-CSE-MsgGUID: PSPtp0hETI2BsLhFsRVqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="139050128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:24:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 07:24:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 07:24:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 07:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUxyBs8qWUJzkQ5uoiVwjD1k2ScMx1cZA6f+gJxyb4IGWoeDD4yZEU7qoT+RJfyB+Iduxre7AksBf3PtuTg8y1NPQyKXBl7B5+VKVK0iUQu6hKt13fRK3QgxIgEBMAw0Pbi0eXTN5J6wPrJak3RCroirzclIGX839LeaKh8ZXVj/xpOINRfQqTJDq3RVPKEzuIJWvxSpQnZIUInObMZvNms/+EIti1yAghvNbnjXcXWbSRkBFuID4gKf6y9J7KqrA1C+MicIicr5TIbeAdn4hYWdzEX9+ub0PDgzlHy4W4phS8SVmLMeSpe7yVDf+iVJWVIU50TyAyqnycDJc+Q3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtb2LTiY4NDj9NIZ7jljzBIQjQ5kag2/DS+0MyQwxDs=;
 b=R/8jj66dg3G9gEE33AoCiY2A0hhdJ4o3bI5jIF5XAyQMNKLEqRPJQaAcNgpb0lZRQ+kTr7hOGSWC3Li7E6OhuDt/4HRxMPwt4yeC/LLGk4GXbsY0JdI6/M/dTJKwjKuB9YuCp67HNqpsEKZo5eEQ5RCmxEoQt3aNpyPyD5XjuKVK3wQ6qhysDkatdm4WVyzTEqjW9s2vPQknr836rTGLzacrHwdRytWFIex8uXhkCingCnQgWC/XHasNRpx3JnusFMifqKk2MXWE01XLAe51pE+oGT/zulyZwujVZZOegNcIwpwbVq81n2r0LRfHqHwm9AagURNEqwYcLk3GDTuOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 14:24:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 14:24:28 +0000
Date: Wed, 14 May 2025 10:24:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v3 5/5] tests/intel/xe_configfs: Add test to
 validate survivability mode
Message-ID: <aCSnlerlgHRzi6SU@intel.com>
References: <20250513142827.1129334-1-riana.tauro@intel.com>
 <20250513142827.1129334-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513142827.1129334-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: e5baf3cc-f8c2-4f71-76c7-08dd92f308ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bqsNzWgO6CBQxi786I9hIjg1kTpJ4TrT0LZ2TkTRauD9i0V8YycnBnNoQC?=
 =?iso-8859-1?Q?CytOhjCC9eRShqFPjArWsJimFyyt7Uuq9cgabSqBnnvzGMvp7ZxRMXTDtI?=
 =?iso-8859-1?Q?YXAwf9v59lhS4ucf+kHf6IiQW0kBhtzfB+OD6r43A/hLtFwpQU5dlm6W9X?=
 =?iso-8859-1?Q?MNJlhuBi1st/Y/cEQAzbtugtuKw8M1sO17q/icmBZq4i3mGbwitmTh/P0M?=
 =?iso-8859-1?Q?TthVVsRKAVTt272JvL0k7UV7h4xBIFl+trY+wcfGglclrguEcJAhsiFNNu?=
 =?iso-8859-1?Q?/cXY4t6243NlNB/2zwv3AnoVkaUj0nlT+WXyGMyBfdF5IOogrHczydGb0e?=
 =?iso-8859-1?Q?vFY80jduaLVJxnQnBsBLue82hCgd4SJiUfcVAdEEAJ5s5MK9AWvSZ4ms98?=
 =?iso-8859-1?Q?MGyBOUkkE41uoXLsDfITfhS0WTn70cLmKbeMwrA0lhhVk15UaYO5Wqsb+Y?=
 =?iso-8859-1?Q?PqLuY/TRsuMkwW8lOf5yVD0489FyGFJF/YQiwqv4QY1oQ/kw9iWjUK7NuK?=
 =?iso-8859-1?Q?1v7M0A1rYTXbPluDaMeLmh/dq0bg2UOPF53VLpGhCSPAu+bR5zJgSs3xxp?=
 =?iso-8859-1?Q?l60SU5y/pb2e8JiLzRRN+7KBuXi+2TnJoT7fvEKpS4nBV1klglG8yEm/S1?=
 =?iso-8859-1?Q?alKgwUJlrZqtAkRegOEXeme43lhdgKERiykw67hUOgLpeVK5RK0L+TMlaF?=
 =?iso-8859-1?Q?Y06Oq5w1hWgnxZLmWtf+s164my/BcBEcR5aBHGtjQw7K/P+010UUoDzCoO?=
 =?iso-8859-1?Q?ZFfi6lBE8WdDbDrHi4KlFmAA9aPPrwxp36tAS0d7b7MHgQ10F+pOlVXQ45?=
 =?iso-8859-1?Q?InzfmP2iQAe3P1sJJHfD1e2VFu7OZJQb8mW1RRBZ4oC5GcPTR8PQgZuCfp?=
 =?iso-8859-1?Q?Equntw9ZStdzLSAIB7NwZwOaRp0np9UXNr/9IcUZ+7SxLv0McgtI6u3rvb?=
 =?iso-8859-1?Q?zrWZFggryqhsPFLgHaWuFkefwUNeEaY/8Fnpa24zSFmTYLthhLFOB9MuPV?=
 =?iso-8859-1?Q?g8a3gP64+5maeAL4J57bbbVd8Y4QOKcb6mCIpuyfsQx0XR8n4EXvaNORXc?=
 =?iso-8859-1?Q?oKjtAwa69zbmdYLekAzsfhkhbeVXQefpAFi/gIl7iiV03mm4nCjUwiuoxa?=
 =?iso-8859-1?Q?+ZLbzaIK+NuGY0pgj9Fx54iuped9Y16webSn3mBHwmnidG4CIa2/5puqJQ?=
 =?iso-8859-1?Q?9wAM5KV6FZ4+6gnzcf8tQrTYbdzCs+I1uhq2Ph5SzLIL/6iQjcVbzYkpVu?=
 =?iso-8859-1?Q?ip5KBqWkeGCc9+MJ0Meiu6W2hlbsu2yKgZYwBSR4YbExLxJePzCE96ZswJ?=
 =?iso-8859-1?Q?/d8G3kdcj4Kkvfb68sn6Mw1XCVfTZLLDUgddbx6axebylsptdIbL5XKqtT?=
 =?iso-8859-1?Q?GE12LClfQrys8e/Ez7+pn91HYdKrAjR3I3oArl4Wp6bXaPRiHhc60iGDPT?=
 =?iso-8859-1?Q?TCuYEs2sg36TjD8a82+r6HGcx+EdSvP4Om3lNyDhkwrC2FW8VP1SO9Iklp?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0x6PnAc5TX3fs13BNtlHMm/VZFTwbhstxr8vI23Lsmxm76hPGwD/WehECw?=
 =?iso-8859-1?Q?EhSndmSNZ78cam3jp627Z0B0PKGW0E3UhKi6xiM5bHlB4QSqR6YdJ0jZtg?=
 =?iso-8859-1?Q?5iCj/IWhlmbu8a1ZPW4UuT4dAz0deY8cfAswCpj8iTVYR2rvyKDfJsBgUv?=
 =?iso-8859-1?Q?JpVI0FIicOQANvqqrAuCNdmSlsY80i82fAaXY8ySLesnF6sdRcTLUQ6Kqj?=
 =?iso-8859-1?Q?zpU+IWmPV90ELJTiuoiiFITP8roa//r1xQmt4dg4V4Yn178O9UN1WN6dhD?=
 =?iso-8859-1?Q?/3d0H95h6ZbrBr/Ypbro1IqgfNTrFJm0uMCs4qUOuTugzNv9jOT7I+F1hl?=
 =?iso-8859-1?Q?gloKDBqcyLzqyI3i20j1UJezmgL7f8maWO6KWmRtrinzg5crx/Azc+dmeM?=
 =?iso-8859-1?Q?8D+2Nf69E9WgU+NVde3OvALgOUFlu01PZVF/nzPNlkkSi/ScN9rjtu1A72?=
 =?iso-8859-1?Q?AW3yRwq4Qrs66yCaIlziFBWv4h7Y9SQuRQiZ0tzMBnyxT3HIl/Zv/nZCZl?=
 =?iso-8859-1?Q?e14mSgkQDewhegQYt5ySRKQVIevDeJAWGobZPnH1a4xkC5dtsCoXofs9UH?=
 =?iso-8859-1?Q?lDMoJdY9dK0Jpgb08qdmUlZiUpIiTMOV+PWM10W7Q4/B9s0P2U8VXxWdyE?=
 =?iso-8859-1?Q?sVgL56rhlVTtqYhdk9uSsFL0QViMwD6TCovlCThPRZU7zkgniaSeKYOo78?=
 =?iso-8859-1?Q?TnTZt7qiTgIK3qELQzU7bHEQEDvhexe09W2GfFYrOmDS8JYeYgy8fo1UDG?=
 =?iso-8859-1?Q?1RQ0vRJqguqFXu6hSVfmg22ThvMHghjLW3Kt3KhZ3N5elE/2rs2CLOkOSg?=
 =?iso-8859-1?Q?TNVIb1AKPlkKbTtrM+k/9QSFp2A2p5o07ZlC3+XDeM1ZzcYjtlYulcfUJb?=
 =?iso-8859-1?Q?0Yx6GR9mYDL0Vchbfg3udVQPG7GAXBRhveoalFkKyqwpEWevmrHlhd+3/w?=
 =?iso-8859-1?Q?AGHbONxtnL8niY8W2YrMXAVqduaf2691zrwQ28b4S66MwmVlHW+v1+4ikd?=
 =?iso-8859-1?Q?CRNXWGdOzZApfztBmHqg6NiCNT2m/uF6SZg+5DaatECj556nHkh4OygI4T?=
 =?iso-8859-1?Q?6Q0JHul5tNgw1+TkeY921KoXbVMA08M7lNH6NUluS5RReovEsAZ/5cVBiE?=
 =?iso-8859-1?Q?WxWKNHKCf8nxS6HppWe7AV2+kjR6wb6EBdyyp8McwbV6lLovuohMnx4XLz?=
 =?iso-8859-1?Q?SBSe80L+TzOouoxfYikWgMnR4CXJQhMItGxWDr+2zFtjxzZ4wu2odyCGJ9?=
 =?iso-8859-1?Q?Hr9v9nHKI55uTPIfDmvOhCGkloz+TfEFbcjZUtF4kLnB3+9R+LbuPzrbK5?=
 =?iso-8859-1?Q?AA4g0M8OedTRK3HriGHqKVnj/axLhnGseeakMzmbF+9PSCdV4ZwvCLMFoA?=
 =?iso-8859-1?Q?tc4xhCawZFHE3KGQvpcgvMY/LhP+huXW+VyTwwObXhCL2l0hoIlvKRGnmM?=
 =?iso-8859-1?Q?Bm6AvG90laWLITKo5kLzogFX2LYBeAlUKeYgIvm0OFRBR2UthiWvw2MGUH?=
 =?iso-8859-1?Q?FOzKKm04Hv/U4UZG0RIfHvXaovpCn8tmmii04dYcKqX7HADyMKeccuPxxm?=
 =?iso-8859-1?Q?2wtwiDuSp9a+Gp6Fc2E5dKed9BHduYHfPsJx2yODWB/2w/yy5MR4EiZ3Xm?=
 =?iso-8859-1?Q?Iats38tHU6Uuusqix+BgMw2e5paWEZl8lqkp34R7TGdU/GjYp04j1YGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5baf3cc-f8c2-4f71-76c7-08dd92f308ca
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 14:24:28.1703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV+RCan10ShpOsbVyUg+w5D7yVkQ9qvEFnWl0Vy/EdX1Y/IVf/bmzyYNGPIE5Mmapu/lrYDkjcslVxaSKGNqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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

On Tue, May 13, 2025 at 07:58:25PM +0530, Riana Tauro wrote:
> The test validates if survivability mode is enabled on supported
> platforms when configured using configfs attribute.
> 
> v2: make test platform specific
>     check for presence of file for survivability mode
>     use mode_t flags (Aravind)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_configfs.c | 100 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 tests/intel/xe_configfs.c
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> new file mode 100644
> index 000000000..4d244321c
> --- /dev/null
> +++ b/tests/intel/xe_configfs.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Check configfs userspace API
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: configfs
> + * Description: validate configfs entries
> + * Test category: functionality test
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int dir_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +/**
> + * SUBTEST: survivability-mode
> + * Description: Validate survivability mode by setting configfs
> + */
> +static void test_survivability_mode(int dir_fd)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(dir_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +}
> +
> +static int create_device_configfs(int configfs_fd, int fd)
> +{
> +	int dir_fd;
> +	struct pci_device *pci_dev;
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(dir_fd);
> +
> +	return dir_fd;
> +}

This could probably be in /lib/ (in the future)

Let's do this later whenever we have other cases, and then
think about the clean up with multiple users...

> +
> +igt_main
> +{
> +	int fd, configfs_fd, dir_fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		dir_fd = create_device_configfs(configfs_fd, fd);
> +	}
> +
> +	igt_describe("Validate survivability mode");
> +	igt_subtest("survivability-mode") {
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_install_exit_handler(restore);
> +		test_survivability_mode(dir_fd);

I believe the only thing confusing here is the name of this variable.
I was expecting that to be the config_fs and it was hard to follow

So, perhaps s/dir_fd/configfs_device_fd/g ?!

up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(dir_fd);
> +		close(configfs_fd);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 20ddddb89..55bcf57ec 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -279,6 +279,7 @@ intel_xe_progs = [
>  	'xe_compute',
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
> +	'xe_configfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
>  	'xe_eu_stall',
> -- 
> 2.47.1
> 
