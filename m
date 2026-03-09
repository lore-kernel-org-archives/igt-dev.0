Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B9BEFCD77
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93410E16F;
	Mon,  9 Mar 2026 09:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAxKKY1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C245310E16F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773050143; x=1804586143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uzmWMIOTGihxsAmWbURyaX58tvVxOraDKPf17xUXnwA=;
 b=fAxKKY1UshCdNlZUenKYAIhF3lz1THqQoZBrbdYMnf6NDH5Ng+IPO9p0
 qzd/fAotoRhdqf1EjRStyA/G0CsgtHw1BnimFvefMhKTT6ZAvay9S3Wen
 Fkf8ibBn07FytwwirO5PB4Fqs9E5OgRcS6OxzJ3qz4I6fJOZqoe/oY9uj
 6zqSlWosbnED24vfCd5pGGpkqTPWo+1gUiiii52727vzZQGPTaGSA4ssR
 1aSqqBDAWFqeyjXEvWOmJqsEQdVWgvf+bcHWWpZ4a4YXOxsxs/1vwmEnR
 cccKE8r3SNmOVwhGS1ZDsffFfblWRA3r5i3nLPdM5p3iuP3TmZAtFozzW A==;
X-CSE-ConnectionGUID: pGThx9N0QjKuo0f29hxaSA==
X-CSE-MsgGUID: NOVPowxcTzyfH3/rAz6CtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84780191"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84780191"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:55:41 -0700
X-CSE-ConnectionGUID: jVpqhM+zTbC85HgJEAyuIw==
X-CSE-MsgGUID: naZ36/tERNaerEZKMPuV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219679191"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:55:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:55:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:55:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:55:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pmkaq3bhrifyBbogGFWQV/U9VnzdkKrn028UP2cITPb2isb8TJqRCau0MQDBMTRZvY+aB/j8k3FrG8eaEFKuETAibn1qHemGMv7xuo/xye3SswqG0K5Z5paUtFU6TXgHbtflRXRbDZg0TNV4COYSpVsvjz41ybMyyojthp2BJ+mk835q/HXQq3+ke0QEjr6ElUv0AiM2ZLdaD9sPkclsgNMLwCi7FAVzWzhkhgA89AUzJYdincrsGCT7MLUGAM1vZLtrrS4awgiZeVYjjnWfZ5/5jkq9Q1hXiEcf7tdwTu1hNI+FFmvc/JpPAsJEu8XyTePrAWMGnvWucIowz3gYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFZuStAxFoYCO1hzNYBO134hokWciK6A7nkEyJ3UfvE=;
 b=sr4TpBn+c7/c64KYuIAMEIym7PPzVOsXQFi5WznAugMTO4/tTxiyusj0IIfKwpbFSQlGNnJ83YoOqt/SJeuTjqvcvhFOH7uYNJrHpYd5VPP26bQiQefcd0HbnD+SYAs0Qr9igzV1fYK1SXXmT83GDjJnjMokemvYeAWp8eaM4IiKv5PuUXntZdlXAjx6fb/B6iU3+pjirt9Q8qaypsXAf8IBP+oJGVfDiL/aFaQz2t29KXIDWzQeiHpXSDbI806K5A2kP/e9MfzSoS0jetANybL6m8yR+oU9B1ZiE/qhMiTBFf5DYETwCYyqpu+w+OVgMetr58ffN3iFwChxVlfALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:55:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:55:35 +0000
