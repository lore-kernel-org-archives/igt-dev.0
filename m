Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B4606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMNfCOPu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623510E0E8;
	Tue, 20 Oct 2026 21:31:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139F10E0E8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792531860; x=1824067860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IgfHY4Vw0RkiljY1qsIhJjERBXRQNxavc+LI3tY8c58=;
 b=DMNfCOPuvM0ds7t4cP+C9KhsM5vR+cCqT8hUQISYr0dQS9b5EhAkThkX
 7yoQJ4BfZmvdjF4svR3CYbe0b+t+FgjvcQVn51RNhBe/5nEKdPbUUjZmn
 ft7OGPyS6zCQdzzG1rPq555Titfn1WiYd5aaxZQWp4DJUcumHN5Ejt2m6
 utJ8rAFoYM+386/ivp6oZwaHl6GV+WYWhu+IC+0n6in2XaFXfjTWfnHp0
 6xzDWhhzrnqsqu/6hDDQEczwtA8NDnaB8dZA5ajCAqFDQhNEiWFZ9zi90
 ShGrJG23CH0UaeY8Ob5zNi0WnW+v1LLWRkqodPvMsIa9sHjnQ9TdKYFMT g==;
X-CSE-ConnectionGUID: /h+NCBdfSlq+COlrGQBPPw==
X-CSE-MsgGUID: 010CoFNTQNmuqgndZz7DvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1260174"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1260174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:30:59 -0700
X-CSE-ConnectionGUID: qUSxg7lgT+ycLMu7eCJYTA==
X-CSE-MsgGUID: Lzc8LYgpSvO3+L99n5kU6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2865751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:30:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:30:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:30:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPh2U5I5VL/4leLc8WJdr8RtuAT17LJudtSVNTiUCpuv0/C2EaAiHSqZFVuRrvvACipUjZL5rMT6zOTToXk2KgsuySVQdsqgdVcwnYgUP9O4Gpws+EyJDY61yTejFsMm+kESF5dWkVPsU28lEEVvcTfbMTjwohbYVovzR9rylU1rKaWt0Vl8qUYHoK+frRNtOAWxM3PgXEKODUtFDBk/9vaqz/zwxdBCtwUtTEoZ4uAIIvXNsO8DbriafA08n7poyyVNZHDCl6J2RwZoD/0Uu9PKZtBvwt3ILk5IIEDIQBQt4YsaB5WNKARW9igCtCJGrRZpNCbZnEY6Jn3nXWibGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL2/0WJZdVZqJaPOPRDfeawA3S5XcxpyZdZ+VuRyWXc=;
 b=hzFzeqNh1p7Id0EbtaEB8ijR/x0BnDeyw/eFtQICt+4Ywt9I6Bvxfk3vzokOTetNIHVTrdMJ98HwZn7No4BK3OFbMe6JDreS4RCgHNrMotuv2SkqN7fQA8XTVMpjitF+sgYSiNviqp/Mcv9Bc5i6ZoZadK+mJScvlmeG8zmyef9tf91TdI2YdBzz4gsf/u/vi2N++4wqwtX9hP7KfBhLU+Whu9OpXrEjjJRk6b1NKSZg1Nn9NTUUclxtv3feFclWVECuXpvHFF0WzusX5BcatrGMUGFlvWacOfHP4Gkbz1R9TbCDTLWdjLzyXDaBTvjwaaiblGo3fPy5gCJLLADduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by LV2PR11MB377618.namprd11.prod.outlook.com
 (2603:10b6:404:301::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:30:57 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:30:57 +0000
Date: Tue, 20 Oct 2026 14:30:54 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 04/11] lib/xe: Cache workaround information in
 xe_device
