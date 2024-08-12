Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD4C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 14:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644210E22B;
	Mon, 12 Aug 2024 14:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHNkrnYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501710E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723471276; x=1755007276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+G4jMFronjBZJvyILOiuClUi9mSkaORMcAJClb6eTis=;
 b=YHNkrnYutMf0fauu2E2yvXIyhmqwbri/tp2H/va2TS1WDjvoMEawqPM4
 obBFH7mVc+L+ueijdbhQC6J9RBlY0jZBEsqPLmsx8+OjohR9NFJ/4OTz+
 AXZbLyxnuHaFPcQ8FPUyXHMyEIfdD7GX6cZdjMlwresVjytO/t29ZnsBC
 IEVWeP2qGW37a+xWUyBU5K1XeqogmYLNI1eog5GTSpTlBR0U/ybLxm4eU
 p9xZnUKPs2pLHxZSr3hNMJLWz4/3PXUDOxwHJ5+nUDqIPfeoaJnlabWPC
 q/avJ1HFlRmQflgJKe6SpAEjRGgkfxrGJuVkubC4w9mXn2o53dcv8G1oa w==;
X-CSE-ConnectionGUID: 6n/IVOgnTNeuBLEL4iHyTw==
X-CSE-MsgGUID: PFtI02cRQBSMeLYNO37Esw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21748877"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21748877"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:01:15 -0700
X-CSE-ConnectionGUID: Hf1MripQR7mJbCfsPwz0jw==
X-CSE-MsgGUID: 8NDtwAfeQxyOgLC1HOwQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="63201740"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 07:01:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:01:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:01:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJZlfn9XhRVcmiDiJVy7BwiaXsuqRZ3wPkXDIXPhGo0PXmgDcH7t9HJm+Ze3yvhfC9ZWOa9QDCkAUPI6g+HLYs8bhs65BUQ+wjDA0BJmthScyc0df5V4ZDUZ2hf3wVKHEKq/zziC6Ib9ahUmj0PEvv9pXXtyfYZmTsnjylLG9SaDFL5BnMmSKI73NQoLKAq4t1MwLqHywJ6GJ009vAxit2YaGoNLejA7+tX1l7Rw/KYXFTekOfWBeSlMb3HodYRJK15cR+bGGG43MnMNbunGtc05HCFn+/ybFezgedz7QHrDZJbDm8JgaY3Cv5kK9qvN2eilD5MfdrQT/Y6FkbddaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zik8wsg2zzm1huN4B8knkpeoHjAxUdm51J0sFErKJQo=;
 b=Vj/edcpb9S3HnHkQNzHpOPVJB339Mq14T4YF3xgREpvuyqjSZjWtS8F95S8eDsM/s1zD/sreTd1otgztU0LbAThj+uXtt8h/iaiQfm7vLDPmQQD0jmOXGH+qw9NzdIO5GrmYnR+gkM6rPMQd/xlSOgrMoICzhcsUmEnQ9YYoTL72UAJHBOIIeisGU8YAkFgMIvuWQnt8DazjyeJA3wkarcbSARd7s5N+np6GDkDu0cHaYFpcylTw5NRl966pvwskxE6vgdMvzxFtq1+dCYdQnXamK3gLvvU2kymB4JgV8miMkQYvf/uRBAJFGIwPJI9BPSYs3Yn2ncbJWpJ1SScVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 14:01:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 14:01:07 +0000
