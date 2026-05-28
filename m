Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BACCD6E44
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 12:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3C210F132;
	Thu, 28 May 2026 12:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0/iSk4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52D510F132
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779972584; x=1811508584;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7mZt+a2wzViXL/W4mx7g9Ao7PrhLUtw1fa6vPqQ7660=;
 b=j0/iSk4kPcHWI2MvP1bky28yH+M+yA0RnjGue93MehFzIR+dMiEQ596E
 0/2y+Tmjv5lsl4tvPoekHMD017EYdoKToDwjQyGTUeij7H48KmLoympC+
 lVYu7d/vyE1WUeLGvxZqox0ud1blAohq77BmvH+H9/L1hc0S8Ctpt/JoL
 ukzIhMCV4lyOmRcior6Dnct7goX7Jbqtq1Zcy4OeN4tlb4BYibZP+Cs36
 9SPImjTv5+NDHz12H6lNMfYqIAamfuekDRMmQny7n0UyOgigpkMR5LtnH
 Wq6NMINesdrCcRGC4wGS53iHmlvbF2E6yoow5VfP1H2asBW4LZ4eU2P27 Q==;
X-CSE-ConnectionGUID: 4gnThf+wQgySahN+ObVg3Q==
X-CSE-MsgGUID: xlduguZSQPaAAORmtekIXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80804546"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80804546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 05:49:43 -0700
X-CSE-ConnectionGUID: bJKG0HK0TGSw7bfkxS2MyA==
X-CSE-MsgGUID: hSLSBxn7SFGAvpI1B+/DEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="266444505"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 05:49:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 05:49:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 05:49:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 05:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxoBvsBTjtpWbTQuEqsLOrWpuk6ox2fTKFvyj/23xXwzVFWWcVqcGuOXgk02l+ndt418LzruSsNG14XqMfQnJEHueZFfTNgU02Cc8zylj1osQeWHyEv82XdcjhUNo0yCJhJsbnVrZKYQG/oyw+1XQaq2LYPvmRX2JeDlco6pFz8TYcM/sXQ8UG+52uVgPVUufCSTJCKmabZ5tYJpxmEmqNzh7cIvf45+dGN8NWM+LlGYOnG80CChMHORkF1yxGpD6GqL52sldU1aOL+eHFPCZjrLXRQAbKODQ0xPiBDmPezv+K5xdSrk7EFxjDbYCOHgMCA5EVB5M1hboPViJGKilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwm+mObFXpm1bo/TqiierqqC+UbgDClDUJMBxd38e3o=;
 b=JBlKxhBMK4lUI53r50M/0jWhUgXKjqY3n4o9PLY/reY8+wxMxSlZ9ND7NwQvS5GLefakX2qcI81TQjQub7SA/vaBr9YM5aMhi06bU1fTT6VRVChUkdJ8Q/2cZPIWlV69ngUtni8BE+zTyq21yI6s5KWA7q9tX5f6svL3r5lSJoaQSEKonFZ9z1T+LM5Rk9gbCKcbcRF83YS5HdyY+XVVCvqXK7ekTxqjh5T/Au7PiooxFKJ3MOXHebj/O8cD8dyzV/fOJZIw5u0HiUv36VJsb0sG5eofgauPbOtesqbNz4iIEhuw2Cun9NGCQTV67iV7sMJDLd9YjmbSfd0nE8DYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 12:49:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 12:49:40 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ngai-mint.kwan@intel.com>
Subject: Re: [PATCH i-g-t] Revert "lib/intel_wa: Assert on error instead of
 returning -1"
