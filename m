Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34351C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C6510E54E;
	Tue, 25 Mar 2025 13:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dcm+q5AW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821AE10E54E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742909858; x=1774445858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TJz3vXeRO5cRRhgvCGk2tWTNJVwf/akVwKuwa3gQn28=;
 b=Dcm+q5AW3UVHsct04JvShausnzLSrS9tCXaq2hGcP7wZ9vVkgJZwGOKe
 tsNxydIG7JolgfMKn3wsyBmVfLd6EGX/riHOjtYJzowdW3zOjAUkpwpML
 rSHhotczugON9R7/sRIEMV7ErZB39nMdgXPsDmPn35eY/SMhcWTVHC7o5
 i2lT7+7x5b/4Y4CA+suL9/ZaENBVmnUdGWNmd4hQGq/Ia35NH3Tf5uYky
 UKb3aLoJMMRYe+WujJ+x4TF+yPscGqTxQfRsaWreBlDa6ZYIaTEXLJb8u
 7sgLXYOBw4zN8Ri6SQ3KLB8tYlFdxLSYEi3riX2U2e+o10FMuW69YoWrh Q==;
X-CSE-ConnectionGUID: CSDI239fROOoXhtTKQotsQ==
X-CSE-MsgGUID: 7O2bpyINRjqBbLLPldsidw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61548511"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="61548511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:37:37 -0700
X-CSE-ConnectionGUID: 7p3Er3KdTX2tWgQSlMm/IA==
X-CSE-MsgGUID: j6DOojAuQZeGc5FV7SEw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="128528538"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:37:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 06:37:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 06:37:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 06:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WW23gUAAB8r33BfQkg3lXVmtnIpk3Tou1BSJXS1tYvUzIRcqN4NgmHmhr5bGuqrY8FPzwzDxpJRz07FAUPsnll9rMN+m5rKaoknacAHJMaIZvyZMDyhtPabh4I1GccvrYJS6wyLDO5KUH+1B2Q1clcilotH226u4leD67CmnxLAUCIk2FFTUOJbppXDDsGyYmKcZZmZqa0WDMlWlupU8VZZr1YY5Ck0xYLmhikqgn4dlYXAyHdfzjuCbYrBpRO2onL4HArtF64DD3SfLiUG1vE3RiPXVIMpNs5P+8d8MchhBq3iFG1F3+xiIWRlnsOVnTzNTNbWgSDZePY99KlNp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGJva+FCvs89rNTBQqfDtAWl+cfsgjjzVgX1DDL1eAA=;
 b=hLY6VGznfVJvTno4THeLoHsnVnbzddzrVZswmhbnW5dYW88N6iYvzaMX/XLRTVilzhJtGS3+HfCcUSc6/xH6QyaMy0F6ZZWkQAMQDXLY+bGJZG6b1TdQHdhmxd1obTQ1Pgkh4CM8T25LYUIkBt8pyP1B/CcgaeaPSMk1msdpLnmCjU1erPHGWXAl9ztzBIggqaStrRivVjdl07Cim0zjyc4vNPa2Ja/Uo16FRH+KdMFqkDBsz/+LZ6CgGsE8oa0J0i1dYxbvtPuCRxNY3rcQqGnWL05d0gbKbV7SFkTt6/l9XJ6jiB7eUl6ZCI3oSECXN+p1+jqLd/S2b2SZ9qJ5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:37:03 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 13:37:03 +0000
Date: Tue, 25 Mar 2025 14:36:56 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Test some early
 probe functions
