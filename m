Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7AFCF9C5D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 16:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5F510E2F6;
	Fri, 20 Sep 2024 16:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfLmNmVC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACA010E2F6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726851508; x=1758387508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f73QJhugg39MMeFc9mx7zcvrMbSGPzINwDSOadunFUg=;
 b=PfLmNmVC3hsLP6AfoY7gXK1riKc/cQ9x2/JSXvgiLiiaoW73wm76A375
 J2JrTtkEPjUnfez7yT9niGCePahaZPFUEtd3tyQqMZeZDShU7z5LqtaND
 dIseMkzydGon+nmY/isYLIuvtl+It9t5LlAqCUbvTA9VGo+f5XCbKpfPi
 6VW7+uyXlEMfnHN/SietL6SpwgHe7BF3y1DXiwHwzle5NICAr+uFGptMa
 j0luh+2ehnrmqJIX6NB3aZAMC7+xagVkRaTB1Q8jNdQ89PP9ngiCEL30X
 wvDjucbq3ukiiJlPvQXR2huK5cpK5S5Pips4HAh8bgvDsCYKBikryl+og Q==;
X-CSE-ConnectionGUID: Ux78E3QSTiS+SMke1zkv1Q==
X-CSE-MsgGUID: 09aS6LxxSrCcsCcxqxw3OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36437168"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="36437168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 09:58:28 -0700
X-CSE-ConnectionGUID: K4Hdq6T1QfSF8hH77A/Ttw==
X-CSE-MsgGUID: jAPJa0fTSe6aTuiND3VEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70643354"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 09:58:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 09:58:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 09:58:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 09:58:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 09:58:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 09:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHxxKIqyoQ7ZGxsZiBLg6VG4AieWHX9W920biQXOTUb5EuQ2Zrr9zHxM6NTL/5ReHnaalnHF06AdBqAX/PS0hbg6BxF4UDI/XpdBHGAZVHvDceiCRPjvDVKJcJffZnPcq3qHkVdL+cEVw6+w9j+cx/eG8AIR9xPJNoH6//xTO54P5Utfjju6OPWbOGLGcCzyjsI2UcD1IQJw+v1IUyRKsc4lIUJLIzG7YEYwctgnX+MwAY1Bn87Ri8v7nZQnFpBK5vSK7NJ5dNYzvIdhII5RnzsTiBo3G/5IWAt7519tEx6vf+8okU66AzlVGw/83WsZ9yXjaSofkP2cgliZdQ4Q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN3mS0d7WxaBrLnasa6rj6/IYw+2/+gPDxBD/xHlZ1E=;
 b=bqLySoE+xNTr6fD65redPZI5tPmrJDf7J3g0Wr7PjtycI+5HpVvYwqEZ46rBt7Ib7X2q8A2F+MWYVQT1NxCURSVnu74pJm8pgior6tTW/2+BeO/YdPnVp5b+OxmDN/OgEUI5L/fupTBhCaxxE6sMbUXpBsOj1eCDQvgxUJsY1C3MYl2zjvjCsS21b9bfoyztJibjmrcJ5d/OU+vYC/17+A7ywgQITYfuWBrYFSfs4g7+3GX4BUR7d1TppLQwF6bO3RU9b0A+ilX59M3dgPMMfeJv5O0o7/AvbCUqb5kEV4zfPFuXgeqk+m2kPG2b1mIlQV6ZW3youGnLU2EkTfkQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 16:58:23 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 16:58:23 +0000
