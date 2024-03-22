Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93F6C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 21:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F20112799;
	Fri, 22 Mar 2024 21:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUthllnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E3F112799
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711142724; x=1742678724;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+SvYO7nTOwyCwWNwzV6W+drpA5oTM2/bmyD0+QUF674=;
 b=gUthllnv3hS5SoXqhvA6VV1108HzvZIxm0bBOtxaZEgohBjE0Uu4FHUd
 wnWqJ9G93EWqu/20dpyh/MCNOeKO1sEQooevcnnvMteI4MSauTgBWb7g1
 +dn9DOrUbq+H3YhV8tj/PR4CeNQTorrBtN7Z2ZcJwRzy2ClZ0zLPGvAGx
 knWoUUoxOGKJoZmSkN+C0jqRpkVajZ8De3nLHQjQwAMt0CSQmwGv9VkHA
 PfSb2BvIPE+SozZuzzI4N9/KdJ9lr2XafXzUQ8Pwh97s9EfZl7eyHTBnc
 vWzng4PHMYG6s47PNXUStdOeQcjmd6ThZnawQQ5LDGoci4qNWf+g6cghu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16755732"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="16755732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 14:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="19513162"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 14:25:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:25:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 14:25:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 14:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kS+4BDTdZYkMA9fEuUer6Xqtp5MBThegdETGEFEizDvLt2xJxzFXRn6dCtOvmLocMV+OikR/9EdaN+d6/d7Uk/3eRhBa1DQdquuG/ypwo1eZY2BqCSXkCJhapqIzogxRONVJT5HKDT2jA0riHNRv3evAY0++fvF1ZbsUoFMBLbf1GILIKTCPBHmxdp/p2L2bHrpSyiZleLWzJoYtFGB4yuu/iBBUXIk2DsJyG8yEMNZPexum5bjxCHpm2P4xgTYxe5nVEMI4KiMSEv5QqPKzDLwSy1jLuE4WBMasBFx04DXmsYWQrw19fcvSS+F1Icbts35RYwlaPduC+o2HPjjqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKzE9rN4vhIdp7t39KGf7TOAOSCs75DA+cJav42Yp94=;
 b=TO/iNvGaw99JBZ/0BmyIh8UiqK4uJcNkrkAhw+anpxjsnKr3DMyrcfueweokYJSrZHimp7BcrzVYiQb8MHa7EVurqBVIphPesTxgs4icxfhkKORhp7yB+FC87z4TnSjhIZNAVKaab+U8l6LkPXYNL/JptlXwzjCYcS/wndC5S6bPztlB6wwbXU2juayW3rskUchwm8t3ZfMQS9glTbGdllF56RIU/3O0Ple6VIcqSnC4ufy0ZGwqXWT/tiikt7r2t7cF0wj7/WP7Wuc6MsVUzK92yHDNWSpeJ/qXPW477CA2UJERCc+nc9XYv6eE6OkHO8hgFRA7OBzhk4A4y0LY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Fri, 22 Mar
 2024 21:25:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 21:25:20 +0000