In-Reply-To: <20260527170827.1963198-1-ashutosh.dixit@intel.com>
References: <20260527170827.1963198-1-ashutosh.dixit@intel.com>
Date: Thu, 28 May 2026 09:49:36 -0300
Message-ID: <878q93bswv.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4cbf97-65ae-42e2-b41c-08debcb7951c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: uzXsFSMPeXoFIJrVCOXzLkvF1zMoAe9QnOfWEgqey+DGcSTVR16TcggzV9Sk7h3Js/HnsFJbizNj2ykrAkddGjUOP0ZGYutKwtYUkbUPA1HYD/kL+4Ku7lOtbiYrVw62/XmCQOs1J1/UqdHbbr4tXa/uqJ0fVR4emIDLSVxprMx2BKXlaMto/SwnEDw9UXD5/hoHarRkmH+XYpIO63ndTiRiDRTrDYNa2SuFsAzn7ggGDS0O7S1+wx2+24EDJDFZs+nOeTZqNYx0MpCZ+1LyTT1pt3U26Rimi5rj4ra/yhNBq03+HmT1iAmmqguKsVhWsxnHLTTEdckvlH0nBR9SXVilWjJevqnNO+lAzlRYcB4wCM83cm0ALKWpEDOWw7Swv4FBtbGnEadqoPH1MV580J0ovuvPEsQpFbV4GaJsIEeX2W9Os4iouOfbyBlMp1OCNOG6hi8x7iRBsX7KBWr0B8yOSe0XqeVybzgiWh5qFEkl1UcKH1LQZU0A4RdavAtnrKZBphfcicrR5pMWpxsQQI3jLGC6wFvk6OUyZivJKFEw3bfKEAM4/vXLo8OWq6kqz8x30ntRmYwzC1UPcqZxr0PXOse1FiGss+zXpfmU3JESQlSLJWc2l1HRQmqkoxmbG8vrp7+zPKjd88Ftcte/EpjioOY8/vSkPkyRWzjy/Ynbi39EZvZoFsZthIYiUOrR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cS1MdPAzUUKDpjO1hUAe7pTUR6LKYDVVeqBomcKCQF9ayRo4Ip13A8g+1jdI?=
 =?us-ascii?Q?nF9tSPemfICP/eAhLUeLf+CpNZfwRyBsnSYU/3jfxVG3wiFhRYrQZM95Y7In?=
 =?us-ascii?Q?qvTewAaLqGx8UBU3sisumgOQz75zmVKnUcvsV3sO3H5yBB8OM6hG5Wht7LHZ?=
 =?us-ascii?Q?AvgP3rUD0R4gMcSX+1zdLIe24/04tGaDQpHiFirRBh8u1OWE1Mcgg9w02j9M?=
 =?us-ascii?Q?oxO8CsYyR8QTuG6Ur6do6C6FEruj1Ezj9692XkpWduGqlLN6ZPGX4NUrvFrw?=
 =?us-ascii?Q?yRx2aFELoE9HDb7prbhSP+ewdKcpOOAOFO/Gi5TZ1kXUV2QCxBOY7d+INaWF?=
 =?us-ascii?Q?XhR2BT+OEa3lpvQYB4sKuxuFizD3kTDGMLT2LHrChBWRgMCKQTNbBKOQXxp4?=
 =?us-ascii?Q?VZw8aUOxX9fadweBzQuzojY3Et22WM+QUCKfGIPqddOGt2xQc9HS8FqIe12j?=
 =?us-ascii?Q?w+vSvoDx8CaiVlYDI6DydAc+6CR7qlGsXCiuFNwggCd0VBpgFTMspHa+eV56?=
 =?us-ascii?Q?jAA3KE5/nNl/AgT5G5xIwpCuYmatqNuI/sb+vSmoMH7XgvdYJVKWiIJL84Il?=
 =?us-ascii?Q?pjLbzklj6xudYX2gAIZq6OEcclRVRIC3Pp1sF5ZkZ/1uV+5iamu1dv0KXVy5?=
 =?us-ascii?Q?fQ/szxwPTJsN2oM570NgXjzL7A5XqWCVwGd3wq0RR+JY3xs+lw2LasWMFHEY?=
 =?us-ascii?Q?/fypZwjgCggSCxvdYLQe/knMpv/vmIOmcolL2Ovi4B2v5oY0LyoM2uuonwsh?=
 =?us-ascii?Q?kYi9ita7SxvhpucWVDfuCsknFAfVe1lGXOBP+nt5JVY6dGS1bKYyUs2kOZ/T?=
 =?us-ascii?Q?WxLvof8c1LzZGlux5mm1Yjq3SnzcCmYb9lNJOwF0eO8ygTsVAijkUsT8vzJe?=
 =?us-ascii?Q?fzti+Wwu67szggdwGwp9AGKbMUKEmLobhdHcZ6jSuQA6i0L9hNnAiJWfzZTe?=
 =?us-ascii?Q?Gir1P64PYgNY+sO1vyD4/iQ7PykhbNKrhaxKlxbAuRJfi3k7fgYSpu3yvD4e?=
 =?us-ascii?Q?K1PB598ywtG1HjntkO5d33sxr8qKCOETYyMH1AS8TjG7Bn9w6aep7yN+h1sS?=
 =?us-ascii?Q?vv9/ViPPA/HPXRAJIHj0QEodx8RJaeZNUP8CwIuzE/nIG/2QlHvBLpYNvfyd?=
 =?us-ascii?Q?s+HW5Z7J3470dolEBuT5ExBqx8bo8EnVifSp9jtWW5YwSY6U/ykYMsaILfZL?=
 =?us-ascii?Q?wPloDPjCOTEKF6Ej9bd4GXXyHSkKRFi+epkYL+TBbI4+4L1WuykTdXbG7ByV?=
 =?us-ascii?Q?ypKeEaoRqF3hXOvSmyQbPFN7gr02R2BO/6cGbqpith0XJH7klUxu3LyOM56V?=
 =?us-ascii?Q?vE7cW8Y96MnPgNyKLNeNkVL5jbPR/7Vwz+kvIjVZ5qMnjQvn4iiH8pQzL1rb?=
 =?us-ascii?Q?d3+unjoD2HKj0VjubUOqCIHn6n0oHmQ6id/RjnTY4/pGiJRqdzNvd1Kd8xmI?=
 =?us-ascii?Q?FLpZX/wOkzdj1DOWyXfRZnWY5ypL10NIETV+bf/N4i+D83PQTCOUDZUEkNFm?=
 =?us-ascii?Q?iPgDUm/Xopwj/V1UjtPGXyVWpE/Gw/NkG6Ob8infXFX8MvPJmG36wMvfB5wW?=
 =?us-ascii?Q?XxlY87pcAXU201lgeJr4WKNOXn1t27+/23cuPq4dQrTq6ibsFjA+EcSibl4D?=
 =?us-ascii?Q?SB4NAEsxa+Kw01xcYzeXcCZ70PQIqvy6eQp3wmhqeuD5WlWRrnhT9fMTb+bt?=
 =?us-ascii?Q?dbcZGJE7VbmfLs3njeqDZWn0Kg29MYxEChqgOq+YaNiqVz7r6NXHuebS3yXy?=
 =?us-ascii?Q?TGC/FpYs9w=3D=3D?=
