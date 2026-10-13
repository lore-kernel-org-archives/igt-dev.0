Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B43DCC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 18:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580810E962;
	Tue, 13 Oct 2026 18:32:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020810E21B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791916276; x=1823452276;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+PcunW6F1yKUcD6xqySuNrnI/BH53wXy/CTpRmPu/ls=;
 b=RF6l5EpsJ+NxusKpQyTmfgjbcx3Rm7DjtgBo3XxePbSye/lGM/TI+R6W
 50h9Mg3A8yx24Lmj6kjD7SDtGRN0nLuBEGqd/snrP/ReWVMOMELxWlizr
 obiq7+PLXyPt/nUxUnLO8KIJ43mtYae1LGaeUjJMLqVOcl1yQPvxLGOnU
 2ZT+u4LhRdOaHYWIOPDDWKfLWffduE+8dRiTJSFAc29QEckyCWjCEvRNj
 dnRbbH2tGUd1VrsN/2EulwI/T6u4C0/O7EmU/gB8NcEVRfFiz/1VkOCOU
 pysav5LjDB8lo2tbTqOZpiuzHtEa8NuIsSBP0teIfOQ/8GxSG0D9Ss6Pp g==;
X-CSE-ConnectionGUID: RBSs/GR5R5Cohc2p5f9pVg==
X-CSE-MsgGUID: t2c3JnMJQruCPY7m7gZfwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="663005"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="663005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:30:54 -0700
X-CSE-ConnectionGUID: xWrQhxh6QIihPLj8brr61Q==
X-CSE-MsgGUID: HcG39mROTV2S3lIlTevePA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1557020"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:30:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:30:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:30:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5upgJYJpsu5It7cqwgM8VB1/0tD0bJDkzFjljhGbtaVUojczSJPJO5X77TX5V5CJclcmsdSKjBRhX586Dc/x62lSfv8sHSJ2efui1qDWRbxYWL7qi8db7kLQ3d3UZtT6Xv3ctS8W7vxa1f0zB7iEnhBYbeFkwqrV2GDVb9u3agQEezAOYMUXf3UNMEi+5FGAcfekYyFu/nG8hA70+njJrkjKN6N6PJ/vrPZDKPkvSYJKHOy1MtgJTk78H4ffpGr1sFCFskqelH8/fB6j9RTVGxBPcpEtzKNXIDQ+Tee6zxMkoJUqgGbfBYP7UGw2uIXCgVa6Z+XwmLgfaQzBJUrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NDG1gvaeAMb69BIFiYoZS+mym8n/sW5kTPd8skotTU=;
 b=jwVnnqGp6notbACLElk9flQDTkVOyU18ZdTgfDLw4xvVrq/dnaXX/+hrChAG5NHB8kVYun86+PapOa9Iuw5n4c0NwViI1dBwlTEdyhkz9L22PNyeZs6Tw0GnWem+qbK8ghx6xsMuZ4fZOe1QJ5R1FafK6mXVRwDjs6rvyTnMxI9ZMhPWLJf796UOxnwUSFe0w/sEMUiohaFFktXrbtJHjfqSLLcDPHmZyG+7x3JdyOjvErT31PhecAmDajc/n/rNZSdDCD+Hl9pvuep/ha9rWnBYQHHiJZnGyPE4mZZ3cVWdTNJLcPXCUs1kdxgRp5VYuUOD/sQ3aG8Z6K3nhKc/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SA7PR11MB9593.namprd11.prod.outlook.com (2603:10b6:806:4cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:30:52 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:30:52 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/xe_pmu: Provision VFs inside
 dynamic subtests
In-Reply-To: <5553bf027e3bdb9253a18fce5477a42ef10f0b25.1791900914.git.marcin.bernatowicz@linux.intel.com>
References: <cover.1791900914.git.marcin.bernatowicz@linux.intel.com>
 <5553bf027e3bdb9253a18fce5477a42ef10f0b25.1791900914.git.marcin.bernatowicz@linux.intel.com>
Date: Tue, 13 Oct 2026 15:30:47 -0300
Message-ID: <87jynla1wo.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SA7PR11MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1fbe68-fcdb-4209-b607-08df29581c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: K5qARuhKvLu8WRmi7/bPJsm11cPB+VbVn426qkEiY7K5AkhoTWPBgplKafnlnfnW8aYYm+tbroXTQ5QE7mxs+cPinU69DwKhGPqYR4Q5r/Vv8IzLDGreZ/t9g4F9pGID1fJkxD0tn0G5vRbiZtfBWz+l+jnIJm/W+eVJ9O1RBuXIdy4Dgigd5nq74xbwjffuSQXatdyfsAXDAMaEDWfc+9ZCFN6Q5xEYPYam4cle4JAoUyHTIu74vNCfIGbUZatRp8mAN7g5+l87BAdyGZptkhcmP6fEszA7ckCh485n+rvsfskfbUkyYA7RS+Zhh0U8f6YbtyCpAeD7Dv78zzd1xTc6/llpkZtbqXfjA7tuWllbH9ZpxMi99XSOSTPXKOJW7AiZwD1VDu+n1fkfkt7OVGBlBDgE+xc1s9GLBQbqKyjb/INNPXO3hdat5caUHOrMCRZeRvYrUWFsZEqr+otakaPoppShgcAXu0EZK7xjPhfFL0XpMTDgDdz4Buixuw3nZbQ96kLMdyEzFU2PgkwdhtuLm/HW70udpTvvVqboAl8AjMPqnbZJ3MpP0Gq26hUt0m5WAC6RoQI5UYOQ+bvTT95Y0FkU4N6GrHv1eCXxupgTLsxoZmFC2riNnKyzNLpN7TVhFDPlMJVjzTeGsFiSUGHPEdSnIWQnr8HsVID120A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+uULw9E6+GQmJM3tHdr5oeY84FGG0YTZYZf6xlTHNPJ4faHWcc6E+e4Bg1n?=
 =?us-ascii?Q?2bBBhJT/hFqHyCvP19IeHCcQy8n64wSzyWo1SqA9pNgVq5PLBMHfv9h5XJbl?=
 =?us-ascii?Q?iaoWSg2qv+csLke7Lh0D/i9c6U1ko/CTtQ2/mTOuen93pIoiLoVeFg5wEX7r?=
 =?us-ascii?Q?PmtZVbILbwoeEbmN6dOhH8OEiPS/rpqEAjcAXgvd6Y4x/qqtSvOa7/FlqlAV?=
 =?us-ascii?Q?hCOJ/2CCFM66PCJZGPLq3Q0YcUbwF5LNYB+HklW+keAxGqe26iCpZCNUp3RC?=
 =?us-ascii?Q?GQbQ/+jRo6HyC15P9xv2qlttnIrI8CaGYXO1MWY6iGauTXLVUkySt5Zn0O8T?=
 =?us-ascii?Q?bzU3NZB2uCXJBjEpD//XRXO+ixry5hRJOvHB90Tds0s2C5ba4lOEfQr1BStU?=
 =?us-ascii?Q?gCogl0altd8qSgTjGCPyF9zi0b7BMNtN11hrowYYusBjRO+N2q3dUshdUQaR?=
 =?us-ascii?Q?n/4733fQ2HwCIskAHKShBClGQTYTV4nlT9ZQLjJA7Kshykecp/wS9/hD1CEg?=
 =?us-ascii?Q?4953SHaRfw4rc8q1LU6+JLRVpN6E6EtDVpRGF6eD8m1DOKTaA0FC3r0CepNk?=
 =?us-ascii?Q?2ONtUh3UAiUWz5pRQugpEcI+RuUpy90QnWvIgHFAL57VUFq4T7WUVz85qktW?=
 =?us-ascii?Q?SZ+JS5KH6MOs6SqbQOHz5N/SjmFYhCm8lTSj/P3HAshDJDM9Sq+79EVFj6kT?=
 =?us-ascii?Q?IOx9l55v5x19Et9/a0ZRatUiqEIrpMhARTi3FGOfybmGRNS3+6K6GvB1nFQj?=
 =?us-ascii?Q?xFnozXgE46Nwz/pxsCo7teU1P6JLEA3yUAzgpdolWKBpuSgKUgXC931acDbj?=
 =?us-ascii?Q?HyShYm94hP7cA/gsVdIOhwE1A/NRq6Si1AUNeiRmVjO/aClmtZnGKwKRUikQ?=
 =?us-ascii?Q?GpnDulDXXTXOqQRHwVMy+TaLeIvOLou+rOK48/tRcc6R8XbXydcWv7cABy6z?=
 =?us-ascii?Q?9k+E4ZWI+MAavxIQe/wLLR71Oqa+nJ3OXfY9ENTUTaBTCbg2/op5ERQDXxkB?=
 =?us-ascii?Q?aBCzaOBsJMxFbA+xjnGmP6V+hmFR1ugaHqfs6mqGJiUtDn58drrIK/zeD55W?=
 =?us-ascii?Q?hL9XVdioVztF7jUmYZKqgtXFK9P907DtHSCzubIsLg1Ude0xGCdk3lCZkwuo?=
 =?us-ascii?Q?H9N5+a9uCE4vfvNnKlNnlzIAdH9tMSlbFJJ5PeWmSkY2edjUMotWhdi+Kxrz?=
 =?us-ascii?Q?0WLWaOTfoP5w9p5jGP/kOJE7GSifS174+uLkoEbZ9eP5FwvotfPD98SzwrAI?=
 =?us-ascii?Q?ICggoZP0DuibjoBpG7LjbfPV1Grw7Had0Xo6Nd41n/36gRld8bjbtzmm1KZ2?=
 =?us-ascii?Q?Rppbdr6ldZPYTvW8uKC4cpxBOKGD7lZ79NtX4viJDPZbIdQcXVGy8pHq1Mnt?=
 =?us-ascii?Q?y7gBhQKOIAIhVa9QUf2cBQwtHmx2hWQqh2c6GFmE3+jm0rpUuoDbs9vY/RYS?=
 =?us-ascii?Q?d/hMHtMzagspyad7DYOVFssCXutVi1Aa/NXDB44rl6v7DuNEOno5OVxaJUad?=
 =?us-ascii?Q?y9Ow0LuTME41dEZQDuYmQg5Qxsbi/eQ0jmugSeCpnaWX3z/Yv/jcGXNI8aGm?=
 =?us-ascii?Q?3JYaEeaR8uhZ7fkHat3WW8axQ710AQ84+DtNxA4i0VH7MBFALL93cdRMuTLd?=
 =?us-ascii?Q?1FdrVl/HhxxzEBgoDnbKwJYGhgCf6O6d5u+sRVTdImiupwZQZtYwEzzG4zG4?=
 =?us-ascii?Q?OYSPVextO4jaFKgNS4oGPFfZ1rTkoM5lisAvBNgzUNaUg7V4qSa5s3EQHXb2?=
 =?us-ascii?Q?5G1SmH3DGg=3D=3D?=
X-Exchange-RoutingPolicyChecked: iNOr7KSx/gNb8GU5dJU43fIn7xL4hLEdoEJ+9YITg1JI6AgFtCRI2PANHAeuF2O3E3hz/eBXSRJL884/NGNs7QUD+q5uOmrtQJUYoaw6itJ9m+39vVUwARPbG65kCcdwzyX2wT236bP5DRG7BIj5av7Maennyaluk9MSGdPCUzEohPpKZI3HVRFrxksSdTO+c9/78ji2csw+AcZrUdUQggCWBqyMxG8RzGm+Qd6mato9fc+BS7XPSCipTS+z+BSixaVfzkwKakJjB1QbAl142+4HLDCMtInXByB4WRJXYcvlIGtOrovMvtCipktEN5/s2xTi7dJBFh+Fw5HAhVwPfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1fbe68-fcdb-4209-b607-08df29581c21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:30:52.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S+jEAHpRwi/kJfyBoTO3U2nDfCSys3FuJfvcc03dhG+izH0AAwysF74v8cC6vLULPSFNzBXudQ6rwUaqC09MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9593
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> writes:

> VF setup helpers can call igt_assert(), which is not allowed in the outer
> igt_subtest_with_dynamic() scope. Set up VFs in the first dynamic case,
> reuse them across engine cases, and clean up after the group. This keeps
> VF setup out of unrelated subtests.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_pmu.c | 48 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 12 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1f..159a7f8a2 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -117,6 +117,8 @@ static char xe_device[NAME_MAX];
>  static bool autoprobe;
>  static int total_exec_quantum;
>  static bool has_engine_active_ticks;
> +static unsigned int num_functions;

I feel like num_functions as a name for a global variable is a bit too
generic for what its purpose is.

Maybe sriov_num_fns (or the longer sriov_num_functions).

And then, for consistency, sriov_vfs_setup_started?

Anyway, the patch looks good to me. Thanks for this!

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> +static bool vfs_setup_started;
>  
>  #define test_each_engine(test, fd, hwe) \
>  	igt_subtest_with_dynamic(test) \
> @@ -999,6 +1001,7 @@ static unsigned int enable_and_provision_vfs(int fd)
>  	num_vfs = total_vfs > 2 ? 2 : total_vfs;
>  
>  	/* Enable VF's */
> +	vfs_setup_started = true;
>  	igt_sriov_disable_driver_autoprobe(fd);
>  	igt_sriov_enable_vfs(fd, num_vfs);
>  	igt_require(igt_sriov_get_enabled_vfs(fd) == num_vfs);
> @@ -1021,6 +1024,16 @@ static unsigned int enable_and_provision_vfs(int fd)
>  	return num_vfs;
>  }
>  
> +static void ensure_vfs_enabled(int fd)
> +{
> +	if (num_functions)
> +		return;
> +
> +	igt_require_f(!vfs_setup_started,
> +		      "VF setup failed in an earlier dynamic subtest; see its log\n");
> +	num_functions = enable_and_provision_vfs(fd) + 1;
> +}
> +
>  static void unprovision_and_disable_vfs(int fd)
>  {
>  	int ret;
> @@ -1039,6 +1052,16 @@ static void unprovision_and_disable_vfs(int fd)
>  	igt_sriov_clear_exit_handler();
>  }
>  
> +static void cleanup_vfs_setup(int fd)
> +{
> +	if (!vfs_setup_started)
> +		return;
> +
> +	unprovision_and_disable_vfs(fd);
> +	vfs_setup_started = false;
> +	num_functions = 0;
> +}
> +
>  static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
>  {
>  	int max_gt, gt;
> @@ -1190,28 +1213,29 @@ int igt_main()
>  	}
>  
>  	igt_subtest_group() {
> -		unsigned int num_fns;
> -
> -		igt_fixture()
> -			num_fns = enable_and_provision_vfs(fd) + 1;
> -
>  		igt_describe("Validate engine activity on all functions");
> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> -			engine_activity_all_fn(fd, eci, num_fns);
> +		test_each_engine("all-fn-engine-activity-load", fd, eci) {
> +			ensure_vfs_enabled(fd);
> +			engine_activity_all_fn(fd, eci, num_functions);
> +		}
>  
>  		igt_describe("Validate per-function engine activity");
> -		test_each_engine("fn-engine-activity-load", fd, eci)
> -			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
> +		test_each_engine("fn-engine-activity-load", fd, eci) {
> +			ensure_vfs_enabled(fd);
> +			for (int fn = 0; fn < num_functions; fn++)
> +				engine_activity_fn(fd, eci, fn,
> +						   XE_SRIOV_SCHED_PRIORITY_LOW);
> +		}
>  
>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>  		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> -			for (int fn = 0; fn < num_fns; fn++)
> +			ensure_vfs_enabled(fd);
> +			for (int fn = 0; fn < num_functions; fn++)
>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>  		}
>  
>  		igt_fixture()
> -			unprovision_and_disable_vfs(fd);
> +			cleanup_vfs_setup(fd);
>  	}
>  
>  	igt_subtest_group() {
> -- 
> 2.43.0