Message-ID: <Z-KxeGwYL3T9SMtO@fdugast-desk>
References: <20250311183833.1199190-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311183833.1199190-1-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 011c4f0d-61be-4942-d491-08dd6ba2208b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BZjeUSLUd6CRrNZog/f77PnIOvWjV9G2miKwvm7PJTQvpGwvzK/RpSNTH8d8?=
 =?us-ascii?Q?ahjbp8p++BybLRFKKhyfWo6jVRlsvPa81OlkTkIHpJtsM3s4yCo5ETDNVtL4?=
 =?us-ascii?Q?5nIV3YxyiuaFhuVrZ24EdmNEEVbmzSN/reOwvueq2Y61aX+Z70LFgp/jRH/r?=
 =?us-ascii?Q?rZ7EQDk0g51AfhcXBtLY2mMUYH7drH8RVXeohQrMEMBbNGX1fnV3P17t5R8S?=
 =?us-ascii?Q?5GH5kSDwbTV6AmFe0Dabm/Cbr2gTbVvyd4O1Bod6GqaR/Ah22V7AebsQxvr/?=
 =?us-ascii?Q?BO74w51ymosVyN2eDbsKucDFMqA4D4EaPxiMrAU95gd20tJX7wmapSYzlXiq?=
 =?us-ascii?Q?+VdNX/Wpkj7U6D9x5SFHgCRjk7M/N1lsR/OlEAeukp91sJWVPXibZGtTb0rv?=
 =?us-ascii?Q?pnu6UgMen8YTMV+5Zdc5FV9WxUNtH5+GIiDm8DW1OsI+pY8mzrK+oSsijXoB?=
 =?us-ascii?Q?/DdPUvS7l3Wt6+XoslnI/JJe1d9BIiNEcy4mDXD6ysTNjTp7wmQ46vOG0cQY?=
 =?us-ascii?Q?i18XcJGghEs78/XBCgg3MI7zncCy1H/CIZbEs6YeGNN3BqrJRfhvjUTdTgku?=
 =?us-ascii?Q?gfsbyo42evQovqJUpRmZmgKrZr4kG5qiRcaF2BU8jTOMru7281PnG27CAqy/?=
 =?us-ascii?Q?EZa6V0dhjD8iCL08mb3R5qsNkEWHUBfU9eQzWYEmoP7+CDWwUNu5tvl2jsmp?=
 =?us-ascii?Q?ZWgFvsT27XCfkDqcaoKtb2b0xE3ZV+BriihRXd6NVcqaqQ4gg4syAPmgVXZm?=
 =?us-ascii?Q?gdFUTZlLqitgPxwjZY/Gt/3tm/3mJUw/DL009uL4DuVnVvt4/3csb0iqsBJL?=
 =?us-ascii?Q?FEcZoVbjHzZtZDe0D26LYn7l0i7fDDGqsIitW74r1KZp2sMoo4xRtvwVhTrX?=
 =?us-ascii?Q?SF26iEqfI+fO46jqyPtwP1sGVhYQGhJQGYJsQD9cpkVhvYKuwxCu3SpwKN4x?=
 =?us-ascii?Q?oIKCVDuLr82boN3b750q7ma6/4W909DcttOzzAxreourE/xmpQeeRKUhVR4V?=
 =?us-ascii?Q?CLVY4kc7yO09mll5nqNLSA2ymfHlZvMqz3awyNpxqaHd43ULbYDTPTrICpwI?=
 =?us-ascii?Q?kS//Clnv0eZnFi0oFHjHc40MbBDvRr1FqHrkCYDw9eNPv3sHTSqwNaay75bF?=
 =?us-ascii?Q?/3w8kwD7jt2vOVDVF6FPNafD/wIOpjroMmRCI20LEhJjoTJ+/+E28XYx+W0g?=
 =?us-ascii?Q?vZExMuo/dC2U/151JO3fEvzu0Lp7IDsZqJX53KtnwFm0qjWsRBVSdkfR3YDH?=
 =?us-ascii?Q?Bux3QA0RLpIRqGyTGPoQ6mJ0miAStdiqgN5fva9cmWPmck9dbRt4vMQ2hbcj?=
 =?us-ascii?Q?q3vtt0pkEWVMeVyA/ddJCiNt5JFFZGeMYlkqsuJ6zmW8bUxlcd2lUJdWLTv1?=
 =?us-ascii?Q?218+7TH9zfM9vXU9WMBbhq+jxbSA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAlkojhaF919TRTp2DotDNyGDTHIZgy8DlDJSzRQXMpeS89xSFPfxLA8Ng+o?=
 =?us-ascii?Q?NLlbcbNT5HeOeLWwi3uU7fCa5/4QoQnLXBZdERuNJcLGAXGl4O8mXdP0VGxs?=
 =?us-ascii?Q?uznKC36kLLjFn1Nk71mRP0myikSGxTrXplyGYBxuzFoIdZkV4pqEpqoTqSKo?=
 =?us-ascii?Q?hYjtrEsWkPFVtvjziDtNeYIuYTG+BYnDcUInxop0e6rhYLgoyviNi6Wmn1nf?=
 =?us-ascii?Q?5B6roD+/kxwADZeQqD1a2w0y6BToxvUc7hWfsyB7C3JWmvYvj4rj4fXWy0M8?=
 =?us-ascii?Q?3EI0POo4dUoSx6W8Q+vDdhVRUI2BiP1TnTWQTfpd8N8sUHIiXuSsiTL5svfF?=
 =?us-ascii?Q?gDUQcXo29fd4wxAOINzxi7UzF3vHR0zU/N9qDZ0sGttflOnDotPPEKQanePC?=
 =?us-ascii?Q?rN9NCv2xDiQmCno5xDrKWfOZ4hvIxOJCvg2+zexkBKD8kHXX+/R0q9vCHW6g?=
 =?us-ascii?Q?uY1njL1sxYL3AzYaqnfOpF0yqBg7frYvXYDyqj29lt5JcltT1vcSW1R6PI0z?=
 =?us-ascii?Q?51GARXyOOwPu+MF0nT9sn3qHwSxzSj1JbjXV0xYtExM/tlDgBR9MCpDCECjN?=
 =?us-ascii?Q?9cSkGxnN1aDwNGA0yXKr9XzzGkRMraogLPf1yfkra/kxAsh58Lo14tWDapze?=
 =?us-ascii?Q?9C14ga6YPhq6fkytHTGp//3oxVzGLbbirqg38H7SZ53cpd6mFFyWG63p5I2c?=
 =?us-ascii?Q?0WHRKSQRGCjbFYdiH4T5Z4Lua4xLrT71GvaqALI3Gmt2mc4oeckoZtmtjedn?=
 =?us-ascii?Q?E9l7C0I2ifFLNtGK0r51Mkfaj1bSCVilNtZ0I6UOYMJ6EOLe99IVyXM0aApt?=
 =?us-ascii?Q?Xgnj5E6XZpReq+I7boGqkQGg9fM8zr1ge6m8O7VmDHTV3gZp1OvVVlCpocz+?=
 =?us-ascii?Q?HMAbAGq1bZcBuWEtWnP8RRiys4tpqt1dsrwQeDpXVlBLiWGMPlevyADCmHKX?=
 =?us-ascii?Q?12qJZIloix/Nfd886cp2ZRfExdUtNfbf+f/Ks2szzdsZ4dW/ELX+5rcs8pKX?=
 =?us-ascii?Q?qa6ZAWyIM7bCDi09Zy3BOHyLuLYByvgdpmRCU2nDkTYbFkmdbmizW5tqsR7j?=
 =?us-ascii?Q?euF9vRmrL0dA70AqrWdyLzG03bFHQZ+tdkUVsBJqWvu1zNfI82R3K9DN8u0C?=
 =?us-ascii?Q?B6asWYfNoYC8CcR8UYhG9R02zmjrNOw2FUmAl1eJH2JuvDoBJlTOjA3DSjGt?=
 =?us-ascii?Q?yZu3Wu/Xt8Acan8okGDCFdl7DsAYDe5qu2/L3CglJDjqHY5HY4g2cDO3ZzLb?=
 =?us-ascii?Q?nwqa4+xBspPoQviRA3YpGZlzZn84DVbIJp9BvK/F4BrIWIQh84ibKAcJa5Kz?=
 =?us-ascii?Q?J/jCD1tDhfv+dQyDfaHYHGFbQIb2SIoghcwy3eIOvq8aEpf6vEEqXEWWqSHD?=
 =?us-ascii?Q?bVWmf+AsSN38ruOLj9d0vPVM7vZ1uN4J8vuhXOdttWVxuybgRO6yBJcm9+n1?=
 =?us-ascii?Q?8K14tCEu04XAm7ZA9+y/qV3ZUAx1Pbx4M1CufsbGBLs9DygIjSrsQthbk4Ff?=
 =?us-ascii?Q?LlkupkXiN3LvK+k03i/RtfmYW8fZSeMiK58BLnb0l213/DUedibS53W+429l?=
 =?us-ascii?Q?dm76/jQMdpXLMj4aAnu8595GdQfrwfe8YRTQ9Pt8FsWyH7pWEmmyWvXLc3jE?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 011c4f0d-61be-4942-d491-08dd6ba2208b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 13:37:03.2795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSQC7lIy1Ff4zjfSSTFDrxNyiPxe+4g6s/aP31/eK98L+pqxwrKA7bato+nqp4zQjp6ssTTGmRa2b22zdNlPC4xQGbe0BTjymi5Nr3HAb3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
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

