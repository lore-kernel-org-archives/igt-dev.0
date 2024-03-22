Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76B1C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 21:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B50112762;
	Fri, 22 Mar 2024 21:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO9y9zbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6EA10F202
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 21:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711142314; x=1742678314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K4mS51G64XrpCSPIMZ29ww938mCIt5K5EnUG2y0x2nI=;
 b=WO9y9zbo9vyjyW2Mw+ZF3UdI3rUvsAVWTALL3ABzfwveyJo1wHMx0vG5
 82JR6wZqQ1IUHnIIXUrdGGPigiCJ32GlwGqwIJsDOYN+z02zvAHxfXQP/
 aJ+adCWhY4bycBAMTSaNcH5bxvZ9kOvJ7SililhD64Wk3v4VDV0f/m/9P
 FNx1nxeq6/uTXrZtwSm5wUhZ99HPj/z9adYu07loizNjJL76DtFKirO5+
 qRBJAcsU7cs7mBiquxqETJ/gjlyeBd5n0L9kF5cTQPG949tqmX/L1NYNy
 APfmUnomXI4Sm/i7bCVFS0zM5K3cY0db1Iu73O4LKqzxt4ersGz0F/VY5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="23662031"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="23662031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 14:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="46168776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 14:18:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:18:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:18:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 14:18:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 14:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIHoir5aiOC0Bz+f5uYQ2Zsuvr8uApHWHAV0uSIe9Yvoo6QxIm83NoO6oT64sBWgtbSf8whIgecQXCAGJSF/drKRDn8TQvU1I++0o09VIwC614YTQXOjTRXSXzOnem0QrKrs7DspjbhY/V3LTbqNEQ7Eee5QsvEHNlp84fABs7TywhRlzSlsz74wzBhiXEtWx0QEOzHKNfSkzDs2TCFMK9B/d/0sTYXmh37xb4CfF26tXGaNzotyXInuXqXuBwJMJtvWqW+oNXI1qh0sKiqB9yB6SwvTIeyi0l72wbQb3Lf6dsvxUDc3mThQU54W679IJ8h+9vs2qV/BKm+/yg6WmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcmGVxLpoYqaj1kXKCzJSMGKoZtgFYgbnWjfQr9+/4g=;
 b=AcZny7JW0XiQtZU6HtKWZv/Uk+IZKZ25Or7cFfaR3SOqwK3mVUCzTXqewXHMP1ic2UcnGWN6qNR3A8WvFSFVSKu+lvZ403eeGvnbhoVTmc58jKKCPbE9Ii4Uxnu4t9t43uV5c7Xoq/PZi0U+wJq3o/18bUTDajPXKVjxeW1r7RVY/1gn17pTS0ipE089Y2HBCPh8qNJ0v8BDs+GwPAzX8RolVu8MeNd9ejmUOgHP5bUF6Kf7x37lvrCvWUubJOGySCgyWO1TdeAchBlanD43RlPNLQlRJQSrOBC7VyASMXz5Lpt6+lKUST+punCjquQJFG8wuvnE+hmVt8Ua9Y06Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.15; Fri, 22 Mar 2024 21:18:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 21:18:29 +0000
Date: Fri, 22 Mar 2024 14:18:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to
 check mocs entry