X-Exchange-RoutingPolicyChecked: O/kQ60l4LVYrZPhHEblCrA/2hxYtSQwPy7dD84MjQq0OTMuZod8IKOss/jf6kd+2Gtc8Wu+MeXoRuWG93bdtLUkcK5PSMARWqqsPbx4H8zZfkDcyWFaH6360WBSbEQJdT8YFMBM8RzKiSnKTBnUWdtx+uCqufHgd8K3tznTRlIMoz66RKTpRFrfsA5yo31dweKBJ3BYzvdHmyXUHm0CVK3dSxpGan+eGtGNMJU3Q89Rf5bdu1YwM1eq4u1Tr30ZZgilaB2xgqW2HXP07NM3OEC2pZaovbRU3WCUlJJqkvz4doywew++owBMgLi8i0RbR1lSGjk4hiALHy/M88cC4Bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4cbf97-65ae-42e2-b41c-08debcb7951c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:49:40.3756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXtgaW+Zh3YwuRsx6gVbdH+2cMq22KIdumiSsX6dlmw8Xsb/Ti4sO6A2dWwwN7Xtfw0vkdS6zJxHRpRfgZUeiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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

Ashutosh Dixit <ashutosh.dixit@intel.com> writes:

> This reverts commit b360115af75ac702b4f776aa3db0ac8a2a620657.
>
> There are cases (e.g. igt@core_setmaster@master-drop-set-user) which drop
> root before accessing debugfs, where we don't want to assert.
>
> Also fix the igt_has_intel_wa() call in tests/intel/xe_oa.c.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  lib/intel_wa.c      | 19 ++++++++++---------
>  lib/intel_wa.h      |  2 +-
>  tests/intel/xe_oa.c |  2 +-
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index a16ea62a4c..727dd6c988 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -7,18 +7,18 @@
>  #include <stdint.h>
>  #include <stdio.h>
>  
> -#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  #include "intel_wa.h"
>  #include "xe/xe_query.h"
>  
> -static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> +static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  			       const char *debugfs_name, const char *wa)
>  {
>  	char *debugfs_dump;
>  
> -	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
> +	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> +		return -1;
>  
>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>  	if (debugfs_dump) {
> @@ -27,10 +27,10 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  		free(debugfs_dump);
>  
>  		if (has_wa)
> -			return true;
> +			return 1;
>  	}
>  
> -	return false;
> +	return 0;
>  }
>  
>  /**
> @@ -38,17 +38,18 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   * @drm_fd:	A drm file descriptor
>   * @check_wa:	Workaround to be checked
>   *
> - * Returns:	true if WA present, false otherwise
> + * Returns:	0 if no WA, 1 if WA present, -1 on error
>   */
> -bool igt_has_intel_wa(int drm_fd, const char *check_wa)
> +int igt_has_intel_wa(int drm_fd, const char *check_wa)
>  {
> -	bool ret = false;
> +	int ret = 0;
>  	int debugfs_fd;
>  	unsigned int xe;
>  	char name[256];
>  
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	igt_assert(debugfs_fd >= 0);
> +	if (debugfs_fd == -1)
> +		return -1;
>  
>  	xe_for_each_gt(drm_fd, xe) {
>  		sprintf(name, "gt%d/workarounds", xe);
> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> index 34cafecc41..765a5948ef 100644
> --- a/lib/intel_wa.h
> +++ b/lib/intel_wa.h
> @@ -6,6 +6,6 @@
>  #ifndef __INTEL_WA_H__
>  #define __INTEL_WA_H__
>  
> -bool igt_has_intel_wa(int drm_fd, const char *check_wa);
> +int igt_has_intel_wa(int drm_fd, const char *check_wa);
>  
>  #endif /* __INTEL_WA_H__ */
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 56d818d860..e59fe953b0 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  	 * can result in buffer overflows.
>  	 */
>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> -		igt_has_intel_wa(drm_fd, "14026633728")) {
> +		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
>  		oa_exponent = max(oa_exponent, 8);
>  		properties[9] = oa_exponent;
>  	}
> -- 
> 2.54.0