Message-ID: <20261020213054.GC180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-4-528b575299d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923-wa_14026539277-v2-4-528b575299d2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|LV2PR11MB377618:EE_
X-MS-Office365-Filtering-Correlation-Id: aeafba46-af28-4dae-ad9a-08df2ef16dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10070799003|6133799003|10067099003|18002099003|22082099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ygQGv1U0t4YupM/lFNgLJoyvkrf3enn+q95fzCLlxpe27xBG9Mn9aALdgVWKz2iJQ/mtogDR4D3bGAvXGlK6clwu98C5ur+4NTMxosxMa2WqcjemCMDaJAC1MXyVKTYlyh+IVZbC+rSYP//q7Oqo3xMwIDW2Zz58Mup0UxWOnZPb0qlfCN2ij2Lwck6UvXrjhcEEd++sMPb2TsoknaAFe7fpMgcd8qi9IvV5BFxel8snYhPL7sErDlo4st4ZLLMLuhWSfRiXeCHkqTULR9tadWrvkfMnLcwYPSQY6c7fzeODygnGTOz/XLVtjH0XOCh7AjIoBhblz2uV7p1N9dDjU9lVTHYojqVX11zbQDLKDrcnqGc4IIlpFORt60ORbXj6qYAjSAKLJtuvny8YIgXhYNQQzO4Q7NXD2P5qm/T6qLWQsZ71ejCU/M9DM7KdZG3XlN3q3eyZu5UXhI2DaF+x6i4Cx6Eeae96qUli2VKFNAzc4YRHWtN6e7clP4cSu8zBZDFAw+ZxNuDsqNZkyv4w6F5UdwrqNsZoVkRTe9TkvN9+l67iwAT5QLT7WsWpEA1IdpYUzvki7ON5hoUYCCg9aBj91mo7aIjlieD8u8sScaK8tHfG3jxLa8EkycLc6wMMQbKTYMpYQWm8PyGSazw5aCwAmseiV7WV4PSz6e+PTj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fn7wYmNvnmrO85SxJmGoyVhLmdyWCNOuqzmWV/VcHJv/3U4p8GzFRAGSEzP?=
 =?us-ascii?Q?8iskuGr2EItC2Avyn//RhL56DC+mwxjD1eh8XMDH1v++TkFzVvUqT6lU9TNI?=
 =?us-ascii?Q?fFdKtkj3OYI+RJtap74+QiwymbAc2HJxnr+fzUDbEgiI6gbYA4Kl/TzOWjVd?=
 =?us-ascii?Q?48qCkyoObLLAtnw8qKENncR7caXmDJWDWkjtHcnuNRhpyyYvM5WkXDLZugbp?=
 =?us-ascii?Q?M/rTRKyHb78kVBC5OqBz7JoTF0p4qaw+26q+mQSoe9X2WUgZkbsSdq0xHwVi?=
 =?us-ascii?Q?vKdouvnfXDjtWioFU/ego2mVUF3CfS77s9uB1v3l3oGeBiluQXc/nSEHKX5F?=
 =?us-ascii?Q?jBcqkM+XAL/gZhLNSinEvZGUUgVKa36bc3CMYj/DmFPmcCsPkItlHLlv99IK?=
 =?us-ascii?Q?Y4TAtI6prWmM1NkFhYZELPO1lGts6boAZIx/5J2ypMfe21Gahvpdo1LxcCFV?=
 =?us-ascii?Q?hcbG9+RBj8XFCvPb9ptaeYN1GEZDMeoxQtLq41F3UgTUX1Qesn0llLvxh8ZX?=
 =?us-ascii?Q?JezDKzu3hGlE0nYpM+i2B72hlGD6s7yn3og/Yrhk7W6Zizvi1W4MW1VW++Pl?=
 =?us-ascii?Q?J9DdxOJ2fg6LTX/glc8iNU+CnrYDlKPjZMUodyjSeALRiA+Kr68I+KWLDxab?=
 =?us-ascii?Q?SXZh9XoPUibovtY9B6sjestfY3v26OvgJBKDO3GNvBRBxmBuF/0EyKR6I5Zj?=
 =?us-ascii?Q?JKsFkjkPyViWxPNsKloVaHK7XbcQ+rGZKXRgYNo/I0BgZOwAIv3dMFoYEUBv?=
 =?us-ascii?Q?YlNizKdPfvS6ux1W5Cfr1r8Ih4sEfIsLZywbTgFHKvQrum5BKIpYjrt2rCDJ?=
 =?us-ascii?Q?StB02QtQho+FyEHedKJPdoege2BebmT8Ca4151XnVutx6RxCcxADL6ERSXsb?=
 =?us-ascii?Q?P7FDwpiyreg9flkYd4Ex14mJh1xuOgtPwn2EJMUUDxEdZ0UjhbyA81mak0VP?=
 =?us-ascii?Q?OE/4RGtjn3WE45/biz+Ke5zu+5PhAVXRQzCTvNUAQ/jdpmAv0wU5P8Bx1Wx5?=
 =?us-ascii?Q?TjS9AZ9kqGOO7Sodp52EeOdR1CO1kXGcR5DrOtPxyQwcja4K6eo2QawyTmJg?=
 =?us-ascii?Q?NFIBfJRK+RlnmwMdGy9loCGCSnkudZ+f44RYhkBc1yHdivS3DTqhPAOZQFYJ?=
 =?us-ascii?Q?AvjPK4J8IAUQ7ikN84sAcEzPR08ss6tXvadYqJCxtg9pvs5kX4Oz6ueYwftv?=
 =?us-ascii?Q?8FoNoSExNRBSfYvQ0S+7E6kkGK+Ya/8epfYiU3gIlJ2HKIqJT8TqNcWdqDxb?=
 =?us-ascii?Q?F+YVHqAyNF3E1DM96K1oFY7R7hZyRrWVL5PQf1TMppNEbKOSL6vkHbU5fJ2F?=
 =?us-ascii?Q?sjENaIlEaqMUqxOi3xxthCNk4B3nARfc0rCsXbp70eWjAUQFmGv5S2XHAujW?=
 =?us-ascii?Q?0q8aUI/1F7XNcZvEG1Zug2q67G/R0OoXzGAw7JN28q7OmxfgrAbRONDmNKiF?=
 =?us-ascii?Q?6CYrg0WAY/L8C9uIid6ZpFwAkkMJYonJQmADmFrg5vJ20IL/vo+dY8hoY2ld?=
 =?us-ascii?Q?EzcERAgOFPcDsby59kNd9546AbQkYKIHOQle/wnY+G+aqhLwAb7eAtxEOfuG?=
 =?us-ascii?Q?OuFmZhwhdPu+P6JGQJ0IW8BiTuah5HHuH+0zHcSN8QWrwy28e7JaJnZEctAJ?=
 =?us-ascii?Q?Mq6KeD6KiwwxstlGBwEFJmBo+ePJd5Kvw1osArUJwQJ9LKLMcr4YUQ45Mo9c?=
 =?us-ascii?Q?i7kleZt79G4vnbwH3ZpoNyfELWULNKpYyCzr1pSNnuZjJKT14KMDaGlQ+kQn?=
 =?us-ascii?Q?pSgS7qeD120rmUUouGHiwlJvF/BBCXRpmTez4ul/Q/aj/dVYPNklD2j5dv1u?=
