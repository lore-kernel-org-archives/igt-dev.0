Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C33C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 13:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E672710E228;
	Mon, 12 Aug 2024 13:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITfrRGn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618A10E228
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723471120; x=1755007120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lPVY4zwU/gLEvAq4Yd6KGN2qpoTMMNUeF7OsQjkDvoM=;
 b=ITfrRGn1XM0nv0sY/M2VqdZ0s/4HP38VAHuGsfs7zR0ugHe9+kK+DRAq
 uf4AWyfZvSdMMi2N1F8cVsl8ZJcnCXTLkcKQ1lYtTTh1TIZ8calF8Cm50
 2ipYXLOS9rm6pkZuIh2RhSZmDHXCwdA/VJwOWUnXRjUjVAP7oZJwVtil9
 gQ4a7cTwyKvT+oiKZRMFwvmGb7jR1W2+zF3vjdlKS2M+oaQcTGb75zauM
 kQp+YaQGmChlmh2RBQ+IxYjSXSLcjAIKMQrglJ1cm99iSHzfstZhvsOhB
 UIFszkbeDpWwxWZuXiC6tHQzweSYPuiUWtWlyGJYEB3JS8TcQxUGSYCOL g==;
X-CSE-ConnectionGUID: tAEoct6fQGKJfiQkfsIqtA==
X-CSE-MsgGUID: Yu02JxGwQkWfvtZIvWwOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25446646"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="25446646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:58:40 -0700
X-CSE-ConnectionGUID: Q7ZP18SqTpqA97L6N8otgg==
X-CSE-MsgGUID: ml4o3zyeTP667foeUnx6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="57929869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 06:58:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:58:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:58:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 06:58:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 06:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmdUUcYTF/rIYOKVz2BkrhgmotHysDTq6MipdVM8LSf/rIePRWz7wxpcJDOzigyKYMyxd98xoMi8vOaXh0v4EewpTU56Vf8UMeaMZLLA0+L83/kRIc88Ep5tRsxMjISAxtc/xXpkhwthyg0tMmD6OQOtPppl6ri3LODCK8m34EWKZKLbExSDXDre4+nxqYQqCcztWjcE3UboJtVaF8vtGuGayttR+mN4TNuzRLhlMkmGEZgPPvE23M5ycBlHAwDIPn9BlXc5n67DCYqMjLfpFtvGH9fOBImyNC4Oo23Vbu4noyCnxUVaE95Qi+RU/ddlHf33bz5dLFwG+TqXBljnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je4YuFCaovMuSJM4tKKJySf4sLSA/UgEPAVGUJabIAA=;
 b=sYpo7grqN6jrCPlMizjw43nTi3lKE4lw92I/gSbTaYD8yqOyYxvNCYRvVrUtnoELeMBp9s7r1dnYmdTzn8GvxVnW7hUSW5V2w87dCD7NsBRk3VqxcoIxvCIYNwHSro5W5WGQ4+Ri1u+cfwQDGfbl6SE8TDt8GEDs9GO+VzmQ2+l4BvRTxF6Tt4XJvEiZLhTR5FVjT/E6mrwXErIr3CILvejDMuEiSRfh+/cXbQaB3ss3uwqJFgxt6XAV/YGlMYlMC7a95ykBwjbNwOHy5S2guibm6WQjpdcv3887ItUAkj9WB1Rp1uLJCBDDSY9djAZvbTj/m1em8y+WojVuBjzlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 12 Aug
 2024 13:58:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 13:58:36 +0000
Date: Mon, 12 Aug 2024 08:58:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 4/6] igt_hook: Implement and use set_fake_argv()
 in test
