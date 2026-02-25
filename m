Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B5FD377D
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 17:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647AA10E7E5;
	Wed, 25 Feb 2026 17:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSELIsTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C910E7E5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772042227; x=1803578227;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=7vs8VWzfsMgMRmuDuIz+2tJEUxvQkTJmhPxNPv0qDm4=;
 b=NSELIsTcFcq8GsCpg+U0FgDLstK9OUjmHeLt96Ay0OOqMGAGZKGqUTy2
 iTjfsxbqSq4jsKLZMLEeb7rZDq2WLS5bMKafSRmtoExVBDLC9jP9Mmp94
 52H8kU78PBm5oemQJ6mCsbUn8yjjuFMr7C8G7THaC/KbB/1QlSPdSkEIq
 jdA6DMjlaCXtsLcXpqgvkpW3GPVP4X7rO9hCwzHNfnkAxGBLEY2R8Jkxb
 Eo28EZ4N24npcHZhn0PpL1vNFa4FszsMWnV+dzo5c8mShcVlbARqekzFr
 oHrvgTRtvRQ2DLJL6WQXy3gC7CXY4K9OCACjGHBJva15kBAmBzto/hg58 A==;
X-CSE-ConnectionGUID: 2gylIPgIRJOfKZHJOGZ+mg==
X-CSE-MsgGUID: Al7mw2+zR7+ohcsYcr63HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84184493"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="84184493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:57:07 -0800
X-CSE-ConnectionGUID: zHPRtQOBS8ujHQa2E7SGxg==
X-CSE-MsgGUID: Jm0sXXzqS0mFR3sbMxZApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214581923"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:57:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:57:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 09:57:05 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSWkYEwlW0A9EytqnCT/bQf54RsVwCunptC99YlqiLefc+X6mk0sv6tMBXN5cvYAFfOoHYQhtDFzsn5W9xYS9FP+KxV3KM74EmbNDna/b1VEMANbcJhJUhk84+UzKtxtnqJmFCH2kBIfKAh3X0xrWJeiJ9+7q2W2nPzhab0OTITKPMwrWTae0zEvPRNBHj7hClrZnzbe08BkdRh2LcG54Up4s2RAMCAw9jvTpVY4Dqi4u5Wfp+aGmyJgklrHKRpRnUO0N09WTFWE3p8IxbdN0HWORnC9z0cNAT9Q6wbhg5i938bnyHmDdD0mS6FFXnbEomNC3GTrTwX7n5VfVOJ+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf8+KKBEKtelpTA5OAb1VLS8G8DRGhqmQP/CprukGNw=;
 b=EwZQY1dddEWiQVpDoORcGfLoJz5ewsjSvga3Wfaqen9tT3H38HtgPygyDRH469dVAr4Rr2TdA9DGyQJ0KqKBC/P6hg/uQ8hUIXEpdECb8KkBnDPM3AsSK6zBv2Es0ULEXOHVQkYvvtfuZawqTWRFtAQ+TT2A5DXuAb7BT8xLwFhLU033mMuZTbtzR0fgSXpBhrbjIKkX5h7YM97LL2KcbQkA6sZ36R+JpBq2VPslvIh0O4Oz0lVgu2WyEzd2hoNRRYrjOYm0TsfMIaeSz4E5JNIphy9BumWMk8PB87WUCh4H4diXBpkcJtBQ17Kqnl6qN3i7RzEkRHRS/x+M4/yyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 17:57:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 17:57:03 +0000
Date: Wed, 25 Feb 2026 09:57:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWls?= =?utf-8?Q?ur?=
 =?utf-8?Q?e?= for xe_exec_balancer: Report skip when test is unable to run