Date: Mon, 12 Aug 2024 09:01:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 5/6] igt_hook: Allow multiple hook descriptors
Message-ID: <f4ijw67kciika23axgp6ijtqtbehf4vccq7lqynaytrvyr5n4r@sdqhr4cle2oy>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-6-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-6-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW2PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:302:1::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fdda062-b393-4af1-f058-08dcbad73659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D7SE4B+JsFDtzwlchv9X2be4Nx86DCFgY7IXVuscdGx+UV8/guJs6x69bZDL?=
 =?us-ascii?Q?b+FpD6Kf4X34i9pq0DP0S6tVM1ssdkZOA1oPdTLnQYAf3Bq+Au+KBAnyRunF?=
 =?us-ascii?Q?IEhphD3S+tloHfctF46qMBCjh3qJ+lTVLdKzWEiTtld9pRSIg1MLDklpj4A/?=
 =?us-ascii?Q?e+S2v6QnqEUhZPUbEltBetlQOb7Uq12Xdw0fuoQI0e17LRYIRcjmhuQSPaKk?=
 =?us-ascii?Q?/eFQNMH5nd5ZSJE/8gK54LInnaCSRgUfNR6dSPsf2wPQv0CEeYxfRMOc+hQB?=
 =?us-ascii?Q?RMB+kuoIP4UQoeYfgbD7lkU1AUZKcGRCyUhD7AiJUEwO0RMAzpCym9l37rF+?=
 =?us-ascii?Q?ShAB6Nwye5a1+km9zbJehZKK734/qqUpHNhnHwv3NgubN6pu9Ncr2aYrbBBH?=
 =?us-ascii?Q?g/pDFoiKCMuuXOTNZWwYljRok5jkiLh3rHTC6yf25HarI5zDKHO9gc2/ErYc?=
 =?us-ascii?Q?zJNHLH2mHi7rjSz0xOGY2acJ9DDTsSN65ejcdxRPcF0o/W21Luqt926duxm/?=
 =?us-ascii?Q?tK9nhhngNJk1vj0It5aITQS4qCRGWtv9Zjwh6kPPehgBBUjyVHDzLOR+w8GC?=
 =?us-ascii?Q?A+xLYxjL5tR4liiInk3/JgFLvMvmJuocUtxTCNKzpPe/q0gOV6MoCA8q9BXN?=
 =?us-ascii?Q?n3lFJeQdZNALGizA08LsAeeCzMFCTeRBqRbtNZhJWAiMytZt+D+jpvSUIv8j?=
 =?us-ascii?Q?8/9EZNZAAVqcnkPDuxKwNy8nIkUhRN3g33h05RZ4W9aWYs0VPynexH6HSjO1?=
 =?us-ascii?Q?5EMEzg4fcmjNeP5fPwNbAewel8uTJrBvzbe9KFw8CN0Y1ZqJDXUUFtQEuzY9?=
 =?us-ascii?Q?AeNa9+YUDaj0YumIl65OGEzz1T9lWFUlB4Cpu87eK/oj3lSykCU49i8g7khh?=
 =?us-ascii?Q?PBbKXXufgLzBBBrABZVgOUQ3mK8NnmocvJt+n4Qxx0HbiW0w0aZujzyUPgnc?=
 =?us-ascii?Q?7pd8wcglGd/RkZmRkkHCzaKspUHz3FBcmoIprrTqovns5ODKX0TZ6ufvza1H?=
 =?us-ascii?Q?VVoX2pRnbelVjp0S3hzXyxi/nUWPwG8cR3ZsTPZTPhxFIyUXtvhU3c08Vi1B?=
 =?us-ascii?Q?N6PPDCA+8krXJcN3txGwtdIvj8sWG7vXisCpTJ7yEsLKwCd30TqNkLPkZZLl?=
 =?us-ascii?Q?ZAGTXZfKvCfxbygBrGKg1c22+mTDNZ4f9F6+GMJYqS3D1irLkvM9ks2iu26z?=
 =?us-ascii?Q?nZL4ESYM/3V9VQEihMAaI32oR6JhBSFK72YyOVgXgSdMu7PQ9qhaUGd6rVl/?=
 =?us-ascii?Q?bxOG3mHcDM5wxKF7tMXYAByUwRWINctzGZrVgTdzani5ts5BVTfEa0AzcwP8?=
 =?us-ascii?Q?ULSPoZ3EuSeicOQWd+J1mIVCPlU+DbWBV+/zPY9+TVIa5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xvi066UuVoyN7FpDJGLsmPdIECrn52dKuUCqsnk7ADBUj02NmI971YaqfCYy?=
 =?us-ascii?Q?kIae5MKNck0sjB7UO4PZdDG6emBvWuQGvBt3/gywKxxAqBYRV9PTiaTjwN4L?=
 =?us-ascii?Q?b9u1+3RAe2MEVCEHhuTqggOrDOHsq141MxdaXJK5hDzV1JRpGpDqDnMl+N/W?=
 =?us-ascii?Q?jT0Xcgixsg8cWztOrdDbDgsmfCfKpJ764aSJsNyTCd14hrbgAT3+aDEc343E?=
 =?us-ascii?Q?LwqS/EHjrj4DULt15vv5n75pk+uU2NTSG/FKQpXOux9DpdmE9noEfMwfYUMT?=
 =?us-ascii?Q?B3UR6daojaYrS4Bk6auOFKL84PsRenmksloWipRi0SWqcEtF83e5WUjNP2s0?=
 =?us-ascii?Q?ulUlCvEzYw0b7kt1sVKLztuPnmO/Uj5UtKEYiQNTQHfngaCGRTkfGVtliTO9?=
 =?us-ascii?Q?NIfm+N/LGYDPL8THMlq2Bm7NNndU/X//vkGTyQklAmwmpyd92kF+9TT6wmtW?=
 =?us-ascii?Q?mK/+qR0Gy9f5q1LZd1dEolzA/tpCjdsVmTbn5JreWwLPlZwBYnfNXg1ME6lw?=
 =?us-ascii?Q?nMEDLLkfy1zB95RXY0mI1HJLXoDXZA4/FZNhvuj8+H+4m4JqxTiIWVEfeJJb?=
 =?us-ascii?Q?d7Vuwlz479Eb1baMvm7/5T0Q1/EI9aREeCRHhNYaLLj5qs7PdIBEdQxL/Yb8?=
 =?us-ascii?Q?m2GMH2Nz1XXTD6EwztB7Y+a/SV4psb/RFEaTu0opwgu2p/yjtyuEDoVOLZOf?=
 =?us-ascii?Q?u7qEzpN+jc4+sgquQd5KjsKQ5qXHLHX0daIHgkv44T4zOzDZ02a9iN1A2mgw?=
 =?us-ascii?Q?eMaO6lFgDsJNvaTWtZUPr7P/hLHEK6eyzVL/9dd9iy2spEsUy/wjAv6c5zWf?=
 =?us-ascii?Q?8mUYfTfzywcz/FRpQBOJr1IkxfQLwIVltz6qhvTFqbVY5mBoyxM84LAuWbi0?=
 =?us-ascii?Q?2D1ekSDuOx88hvjWVYAA54Xj8ggGfTvvDLoZszuuvTFCwX7sd+xAn7rW4rR7?=
 =?us-ascii?Q?H8OgNyamNPi0b8T7B2PganyvkmLcPTZKAe30Vsly5Fq1pRIUPXV4EyHLfSD4?=
 =?us-ascii?Q?5SahRlK9sc8dTb938thTotNdNxndmryml50PNAUNdKrqw4qoc0pKg+TX1fT5?=
 =?us-ascii?Q?SCoi3j2F77JwhiB0Ldab+qcWr2s/M+HUZk7prIxvjrYgSRGpgj5Jg2CyxnC2?=
 =?us-ascii?Q?Z+xqhkqVc2B7M51lo6e7sWIULUv3yRY0vs7bM7gA8YSfHnWoDtD9IcpyRqYJ?=
 =?us-ascii?Q?I0mAkokg8Y70f/r1HEs8a5a40w75qswYjthC/SluMmf0dkFsK82PtAf1JX6Y?=
 =?us-ascii?Q?rOvkGzmkymguekgxrfSp7tAdtMNo/FcwhA56tLLGyXXzFm2QyoveE/dBt9nR?=
 =?us-ascii?Q?KPXikpbCsEwz5JyOufdJW3LUmPhH62nDdFfwSqOJb0qmfnPtTGU7V77HrpMq?=
 =?us-ascii?Q?iHwcuYIQwPqcfGzeMHMOVcVwun7E9H195xEGoKMNe0nv23fejtIGevcej19V?=
 =?us-ascii?Q?LIpDE6+FWliuk23nTUcqcn/ivO7BOwXhH+v3ITAODMVejTLApz2mDbU9cjRX?=
 =?us-ascii?Q?eP0tVLiqgIITJajpjrDkOjF9D2T8AjqI2HvAMvhv/sqmeBARCTyr+92BlXCi?=
 =?us-ascii?Q?YpZSDuYtLdaT+xGKaf+HWJX/TXt8VUCyG7eSAmOOYBkB26Mm4e95BZ6DlmZL?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdda062-b393-4af1-f058-08dcbad73659
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:01:07.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkVgoqF9Rl6cN0aiJ2QP5Kf5Sf0n24vkTgSmhnGLk53rE/DdVILNnmcCj+n8Rkh3fHe+6w1eQWJGZNl4avBoLMIHVFWtXDGBAs0HZQFUVUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

