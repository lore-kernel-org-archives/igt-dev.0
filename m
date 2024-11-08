Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EADD6407A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 19:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30F10EA2E;
	Fri,  8 Nov 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUF7b5yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9947110EA2E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731093520; x=1762629520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MF/lswGSDgmoZtHmnF8hpdr55qVpfj93K1qQyZINm/c=;
 b=UUF7b5yi2a9qNhk6md8Bwhq/B+ZhL2FIySMaifhIqYygOOxUd3z1uY/2
 dCz42ifz3O2ui2Edn3QPmKTZv3fzWxopWbJzIDWGDyGimiegz0iCKu0G0
 jEifzZzawR4lC6VBt/ZkoszdmBAwveMrqww2tehQbs2Y8jW3UCeeWdqhP
 DXVj6ROvquPt42qNTtkyN9xJm+A9wTvTdnMgHI8/TWxv6GM8mg2AxgNvV
 QppnJmAw9yuw73HwHXt6gNYjqei7uyhFMm5lbW6ceiEmBmf4wjj+3qUPF
 OZTNNReaSI3LTrurDx3nQcBaXpmd42dosHImU4dwvkDNBPdBDTyt7YcLb g==;
X-CSE-ConnectionGUID: 12qF4amaTKe1EmF8MXd3kQ==
X-CSE-MsgGUID: L7xePaR3QpCuFEy1pz9kaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30845576"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30845576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 11:18:39 -0800
X-CSE-ConnectionGUID: BdL8nL/QRiGxlXJUgkapUQ==
X-CSE-MsgGUID: Dqw+1RAmQkC1nRaTbYP+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="108981403"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 11:18:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 11:18:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 11:18:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 11:18:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6wjByOgPB9JAit9oJZGMeR+iVnotAf6A06/PHwBmNhQvxiAge554uPNk9tv2i71nb1vX55xAjS317B/eNUrug3xQf1tpgnfoGi2MMVlQfs2W0UNw2eZFnY8BxevC0Z6lDuEuRfGvp/Zn5CDM2KCF0JiXFtIeZd26+hgclyP0egg6LiLlWAOkhXMoEkOGqxRw1AIk8vFxMP5d+o/xyxp+jhtZrUxgrrXQQ1kCS22/2LkLEyUR/Lui/G+0PeVffn8iH+AdECywJrIdeQxpi3/bLr8mtiqxTgOEBg8H2cOVHbXsUHEGCyNjxkR47QDgL9QSZohUGJcR+Qf1Ww2wkCTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQf+e4yYsXvGQlZsp4wRzThPvQrJ129zDI6G+gVu8Ao=;
 b=R+av7wRehe6Qv9kz79LHcaLADtwEy15ZtkF+rwX5rJd85n5tjilfAsfUikxBIopFrVIlIFMvIFq3xuKc5eVcT6BQ6yaNF27ZhJZI5fjnjx8MMHxMi3lUaZT670WYOGsCr+cVJ7FMDMe6JW1KxXb5tIf+untZvX0i8as6cScpzUDikg7PHreeZzHPFvWXRArbWE9/rr2ht/BvJn4TeiB7hTmXqOiuDtbiFR3eX6Zi6Hj4Ds0EPu6Zmtg126P0iPrO+H3MWAIh8NyF+k30cm++E6CVUAVmVNys8BSQB2qOiAWYqOoYYjy3WYBfUjhXxFHcLwaUfoBIG2aQ7LQCbu07RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 19:18:29 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 19:18:29 +0000
Date: Fri, 8 Nov 2024 14:18:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/5] tests/intel/xe_fault_injection: Use igt_sysfs
 helpers