Message-ID: <20260225175701.GS4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
 <177198300365.284661.9386700281246722055@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177198300365.284661.9386700281246722055@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ecb9c2-24e5-429f-4ec9-08de74974841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: zK+DZI9QeSSbL90DG1MsoFfBx92dF6a/xlVvWSqQCaWznwRBsxSfPvDdNs74z4rrX4ciMNuW+LHAInjzbpozr7yEGlnNY1gNx6kv7p37kH+3AtKumS+L071gd/WeB+oI67fWvTbnoQsABJ/0mlvLDqZzSvY77wGyqo/db1MrL1bHtDk99HoN+zs11b9fTibUFCg3OgBpJaikne0lStPpi1O3ClP/8NOBnOtAIUQ/lzao7w9X5PVMWIdEMMgotv8GNmM6mYl8zBIdBb6tLvckpq5EDKB1ggmaqNeuDwRpPFKPzbBZkTJ7RnFlGFC1CmZieyZUvJKlyBYyjRh6BhMhZI19RqXfo3FdtB5WCnszUVhQv26J6vQcZvc20zMUVE9VLHjUWR7BepUFrHIYAmNYKxSWBilefPPzUKziUalwROaAW9dj22GErizdbioGZSdL6WTu52QkYPjmEEZxeDAZSO9Yr5A6YRPPfgbInVbAHSetKk0kw40zc0IWl7UlEJF28Tgunc3jl+LudCqA5P7y2IAcio+xKpoiRLDKOkG3KTN+awpk9dIhuWzjDvu2xANV1HwnwbgGC7eHBnA0UlbLpI81yhQbQ5LFQarFT4i8nFxMYuHOS6NuK03Hp5vN7K+HdbkF4M+nOEGhR89fI4Ppjspfoijna7PLOC0v0SUYZW+NvaDR3iyIFkeGG+Mp7aU+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhYckSPI2RQJ8KZ9P+FAXA06X0TxMBUVpkr++U/sZCyxJjWigdPTq7wovKX/?=
 =?us-ascii?Q?4QzdRLiMVwN1aThKWDXpYDVPagGB18eGMPmC7D1EfjkGk2jtPbFDgjDfvTpF?=
 =?us-ascii?Q?ov2ovwevDYlH0vmgYAiJ6CkkqaDI6EAd2PVPEmh6eG+ox0MH/gyMYKBoefml?=
 =?us-ascii?Q?nH6ZHpsevW7sEW/jM9aH9X2UvWhtFSzRuVWHg6K41whhT8RqfUlzf2ubAlrP?=
 =?us-ascii?Q?fGz1D/v/fPFILTLuY30C5xmhX5fYYEI2r82Sat44l96pA8anMaQba5OUMVma?=
 =?us-ascii?Q?im07vCc8bOYv1EdGL13gscNX4Dvwwfo0nkb7AcCmqK8Ut27MIFwNrh3DSB6r?=
 =?us-ascii?Q?6sWrPQPeluuvBTNJLkLu6/NDo+nuuOM5zAq+XZj/HJWTsVT9GD9Gpub/D7OA?=
 =?us-ascii?Q?mjVhfwszQ7Hj4dFDPa1NypFZI/O8LisAMbB1yWOYa0FN+M1y9C9pawL5m6h8?=
 =?us-ascii?Q?5upEMpvcYyQFrDNwIAVVPYYm7UlBg92j7wgZiOwGTVvpT+b0IJLdiW0tA0cx?=
 =?us-ascii?Q?gmJ2MYdO3hsV7EooAjMbwgRX8/KejSk+91ahxPkTo7M1aZx3okgESG+D92sN?=
 =?us-ascii?Q?HFJSjQnoR1m/9ynzklT2RV+ohWwo2Grezsus8Aqj/284B1r4jca10GbDjgUj?=
 =?us-ascii?Q?3AdCJSyYeoKQBXHWHlTZhi5kxJ9GoovjdaEyH4ktxlrVMeujRLF9s0Javwz9?=
 =?us-ascii?Q?DeLjBEZS5UvbB52yr1T2ZOx/8FDU9sas/zyCO2Jx/xZyMMe936h7E5z8CRd4?=
 =?us-ascii?Q?aquGH4XFQ4FhGrth/2IV0X4F1zoCxFM8tzQvpiDXKyJ+IG3vumsfrkdj1Ko/?=
 =?us-ascii?Q?L3a/mX7yCC0QbJwgjXnUQnphX5ji1XIbmiEi+4FCscp8NXWCyp9Eq2gSvRGN?=
 =?us-ascii?Q?KfqIrBSjubvXhkLW97Wlhk4DmDClACfOKJjwyLjRM0BK84H3dDL0ufjXo7Ab?=
 =?us-ascii?Q?TRVHz7GyO4DIXTtGPijZRusYHL0W2bKKiTqgEkcmNX2opEZMyE9Ws7H+Fq+4?=
 =?us-ascii?Q?kpccrEbhkRKM83SNy2t6vr9LxblP9h2m5ns0QwnJ1sybenlRyWA+QreJHteX?=
 =?us-ascii?Q?g4Abg/2PVXLrX4RgF44tiAq/9y4Gpl4biUNN5+pa5QzKDKlaBnC4znoXImav?=
 =?us-ascii?Q?7O94TXodbQcOHxoyRfSy+aPSKiiOkMzht/4rNuiWlVC2bom2syPf32/L/fRI?=
 =?us-ascii?Q?q/WAxK1jC6w8Z1j8CevzIk72RZN8bY22lh9DEypvDjrp8EYxQbzGWUiMdGRR?=
 =?us-ascii?Q?2DMKiVgWYt5JFTLB7StqRxC4JEz+lS2xyx8itrFeIs3FLV1dGbkQ9oVYIJGS?=
 =?us-ascii?Q?/YwFyBq/h5k47cZajKHxI8gCEhrBNJ6NK9YRQ5JMVDLXDTfHnpWLZ5I6zwHR?=
 =?us-ascii?Q?RRgD9TfSlfwi/ow+DAkdIIm0Xu4lAWl72lJnbVoc9g9llMrT2JUxERxefhIy?=
 =?us-ascii?Q?p07cqDsY6pVpyP9zO4zeUqqezBmTzcoTeCYPL7/zNk0Lfj+IVsCiV3SZHlIY?=
 =?us-ascii?Q?02oyBqNhhoGCZs4IU8EmqRIGuA4SCgE1Tzi3BDbsW//EPHtgaQ3vmwrgPMuy?=
 =?us-ascii?Q?YSqyqbjy4PSLq8Y8gm6gn6q8omphpCYYIkdVAGIzgXnYithk6lID5AqpgOaI?=
 =?us-ascii?Q?jwPnPcc+9g0ZCQMWbayVFtPDXYc2Q5jpA7NQ44rkXEVqfE5EdbT7jNsBhcbd?=
 =?us-ascii?Q?0OKmb15POLFDGzSzOUnVvhYG219rrLrs7gWVDBTJg/RxdIR/PEwsFhqRjq0e?=
 =?us-ascii?Q?MlOxvQnSVBn+wY5Uv2rJSWUiZTotRGo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ecb9c2-24e5-429f-4ec9-08de74974841
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:57:03.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh25xRKypg1LnDrMirFMes5fxNaroBIOx2zaluyjQjwsqIRNCUBkwjqGoIkjdkfjnFNKWaZwhdbnKwZ6jseMd1qFZO8tPxrB1AL7NezE11M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On Wed, Feb 25, 2026 at 01:30:03AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_exec_balancer: Report skip when test is unable to run
> URL   : https://patchwork.freedesktop.org/series/162088/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8769 -> IGTPW_14611
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14611 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14611, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/index.html
> 
> Participating hosts (43 -> 40)
> ------------------------------
> 
>   Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14611:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-dg2-9:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines@lmem0:
>     - bat-dg2-8:          [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-dg2-8/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-dg2-8/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html

Known issue https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15759


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14611 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-mtlp-8/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-atsm-1/igt@i915_selftest@live@workarounds.html
>     - bat-arls-6:         [PASS][8] -> [DMESG-FAIL][9] ([i915#12061]) +1 other test dmesg-fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-atsm-1:         [ABORT][10] -> [PASS][11] +1 other test pass
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-14:         [DMESG-FAIL][12] ([i915#12061]) -> [PASS][13] +1 other test pass
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8769/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/bat-dg2-14/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8769 -> IGTPW_14611
>   * Linux: CI_DRM_18038 -> CI_DRM_18040
> 
>   CI-20190529: 20190529
>   CI_DRM_18038: 189174b3312588d97dc467dca7cfb9dce42ab81b @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_18040: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14611: 14611
>   IGT_8769: 8769
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14611/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
