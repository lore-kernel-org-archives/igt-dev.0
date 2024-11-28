Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D0FD690F9
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 11:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4C310E337;
	Thu, 28 Nov 2024 11:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsZGhwSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38FC10E337
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732791955; x=1764327955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FZtm4WbzrukVNuFrDGJw4R7EnPikdaEBdh3obqmj+1I=;
 b=XsZGhwSMtkyTdFuq+1S4qlqp+lqlCvkRkheMmvclSgPf7aeXQPEknGM2
 gO41e35LwMO3RHKnoVMUL21OLnl3MxjRvbroUGUIaYLctzjbwHWr5I3ZH
 611ON8SAkT9mLkgGkoWQNCq10UG2YMgybDMrHfYjXVkEbGDCSlhLF1Z6J
 eSg7W97nHKZam5LF8dt2UQFZzx/DYsHirHrIzHBzC/NX5csm2hA5QNggv
 oa5wMnfxt+WTEhZZxJ6C3rrLR73d8C2o2yRf6et7/E/o3zH8u7sVDRXpQ
 DuPsHZrGPt44oSiuAEKmxfoWFT+wzedwOafsRPO7RovBBWkhaQ/xOqIg1 A==;
X-CSE-ConnectionGUID: fZpVBefISuufPCpcf9Q3tA==
X-CSE-MsgGUID: DJRtjVMJR9uKEpNWuq48hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32389675"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="32389675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 03:05:54 -0800
X-CSE-ConnectionGUID: tDg2tOx2SZ6SkdUmv2asgw==
X-CSE-MsgGUID: LJVLmgxGQuO6A8QSKF7tuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="92305603"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 03:05:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 03:05:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 03:05:53 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 03:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCABCKFEPcc8Kl2yA0KKj6Hl0hQoDQU/am9ox7/eXGZ1/biM8p46g18ZblkzHUALWw32v1nCc4A3oXbW80dKwIrvwuTOyBjiQRPN0bsGuCpAk/cSQqVNlPFCPKxVl9tLZbIiZFvMfZEiGts1aR9PuczkeSKn5P/aXCvt+9T8cKswlcpbQf3JpLcvzGcjDa/S9v/5YC7vZjU3EPui+Qzfsa+PdoO1fFBWGoqnFpYcNM3mdMjGFONVpjfyM/b8kjn1dDdI4wNZQTwW5a+yFqkfkPyMlYlhvSa2/cdmO86Ex8Ze1fx5cFH8X1bn2ofrMs16YiyunRNcaPfVPmdXoOEv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvZt4r2anNUMugtOR4Es1MVYKutx6OLvDAtfH4p0gEY=;
 b=rIGj+K6vwqkGku8RV7LMKzT3Rafj5EpdztlvgI8fPMYj1jB+hu/LjYMRzWn+wof/4SrXaFwNLFNaocJxmUOxwIJkl8nK7mPLHZ8tvz4zKQSKi6ZhyAwxBbFFzDTznWok+K0i5jks1fT9UX+bmnT/iP1pTpIofZyknwZY2ty/HxREYO9REEEi5LGygaKa+ne+vODd9zdkbQ0ymx1LvmQ0F7I6Q27AOikpFS4ZhJEOBRAw9TEGQPrzVvlLEzySu1jhxKQAXtVZeLqCbt6e1BKOqeaCfxztSrAMhJEM+O7lxgXXuA8O2TIci55xPJiFD8nPeexbpIzm/boe7EDtItKqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Thu, 28 Nov
 2024 11:05:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Thu, 28 Nov 2024
 11:05:50 +0000
Date: Thu, 28 Nov 2024 06:05:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Manage verbosity of GT
 reset fault injection