Message-ID: <Zy5kAfpglK9dWMYO@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
 <20241108160021.1202234-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108160021.1202234-4-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2591b436-2be5-4249-3705-08dd002a2067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5jhUntNbYeYSTtC1Isj4XHWwQ4zw5dyBZ25pPWKaWVUsEwZcp+cAezH2RGc5?=
 =?us-ascii?Q?Kwb1IyYEyBhA4SlWGCglEyoaIjLvqVqa5wZysiReaycjnejkKFkWH2CT1pWL?=
 =?us-ascii?Q?R3UOvUQljknODIQyJYWWGCK0hd22p2Hu9OCRN2eN5QEymP+PWPYlsxA3mt+/?=
 =?us-ascii?Q?h8rQYmqz+ceyNK2RTlE9SVwEqc0NeDb/970Stdu1OGSaVBxHqngz17fBhNrI?=
 =?us-ascii?Q?VeNM5cvcXuUkOKeMqUXY9oQh5sCYXSCjqE8QQSLGrL9KmythUPMDsYLp/f+u?=
 =?us-ascii?Q?jGlePzvL0GxB1REx7rcIYBQ0QdjqlttDEpUfBR7j/DxOS55FRDfJCyq8D8zI?=
 =?us-ascii?Q?NQnFmlhc82Vz6sJs+YgaqqGJ63EOu/lUW5NuAh6YqKDgh6i5JmDsHI4fDtNZ?=
 =?us-ascii?Q?s+qzljTjT1dQnMD/USLhiMEEtisAk5vgaEdGLFMBr+gQIR2olrTZR62y5D4u?=
 =?us-ascii?Q?i9pfVwLVdABEvamN9DcGXIeetZ6tMuMXI0q3i96/igbd1ossdYgp08lqRxyA?=
 =?us-ascii?Q?5/g7BsvJFNNx1q1ef8x7UcXzrdWHD6lVOeiTYb+s3BeUBjNq6pvymiUZ0z1y?=
 =?us-ascii?Q?sa9DbZeJnE7O0p1tt+BRealXC/RuNPwnqCsfVqy1409ivonwXJc+M0Y+sFiH?=
 =?us-ascii?Q?Bv7Jm29nGmQzD8cbVEK+SPA/EPx4fjZAFqdmtg+ZC08kKm3K18erq7GIl9yn?=
 =?us-ascii?Q?WbJM/QJXPt5UY2WwGNVTRVHx53elKDc2oIekboF6IZtQMCZryGfYj0i5sOXW?=
 =?us-ascii?Q?Mru6hqieFpidcu0NyMBYf6lWDt+r/fUtrPGdMBBK4ZKEGMLxusSWd+HwCNj+?=
 =?us-ascii?Q?m01Yun/iDt5IEAKMzN9NEmUIR77YL/tGsHDmlRNFhzrfxb8WuV2d+S2Abwt0?=
 =?us-ascii?Q?CW25fZmPhgeRt7IRCPnuaFv3KLdb656brZl+7T1vUXCwAyPYSTlmNspqwhPB?=
 =?us-ascii?Q?+4bgkgQA9mbmwS3Bt4Id5ao5iK5gx73V12mjFPgdgmQ28NOdoW+y/Amti8lo?=
 =?us-ascii?Q?WmI7mWL7ouYFhQurjLJp9vhZYtaZp1vVo8qHd1XfOgnhYwEPEM+f9DBkFMEG?=
 =?us-ascii?Q?9ICKKAj9glWsW8Cc6VpZRrR4zkO7+eezEh1e7YP6l+jNAHsL/syiluR1tr9G?=
 =?us-ascii?Q?G4oosD4nyoV+LWPjBDy2oLsYY008MBLKO96Q2T3HnMYYU3rUie2Xe9/t0qmf?=
 =?us-ascii?Q?efJklTvkWuJx/syzejASiyiPedaUBN2ZYwhEpzLbqFM6DYlBLmNPFSEGzTwd?=
 =?us-ascii?Q?q9LHWuGjO9JsIwClfq9pPqubIeFCa2CfIRjjMXPyQGToqEC7FqpipZaAOiYL?=
 =?us-ascii?Q?pvwdL1Bmg42V4Gpbe4JdbBw1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?21Nz40vYggmFqjAeyNTrBH9xIE90L8om/bnYlNSmGUu5VE1T5CScqU8JAOHy?=
 =?us-ascii?Q?I4EnXkAjIvXL1dwwKUS9p7hwaOj801biaK5OwsYJqAJUYX/limvQBkVMXe9O?=
 =?us-ascii?Q?xvDNu/owUrcqp0+GcxhKxynBG2hEyZ/cTq+RhR9TjsYsJWa2/pFCBYc14l0N?=
 =?us-ascii?Q?cPDTv4llpwzuKZz+K60XB8E0xkPk0BibC9Cs9FVzTRlOVMmhNpcBEhdgYvhY?=
 =?us-ascii?Q?zYfXjGQg9esdHHaidPAKUbu4fna1wV+Q/DFCbi4SlqZAWcORIEc94SVhaOLJ?=
 =?us-ascii?Q?Hy3EGWY6HsdnayX1aFcibIbW4iYHhz/NW41DUvJOJM67AkWGFCkAvJMc8yz6?=
 =?us-ascii?Q?q/q4wUg9XAEeeKeneHaMiZRRQ2d+Ii4iZ34aiLosVfQFp+X5d/jFSourDSAl?=
 =?us-ascii?Q?ShuYTbJcB4QIPEon5QR3VrM/1BelqutB9JiMvEG9n+u4K37S8FNVfS/m7Gt8?=
 =?us-ascii?Q?G6c+ylBeRU+fzWGuq5jngKpBl2mrzj830OtnLNaz5ncqqGOFvuOXSCi46YnS?=
 =?us-ascii?Q?fGCbJInWe+CEdDL1npwBK03QLqiire4u7TcrA6QnC6mgfJBESzjUWIB6rXaC?=
 =?us-ascii?Q?LMLiAXCYGehywapBce9D6EgrOkCuTNuIoFUUbEFuYu4qZkqXnvJIbKJedadv?=
 =?us-ascii?Q?jWCUhYV1ttmRHYhYHKv0i8TBh15wuHFuIjfE2IrK+95blusPnMliUTMWfUMf?=
 =?us-ascii?Q?HoblyP9TRon3z65zosaiYH8JbqjJOCYurqQ0Qhf6D+FBLwMiHH8DQ63fuT3K?=
 =?us-ascii?Q?JvV0cLf9j3cWZz0jKh+ds+nhxd2mzL9KcynIU2GmlAK9xD3KeHkO/GkOyGol?=
 =?us-ascii?Q?5E93VOe76t1lXbjq3mDZ4xkbPOY/VVJPEIXGGBjuBpKwvwNRQ2X21upDI8+0?=
 =?us-ascii?Q?3/WT0lHdN0inptgoeo+oyg55O4vO0OipRykiEv++mfYvFPNdaL7KNyX8AcwK?=
 =?us-ascii?Q?kpncwj/Ogt16PIGXgMs2JV8/duZEZaSUN3xWjTzg28AWaipdpfseeqCNAcpP?=
 =?us-ascii?Q?y1yXfG6PaSAu4vo1sc6cKOZE0WwrLGhNYb25PMOhOb3GtUS2970NSdFV13nV?=
 =?us-ascii?Q?GpRakZW5wQxnRB3z15s280Dlw6VbWXF2sL0jGvFr9PBkQy55vkp1A1KZpM4F?=
 =?us-ascii?Q?ukOWrQMjSJw4UpjZHAVkWPZAnzXnGJJTqq+R3EoB1T+j9H/q5AXGlDdswG/m?=
 =?us-ascii?Q?gg99cvEJBwdgt14YYZ1rZ3tpP6nnrJg94S2wRb+pWxPU3Em9skcAQt9Zbfp1?=
 =?us-ascii?Q?dTzcKQ4zQWWNFfGNNGZjlpszdUPsuW0oMhFKqDf0vlOmQ4jcuBsh8hMI28F9?=
 =?us-ascii?Q?saWKyy6w0DEyyTPffWOxnvns4w3Lzo1b5n+M2j2NVGJz+Y7m/peDF68Jz4cE?=
 =?us-ascii?Q?QuL3DjxVaBd/bA8AiIKwRyMb5VAEMNPKDbx72eNAz3FSwObGIt7tuKRcQdR4?=
 =?us-ascii?Q?ox1bCrlzfmRV4Fs6GmAO7uOn17mxlY4yRGcBg3ilUURtK5gGowMY/cPPMiwK?=
 =?us-ascii?Q?oEopcX9ZBKXVaTus1WSGhQm+hMnm3UAhBQUbW5pVeOtdKzC7koHKKObX2l45?=
 =?us-ascii?Q?dXIxPwvXYyUOImEPmEh4kNb8VrffYgzHfY5vtGbxfiPWZrp5f5F52TRISUyq?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2591b436-2be5-4249-3705-08dd002a2067
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 19:18:29.0969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVMzjtgeRJ/18n0QjGpZoGfFdDt72X6m+MKPd/qH7A8TkID7dYdYg4LuSzKMOU+UzXrcG/9tBdb6VvQxUHD0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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