X-MS-Exchange-AntiSpam-MessageData-1: t1+/+0oaR2ZgwpQKW5Vs1y+9Gs0Cl7lvUI4=
X-Exchange-RoutingPolicyChecked: T8cueDAhT7jml7v5cvkPHPDYJ2hjknjHUbztm1HvUH+ou/XkYlQ2oDW4PsXmL6+4MqmuZno+sSP5wXmZ1D0WvCd/hYWKyrxDdIW0LKS9AAPjUHCxf4FI+ci49DI++LfZsYkVHvJ0a2/9ekiiKvWUngfVyfdPJm31FPUvPBT0iNntizXKB6Wn0yUK+CRZZ7xP+rOzhFl9YVFzL42bwpK+s58Hwj19SjSIxOMuzcRo7atzFoLPx1UQM4oNEk/qbXopyuRbHDtDC7YOrNzzG9oO3DMFedAfQznLcK2pcxYTu14+j7UAsOxkPYYLa3U0iwHaq8w9Qx2LlggBNbYyWWGZbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aeafba46-af28-4dae-ad9a-08df2ef16dd3
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:30:57.6110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtIZNbKioAOr3YXK9b4Bt9AEtApS8y4casqCFa9ZrRU8gyozusMcxUuGbTCs2saGUyqj0Nms/Iu+YGT/0pxJdGHnOOsmbwCEGuzDG9ctDSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB377618
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 23, 2026 at 06:41:11PM -0300, Gustavo Sousa wrote:
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
> Note that this change also requires us to introduce and use thew new
							      the