Message-ID: <Z0hOiOTWpw61gAZa@intel.com>
References: <20241126230240.1780940-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241126230240.1780940-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: d6258d1d-aa54-439a-7244-08dd0f9c9e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?INZpCLILeX4laoHSpf6tdje4BCuPojPiOvTcThVL4WIpEi4zdhuFYE9DLt+u?=
 =?us-ascii?Q?MBXPzP9weeQ13aDUqBN2J95XLmPPu+j0x/U7FkFgGPR+UsvHx4DM7PGX2pxZ?=
 =?us-ascii?Q?HZhYhYKJKh8dD0Mz81fc47v3UKH+foTvIlshOKF8Yah1zE7x/ANzQoaFlEDe?=
 =?us-ascii?Q?ZqNxYphxo4L0Q6EWnEbncUTF2GUxuiRhct2xmuwughd37qCaXEXuEpUSIpfc?=
 =?us-ascii?Q?i2RBSXr57xEGsIg7MXCWEyW5azxQSj5ypZo8jYUziEMM/3n+0fT6c7f81wHK?=
 =?us-ascii?Q?iVbeL34hHqw6esI9tJNHz/0ZF2IWYvly7EouN9wCVlMk4WGhojfSBq9jW7iI?=
 =?us-ascii?Q?4y/wZQtW1jnKQ+6ISHQQo6MU0wISkZm8Qow9ukxxwqeCCSZa2D4xKEFFzH6t?=
 =?us-ascii?Q?coSrdX11CL1D6TtOi0Qdd6YuxR0Ibw61SGxQ6XgpU/5sJF62DgVuVAUQyPFV?=
 =?us-ascii?Q?OpRqimBChN7JFz25sxKy93ZwpgUDrPvJjLFbNzf2pow95uHw2uYrRFeP+fvs?=
 =?us-ascii?Q?gCdNl4AnU/tC7TcOPBnaIjoKiiRPqz986P5Ogq7HYGeT3xQzJzQrZjG2D460?=
 =?us-ascii?Q?nzwDIPLEmWPoy10aSlTWGUCAzRGqx7CrxgEHKokc4cXD2qTRTtD6xUSIR5U4?=
 =?us-ascii?Q?jhVKFSBuO3eDF89EWUresgb4YGWAVtIpkCL+TpBiZNLVfX5gecrBkKTCtPWS?=
 =?us-ascii?Q?3W30RUQHHmxMAcoVu+NMDJivlKFMm6Q0+sgNOSIcFH729r08l2qkHJoJ30um?=
 =?us-ascii?Q?/X+Cl/Ed0MFcM8oLin73/u86/qT3Ki/oOwK6vJqDRkgcO7MYlb1ZvZoLfTfS?=
 =?us-ascii?Q?nDj7FzI+C/3umxV9wicNmGLM6gILsMkGpxmGYfhZT+p1ev7IKcb57z7YMXzh?=
 =?us-ascii?Q?6kj0sxY/X+t9Hgnxeey3FEmekS8hcqXt2684I0WGuHsGc7w+0lQYS9uKYs8/?=
 =?us-ascii?Q?ZLVCJs3fXueboOSPNM3pwaIodO89qwaj5NkV0kKy4nua9G9Fi1/OHRF6kCwx?=
 =?us-ascii?Q?Sd1mgFu6eZYUuoUGlBEmg7ps3Rdvn2/3EjO9XnyfGv5PrG3+Iswstxdk55sb?=
 =?us-ascii?Q?tYKxsnvg/DiCn6D+M4++z8++lI+Ql+Uky0jxYYN6HXP7Fm86ukQMrx2/qEn9?=
 =?us-ascii?Q?uF0zcHdMW9glPk4DQ0KKzdtgGuPpWO1J+7VzvYaFaOZX3YJUsHzTu5wgeeXM?=
 =?us-ascii?Q?nuHb0IbGbsVhqzDdHKlxBY2QtTuDY5Jg4snmXYZNzeiEtybpN+Nk0kF4acE3?=
 =?us-ascii?Q?b7i+6pX7UAVfi/4zZDX9mGErPLrmcSJo5YT8phduGuScL9zzs4r6SZqNVLkx?=
 =?us-ascii?Q?Wtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fNZ0ITB1xXHOf97Qu+ENMvmLKVu1/WsCyBYRxShOYAxh40XjyO6cVx4Ycrx?=
 =?us-ascii?Q?sE6AgpZQybT22knGuCge4V3urTnl9C4M96Fu5VVFuvPElJy2CHfYYj3gPDRy?=
 =?us-ascii?Q?nmWuMcIGsSyp0lrRnNC6+5WKYb7kn/82p9jxhjHKkIp/bZVxJwFkXekeXTQr?=
 =?us-ascii?Q?ga6F5aiYEMiAN8Uo1PrHlQ2x+5/A5ozZ/Mu3tUAhrvWKGUkqqrv5zUs7BKX3?=
 =?us-ascii?Q?JtI8uBWeASxAKrnW7VHFzsNEH8HWTstdGlYvMjMu/3jXmO7t1AY+tfplUZ1Y?=
 =?us-ascii?Q?gd/UxNQPnpR15toHp7Y7MIEC+LeLYHHDl/QluTwbYk+lz4fH7Vj4+65GHLNt?=
 =?us-ascii?Q?PObjaWOL+p6Q9L9z60MCP0UL2kS22hLJXd1Lv3BYKJZAZXbat8dEn5/mfIJO?=
 =?us-ascii?Q?TqlKjwt4loqbibzQdC6EmqxMZr766d/Diy96LDrOMvgPkmcY2lWEbTblOsbG?=
 =?us-ascii?Q?4ocfYUN1ZKlFbA6cOyhAWaElls8kpgL2xmMUoFyUywaxHNmlSRNQe9YrnWP4?=
 =?us-ascii?Q?0uYtpNpYZJQOQc1bxyqMGPPbaoR9VaO/lmhPkLll03L/3JfM1R3W9Gn0goj6?=
 =?us-ascii?Q?6L/ozSmXQHr9cXeT4tzk/yE6eKlDZwJW9z/KPD4XkKTr+fkockiONXoiaIR+?=
 =?us-ascii?Q?cWpuyoXtQQbkjy2k+SaENgdRlSh3LVK/rZx742a5XRXiMypdIe9MbHXCtHp0?=
 =?us-ascii?Q?6oUf3QHmMKhqcKtJcQADYIPjvr4wSNYNi5p3SLzXFl+V8TvjkLlgbgIwK7Ac?=
 =?us-ascii?Q?sOZCg6fixPUCo38SPTEUzzLP/SvOGvrwoohCuXy9CtFU/uZbv3HVkEtRbvJS?=
 =?us-ascii?Q?yu0t/f7rGH+vqkBMW9n+3oPOG4LEZQ1tAbv+eIIIXYA6OMUBJSbvOLJeX4kP?=
 =?us-ascii?Q?N0BnyyorRmwZJKmTxssBMezRxluaAmGifvKacdaAwzr+tL0K3dmSWJAsOSlJ?=
 =?us-ascii?Q?/qLhnOP4IVihjprpw4ole3wEHZnI9iEP3xOxjIKesuRFnAY7bHsU+SCFN3Pi?=
 =?us-ascii?Q?h4di/UPhJWrSAznE5UZ1FRVErnFPQR5o4Gx4epQEDS9ui61GzJ4ZqM6/JcSs?=
 =?us-ascii?Q?5q3pssn+QiOG/drWbctnhCPmtJWOojsJ2oPojJ5DAX2eypjLb4IrxF25YDw1?=
 =?us-ascii?Q?Em+lisNHa5DGccjNvlEPBCi1ARq7s5ca0DZ/4gUMTwd2DufN2t6uF59YzMti?=
 =?us-ascii?Q?RTqrv30PT/nSathbA8HPcPO8IwwrDkiz929+HYPcl2cZ9P+AcbIwERuqeEd7?=
 =?us-ascii?Q?Qyg3euKoGegqqGGF+LKlk+j0iMZujD+5Niwzwb4cb+E1LKQdZ1dtjjIwHy2c?=
 =?us-ascii?Q?1eP+mN9G4q/FYqvffV9jkKHOKuwxdS8YYfWO35BosJa9+Tw/vlBCMiABQSUK?=
 =?us-ascii?Q?SecWy6L4HLIp1PuvRGQx2M9ikBayvpjOqCTrD8MPAbhqixG6ITUctyPASlFu?=
 =?us-ascii?Q?lVR2/Knl0WDwlZ6nGbsazlw7KJ6kc0b/Xa4jcq5Doer8PCrtyNlRKkBUK9XX?=
 =?us-ascii?Q?srj3Lfd281CwfyMOIFk1/BRSxQ4P+u9uHCKr07LIGAKeJwKkju5Wyg+cLxig?=
 =?us-ascii?Q?gy6n25CMR40We6NO4/XZSo1ngwuR+g9J/k97Qt70Q5ERtrBIG4hCArz2L72z?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6258d1d-aa54-439a-7244-08dd0f9c9e18
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 11:05:50.3157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaKz2GlqrAZs3aKuIEWKXC8XnrGduH6UsNoP3oscjID5es1iEf+Zfa3wb52vB1ebyHVjmSt7dUm3gjdo286E7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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