Message-ID: <20240322211826.GU718896@mdroper-desk1.amr.corp.intel.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
 <20240321151637.3320911-2-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321151637.3320911-2-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dce27d-7a8c-488c-7151-08dc4ab59e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjDB6bSUIQawgTEsjz0gxGTpq0TNBEplRTTKstvdufIGCR3M8oAjNc0c0U5xy0FOKLcH2qoxpLHifn5rrBxclDTPD7ogV+w1ckS4DONKxszvOa1pCJsbkzQ3iFGb/L3dnScysVinzqSA0SCj2mUvHH0FmwoSXJKFaqzBhg7WP/XJU5bdMvIEgSSlpux0bMeQVOTwtqeGzowWjGwWcO8g0+1ToEBYXemjYTBYF0MnPy/wRfI5YDZ/u5aKxza6AGJdFReTmchIZ82IgLoYzK5K1Bxl8iP2tV61qvnsr8i6GDKeYHKLcS2PQxsyPNMD+B50PqteBrxEyqhckCZfOp5aGLO6tjtHsZCEhFwf9H8z6Md3jfsgUkNV3E+EENPmSM4XQTjjSmZK9nxVyyRL5j7SLBDi4vvZaWad8lL1Cbgw4LId8OKmLRNemB2+IypkPmCVLn5pgmGDrOPTnZSUyNLayjDyAfMozCjsBZ7FexEOU0KZt/ivMjUFWogtlxZZyKXBglSQEnnb0y+Aqurf8jGcUztabK92lU9Hl0I6Y0FX+Sqtw1rRqXC74p+i+BS7Ca7yaadLYeFL4TsvSflAaSiw2ucF5//5l4nBkn7SFobInVEAPIjrNf3BPIr64zicuHjE2+2GrNq6lxpq0wW1l7Oljeq1UtXqoa0lC9NsJMmSsJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G0yY8S90Kf+04aE+qUiL+cMu82uOG6P16VB+qduIGVfqv6WK5ZZKeEJIDbes?=
 =?us-ascii?Q?p7ARipb3n0TJsO1y1/B8TDe9NuFvC8z4dQPy8NzYGI5zGU96FQ5jhvwRk2nW?=
 =?us-ascii?Q?8+X8DYOjS1wP2jeCHDeA3GqDV5PFTyEzPD5xri2Wrb3pAp/74epTzgPtZlkc?=
 =?us-ascii?Q?FpjYsnnFOoMsBUSBfeL+DdGCW1NHBu37shpfH4DZlqsjIjlcDDlvrd3SB7JW?=
 =?us-ascii?Q?LlgIU4lX0kjBcUfCrXRm0uWj1jmYLNF1yjrS5D/oD+2j+tXpLAYqZJqPYacJ?=
 =?us-ascii?Q?b0aCePTuMCJcTISluTNeUKTNql14VYJxZqfLHthnIWGFP7U9RrNmOTuqYXor?=
 =?us-ascii?Q?mT5i6y0GnV94SUqCgpINXfo1vkBY0Ahbv5XHtBT1whx0ptf+NKguDWLpoXb2?=
 =?us-ascii?Q?4B65UsdWhA0kfwhBmQISbzc7MbQXsPIYKY27Ulq1BXoU6kSGMUuHlS96LuAI?=
 =?us-ascii?Q?C3kNmx9EWr9CPBPUN7IDDM3Eai59OqKIXLTzEDg6ZTeVjazsmgL6zuLTpYJi?=
 =?us-ascii?Q?P1/zjarKvThN9YMJ1k2NNgo/LOArd/R0l1rIcoEQXgNnJClJpUZWG+K/9PuQ?=
 =?us-ascii?Q?DVQvDIUO8erFhdcAnSyep8iMlQ9rLBCBCzRBDdmMMp9LjVBe5V/rp2VJiIXl?=
 =?us-ascii?Q?il03wkPhHkOR0QVKe32ZEMl1hRP4YpgBTIWFqy1ULFG0rAqAb9smWBp/4fbO?=
 =?us-ascii?Q?tMs2M+PIU9Vc41G0ZVefctfwIkf71E0CYgblEKGCxnjBR/CGUg+MRvo1QoAS?=
 =?us-ascii?Q?a+gJ0aN6WP9Q4ty4NE8yeSnEwJZ3wNRyKbLV/Ui5rbFj9HFhgiwZnrHwdgQ1?=
 =?us-ascii?Q?EYqdYeotPG8UtEcA94/craYPI+s/viEuBfklPWeOrCJWbweGYUP5evM50teq?=
 =?us-ascii?Q?DLu3IEWCKbacHLUNNQf9wddTbdkijq4zVRq61VyagzG4cGwZLQsnoHsSW9M+?=
 =?us-ascii?Q?pNLnoF2kzJsjoPl4h/M2HcjIJT+Ncp6kykE+pRaeaOU2OCJ8T8JX6Se0WkV5?=
 =?us-ascii?Q?/xFJVC7iPkGfIs6ig1/T1ODOwaRcP7gbPhZlomytpL23Mv5kUhF09N9w+I6V?=
 =?us-ascii?Q?lz5gOPiBx/Es+ccx9W+69LhxMR1fuHuyTgZ0yUg/RvQQJB491eY3BEw/tUfx?=
 =?us-ascii?Q?GbbxYCjtRv5HhSTPWf4XOKXyD7KFF+2IxA7Ic0tuc8BnW5AYy/WBLyflQDln?=
 =?us-ascii?Q?C3ubZAdcZx2a2PKi+G7eomv8Tn6zgWQE91cO746B+QYytp7LAUFjPkaK4WuK?=
 =?us-ascii?Q?2f0T71kp7lBfdFL17A+xxEkLqLDzHG9jG6enofpQxlTTNJUeZ7wR3xpkA0Y5?=
 =?us-ascii?Q?xa9zI/el47jF2jsuaAX46PNRdfRrmFq68B0uTkvsodXplPlFzhCSsAbL+Cd5?=
 =?us-ascii?Q?H1UVqVB/kRxMxWKFM2NO+Y0SybLfKRQJj3ZYN8NXIY28YNS37/K60Xr/6LHM?=
 =?us-ascii?Q?5gWuOkA6Hng9QVBFYw9GHGD6Hu8YnWIUkP8Vk9/chy0hNcl2LNhsY/xP+NWj?=
 =?us-ascii?Q?TQgrQsyxwTGgNFK6oKcIwZoBTI8LJ4lSE8RRbkf0PMNLZ39DCOJsr4D4jwms?=
 =?us-ascii?Q?cwV+T4R+YTdkk10JJjY/j8Uoa4zMJ6TxFRaKHjwQJFBD4o1w57fzEve1zag1?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dce27d-7a8c-488c-7151-08dc4ab59e7f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 21:18:28.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU0FUY6L0VkfdfF0e5bQcbbbpqndZgRC7YHHDpHY8x8QF8aTFiL/Oe8GdUxLaRB10hmrLokYbMtyNbwLbBfu60qVTlF4ANo1JGL9GiwKKrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
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

On Thu, Mar 21, 2024 at 08:46:36PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Read and dump mocs debugfs entry.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index c5a586e9b..ba12f6ccc 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
>  		"topology",
>  		"sa_info",
>  		"hw_engines",
> +		"mocs",
>  //		"force_reset"
>  	};
>  	static const char * const expected_files_uc[] = {
> @@ -183,6 +184,10 @@ test_gt(int fd, int gt_id)
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
>  
> +	sprintf(name, "gt%d/mocs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);

Rather than just dumping the contents to the log should we do some very
basic sanity checks (e.g., make sure that the values don't come back as
all 0's for every entry)?


Matt

> +
>  	sprintf(name, "gt%d/uc/guc_info", gt_id);
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