> macro xe_for_each_gt_from_mask() to avoid infinite recursion that
> would happen if we were to use xe_for_each_gt(), as the latter would
> call xe_device_get() again.
> 
> v2:
>   - Add note clarifying the need of the new macro
>     xe_for_each_gt_from_mask().
>   - Use a struct xe_wa_cache type instead of having struct xe_device
>     declaring wa_cache as a void pointer.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
with nit in commit message.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  lib/xe/xe_query.c |  6 ++++++
>  lib/xe/xe_query.h | 10 ++++++++--
>  lib/xe/xe_wa.c    | 48 ++++++++++++++++++++++++++++++------------------
>  lib/xe/xe_wa.h    |  5 +++++
>  4 files changed, 49 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 91ffc36e6425..d2c4329aa317 100644
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
> index 59330d80fd1b..c50df0e34320 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -21,6 +21,7 @@
>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
>  
>  struct intel_pat_cache;
> +struct xe_wa_cache;
>  
>  struct xe_device {
>  	/** @fd: xe fd */
> @@ -80,6 +81,9 @@ struct xe_device {
>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>  	struct intel_pat_cache *pat_cache;
>  
> +	/** @wa_cache: cached data for xe_wa() and related functions. */
> +	struct xe_wa_cache *wa_cache;
> +
>  	/**
>  	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
>  	 * UINT16_MAX if not available (older kernel).
> @@ -99,10 +103,12 @@ struct xe_device {
>  #define xe_for_each_engine_class(__class) \
>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>  	     ++__class)
> -#define xe_for_each_gt(__fd, __gt) \
> -	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
> +#define xe_for_each_gt_from_mask(__gt_mask, __gt) \
> +	for (uint64_t igt_unique(__mask) = __gt_mask; \
>  	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>  	     igt_unique(__mask) &= ~(1ull << __gt))
> +#define xe_for_each_gt(__fd, __gt) \
> +	xe_for_each_gt_from_mask(xe_device_get(__fd)->gt_mask, __gt)
>  #define xe_for_each_tile(__fd, __tile) \
>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
>  	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 93b97c7c1476..59064219cd96 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -30,18 +30,18 @@ static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
>  	}
>  }
>  
> -static int get_wa_debugfs_count(int fd)
> +static int get_wa_debugfs_count(int fd, uint64_t gt_mask)
>  {
>  	int gt;
>  	int count = 1; /* Device workarounds */
>  
> -	xe_for_each_gt(fd, gt)
> +	xe_for_each_gt_from_mask(gt_mask, gt)
>  		count++;
>  
>  	return count;
>  }
>  
> -static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
> +static int get_wa_debugfs_dumps(int fd, uint64_t gt_mask, struct xe_wa_cache *wa_cache)
>  {
>  	int gt;
>  	int debugfs_fd;
> @@ -57,7 +57,7 @@ static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
>  	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
>  		goto err;
>  
> -	xe_for_each_gt(fd, gt) {
> +	xe_for_each_gt_from_mask(gt_mask, gt) {
>  		char name[32];
>  
>  		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
> @@ -90,12 +90,12 @@ static void free_cache(struct xe_wa_cache *wa_cache)
>  	free(wa_cache);
>  }
>  
> -static struct xe_wa_cache *build_cache(int fd)
> +static struct xe_wa_cache *build_cache(int fd, uint64_t gt_mask)
>  {
>  	struct xe_wa_cache *wa_cache;
>  	int num_dumps;
>  
> -	num_dumps = get_wa_debugfs_count(fd);
> +	num_dumps = get_wa_debugfs_count(fd, gt_mask);
>  	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
>  
>  	if (igt_warn_on(!wa_cache))
> @@ -103,7 +103,7 @@ static struct xe_wa_cache *build_cache(int fd)
>  
>  	wa_cache->num_dumps = num_dumps;
>  
> -	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
> +	if (igt_warn_on(get_wa_debugfs_dumps(fd, gt_mask, wa_cache))) {
>  		free_cache(wa_cache);
>  
>  		return NULL;
> @@ -181,22 +181,34 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
>   */
>  int xe_wa(int fd, const char *wa)
>  {
> -	struct xe_wa_cache *wa_cache = build_cache(fd);
> -	int ret;
> +	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
>  
>  	if (igt_warn_on(!wa_cache))
>  		return -1;
>  
> -	ret = 0;
> +	for (int i = 0; i < wa_cache->num_dumps; i++)
> +		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))
> +			return 1;
>  
> -	for (int i = 0; i < wa_cache->num_dumps; i++) {
> -		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
> -			ret = 1;
> -			break;
> -		}
> -	}
> +	return 0;
> +}
>  
> -	free_cache(wa_cache);
> +/**
> + * xe_wa_build_cache: Build cached data for xe_wa().
> + * @xe_dev: Xe device where the cache will be stashed.
> + */
> +void xe_wa_build_cache(struct xe_device *xe_dev)
> +{
> +	xe_dev->wa_cache = build_cache(xe_dev->fd, xe_dev->gt_mask);
> +	igt_warn_on(!xe_dev->wa_cache);
> +}
>  
> -	return ret;
> +/**
> + * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
> + * @xe_dev: Xe device where the cached data is stashed.
> + */
> +void xe_wa_free_cache(struct xe_device *xe_dev)
> +{
> +	free_cache(xe_dev->wa_cache);
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