Date: Mon, 9 Mar 2026 10:55:28 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Message-ID: <aa6ZELD9LR7TmcAS@fdugast-desk>
References: <20260309043400.2280535-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260309043400.2280535-1-nishit.sharma@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0202.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 022acb09-5d8f-4e79-06a3-08de7dc20284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: XwQU/iIj/fEzgVUghMUNDmaFC2K1w66iLTRGF/5v7LUYD/IgOc8/EbRcWggHh+N3Xdu343Ky/WHYYOpmzB3l1/wUaOam28IAtbUYM4w1lD8q+bqMlQC9FlYw0zlHatWXtu7s9zYMOR7tKDN8J60yIEIyzrjXppAIyHvEWiGUrVpiRdZcmO/fyKh0TdS7TPI0WpRAVwk2MeF8VdGGB8jL2q9gm6vSdOQbylje8Dkd9uDuDI8CfXHZp4uDXovFxMGgQDUCwV1IC3UTz7Qg0qHOYoFq1VPFlkcFkdsEjrcKkdn8grjcxiGC/sEvOAgNqNHhFIW8amrv+CFBpQF8M8Xi7OlYy4+Qh/hiT3VeCmGV4ZgqGeZpjiAt6xIbpTaLtUHaPcLkVgkBG7MrS7u5yjjSmxh25OV4ZJ73NnPN4xU9Bs/CcrQdAWcPi50V+dnv1Cx9LxdjtSbDmyOQuWug1LsviZItnYZUhDzQ4q9NiL9yGfhzRx+n4ZDR27yLtHcZkB+FyRrQnVToxEgBeYmsGM4q/uxQ4Q+gravdbJcdKpDUnZDgEei/9HMovzYqH4WiIQKx8XqDa+6bu4In/anBR6rPx4t+T06icBhTUMp2odG6JagTa2DFmR0420eD7oRy/M5ZvI1GjmlglAyFmW83K/R0j+oXW8KWba2Ve9QDEg13+wGYJfOgL4dGEIKoNl9PKaUV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/xjMe1RktZwHBdCzGr3bGIxnQe40bydImJS50iXdMR562UJ65FtgFy+Qlwog?=
 =?us-ascii?Q?NImzWAQusesDM9r5QLQoOPFsO/3pY/oej8fezO2KlRjheGHoYIIFGlk/IhE6?=
 =?us-ascii?Q?WP91i08F8XbfvWSKDYus5c1TbXvPimXdnqyzO4bfYAiQ4m8arK5VkcKxh3kO?=
 =?us-ascii?Q?ok1N2OchLdZ/NvnXVqwoRdN1Cx85AP9B7j6a2KmyfxyR8RE9VgVN1tYSx3bm?=
 =?us-ascii?Q?nfxJR8FK5B6i6ulo5IE4y0JXjJ9KPOmTdHs4ea6G90NarHTciQCN+NT+Y9GC?=
 =?us-ascii?Q?tvnx0ANPNmYN+0JcTK91qP+Mw/M8UKRhJKynDOHcp+NtFMqlB0PVrz+AURIL?=
 =?us-ascii?Q?3LzGfHywSHaGGSnEXC4l9pAf6xzsl9T6rd5oFNY7gy01ZvjRtTgZOwrj9Xf3?=
 =?us-ascii?Q?7NBuaafWsr4YCbuH17coFIuVCAIRrQBHAokgjUK1JkifOExCMugMO2miFo6J?=
 =?us-ascii?Q?m4UNXSh4SJ6o3EedHWBoLRCjJkysxX5huoKSCD5u4qFT5jyHPijpmZI9Ho5A?=
 =?us-ascii?Q?iGrNjX1HmizEiDSRRWk7zj9G7S5TF/CBgQwy3sNjYFh7+RSSiWircwAaPpKz?=
 =?us-ascii?Q?G+2WLHgxLyhnAWqx3zcNdge+lcpAhShsZJn5tju4/yWP9ycZfadN+a2vHlRK?=
 =?us-ascii?Q?uz7FCF/R9VBVswq2Ed1OUku79CPDPJVlD57plxdzae5bKkt+s+asJ5ZTAG11?=
 =?us-ascii?Q?w0VyMTzgekEitXjKiJLmAXJn+TCI8sQNAvwxJVvpjCIj9Z8nMeuBOBeANCp/?=
 =?us-ascii?Q?0G7Dob7a5f97C3GGrbgEM3Zs73xBtSmkGWLhHrBaN2BFo78JJKfqIkMTDF4S?=
 =?us-ascii?Q?coKtLavhvl/ELxAtXWarTyx/DDchQ5sEcEGvyPloamh3zW7qi8AP7B6JkA8y?=
 =?us-ascii?Q?0xnKBbV6ZFX7ICfP4XGYRv8o29ATBFmjeSkVvHlKNZ1Y28PSNO5mBbgQ2DKw?=
 =?us-ascii?Q?cPxUBvewkPJluj38aRljK+4EM9VRZfHJxjvNMGs2PW7AID+v2RWtGGRri1BW?=
 =?us-ascii?Q?+XZO1AzX1ZydqYvruqEk4cKmZ6xnzeIH5mTKj9tId+LS0hQCX8Rbbu4oR/kJ?=
 =?us-ascii?Q?HUDsir4DM/otv1wB3CPlg82hhwfl51xGB1w69ilWNc1TV0vRPixWShItSum0?=
 =?us-ascii?Q?y7KSmmk5ntqk2WjWMy8UhbSnOootBl/9+OzFzEV6c44VZNgnQ5j0o4KmgLVM?=
 =?us-ascii?Q?Mu2rzMybJc3NB+DvT+hedMDjGkF8dD5CuY2y09R0xDuHUpJDVtnatx7Fj5eX?=
 =?us-ascii?Q?hsEoUhfkl/ulso6uXOfUIVfRUG/+ffqfMcsrpXDaE4CNc1IjS8j9mUlpi4kx?=
 =?us-ascii?Q?FFCdkkuvKSE83uzWyisQz9z5+J0d9WHTbRpogtH9YJkH0OrkztPyZY/6fdIz?=
 =?us-ascii?Q?vag/ERxXOQvEcpDziMcfUyR2WPLpcZhru4764h/wL1apgI9HwsdNx9XeHw2L?=
 =?us-ascii?Q?4inUKScc9sHLvBl0uSsLDG6p4P7lKnCVF0tg+7UIzYkV1ueMZl9xzk/VkWpa?=
 =?us-ascii?Q?N3Wj9aVeI8SCvclgGjiikxXYBxRyBdumpovmKKj0bA1z5hXhtlY+ujoqOYbl?=
 =?us-ascii?Q?O39BnuTmntp45W2YZ74JvpEClKZ5j1cfoRYqla5HExFdIJ512gicSYRdedbg?=
 =?us-ascii?Q?2il/mYnLM658J/6xFrhy+PxyEesNb8K8fe7OLIU5aFgMspnjg7nJdZ/t2MlB?=
 =?us-ascii?Q?UVgxZzbwm9iOiFZqFMmfg1gkWK/pH1xOxMnEwwxShKunOtcDxHY0cRdvpSwj?=
 =?us-ascii?Q?rxZo4W5/QxuXCnE/uC6cf6H19o2vJVQ=3D?=
