Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A571C369B8
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11B010E542;
	Mon, 14 Apr 2025 10:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqk2LD/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FA110E542
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628202; x=1776164202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mrBCOgqEdbIqBgYbQ88/dDKSwBuSGirASRCA3RolLrU=;
 b=Nqk2LD/eMoq38TQK8KFYsU18w+S5S4/jA0RN2c7ZpGs7rgcG1e1qFsjx
 9kcFUdsLJoZOp+5tGShQ62N7QsmXuu0Q+nGGF06/c0QfnfObIH0LuNW6h
 2fPPXghHXIhWSpkdm16UJxLZt9xZakRztd5yZM+u/cqT09Zh6k/5Hx2MB
 nV0pRZPCgfVSZAWefi8V7ppUv6pVcQWIdHnHN/A1If2MQSY1D3Fkf/img
 TqiVkzSkK/xBYUECe7wXMuGlA7GZcJdgNLRLq/GW3gplyFpA3I/mh/iGY
 DR5GXK3BBHWw87BC67oA3bc3T7F4KZcw0Ir/G04pjMKHTQ/y8m0y2K+86 g==;
X-CSE-ConnectionGUID: Yy0RbvjRRJuqDRqj0Gc5Aw==
X-CSE-MsgGUID: hyZLUbynRIGw631XbR+NjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49921798"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49921798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:56:40 -0700
X-CSE-ConnectionGUID: rPZrKtPZQgOmCg5dHXTYZg==
X-CSE-MsgGUID: 6zep5tbtSL6kqY+mfos4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129752892"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:56:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 03:56:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 03:56:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 03:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx1eW4+7nmU6v0SdSEhtQ8KP71RgGjo7Zoe/Q/vdqeUo6yUrC5hzrkyqXFdZusfuJMTROPpk1a8GHJu3k3v9v0eYEVpXPQH67+ISN2haDEpEv17f7f1Hc7atGE2k0OophQwgOD4DuXSyDIaAxzwJm3d9pTeojRNxYBVbUmygMRWtSn6+vHAFXn6Jk7J0/+UQngAUw08cVo//HWbv7sSoyw3fv4PK3ZRhFMoC4E4AxMemQrNiDX5AzUu8ifQc9WMo6yaWxoHNTitJpuD0tH1DJye/FKedQ7t0HESFB7k++DSql7X//71GWM7wqP7fEU9adrp+2g4Hm05bhs2T0GWD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YErG1b+0lkehCrEOSi285VB+f1CaU5e40K/xZHBG2i4=;
 b=Xx/+0cRItrg+bxA+pGiPCwsvESU1CWGqLj4fUfSGuaMoNxAY7yVamPN+hJTCI4/rTql5qy5DTrIncXXnwa92Xu+JlLzW/gx9xcl5zT+L9TQ93xotIAJehrSGtr+jCltavFI1KK2CJqOfuVhiGy2nWP9XVp5cfmEJTag6FnGXzQturiDRTSFOa/31vdRn0g1cqFffxGfpL2YAoIT9a73vMHB2WS7h3Xq0a7i0YOBghK8DQEZkuJBKtA9nO1NSQnrgsJ4EihB60NlYI8pc4Cj0xBQJniQVR5EEOmMoibGZIDdQq1lEZVAdD6gTlo45cV33eSB3Ik5KgaSjzai+WBQTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 10:56:37 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:56:37 +0000
Date: Mon, 14 Apr 2025 12:56:29 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib/igt_kmod: Fix comment about unbound
 devices