On Tue, Nov 26, 2024 at 03:02:40PM -0800, Matt Roper wrote:
> igt@xe_wedged@basic-wedged triggers a GT reset and uses fault injection
> to ensure that the reset artificially fails.  This works as expected,
> but depending on the value in the fail_gt_reset/verbose debugfs
> when the test starts, different levels of output may be printed to
> dmesg.  The test already marks the general "declared wedged" message as
> expected so that igt_runner won't try to flag those as test errors, but
> if verbose=2, then the fault injection framework will also issue print
> dump_stack() output which gets flagged as a problem by igt_runner.
> 
> Explicitly set verbose=1 when running the test so that we get the
> general wedged message and fault injection notification (which we
> already tell igt_runner to ignore), but skip the unnecessary stack dump
> that just confuses the runner.
> 

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/xe_wedged.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 88e5d47f2..0db8c8eba 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -213,6 +213,7 @@ igt_main
>  	igt_subtest("basic-wedged") {
>  		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
>  					       O_RDWR));
> +		igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");

Great finding! I believe this solves some of the cases that Kamil was working to mask.
But also +Francois because it might have some use on the other fault-inject cases.

Thanks a lot,
Rodrigo.

>  
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		ignore_wedged_in_dmesg();
> -- 
> 2.47.0
> 