Message-ID: <k6m6hgvqtd4m5mswvutge3pisf6t7rlkb2jqrmmeqvhee5frxc@yzx2nalfz7wj>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-5-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d2ea4c-8a34-4ac3-ade1-08dcbad6dca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kXBxke0lXf9Da9gLEYGd6SQghR2EK/rJs2HbqB0BPA1EStDr5CbHmSmAykb4?=
 =?us-ascii?Q?j+DgL00YEzroy6M+bkpFtwpw2rrti5i1nqooFOCHpyOhQuK/yLQ3omD1uyGC?=
 =?us-ascii?Q?PblF29jbgOA5KQivExVPynI/Skf5yeG2hN0QsRGpBoPGQ6MtMDpkGlUAKMgn?=
 =?us-ascii?Q?X8B5UyiScSqVfXyzw/RchdFimvaxBANdXJNYzz6JHsXQM0RWJTCfO9hUlsPF?=
 =?us-ascii?Q?+KglzkVWcTtcFNkS/pvTDNHQ+pexcSgndpkRtXlHn6WgwalWiCZda40olMC9?=
 =?us-ascii?Q?j3rrFuhP2vFnma4SMHW3srv/P85Jn+CjNpQE6ndtx4gqQHT+Y3vWLqyNGomU?=
 =?us-ascii?Q?7CVBb3+5K2r5ew/8GBjxhG3pMK713qVHA8QJE2aax/orZ5a51PMmY39obMF9?=
 =?us-ascii?Q?+UR5Wc9wQZqep8coAtFOHOf5a3W76E97V4j76UkRdO1E7osL/Kh2z+KeWvk2?=
 =?us-ascii?Q?IoNlbxFJkr6mhTrkGfhJ9gn/IAYM8CXjWuTXmbIPH7b9dAOcrhGi3zeI/G1F?=
 =?us-ascii?Q?jae3Qc1QTFu+gDNi2B+WbwUp0rYy8MBocDQyafZ3UxjXv5hhufdDrqEGAljH?=
 =?us-ascii?Q?Yobh5DOdQhZL8IPSl9DiuW2879o9eCoJB2TYrZeUPYO0z55BJNZDxb3T/DaK?=
 =?us-ascii?Q?ATZmfXvxgn7LwyWbZlJDQsXmWaBUUwVPbzwYgVTMHBOwBvORz/LoGYlO5Ksp?=
 =?us-ascii?Q?CO5E0nkR00ilMK5B4G6eo8YAEC8MYj1RGA7bOfXN4boVxfvPvIcKPnde6Jd1?=
 =?us-ascii?Q?tQU3BV6byqUR8M/4lVsc+f4huZbvqHe55KN7lFyvBgcqb+rLbn0PG/paQ8RS?=
 =?us-ascii?Q?A3zAbDPgiR1oVXFNHutmPQAme+D7yhxuMiFkb0m4jYwIKQufbge7FWiqQHaL?=
 =?us-ascii?Q?Rt9Er0B6DSB0uS6PziO6OSjVTizxJAMConf7GzxxGpm0/wENHf7Bcz2cmiyo?=
 =?us-ascii?Q?CC71/CQigZYq4EVX8uAGzz0iPltKLaAm/59alelYQHSxF05w/P5irKoiGoHX?=
 =?us-ascii?Q?DpfK9z6SDpNIeQTXPk5yQ4opTSE0/AFTkm8/GfHhFA9wi5j275Lj1JRLut3h?=
 =?us-ascii?Q?+QOVVx7oeOJqF8+1I/iqNsJIUjJTo8QCFad6ok0hsYuj45hkdOs+yjFV9tzZ?=
 =?us-ascii?Q?ka3ezpFCysDDAMrlbkI3sWC+/zgJa0l7P3UzDk1kLDnimGSFJ/b2+gCzubVa?=
 =?us-ascii?Q?S9JmTk0cNlhBCHsUl8VXGWhGH54+MS4IozIaTtLwjfUEZTILAH7yM5FgCQcT?=
 =?us-ascii?Q?gV9K8P6LQi9kwPp/jZZ5+AMHCobf38Cjrbi0pS8Ot5PDqhJ4Xv/bhk+xwm3p?=
 =?us-ascii?Q?EwdpaPfnLKDRMaJdnGnKE8xUzxDuH+vV2nJ5xXh3Mbc8dw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+TrTePzX4A6iSX/grl1fNQ03qQmwmG7hYfLTtTyQDBrDdEcs9Fkt4eXGtuW?=
 =?us-ascii?Q?WJ9n/RGr6WAtOeHXrlGDwSv7z7uP0W8OhcC7BvCETdBKQp5R14aqxu1tFGQI?=
 =?us-ascii?Q?4k8skPZyPHmGIJXhCD5qZ5fZzhQuyGF56GoO16SvlHIsMP7iXLibkFWA+pum?=
 =?us-ascii?Q?jBZRnIQBOLnQ6Mpaer0qCT6B76jy8EAYZf+XTGqqO4f8mLjjeBOaphaTWtzc?=
 =?us-ascii?Q?dN0o5L6TmF9QzIzh+I5FsPbODuPU0SnI6oUO9xsr68fxU+8DDYZbGXaHkjPF?=
 =?us-ascii?Q?lQUte2CuhlCZP1uqYVpoDzwPWksrRsYliVfcK8pp0j4nJDqnJ6vLkUh16hQq?=
 =?us-ascii?Q?Ud/2Q6o2U46Kfo/EH+ouga7QmBluIrGtxn05xsEu8uM3i/ja3qOzwWU4JWoO?=
 =?us-ascii?Q?TGMFrcYYmgLmR9BbUbN5VWVySYcgZZjhwIC9r5EP6wyl31AYnATj3QUfZ4b6?=
 =?us-ascii?Q?LsaI93kirvOnXO1/1Po0Be+r/CrGrf6dWQyjIiEbvsO5PJnAUMeoIs2lMOAw?=
 =?us-ascii?Q?k9APiTf10nNJX2z6B0KvflwfpO/NPcbT8UpCGg80ZJh8zqysMIHGYsEY3tly?=
 =?us-ascii?Q?TRe/Mj+zHP8XDtGXcZZKcSeJgfFxnKPuHwaecLjnM+UbZW7RQpBIRM7A7FHD?=
 =?us-ascii?Q?vhBrDUzKTbcBnLrDlGgxMvtVMWsHNag+SFRtmhRsPRGEqDxxQvOvRcBD0s0l?=
 =?us-ascii?Q?0vfpWu5zFenKkq9koGueJyiOw2Xv0NbGtLhGCEivfuegmKUBHX9LHOtY9W6V?=
 =?us-ascii?Q?b5jOIEK+sKoMcgT72ZN2jg0S/JAiBigfNh49wbRMgFI2ThOF+pQfkAW9Sx7I?=
 =?us-ascii?Q?H7/Fs3TzYYQfEWz4Ozz2lHwUK197y2Da06uOnQGI9qNzqaF4kqPWRAA5jG0d?=
 =?us-ascii?Q?RiJs21Cj4pKdtmvKrNjxUbdEBAvqKZq/sf0dKgNFiSPp+4spebvcgH0F9iwd?=
 =?us-ascii?Q?x1/rll7s09wqNGSNT6WnmELb69Sn69FdfpsZ6vOUidwJni+pF7iCeA1IssgL?=
 =?us-ascii?Q?IL0kb7aYJQpER/onAeB5KWW5PryTQ5Hw7mBviVkjadgP8kavXQv4l02vYCEZ?=
 =?us-ascii?Q?w1JMzRUcJSXhmuQ2eX638BKdvW+whY4vIo90ILhDw5Yt2BSDBfneIVniiaw6?=
 =?us-ascii?Q?leHPLSjtcxFbaEBYh+WUS5ZorAvHdqnj11GuoltgqTJQh5XBmoJQLFNNmJCe?=
 =?us-ascii?Q?keskGxCHj3Cx389Rh7B+Cgjbn9XQHb8fBVsGKOHMtYTy8AU9hc5t3kC1SnyJ?=
 =?us-ascii?Q?Q1R8KWKDNqQeXYlBYbS4Oy0HEnRBXESelhbFovRSTk4LwYaOFQUcBFjzUw06?=
 =?us-ascii?Q?VbOOq9nXj0U/kp0rZknJNeXFmoTbxiA5KsIk5qFMktdiW8mQ+S5cTbhpBv6+?=
 =?us-ascii?Q?/rwWzodNWpUoKuy4LamYo6zKGMV+EJ30DUpfZUAlfR7UFNyCgpiEn62MY79Q?=
 =?us-ascii?Q?P+aQ0R9L3/KLokVNAmRGsc/N5F+zWwAs9aks9edZ5C3tKpwj87rUf7QVOPEo?=
 =?us-ascii?Q?yx5h9DXNNLrtbI7HbonnJFudE3aGpSG5GOAjjg0y2YEtRdm4lwwOs8hzvUb/?=
 =?us-ascii?Q?uh/KNQ5DpcdVIL3ygqIayyXTjj6opdfD3tyPgGKt2ERyurubKhdbbk3Xv2UN?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2ea4c-8a34-4ac3-ade1-08dcbad6dca3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:58:36.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLqwq/ISmVXBgZEDL6g7qchtSw1c8gRFBgemlQEK8l7YkEiOrwTibrpblw9tfDu68UAXyokmNo9s7+4T2zUKNtSxMefGA2T6+C+2qBrWF3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
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