Date: Fri, 20 Sep 2024 09:58:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/6] lib/igt_gt: Fix forcewake open
Message-ID: <20240920165821.GM5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918163629.1186314-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a3b763-60bd-4dc9-bdb3-08dcd995702f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TkwdSc57q1ya0YhKHpyOsBknK4bwLQIPMA4bGqrwtmWVkozbeH5lHXiYlvBT?=
 =?us-ascii?Q?lBnJslWwEecCWs5s492yU3S61f58lyHaYv4XgQ+7kYzSAbVNHgvLxvgq6MzI?=
 =?us-ascii?Q?9b69X1RSCZ+QkvIblv+7cdQb95ERJtv3VVdrwG4PQ8PhawRy7IMcS6jswAXg?=
 =?us-ascii?Q?fejNGnKDo4Pt95YXe1rZYf+LiuJ6YMWKo4jRHpCUJdfdx+mlyu8pk8Qy2YgS?=
 =?us-ascii?Q?x7a65F+csTY1jmbqdclyZViFNGGT5VtPZEc7rY5dV3yufW8RWcLAMDvHJLp0?=
 =?us-ascii?Q?hCFqVzwirnc44ibpS7FoVUbgq2A/om6v6jGd2GRtk+avABS13wDTCFcWIxof?=
 =?us-ascii?Q?Z3XkSM7s5gFGIRPevpy/iWOdb6M3tSbeTeyP+DUuMHna6a4k1kwwXRXpOgBK?=
 =?us-ascii?Q?zh+Pcg6MAUgsyL59Sq606fAvBO2df5Fwh/YNOJqcaZDD8AObSywJMEz2RHwg?=
 =?us-ascii?Q?/2qUg5DkTk5wdPRBDWoC+oXbnFbeRnN/ycjwL3Y+W8uVGNwEZJMDGbpyQrdn?=
 =?us-ascii?Q?gzlNwxx3aNUnxvhadI0i+r8LZbX2KaUI/Xxg3hqJ4QBcDEDx+WnSdzUTC2xL?=
 =?us-ascii?Q?7gY2D7/fb3tPgLv313678sC1FA2UFGyc+xQwLUBgHChpBI35qcZBmRN1nvIv?=
 =?us-ascii?Q?4ivHKoU29vhGg9NpRGlRRnHVbpbsRc5D1aa+eZPddA7RzogoR/m55O9vyFcy?=
 =?us-ascii?Q?rZOXLFixhJEcZIbYthWk9XAzBjrDmf6GL5Ov75UXQ5LBUsFa1T9x/SjcchWc?=
 =?us-ascii?Q?3uE9kSejsP0ccKHQM2uS02+/YGWsVUIeT5S7F7nJTneq70vNm4QBwD2q8fwC?=
 =?us-ascii?Q?mAgwr6m68ogSCTkHX7pnreg+f3Vb/aUl+3AMDeC5bts3xbjtgl2IUhwoS+AH?=
 =?us-ascii?Q?VXoRgmM44VWEDaec3qgqd0EjrDz5lXEfrHHFXex9BwAOlByNTokH1SPFWNb0?=
 =?us-ascii?Q?HeJ3h/sUPmNWjay458PUQTGal8jhuq0sxtwfbhAoRuYKIZ0BA+NYBcrV6OXk?=
 =?us-ascii?Q?U2mWPchHkkmqnzGqfDszzacK6PvswEk7mARf/VIs/Vld0EeNCd9G6UOmCYRj?=
 =?us-ascii?Q?uu4LiW6Eted3kmsiwgq2TOpmMc44oSnRHD/uQqRQyGa+iRmrkXUOkQLukUX+?=
 =?us-ascii?Q?/uxJgRkXAQigqQKd4a/PUdv/AOkdgzigjcHide4Qwb2AUGX/rexXGSHGQTDk?=
 =?us-ascii?Q?8xQB0ElRYoS7GanUcZ3BrslMkNgY73RBBwpxOzSUGpVj22ZAvU76yOtF2fxl?=
 =?us-ascii?Q?qX7mxkCYMBw/NStoWZM8BJJBgqNCLpJsXUAx82C6vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxuNjCFx2FHJp+NplPuxfsl5wIXBn8odJ8fhGjECZ3m1a5UwscVxSYh1Z6Rq?=
 =?us-ascii?Q?alAV/078xaJSUpp6XW6tttCssp/Ahe70TPcZkKMlAtOjq0OUxiyn2bY73EZJ?=
 =?us-ascii?Q?ANZ2/nFuoH+kDdY43Jef2eQ/4w4avaciZbgs2AWyZCwx+a8EjIyqTQX9N8JR?=
 =?us-ascii?Q?F/BgWxn29Q6zTeBHU5lgXvxdO10SIEXlLa0uxCmCCS9fTxYmpxZlrP/S8UXb?=
 =?us-ascii?Q?gNyQ8h9EkRlvLTZo80ab2gPBn8s+Xwkj01M9t78BA3OtlbueQbyDVZLbWtzB?=
 =?us-ascii?Q?PkktLdr3Xlwr8mFCkhrfPFap/Y2ffjO9nMmzMyvLd030yHCyZwx4mYxrVPoj?=
 =?us-ascii?Q?Mjk4rTiZaWcDMPf/8zXDBWr4wQykzzvvSGCB5YbjGYYXIoh/uzxLmm3S5P4+?=
 =?us-ascii?Q?oWO/yg1GPNBYlABkqhAznOyFiMpiLOoFjcUYtBTgQiSk/8MYgTzjsGrfmyRq?=
 =?us-ascii?Q?mA3TQ19KbVfp8JUKth9lcB7A6pgKqI9VmXDfeAI2aKw1QrHOeG5aEK5000do?=
 =?us-ascii?Q?xtYE8FLTO5BrOCFCle33htAoaEC/IxfMKVtVB7aJCJEBuI/2XXc1/B9EiaGc?=
 =?us-ascii?Q?UiT/nHpNxkH33yqnxNBRkiRo4kGKTsVDYf0nHcPkK0xj+NdS9/jEY/+NtXfk?=
 =?us-ascii?Q?Vxx++YQxOG66Okcvh+RI6zvMKN6w/uvcbopp5RL++ImTJNms2GUale0ygMec?=
 =?us-ascii?Q?oeGeO6wLgv36gGgqPpSWY4bfcMw+L1uWoklShKS62CJJsCxSqFiOMq1sxobB?=
 =?us-ascii?Q?8iVWITiVRp9PfZnApWqpULHtnuLTuTQXegFkYplUagfKIxrkE664FIgt7p12?=
 =?us-ascii?Q?uIk+QW7idEV9xsNk9/b+OfnbB8fpqfWf9YWWWSWyDcgfkbwgtVWqFtjMenj+?=
 =?us-ascii?Q?/eR5IlKKDMZJldgFKiLaTwToM+Vn05gzdnFPYemn7r8QOj9ip51J2DSjDJVF?=
 =?us-ascii?Q?HENeFjxuqsEQ13epPcvlmn2sHAF1ic4cpyz0bUve0dlUD93dQ6bTmFdbPvS1?=
 =?us-ascii?Q?jnfip95UFqk1qnmNNi1epTig5Df/NiQoQ+dxp8835j/zm2LRzTxFpB5aabFZ?=
 =?us-ascii?Q?JPjMhiUnWmZAoUe+nBmxgfnnbRv/0QcM9sjm5uTsFjoRj8BcM8Qcz1WHXCPR?=
 =?us-ascii?Q?OqmO4OwgP/BotdB1P8Gan7/9dnJPJc781G/H+xhAwpc5IzOlSbE7FMReQcdm?=
 =?us-ascii?Q?u9SNXdxr0HQ7zubayaZ8xOb8JxdT6ofezqZ/ibywYpWYwSOfAqJh6mukld3W?=
 =?us-ascii?Q?x2c8lwAP5FPHGCn2VRZB2dnMTcq1H2GMrUU/gkhynr0nW78Bw2eWQIev1HyW?=
 =?us-ascii?Q?uLefuu+oQNBNErBbaPsG+IP6mPne+Q2SdnnXgsvxddw/hi7wxudoF2tMh9dy?=
 =?us-ascii?Q?d9L5ZRqf7M0GBsxw3CABoyaoZpxzQKMkUMap2OE76h/ZS5zAXcYeSegJMAVt?=
 =?us-ascii?Q?Y41M17/sWYGRjqJmMqu7Pjp6oSqaF+VnDeBOrNES07UPuYGKfQxwTvtj48L5?=
 =?us-ascii?Q?imNPqfuiSifgXCC1Gn1ZdCyLs5VFUJYHKhbg3ZAzSQilLgU9ljbn3X6WcJMl?=
 =?us-ascii?Q?TSatRMviQo3GB8OQ2GnyyXmUiSCBJdRRhdsZZYmxNlOaOeCpme891RWrisTl?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a3b763-60bd-4dc9-bdb3-08dcd995702f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 16:58:23.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoJrHq86EH3L+b/cVgUexeQdvKFlrUw7/ZBM83Mqzj47z0jELR5pOkAOAxpyazg14OtBEpGjCrMxmt3+FoA2UhZRNTA0EvAyVtpOG8TQcVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

On Wed, Sep 18, 2024 at 09:36:24AM -0700, Lucas De Marchi wrote:
> File from the kernel side is read-only and should be open as such:
> 
> 	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
> 			    to_i915(minor->dev), &i915_forcewake_fops);
> 
> Apparently it doesn't matter for just opening it:
> 
> 	openat(AT_FDCWD, "/sys/kernel/debug/dri/0", O_RDONLY) = 5
> 	openat(5, "i915_forcewake_user", O_WRONLY) = 6
> 
> But RDONLY is sufficient. Let's stick to the file permission.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_gt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index aa5e75b07..b043e2d41 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -503,7 +503,7 @@ int igt_open_forcewake_handle(int fd)
>  {
>  	if (getenv("IGT_NO_FORCEWAKE"))
>  		return -1;
> -	return igt_debugfs_open(fd, "i915_forcewake_user", O_WRONLY);
> +	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
>  }
>  
>  #if defined(__x86_64__) || defined(__i386__)
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