Message-ID: <Z_zp1ahVT2bIBOJY@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-2-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-2-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::48) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 070d5e47-53e9-43be-a4e9-08dd7b43072e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WQD3RFGtmH2j+dYG2TW36fBug4AQglGUcruMYvkPSRtq69hsg8Rai5Vf4Wks?=
 =?us-ascii?Q?4xR4ts5tQ0qAezhN0D2N0gK5yuPoQ/63a3Rx/jgYxYR/WF5ZaDFtOp60XEGQ?=
 =?us-ascii?Q?18n5/aYSReaMGV2d0So5gwYsTHJF6NaTcwaNmesjCp3gdyJOYm2x7bJ1QQ1m?=
 =?us-ascii?Q?HU0aVQAZktLMvPaa4lOejDQmZm9Z2GHEuSYEtzPtEctwlg8QZ0w/7/Djm7QK?=
 =?us-ascii?Q?7/C36p625GBO8w+67acUpqdWY7WT5mmQ13rN8b7W2lbMOTt4siNN3aEZpqCl?=
 =?us-ascii?Q?HlOjQDqsjl8Uynp3o3wQStJXNytt7cRFHE5Ki8AEV+2edlmmAX1utQlutFTC?=
 =?us-ascii?Q?QLjvgCp0Cwo0bRVNVTjROXpmTKaBbf+hjdItd1YPHCugMfKUocqH+Fq/OG7/?=
 =?us-ascii?Q?rb4BrKko7Gd9gmmxb0AEd4V8ZWDHT+8myfOUYDKi8p/sX6/2yiELGjCmGaNt?=
 =?us-ascii?Q?QNF4OKNKWIqWEa34dcrkrqNWBB7qaikgsoLo3phWmQUQ+DZ5gcVVETe11Ou+?=
 =?us-ascii?Q?Q0YgF6rkMCsyD3cIlfRqqE6FqaiYwGI8M1KoXe3ZWJNLwxw7vKJlsnDRUQ1n?=
 =?us-ascii?Q?foEVq9qtwRkknLV0iSEJJJGjv1F4at8HIvhY/vWgFjrLv5Wol9LR2RRebJ1P?=
 =?us-ascii?Q?iRw2An3E/ue1geq/4mZMccxUApnDWCYv4oXdPJnTXS/HJOW+iCta3bddLquA?=
 =?us-ascii?Q?vWrHuszK1BHc7LwMyplcPo+ML77CE5MyAJ81QOpypPPoKB74Jgjt5rvlGMfP?=
 =?us-ascii?Q?RFrEA+SNMrOPpoYFVlumHwR+bJO/WJ/pHrH5apC9/QTvT1XI9a9AfFu5H80b?=
 =?us-ascii?Q?EOYV/Od7AOyzxKLlxIvmNNCsfcaADeoxT9/CUyFjfzqYUbO7tSyVupGKhIL1?=
 =?us-ascii?Q?ViZqqA+AX5FEQSkTqo/pqsEZ08tHZFzO+aO4PYlMEJJFSZmN+wS1K9yvh5fk?=
 =?us-ascii?Q?jJT+33BipMA8fX4MuLIUNT4QViC1X7wICL217yooREvS3H7oRBcrH5RZHrMF?=
 =?us-ascii?Q?m6xh6+KZzw6Y4DoL2TQtPpPHGvqqhafz4Bk2+W1bzsX+e3yK4BN/el3GZlWQ?=
 =?us-ascii?Q?/IGK11TyIypz8dwYdLCKjSCLodC7ehyzsomQPfuXeJR5ESzgppeFsUw320vR?=
 =?us-ascii?Q?KEOSBxW0f1ZU+HmwNdRewfrRKXcxCPmOT9/2QufVJ//isp8iYBAzFVyF/zX5?=
 =?us-ascii?Q?dyRNpF6xvJDEzPxMhfYge54FMeEi+FANvf8v7uq4+mdACP493adXZu0cJogh?=
 =?us-ascii?Q?E9zxgqIV7jWWBUPsQbkQXWng07+/68bHL3hkHt65J8SiQzpe7jYrDFvYz75g?=
 =?us-ascii?Q?C5UC7HVQyQT7z8T4PjPCoHcnJX+BxmHsok5GNUEoh4H/EHC0nadPZ6cf3yCO?=
 =?us-ascii?Q?b/YgKqSKu1ZAm/i1bsCKXfqYmHpXomrW3tc++ZgV/JEoVKSQ/gJ42v7qetuC?=
 =?us-ascii?Q?Xim7GtcU0XY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oVWK5bI4kA3Jf21CyVWCop3XV1kUorddOGkufbLCZ3iiViNuKgm+vk9dx27U?=
 =?us-ascii?Q?bC/lvElUgbbjw1K1uKCxh0tzg5n7kcjncLPUbb6H+LCU3NqcDulPR811Qon4?=
 =?us-ascii?Q?r+PU3vtRlVQTfaIR0FVkENEKQ22Oo8tcFKF8rR71F/c0G0SQo0o5uWPcryub?=
 =?us-ascii?Q?maSsyzdefTS0fDQ/Egi3diwoVURo/gXfX85kjnDoEouv2XAVub4vPY9KMmhn?=
 =?us-ascii?Q?3YowacLp4HCSc/VWinXmHaNhqU1JZMPYtRMtM8FOJ1HktxJ2V9C8FNY+Q9Na?=
 =?us-ascii?Q?m4KzGeflfJ5OyHw99OZn8FHDjzIc49Y8F2ZBy04BnYukpRHC42D1LSr/GkdP?=
 =?us-ascii?Q?f+adK//8Rp6iNG+HFgSelEAAPLOIEr7K5CgL+lzLGUTpMcO1Bykdyz4gKmGI?=
 =?us-ascii?Q?ViM+bwtCs6VN0IT2xT+dBK1JnzO33E77E7oYx5IluQJ4YVRk6hc6N4PwgUSX?=
 =?us-ascii?Q?G5pQcRsoH7qJfS/jhhIGm3sLDsCtfOp/cjniaEhOQGXAVKCwM0tcDmM3y0vq?=
 =?us-ascii?Q?aDVHw8FCQyFZHlCmoDcqMFqMf38tgT20PBvpozDclRsaxzjP4AYNbXnmhdg8?=
 =?us-ascii?Q?PDjpuAJHED/APLiegFGziV1o0mq5xWPQWOvtomN85t6naS4viTfn5wUU1+zd?=
 =?us-ascii?Q?zz3nP5q8r3SBwqYqzFxPSfOVWFbMxZFInrK6uI5spTrV4oCG2fKA11v808h1?=
 =?us-ascii?Q?PDHJ6uenUr6hkOBpYZUt1bRjLhG9qf3JhmPJ64PwAGuNZ/Fh91HGWH0m0fq/?=
 =?us-ascii?Q?Vm+iSouRHJATg/d5jnpkxBfBQg0Y/PlLFIXOhw97tufDzQP+/8thscNzExD+?=
 =?us-ascii?Q?qfC8d/DxwcoftGJiTziRdUT/hzlmCbatKI86h/q2G1aE1oer1LqcaEkVZH3P?=
 =?us-ascii?Q?9Hf2IGnM69DoisYMQCHr69PGtmkyTgXxx1E32hn5RnkvuNYH6K3BK4eF25Zx?=
 =?us-ascii?Q?jhZjkgXv0kLPcDAfsl6EawXZQsccEAEL5zClEzU3iQpAYQkc2qXrh4D74P1A?=
 =?us-ascii?Q?Ev23ttpYN341SLOH/iCC9oFIDf0KGVv+IBWFCl8lbAUqRNrmtihh7BAQvDDP?=
 =?us-ascii?Q?2ojLYbKFbOP6YwrcJTmF8EAdS5dScvK3QoJL3J3XhK6zt4+2fbGXvRxSxks+?=
 =?us-ascii?Q?n1sIyG2OuhHhO/xnM7qRVVPTrolLGT1ioRUvc50Qi83KlEKvhxNiNFFHpVW2?=
 =?us-ascii?Q?vRZ/J/gJFqXmD23cf7xQkC0AwA9ldiR4iOigX3+d3bomU3DpHRZVfFHP35p+?=
 =?us-ascii?Q?rVSflgvgIDQ5jnRe8XEcMCcJqr6fyPIOw8Sfd5lV1NrhkaUI884GMIWr1uMf?=
 =?us-ascii?Q?1SEdw6nOyjusW0nNKvWSUscDjLGVve96kk5ti2xJ7aUmplUuTBWWwNM4wufF?=
 =?us-ascii?Q?HiExfEJdyR0mKdtTGIn8A0CF64LEpVffDadT8TBc1uPhRLFd7uLebUD7rOQ3?=
 =?us-ascii?Q?YG6fa30AUfRd0MelMWCZ2UP2HSIk7upR8FQ9e6F6lOdMfJUHKAik+om5L6ru?=
 =?us-ascii?Q?0dBGMHeaAwnRFUvnvSQVp4snsOzPvjqcLX8V6eehEUnFimnLWucx+pWTAFAT?=
 =?us-ascii?Q?/6sgEfJDnX3lHNSQwS0dihBNRQnKFAU2M0DtoXVtgZ1u/aszKyosIQk1AZ9n?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 070d5e47-53e9-43be-a4e9-08dd7b43072e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:56:37.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WECHWNmHYaesrjv2gF/cQOn8T/rcINUS+uwI2z7jgMY2C68zYjn281Pm+yYMkRv1a9UhVn6dPy4+P4xHL2zrab6X+a/jPQw4/6yTNZjgh4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

On Thu, Apr 10, 2025 at 03:48:31PM -0700, Lucas De Marchi wrote:
> If the module is loaded, the directory should exist, without any device
> link. Example:
> 
> 	# cat /sys/module/xe/refcnt
> 	0
> 	# ls -l /sys/module/xe/drivers/pci\:xe/
> 	total 0
> 	--w------- 1 root root 4096 Apr 10 22:12 bind
> 	lrwxrwxrwx 1 root root    0 Apr 10 22:12 module -> ../../../../module/xe
> 	--w------- 1 root root 4096 Apr 10 22:12 new_id
> 	--w------- 1 root root 4096 Apr 10 22:12 remove_id
> 	--w------- 1 root root 4096 Apr 10 22:12 uevent
> 	--w------- 1 root root 4096 Apr 10 22:12 unbind
> 
> The case in which the directory doesn't exist is when the module is not
> loaded.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 4e1a3d42d..ecc74e0fe 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -667,7 +667,7 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  
>  	dir = opendir(path);
>  
> -	/* Module may be loaded, but without any device bound */
> +	/* Module not loaded, nothing to unbind */
>  	if (!dir)
>  		return 0;
>  
> 
> -- 
> 2.49.0
> 