On Thu, Jul 25, 2024 at 11:19:37AM GMT, Gustavo Sousa wrote:
>In upcoming changes, fake_argv will need to allow a variable number of
>elements. As such, implement the variadic function set_fake_argv() to
>allow that.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> lib/tests/igt_hook_integration.c | 49 +++++++++++++++++++++++++-------
> 1 file changed, 39 insertions(+), 10 deletions(-)
>
>diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
>index f5ba25e92897..c552d5a4e796 100644
>--- a/lib/tests/igt_hook_integration.c
>+++ b/lib/tests/igt_hook_integration.c
>@@ -3,6 +3,7 @@
>  * Copyright(c) 2024 Intel Corporation. All rights reserved.
>  */
>
>+#include <stdarg.h>
> #include <stdbool.h>
> #include <stdio.h>
> #include <string.h>
>@@ -11,11 +12,9 @@
>
> #include "igt_tests_common.h"
>
>-char prog[] = "igt_hook_integration";
>-char hook_opt[] = "--hook";
>-char hook_str[128];
>-char *fake_argv[] = {prog, hook_opt, hook_str};
>-int fake_argc = sizeof(fake_argv) / sizeof(fake_argv[0]);
>+char fake_argv_buffer[1024];
>+char *fake_argv[64];
>+int fake_argc;
>
> #define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
> { \
>@@ -51,6 +50,32 @@ const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
>
> #define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
>
>+static void set_fake_argv(const char *arg0, ...)
>+{
>+	va_list ap;
>+	const char *arg;
>+	size_t buf_size;
>+
>+	fake_argc = 0;
>+	buf_size = 0;
>+
>+	va_start(ap, arg0);
>+
>+	arg = arg0;
>+	while (arg != NULL) {

nit: you could use a `for`:

for (arg = arg0; arg != NULL; arg = va_arg(ap, typeof(arg)))


anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		internal_assert(buf_size + strlen(arg) < sizeof(fake_argv_buffer));
>+		internal_assert((size_t)fake_argc < sizeof(fake_argv) / sizeof(fake_argv[0]));
>+
>+		strcpy(fake_argv_buffer + buf_size, arg);
>+		fake_argv[fake_argc++] = fake_argv_buffer + buf_size;
>+		buf_size += strlen(arg) + 1;
>+
>+		arg = va_arg(ap, typeof(arg));
>+	}
>+
>+	va_end(ap);
>+}
>+
> __noreturn static void fake_main(void)
> {
> 	igt_subtest_init(fake_argc, fake_argv);
>@@ -85,7 +110,7 @@ static void test_invalid_hook_str(void)
> 	static char err[4096];
> 	int errfd;
>
>-	sprintf(hook_str, "invalid-event:echo hello");
>+	set_fake_argv("igt_hook_integration", "--hook", "invalid-event:echo hello", NULL);
>
> 	pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
>
>@@ -196,6 +221,7 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
> 	int ret;
> 	int pipefd[2];
> 	pid_t pid;
>+	char hook_str[128];
> 	FILE *f;
>
> 	ret = pipe(pipefd);
>@@ -204,10 +230,13 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
> 	/* Use grep to filter only env var set by us. This should ensure that
> 	 * writing to the pipe will not block due to capacity, since we only
> 	 * read from the pipe after the shell command is done. */
>-	sprintf(hook_str,
>-		"%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>-		evt_descriptors,
>-		pipefd[1]);
>+	ret = snprintf(hook_str, sizeof(hook_str),
>+		     "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>+		     evt_descriptors,
>+		     pipefd[1]);
>+	internal_assert(0 < ret && ret < sizeof(hook_str));
>+
>+	set_fake_argv("igt_hook_integration", "--hook", hook_str, NULL);
>
> 	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
> 	internal_assert(safe_wait(pid, &ret) != -1);
>-- 
>2.45.2
>