On Thu, Jul 25, 2024 at 11:19:38AM GMT, Gustavo Sousa wrote:
>Extend the current hook functionality to allow using multiple hook
>descriptors. That allows running a test binary like the following:
>
>    my-test --hook pre-subtest:do-something \
>            --hook post-subtest:do-somthing-else
>
>Which is more convenient to the user than having to implement a script
>that checks the value of IGT_HOOK_EVENT environment variable.
>
>Note that we still need to add the same support for igt_runner, which is
>left for a followup change.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> lib/igt_core.c                   | 27 +++++++-----
> lib/igt_hook.c                   | 75 ++++++++++++++++++++++++--------
> lib/igt_hook.h                   |  3 +-
> lib/tests/igt_hook.c             | 13 +++++-
> lib/tests/igt_hook_integration.c | 74 ++++++++++++++++++++++++++++---
> runner/settings.c                |  1 +
> 6 files changed, 157 insertions(+), 36 deletions(-)
>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index 51141722c89b..e0edfe18f50e 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -78,6 +78,7 @@
> #include "igt_map.h"
> #include "igt_device_scan.h"
> #include "igt_thread.h"
>+#include "igt_vec.h"
> #include "runnercomms.h"
>
> #define UNW_LOCAL_ONLY
>@@ -1115,10 +1116,12 @@ static int common_init(int *argc, char **argv,
> 	struct option *combined_opts;
> 	int extra_opt_count;
> 	int all_opt_count;
>+	struct igt_vec hook_strs;
> 	int ret = 0;
>
> 	common_init_env();
> 	IGT_INIT_LIST_HEAD(&subgroup_descriptions);
>+	igt_vec_init(&hook_strs, sizeof(char *));
>
> 	command_str = argv[0];
> 	if (strrchr(command_str, '/'))
>@@ -1241,17 +1244,7 @@ static int common_init(int *argc, char **argv,
> 			break;
> 		case OPT_HOOK:
> 			assert(optarg);
>-			if (igt_hook) {
>-				igt_warn("Overriding previous hook descriptor\n");
>-				igt_hook_free(igt_hook);
>-			}
>-			ret = igt_hook_create(optarg, &igt_hook);
>-			if (ret) {
>-				igt_critical("Failed to initialize hook data: %s\n",
>-					     igt_hook_error_str(ret));
>-				ret = -2;
>-				goto out;
>-			}
>+			igt_vec_push(&hook_strs, &optarg);
> 			break;
> 		case OPT_HELP_HOOK:
> 			igt_hook_print_help(stdout, "--hook");
>@@ -1285,11 +1278,23 @@ static int common_init(int *argc, char **argv,
> 		}
> 	}
>
>+	if (igt_vec_length(&hook_strs)) {
>+		ret = igt_hook_create(hook_strs.elems, igt_vec_length(&hook_strs), &igt_hook);
>+
>+		if (ret) {
>+			igt_critical("Failed to initialize hook data: %s\n",
>+				     igt_hook_error_str(ret));
>+			ret = -2;
>+			goto out;
>+		}
>+	}
>+
> 	common_init_config();
>
> out:
> 	free(short_opts);
> 	free(combined_opts);
>+	igt_vec_fini(&hook_strs);
>
> 	/* exit immediately if this test has no subtests and a subtest or the
> 	 * list of subtests has been requested */
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>index b9350fdd78b1..ae32668b15f0 100644
>--- a/lib/igt_hook.c
>+++ b/lib/igt_hook.c
>@@ -35,9 +35,13 @@
>
> typedef uint16_t evt_mask_t;
>
>-struct igt_hook {
>+struct igt_hook_descriptor {
> 	evt_mask_t evt_mask;
> 	char *cmd;
>+};
>+
>+struct igt_hook {
>+	struct igt_hook_descriptor *descriptors;
> 	char *test_name;
> 	size_t test_name_size;
> 	char *subtest_name;
>@@ -172,15 +176,16 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>
> /**
>  * igt_hook_create:
>- * @hook_str: Hook descriptor string.
>+ * @hook_str: Array of hook strings.
>+ * @n: Number of element in @hook_strs.
>  * @igt_hook_ptr: Destination of the struct igt_hook pointer.
>  *
>  * Allocate and initialize an #igt_hook structure.
>  *
>- * This function parses the hook descriptor in @hook_str and initializes the
>+ * This function parses the hook descriptors in @hook_strs and initializes the
>  * struct. The pointer to the allocated structure is stored in @igt_hook_ptr.
>  *
>- * The hook descriptor comes from the argument to `--hook` of the test
>+ * Each hook descriptor comes from the argument to `--hook` of the test
>  * executable being run.
>  *
>  * If an error happens, the returned error number can be passed to
>@@ -188,20 +193,43 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>  *
>  * Returns: Zero on success and a non-zero value on error.
>  */
>-int igt_hook_create(const char *hook_str, struct igt_hook **igt_hook_ptr)
>+int igt_hook_create(const char **hook_strs, size_t n, struct igt_hook **igt_hook_ptr)
> {
> 	int ret;
>-	evt_mask_t evt_mask;
>-	const char *cmd;
>+	size_t cmd_buffer_size;
>+	char *cmd_buffer;
> 	struct igt_hook *igt_hook = NULL;
>
>-	ret = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>-	if (ret)
>-		goto out;
>+	/* Parse hook descriptors the first time to learn the needed size. */
>+	cmd_buffer_size = 0;
>+	for (size_t i = 0; i < n; i++) {
>+		evt_mask_t evt_mask;
>+		const char *cmd;
>+
>+		ret = igt_hook_parse_hook_str(hook_strs[i], &evt_mask, &cmd);
>+		if (ret)
>+			goto out;
>+
>+		cmd_buffer_size += strlen(cmd) + 1;
>+	}
>+
>+	igt_hook = calloc(1, (sizeof(*igt_hook) + (n + 1) * sizeof(*igt_hook->descriptors) +
>+			      cmd_buffer_size));
>+
>+	/* Now parse hook descriptors a second time and store the result. */
>+	igt_hook->descriptors = (void *)igt_hook + sizeof(*igt_hook);
>+	cmd_buffer = (void *)igt_hook->descriptors + (n + 1) * sizeof(*igt_hook->descriptors);
>+	for (size_t i = 0; i < n; i++) {
>+		evt_mask_t evt_mask;
>+		const char *cmd;
>+
>+		igt_hook_parse_hook_str(hook_strs[i], &evt_mask, &cmd);
>+		strcpy(cmd_buffer, cmd);
>+		igt_hook->descriptors[i].evt_mask = evt_mask;
>+		igt_hook->descriptors[i].cmd = cmd_buffer;
>+		cmd_buffer += strlen(cmd) + 1;
>+	}
>
>-	igt_hook = calloc(1, sizeof(*igt_hook));
>-	igt_hook->evt_mask = evt_mask;
>-	igt_hook->cmd = strdup(cmd);
> 	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
> 	igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
> 	igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>@@ -237,7 +265,6 @@ void igt_hook_free(struct igt_hook *igt_hook)
> 	if (!igt_hook)
> 		return;
>
>-	free(igt_hook->cmd);
> 	free(igt_hook->test_name);
> 	free(igt_hook->subtest_name);
> 	free(igt_hook->dyn_subtest_name);
>@@ -327,6 +354,7 @@ static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_
> void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> {
> 	evt_mask_t evt_bit;
>+	bool has_match = false;
>
> 	if (!igt_hook)
> 		return;
>@@ -334,9 +362,19 @@ void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> 	evt_bit = (1 << evt->evt_type);
> 	igt_hook_update_test_name_pre_call(igt_hook, evt);
>
>-	if ((evt_bit & igt_hook->evt_mask)) {
>+	for (size_t i = 0; igt_hook->descriptors[i].cmd; i++) {
>+		if (evt_bit & igt_hook->descriptors[i].evt_mask) {
>+			has_match = true;
>+			break;
>+		}
>+	}
>+
>+	if (has_match) {
> 		igt_hook_update_env_vars(igt_hook, evt);
>-		system(igt_hook->cmd);
>+
>+		for (size_t i = 0; igt_hook->descriptors[i].cmd; i++)
>+			if (evt_bit & igt_hook->descriptors[i].evt_mask)
>+				system(igt_hook->descriptors[i].cmd);
> 	}
>
> 	igt_hook_update_test_name_post_call(igt_hook, evt);
>@@ -466,5 +504,8 @@ available to the command:\n\
>   values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
>   events and will be the empty string for other types of events.\n\
> \n\
>-");
>+\n\
>+Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
>+when matching events and running hook commands.\n\
>+", option_name);
> }
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>index 83722cbb2f2b..e9f97b79b943 100644
>--- a/lib/igt_hook.h
>+++ b/lib/igt_hook.h
>@@ -6,6 +6,7 @@
> #ifndef IGT_HOOK_H
> #define IGT_HOOK_H
>
>+#include <stddef.h>
> #include <stdio.h>
>
> /**
>@@ -60,7 +61,7 @@ struct igt_hook_evt {
> 	const char *result;
> };
>
>-int igt_hook_create(const char *hook_str, struct igt_hook **igt_hook_ptr);
>+int igt_hook_create(const char **hook_strs, size_t n, struct igt_hook **igt_hook_ptr);
> void igt_hook_free(struct igt_hook *igt_hook);
> void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
> const char *igt_hook_error_str(int error);
>diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
>index 0d71909e676a..676c6eb7a818 100644
>--- a/lib/tests/igt_hook.c
>+++ b/lib/tests/igt_hook.c
>@@ -42,6 +42,15 @@ out:
> 	return i;
> }
>
>+static int igt_single_hook(const char *hook_str, struct igt_hook **igt_hook_ptr)
>+{
>+	const char *hook_strs[] = {
>+		hook_str,
>+	};
>+
>+	return igt_hook_create(hook_strs, 1, igt_hook_ptr);
>+}
>+
> static void test_invalid_hook_descriptors(void)
> {
> 	struct {
>@@ -59,7 +68,7 @@ static void test_invalid_hook_descriptors(void)
> 			int err;
> 			struct igt_hook *igt_hook;
>
>-			err = igt_hook_create(invalid_cases[i].hook_desc, &igt_hook);
>+			err = igt_single_hook(invalid_cases[i].hook_desc, &igt_hook);
> 			igt_assert(err != 0);
> 		}
> 	}
>@@ -112,7 +121,7 @@ static void test_all_env_vars(void)
> 	ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
> 	igt_assert(ret > 0);
>
>-	ret = igt_hook_create(hook_str, &igt_hook);
>+	ret = igt_single_hook(hook_str, &igt_hook);
> 	igt_assert(ret == 0);
>
> 	igt_hook_event_notify(igt_hook, &evt);
>diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
>index c552d5a4e796..8dffa0819f9b 100644
>--- a/lib/tests/igt_hook_integration.c
>+++ b/lib/tests/igt_hook_integration.c
>@@ -215,6 +215,14 @@ out:
> 	return true;
> }
>
>+
>+#define checked_snprintf(char_array, format...) \
>+	({\
>+		int ret__ = snprintf(char_array, sizeof(char_array), format); \
>+		internal_assert(0 < ret__ && ret__ < sizeof(char_array)); \
>+		ret__; \
>+	})
>+
> static void run_tests_and_match_env(const char *evt_descriptors, const char **expected_envs[])
> {
> 	int i;
>@@ -230,11 +238,9 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
> 	/* Use grep to filter only env var set by us. This should ensure that
> 	 * writing to the pipe will not block due to capacity, since we only
> 	 * read from the pipe after the shell command is done. */
>-	ret = snprintf(hook_str, sizeof(hook_str),
>-		     "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>-		     evt_descriptors,
>-		     pipefd[1]);
>-	internal_assert(0 < ret && ret < sizeof(hook_str));
>+	checked_snprintf(hook_str,
>+			 "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>+			 evt_descriptors, pipefd[1]);
>
> 	set_fake_argv("igt_hook_integration", "--hook", hook_str, NULL);
>
>@@ -254,6 +260,59 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
>
> }
>
>+static void test_multiple_hook_options(void)
>+{
>+	int ret;
>+	int pipefd[2];
>+	pid_t pid;
>+	char hook_strs[3][128];
>+	char hook_out[4096] = {};
>+	char expected_output[] = (
>+		"  hook-2 pre-subtest igt@igt_hook_integration@a\n"
>+		"  hook-0 post-subtest igt@igt_hook_integration@a\n"
>+		"  hook-1 post-subtest igt@igt_hook_integration@a\n"
>+		"  hook-2 pre-subtest igt@igt_hook_integration@b\n"
>+		"  hook-0 post-subtest igt@igt_hook_integration@b\n"
>+		"  hook-1 post-subtest igt@igt_hook_integration@b\n"
>+		"  hook-0 post-test igt@igt_hook_integration\n"
>+	);
>+
>+	ret = pipe(pipefd);
>+	internal_assert(ret == 0);
>+
>+	checked_snprintf(hook_strs[0],
>+			 "post-test,post-subtest:echo '  hook-0' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
>+			 pipefd[1]);
>+
>+	checked_snprintf(hook_strs[1],
>+			 "post-subtest:echo '  hook-1' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
>+			 pipefd[1]);
>+
>+	checked_snprintf(hook_strs[2],
>+			 "pre-subtest:echo '  hook-2' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
>+			 pipefd[1]);
>+
>+	set_fake_argv("igt_hook_integration",
>+		      "--hook", hook_strs[0],
>+		      "--hook", hook_strs[1],
>+		      "--hook", hook_strs[2],
>+		      NULL);
>+
>+	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
>+	internal_assert(safe_wait(pid, &ret) != -1);
>+	internal_assert_wexited(ret, IGT_EXIT_FAILURE);
>+
>+	close(pipefd[1]);
>+	read_whole_pipe(pipefd[0], hook_out, sizeof(hook_out));
>+	close(pipefd[0]);
>+
>+	if (strcmp(hook_out, expected_output)) {
>+		printf("Expected output:\n%s\n\n", expected_output);
>+		printf("Output from hook:\n%s\n", hook_out);
>+	}
>+	internal_assert(strcmp(hook_out, expected_output) == 0);
>+}
>+
> int main(int argc, char **argv)
> {
> 	{
>@@ -307,4 +366,9 @@ int main(int argc, char **argv)
> 		printf("Check multiple event types tracking\n");
> 		run_tests_and_match_env("post-dyn-subtest,pre-subtest", expected_envs);
> 	}
>+
>+	{
>+		printf("Check multiple hook options\n");
>+		test_multiple_hook_options();
>+	}
> }
>diff --git a/runner/settings.c b/runner/settings.c
>index e554a5c70776..6fd742cc826d 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -758,6 +758,7 @@ bool parse_options(int argc, char **argv,
> 				fprintf(stderr, "Newlines in --hook are currently unsupported.\n");
> 				goto error;
> 			}
>+			/* FIXME: Allow as many options as allowed by test binaries. */
> 			settings->hook_str = optarg;
> 			break;
> 		case OPT_HELP_HOOK:
>-- 
>2.45.2
>