Date: Fri, 22 Mar 2024 14:25:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add mocs suspend resume test
Message-ID: <20240322212518.GV718896@mdroper-desk1.amr.corp.intel.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
 <20240321151637.3320911-3-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321151637.3320911-3-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9467067a-ec76-4f3e-845f-08dc4ab693f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKgzHwrUqNF/RxjrEyBAzhuO6XLZzppL6CB1I3jB8FDqGGVXaUDpIeIelcYRB8dPH7A+7cKPFgUPLgiEiUM8EBV3mWjwK7fddCgQtTm4BgScCmQ+wvYWfHeDttvHoyfrLiDWZhBdhXFk3477qZUhpvtEGOx+bblhytvG5TA2FEVcXt99IvFgW6bsYmJBv0rrE9R3FymmsXEiGIrDFuUPl9De0820WbxKc/2Lc+CLD0+zv+KQiLb21FwjXsOFDqlyT3GHrq+ykCotEV5C/mhF9JAnx6ngrKaEPOg+XucVE8ERhdz3/Wonxf/MNVIYHWJYX+wJ4joni9hSX4g6aMOYAomt3u7J/x8YdehM6eksDHLQ8xmOuXCutcFiGSfsvr36/SaZj5q3IytvPcRXVy250l7Y/hjFJg++n8hRJqxONNi2hPqw9zcrthPafpr0M2oq0wUXtc/XI7pY8uEKkLAUxDR3IlGTmuBi+kR9kJbWGYTs+3q0ydPwVCQXjZFAuAHXEj+VPguarULwNX5GwKClnbCuGRFL501uCQL0qcUdghmtJAyScWw32jn0xPaP6xCXZMjGRC1/wCi5VX3cUubRGhV/UPsvP39/gO4pwDnjryy7PXFtO19c7dxIA0HGf2b9WubUfuXzlm2L2QzNkLikaINdc8yI9EiK3S5XPm6QXVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRAESykCQcB8inVMzbTA8hix7PADIkB/QY7Dj0mW3y4EwMnJO0zb0ZnWScS5?=
 =?us-ascii?Q?4gdYvVKi7e7LirozAmrTH9wo1P/yI+8ikfBQlnyX3DF+u+ZVmVDrcu/GVQVh?=
 =?us-ascii?Q?9TOK9lifXQ5T/6FwYMDHyGVBvM2mFftKExjrluavoWVA8TIQMsGCp4y+FY6f?=
 =?us-ascii?Q?ugkmIgy6Ze+htfTplgyeG2G/zhR5n1hwyrtL219HK06r5yQh/XtNG+CxjGGb?=
 =?us-ascii?Q?zlbcAa6Yh/J8KooDvA0klT1HeJ/yig1HwQt+XPiSsCQkNCV+7KrLAGIaaiS4?=
 =?us-ascii?Q?fUTzefOmDGgap6WuflOI2rLP6QjXbGtLIwOG7iZ3kbFz4+TorIByQ5axo5uB?=
 =?us-ascii?Q?FXVPU39CY7ZHAmlTQOV9+I0000MzWpUV/+SUeMG+zeMg+DKiz8UJQfRrcKia?=
 =?us-ascii?Q?4d1RpI3RvWhPaDwk9LJSuaCfUvf/bI9FrFdv7MThX3xbhB8lafVd0XILlTZK?=
 =?us-ascii?Q?Ndr1jHr/j0OTx8jQia3+iywsU+jnrf0z791kfy0dAQshfXYwZEyujq2lAzcO?=
 =?us-ascii?Q?zYECeovWWbJ0zuuAUZziqdv7opPdgvbmPln5lIIBYKmOXw+f1qt7j9mooL0z?=
 =?us-ascii?Q?jH6Pjx6B/txd0SrZASAp4mmIZaQpr5AbuWRr7fcHYXSTaRSRRHoXgm9XMAoU?=
 =?us-ascii?Q?1GqMKtUQ+erkddjx56Zlep79TAY4jTHR35UL9SyfjTW/DdiUNeOmSMW8oA7R?=
 =?us-ascii?Q?fyOjxc1itLm3D1butSf5h+idpqj6XJGysCZqE7OTuIt3QhhN/rrF9DAXBQVF?=
 =?us-ascii?Q?A03tzrNXW16dMKt5xs1j1aSaOx0HJ0D//Jfa6ZF2U+hWvjO1UqWEwEMtRTzw?=
 =?us-ascii?Q?qOqP7lrlhOnfYnq63AZOIShoB/jDW8XSaKbDD09DCYYuMRCLXLBqDcvpitiA?=
 =?us-ascii?Q?021dwPF8QIF2L/wjqBrXpb1CK9ILUOcu+jIKX/WfJW9WsGfWytz6sdMU63w3?=
 =?us-ascii?Q?20XjjSiTYh5QrEItt+HfhifBBnMRgofZMH3yLWqC6dDUILKohDGm6SLG0/ax?=
 =?us-ascii?Q?3uWcYhrzgC1kfwmb3wajeL1nacmZhMuUrtvSqyhZxaWiW6tzOl3V+U7dAupw?=
 =?us-ascii?Q?P/X8e1SaIVk6yQngZ23erMYonAmM9qYE+BWci4blpE3tb9NzyjtcldXZReTW?=
 =?us-ascii?Q?r9ZlX2h7XJGZZ08KRfsjdaaTyxu65h6Uu2tL2T2uY7AFP03E5wtG1IXsiiM1?=
 =?us-ascii?Q?3lp53XvA9eLVQ1nFKIb1r2YQ2Ag9oN5cLBA5oppBqcniSndCcQ7fBB9SfdyL?=
 =?us-ascii?Q?A9RmkDsBQox7yLd/zr+WFPsJWUmfFQsm54VHQfLyZUIUD27+RlxrBnsGLfMF?=
 =?us-ascii?Q?8VQccdqEcyOWe0Z3sbXY5IrxEYadvXtjEQZ51e21Xp1W4vV/zrfNnOk+zF2V?=
 =?us-ascii?Q?q1iFtKMeBfFP9cAU/HSjO8BiABKKOxFA6trYcl8/maPVAygjy2B0lV0AIF9D?=
 =?us-ascii?Q?ULgMCjriCzTrcuvMqQNZMLI2Nlzq7NbuSTQxS4wUkMWM2/WBLYXuwNj1kKkv?=
 =?us-ascii?Q?4FWwIcwRmFtFDbel1YEoOFOygIfLTfIOy+zlPH2qaeD0Ck0VjUhK021Q1+oT?=
 =?us-ascii?Q?pkob6VxP1zUczgZhRme4eNefsXOg7WtA+zTr3WHum+gTVGeJA6+s3Uq1zrf1?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9467067a-ec76-4f3e-845f-08dc4ab693f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 21:25:20.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkEHWcr6AQmsQnHFUIXi9s+Xm0cx9Vgyq2vgUPXAiP0cgPowEIpvw+7f0KaPZFjRYiaVcGdnSGwOBg0wXVVvSljxB6axyQh+9TMXrSVj3jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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