On Tue, Mar 11, 2025 at 11:38:33AM -0700, Lucas De Marchi wrote:
> Test-with: https://lore.kernel.org/intel-xe/20250311-fix-survivability-v2-0-729ce081155e@intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 5409d19a6..abe224cdf 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -160,11 +160,14 @@ static void set_retval(const char function_name[], long long retval)
>   * arg[1]:
>   * @wait_for_lmem_ready:	wait_for_lmem_ready
>   * @xe_device_create:		xe_device_create
> + * @xe_device_probe_early:	xe_device_probe_early
>   * @xe_ggtt_init_early:		xe_ggtt_init_early
>   * @xe_guc_ads_init:		xe_guc_ads_init
>   * @xe_guc_ct_init:		xe_guc_ct_init
>   * @xe_guc_log_init:		xe_guc_log_init
>   * @xe_guc_relay_init:		xe_guc_relay_init
> + * @xe_mmio_probe_early:	xe_mmio_probe_early
> + * @xe_pcode_probe_early:	xe_pcode_probe_early
>   * @xe_pm_init_early:		xe_pm_init_early
>   * @xe_sriov_init:		xe_sriov_init
>   * @xe_tile_init_early:		xe_tile_init_early
> @@ -325,11 +328,14 @@ igt_main
>  	} probe_fail_functions[] = {
>  		{ "wait_for_lmem_ready" },
>  		{ "xe_device_create" },
> +		{ "xe_device_probe_early" },
>  		{ "xe_ggtt_init_early" },
>  		{ "xe_guc_ads_init" },
>  		{ "xe_guc_ct_init" },
>  		{ "xe_guc_log_init" },
>  		{ "xe_guc_relay_init" },
> +		{ "xe_mmio_probe_early" },
> +		{ "xe_pcode_probe_early" },
>  		{ "xe_pm_init_early" },
>  		{ "xe_sriov_init" },
>  		{ "xe_tile_init_early" },
> -- 
> 2.48.1
> 