On Fri, Nov 08, 2024 at 04:59:31PM +0100, Francois Dugast wrote:
> Make use of existing helpers from igt_sysfs where possible. This
> improves robustness and removes code duplication.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 127 +++++++++++++++----------------
>  1 file changed, 61 insertions(+), 66 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 891b4d70b..87e567a54 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -11,15 +11,13 @@
>   * Test category: fault injection
>   */
>  
> +#include <limits.h>
> +
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  
> -#define MAX_LINE_SIZE			1024
> -#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> -#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> -#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
>  #define INJECT_ERRNO			-ENOMEM
>  
>  enum injection_list_action {
> @@ -27,40 +25,66 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +static int fail_function_open(void)
> +{
> +	int debugfs_fail_function_dir_fd;
> +	const char *debugfs_root;
> +	char path[96];
> +
> +	debugfs_root = igt_debugfs_mount();
> +	igt_assert(debugfs_root);
> +
> +	sprintf(path, "%s/fail_function", debugfs_root);
> +
> +	if (access(path, F_OK))
> +		return -1;
> +
> +	debugfs_fail_function_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_fail_function_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_fail_function_dir_fd;
> +}
> +
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>   */
> -static bool function_error_injection_enabled(void)
> +static bool fail_function_injection_enabled(void)
>  {
> -	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> +	char *contents;
> +	int dir;
>  
> -	if (file) {
> -		fclose(file);
> -		return true;
> -	}
> +	dir = fail_function_open();
> +	if (dir < 0)
> +		return false;
> +
> +	contents = igt_sysfs_get(dir, "injectable");
> +	if (contents == NULL)
> +		return false;
> +
> +	free(contents);
>  
> -	return false;
> +	return true;
>  }
>  
>  static void injection_list_do(enum injection_list_action action, const char function_name[])
>  {
> -	FILE *file_inject;
> +	int dir;
>  
> -	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> -	igt_assert(file_inject);
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
>  
>  	switch(action) {
>  	case INJECTION_LIST_ADD:
> -		fprintf(file_inject, "%s", function_name);
> +		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
>  		break;
>  	case INJECTION_LIST_REMOVE:
> -		fprintf(file_inject, "!%s", function_name);
> +		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
>  		break;
>  	default:
>  		igt_assert(!"missing");
>  	}
>  
> -	fclose(file_inject);
> +	close(dir);
>  }
>  
>  /*
> @@ -68,61 +92,33 @@ static void injection_list_do(enum injection_list_action action, const char func
>   */
>  static void setup_injection_fault(void)
>  {
> -	FILE *file;
> -
> -	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> -	igt_assert(file);
> -	fprintf(file, "N");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> -	igt_assert(file);
> -	fprintf(file, "100");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> -	igt_assert(file);
> -	fprintf(file, "0");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> -	igt_assert(file);
> -	fprintf(file, "-1");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> -	igt_assert(file);
> -	fprintf(file, "0");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> -	igt_assert(file);
> -	fprintf(file, "1");
> -	fclose(file);
> -}
> +	int dir;
>  
> -static void cleanup_injection_fault(void)
> -{
> -	FILE *file;
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> +	igt_sysfs_set_u32(dir, "probability", 100);
> +	igt_sysfs_set_u32(dir, "interval", 0);
> +	igt_sysfs_set_s32(dir, "times", -1);
> +	igt_sysfs_set_u32(dir, "space", 0);
> +	igt_sysfs_set_u32(dir, "verbose", 0);

is verbose changing from 1 to 0 intentional? wouldn't it deserve a
separate patch?

>  
> -	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> -	igt_assert(file);
> -	fprintf(file, "\n");
> -	fclose(file);
> +	close(dir);
>  }
>  
>  static void set_retval(const char function_name[], long long retval)
>  {
> -	FILE *file_retval;
> -	char file_path[MAX_LINE_SIZE];
> +	char path[96];
> +	int dir;
>  
> -	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
>  
> -	file_retval = fopen(file_path, "w");
> -	igt_assert(file_retval);
> +	sprintf(path, "%s/retval", function_name);
> +	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
>  
> -	fprintf(file_retval, "%#016llx", retval);
> -	fclose(file_retval);
> +	close(dir);
>  }
>  
>  /**
> @@ -161,7 +157,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  igt_main
>  {
>  	int fd;
> -	char pci_slot[MAX_LINE_SIZE];
> +	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
>  	} probe_function_sections[] = {
> @@ -182,7 +178,7 @@ igt_main
>  	};
>  
>  	igt_fixture {
> -		igt_require(function_error_injection_enabled());
> +		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> @@ -194,7 +190,6 @@ igt_main
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
>  	igt_fixture {
> -		cleanup_injection_fault();
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>  	}
> -- 
> 2.43.0
> 