On Thu, Mar 21, 2024 at 08:46:37PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test to check mocs values are retained over suspend/resume.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_pm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index fcbed6249..0761d59c4 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -560,6 +560,45 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	close(fw_handle);
>  }
>  
> +/**
> + * SUBTEST: mocs_suspend_resume
> + * Description:
> + *     Validate mocs register contents over suspend resume
> + *
> + * Functionality: mocs
> + * Run type: FULL
> + */
> +static void test_mocs_suspend_resume(device_t device)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(device.fd_xe, gt) {
> +		char path[256];
> +
> +		// Mocs debugfs contents before and after suspend-resume
> +		char mocs_content_pre[4096], mocs_contents_post[4096];
> +
> +		sprintf(path, "gt%d/mocs", gt);
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> +
> +		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +		igt_assert(fw_handle >= 0);
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +		/* Runtime suspend  */
> +		close(fw_handle);
> +		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> +
> +		igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
> +	}
> +}

Assuming xe_pm has already ensured that anything else that might have
blocked runtime PM is out of the way, looks good to me.  But should we
also test S3 and S4 as well rather than just runtime suspend?  Those
follow different driver flows, and it's possible a driver bug could
cause of to fail to reprogram MOCS on an S3/S4 resume, even though
runtime PM resume works okay.

It would also be good to extend this same pattern to other kinds of
non-PM MOCS tests as well.  E.g., for reset IGTs it would be valuable to
have subtests like:

        a = capture
        trigger engine hang & reset
        b = capture
        fail if a != b

and

        a = capture
        trigger full GT reset
        b = capture
        fail if a != b


Matt

> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -701,6 +740,10 @@ igt_main
>  			dpms_on_off(device, DRM_MODE_DPMS_ON);
>  			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>  		}
> +
> +		igt_subtest("mocs_suspend_resume")
> +			test_mocs_suspend_resume(device);
> +
>  	}
>  
>  	igt_fixture {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