X-Exchange-RoutingPolicyChecked: akcQNQPPDw75tjKwPEknhNyQ8SBzbM6Y130qUJywPIgqlXsJjLMKCX5rPv7sjN3kb5hA5a6EJw8gB/+kL8LJgTICng8rgeg24UXqw3k3uR/Q8mMJlmNDybphGzIif4e+jqM3oCjKOoLTZ/dCGKDeuRL9VtUA3OO5AAmwOQDt+/rfPld8zGo6y/Z/eEPnSon+PgV7RTZWl+TDTMmREZO3c+Pt29mzFkU36IHWCN7/+4WTcqOoyJEmGFYBMckoPhr8clq/94OjfC/J6RH4JzSamf5u9/7orBm38sjAdwXRZd6R7mtFXHH1qb8n2irrgjUZBldPRPo1c0KjpaXdJOTbAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 022acb09-5d8f-4e79-06a3-08de7dc20284
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:55:35.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ATbOdcXgtIT0FYWNX/hdhngusDSGhxPtPGiTpp3s27JMXvGAa5eamI2jQxR1RN4lh2WlUE2AsEgLkJ9OjrsThNTCFxsya6h+QNeyHvfDnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

Hi,

On Mon, Mar 09, 2026 at 04:34:00AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Updated test to validate output values against expected results after
> workload execution. These enhancements improve test coverage, reliability,
> and debugging for SVM compute workloads. Updated test to validate output
> values against expected results after kernel execution.

Using a malloc'ed array for output and validating output in this test both
revert what was done in this commit, for good reasons:
373a6dbfb tests/intel/xe_exec_system_allocator: Cleanup compute test

This is because the test is used to finely trigger page fault floods from
compute kernel context (EUs) and we want to avoid interference with 1. extra
GPU page faults and 2. CPU page faults, so that we can measure the exact
impact of KMD optimizations on page fault servicing latency. Please see:
https://patchwork.freedesktop.org/series/160784/#rev2

This change would bring us back to the known previous state, which prevented
those measurements. Can you elaborate on why we need to revert?

Thanks,
Francois

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 14f5e358f..e670ee007 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2257,7 +2257,7 @@ test_compute(int fd, size_t size, unsigned int flags)
>  		 */
>  		.array_size = size / sizeof(float),
>  	};
> -	float *compute_input;
> +	float *compute_input, *compute_output;
>  	int i;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -2267,19 +2267,31 @@ test_compute(int fd, size_t size, unsigned int flags)
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	compute_input = aligned_alloc(SZ_2M, size);
> -	igt_assert(compute_input);
> +	compute_output = aligned_alloc(SZ_2M, size);
> +	igt_assert(compute_input && compute_output);
>  
> -	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / 2;
>  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
>  	env.input_addr = to_user_pointer(compute_input);
> +	env.output_addr = to_user_pointer(compute_output);
>  	env.vm = vm;
>  
>  	for (i = 0; i < env.loop_count; i++)
> -		compute_input[i] = rand() / (float)RAND_MAX;
> +		compute_input[i] = (float)i + 2.0f;
>  
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
> +	for (i = 0; i < env.loop_count; i++) {
> +		float expected_output = compute_input[i] * compute_input[i];
> +
> +		if (compute_output[i] != expected_output || compute_output[i] == 0.0f)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, compute_input[i], compute_output[i], expected_output);
> +		igt_assert_eq_double(compute_output[i], expected_output);
> +	}
> +
>  	free(compute_input);
> +	free(compute_output);
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> -- 
> 2.43.0
> 
