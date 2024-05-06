Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04DAC10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 14:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446E910F796;
	Mon,  6 May 2024 14:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grlf111k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BD210EB09
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715004885; x=1746540885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qn5ixN5YkdY753ZNw56WaSRgw/mQWISeads+zjfZRE8=;
 b=grlf111kgFK9J5hcVQqs/5E1DS0N/4wSwaQ8GZ0g3kdY9BCrklZ+PBXr
 ED03URNu6EB6fUAx36ULLKmvRjB+U0m110OS310wJQ7p7bIwHTcE1xxny
 h1N8rrG37QUJzmDTwTw277s9BMzD0dxkHruRMJzFkN6BIwYKkCFlPLhqT
 Bi0ch09+xwPQBY6R2fn6rP52W8Jx/UZq0tzguikLQMnImFonVxz4c4aHs
 Q0tdF8WRY25rqtOMXcDRKqjnjpJUVDnatmHwMsv8ndHN+sLSqNT2kYTk4
 DfViQmbLNr/tk7EfCZMxkdG6ioLLYxNdYMbvkAA6w3NHoM5kWxUZXhFd+ w==;
X-CSE-ConnectionGUID: c6HA79I6QIi+kW5Q//2IqA==
X-CSE-MsgGUID: e4tSR67fRiOr+zo0pQCCxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13698498"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="13698498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:14:44 -0700
X-CSE-ConnectionGUID: KbmdacAOQKSl/hK79he9lg==
X-CSE-MsgGUID: KMOYdWrCTHq9mLfSbt8QwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28265695"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 07:14:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:14:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 07:14:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 07:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeYAGoGUUqEfd+rrFmRPf3Eoi0dBbnTLES9Ooxp7lT6D+CVTuLZNDHE2qpy0GLIdkPwAFDKmsXVHvO4qd9zToFXgvJDo2zqm7C1BHhQ+8VB0fqJqsrN2hLq1J1r5fHdYHVa1jGhwGvfRmq6fTms6z0l89KCSaPK5um8ca1mMzU2qG2aMW3IwzPYUUNgaSYc7qk2V1WeGedzH3l0/olurAzCo99jAJibtsPcfixmGtnHDgpObtCERAe2LI9AEFVdAsSQ7IzTpSaJLVk0tNUOrJZHbYyi9CJ8YHFo3Mn8ZiP0PGEXSicS9qZqg5rNA9QzgX2SgLoIr1AkUHKkVxIprVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiMVHg9OKbBKW2CNHHE8m3C/qf/eU9TaHQET7x7XrI4=;
 b=APpzsxCpcBbxbqWFHqs8p5wTy8+liAODOf/+S6j1t856LH4DTPOJQmq7EJKD+hRQkZXZoWjYJ586D5sGRWRNnMig66/3ggrUGS9qkbFbRlwygnfscRe5r5+nRmFD3q7vn9AyoMai17nLDzAAqufXl1S3X7cav5LT2IuoyAjFJQY7j7khvKaSAYyPdv0rVvmgRfOtQB3C0T9juuJYvtMNGG93OVt9PtlpnPyOf0zHJin5nhSZQOowhqkQLpfPVOkGLrotYpWOSdQnZUfmHd5H/aVWuyNC1QE/OGojq1GY2gEG7JTcyjBwRbQ+J25SprxsiaRNs/GbLCj+GCMgy9+Vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:14:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:14:39 +0000
Date: Mon, 6 May 2024 10:14:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: S4 to go up to devices only
Message-ID: <ZjjlykhAz7LIFpLX@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
 <20240503224745.14890-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240503224745.14890-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b5a67a-7d1a-4b9c-0c0e-08dc6dd6dd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TgfSGCXPGmZHBFTrzv18aNV1x+mTw0zWo4f3Yk8PO1P6L5dQRffqLU4T8Y99?=
 =?us-ascii?Q?P+R2G58+6JZk31MJCBX03U4+lKAiNdFdsVhSzPIugISQSbK9Jdl3IwxLzU5v?=
 =?us-ascii?Q?5T8xBkHAn3zjPCtYd92TKVHr8c2o2uxOS7OBLGK6Geiur/1udw1m0U6F/6wR?=
 =?us-ascii?Q?obSGH+xkrlUDuTsGeDQLg2W2nyWCSqx1tcvgkabv10t6pvSPlE3gZeorpZ1G?=
 =?us-ascii?Q?/BmgVyHxHAsXj4fo9oyrOz2ASAGww2w8Tff49i/0qH9vXlNgaqWXiEqWGpJA?=
 =?us-ascii?Q?Y/ZgEvgx63uAjwdw7na1Tt7bkWUV4bSZIGySeFYUvfFc/HR4rjquxhWw0ejd?=
 =?us-ascii?Q?xH/lXLZjvaRvkYzPSH+tXAZJvGizThbbfbh1vt7WJ9TUtybF2sgOdng7vQOj?=
 =?us-ascii?Q?KIoNjnWGYx1ZO9YFABedGCMYDiqONeRtNL4ode7Ozt5W10K77txmbWwa38PY?=
 =?us-ascii?Q?8h3P1b/YUm9cWQUO1DA4ueO6MktLsJU2vdMKxUi/+rglTw2EEzHAY/hV5wTU?=
 =?us-ascii?Q?9Epp6g39Jawi8su2Aw8s0ndPn3wcNs24kHIUOQDoZtEoSg86NrYytnouQgd1?=
 =?us-ascii?Q?pkF+IgO+NHCPEN+DJ8rVjZ++euL6p2BM9sTCuCpHkPDF055FbH2sTN4hEy3I?=
 =?us-ascii?Q?puRUxPmjlLtxzwBfSVIU40K41RaRbu6mqfkdqdeh4vj1/VuX3YMCRv9gTQEj?=
 =?us-ascii?Q?TQNyXyO6+Cu6kB2X35rtRO6Rst6o2ElvDLWZMHbVyxC8yD4+p1wVohOACYc9?=
 =?us-ascii?Q?cWcQHKjCm6UQCZVv41evpJH6B+CyErYfL6LgrZ/nlQbIw3iKpbYrwrcm5xRH?=
 =?us-ascii?Q?FBXZShbWy/P4uHymVpS3IkMzxdSjGjEjf7qid6nDr2W4/wy+/Q9qIJXp0oEI?=
 =?us-ascii?Q?LQee1cQXIe0NYHYOwOBpKcFU8fRZDFIWkgY+VOGVrb4ZfWSYyi2ShpfsArYi?=
 =?us-ascii?Q?1MMXGnr+7iyO2QnG1BdYvxr2CwE6Bg34KZNS4+ENudv/UrlGp+oSK6tcGvdA?=
 =?us-ascii?Q?fj4UTxVyEShtI5PDuOBANoWEG2PRfAOtXPSvCWVD5jYapXffgklPtTzcV9bH?=
 =?us-ascii?Q?Xb6gf64ZxgkNcFC3HxX9yX3KXeinHqhOnd+WPHY+vFNnq9q4edv0/HCbDnd4?=
 =?us-ascii?Q?2zUOw313xqetM9PhZMvxPC4XTpPEj1YsUVf07nE9dZ0nVkuDOCaGnG31U5yZ?=
 =?us-ascii?Q?bM+TiXLEWpmyfc9WiLquPiK4By/JQ2fP4DyVjUSTFq2POl9oA+7HZLySDrU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nvu+L1x+mKhjF+UajPkDrKGqQQmtwRSHYidMT49Mc4EdEC2AmVEdT203W9tv?=
 =?us-ascii?Q?ltKHLqEO7pA0/pENNzTtzmRLY90AwSidCywyONDG/COPFfRFb+KjJOCfw91a?=
 =?us-ascii?Q?QgxLDb1RhPPejmAxjxnhbJA52eE6ODpPWyhK6TP8W25sjze3m8+FqIddSTtP?=
 =?us-ascii?Q?41vZLgufPwCMnL44dU+ZNQ4foCqEmnPEgniEyUiU6lbfPS0sYWFD5HfMvrIj?=
 =?us-ascii?Q?mph8uQWJRdo1cowZlX9N878ERDtxBEoD7zFeWo7xIxytahmVYVU3ZwMwcnq6?=
 =?us-ascii?Q?Rnf9JIPfb2s7hRvWADcynWLsWOv5Xk8EIn77RNKWI8prRei7s4AcWBkF+f5N?=
 =?us-ascii?Q?9y6iWWboPVBlgd48cZavQE2FLGPgBIKZ2Qpni8YWSLJzNl0HAR1GYn3miw91?=
 =?us-ascii?Q?eAuJgawKvzQLbTT34fqvCmaPJpLA6QrUJZGxpoafdE48KCn8qoSfgMcYJBjQ?=
 =?us-ascii?Q?0b14YPjwNq0P3pNfLxfJhnZ2uE+TqKX91uJ+0bWLi4eaYdgQHQSvpP9iWq1X?=
 =?us-ascii?Q?fm0cZN0sTHiha46rK1AUC9wzvabdhijVrVBcL+ue83+SYUfyf8U9bHWJHAfe?=
 =?us-ascii?Q?bGlRAgxNEiMguHBqruQAOIx3lPXWkDvmqfuY26aRRdXX5vqrOGWr3C67cWp8?=
 =?us-ascii?Q?Z0JEG8TaE1hPiSmeKo+qJiEVODPPHhIEj7ELfBMgdCzPBO7MPtqNg2jJfbQw?=
 =?us-ascii?Q?CUtoPsL+1F7vDbdc3VOrYNQ6gnr7MqBURyYnCywJBDN9wAcRm3BH4i3uEAnk?=
 =?us-ascii?Q?qZDJPptnb5VfLvm4mf+5iTNQPi/b4WvCwlNnyD/rA/eqXGKzSao1w3vom69M?=
 =?us-ascii?Q?jX8FU2pQMhouVCTNbokQGtGHZ8y2K6bDP4lr6ydPs3Fmfi6OOVcju0l9egJT?=
 =?us-ascii?Q?wi8AXa4Qsvdnlpw/0FrDDor2Ump8c/6MugXBlAd1RfzoXVbk8PLaW16uc4is?=
 =?us-ascii?Q?cgFNgXKzD0nvyk+HQEXFL5SRJDzU/aXkx1hF5KNsn34GPMCSV3yrpCiX4/iK?=
 =?us-ascii?Q?0toMjzP9DFAZvOg/JAvd6MQ28mn6nu2tEanrRiwc2ixvRfIsg+MEpbtzRxxq?=
 =?us-ascii?Q?lkb5h9PS8SvuPrFZ3AWyxYofWG4LrEOUr60X2+HqC0U83+eTz54X/BERQl8N?=
 =?us-ascii?Q?NYytDry9MvFkRWc9aAXzV/mhV9H//FANuVbL06V3RJ1LLQxODqxWWYmNpxJb?=
 =?us-ascii?Q?RQSUBPQ18mhb5dYtyeMrSKiQiBcKBd2hEpylXjxWanHnd/jEFU2GBrE8xcdN?=
 =?us-ascii?Q?UTCWW1xLUbPgRz9R0+7VWko3M9XqJLP37r2uX2Gl1d83Qlg25vvUupsooG6V?=
 =?us-ascii?Q?bkaqRSqHsfbHtym0t+rX7ZJLVVVTTX53cdtOTd/PiY4SKDD92aWwG4X8h0F0?=
 =?us-ascii?Q?B4M3WCqaT+jQTmzkyot4cFYaRrnADTkbevwCSEGg93LEbUNv2jCXL8Um6LpY?=
 =?us-ascii?Q?I2ksHdmnSV94mHRFYgXXec4F62jTVzYsFoZfJvvnZ7wHUF+RiAB5CnAmFs2r?=
 =?us-ascii?Q?UKd9btfllHoRzTScgkw4ezL2IvvK9BtfOEsjT447vTSo6brBfbX/+eLmhRG/?=
 =?us-ascii?Q?csux30vTyCBmbqfvRa/qMIs/DCJiW3eGx9HmMozB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b5a67a-7d1a-4b9c-0c0e-08dc6dd6dd9d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:14:39.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txNPje0YbW62CwArBeEG/Xhv8ri9vfZ9dkDuuzktBFcF+78uF45fDpeKELETBMAbEc8+Dig4P3uai/OzBhNYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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

On Fri, May 03, 2024 at 03:47:45PM -0700, Lucas De Marchi wrote:
> Testing S4 (hibernation) is typically painful as there's mixed support
> in OS versions and platforms in CI. Doing the entire dance of saving the
> image to swap (which sometimes is a swapfile) and communicate that to
> the kernel that is going to be booted (without initrd in the CI case) is
> often a case of problems.
> 
> Main goal of xe_pm is to test if the xe driver and the graphics card are
> working correctly, not that all the farm of machines correctly handle
> all the corner cases (which is even more problematic as we test early
> rc kernels).
> 
> Stop doing that and rather switch to going up to device shutdown +
> platform low power state (the default in /sys/power/disk). If that is
> acceptable and work out great, we may even do that unconditionally,
> passing SUSPEND_TEST_DEVICES as it should work in other cases too.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1043
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_pm.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 5e79e80ec..9a0b362ab 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -414,9 +414,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  					INT64_MAX, 0, NULL));
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  
> -		if (i == n_execs / 2 && s_state != NO_SUSPEND)
> -			igt_system_suspend_autoresume(s_state,
> -						      SUSPEND_TEST_NONE);
> +		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
> +			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +
> +			igt_system_suspend_autoresume(s_state, test);
> +		}
>  	}
>  
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> @@ -662,8 +665,10 @@ igt_main
>  
>  	for (const struct s_state *s = s_states; s->name; s++) {
>  		igt_subtest_f("%s-basic", s->name) {
> -			igt_system_suspend_autoresume(s->state,
> -						      SUSPEND_TEST_NONE);
> +			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +
> +			igt_system_suspend_autoresume(s->state, test);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", s->name) {
> @@ -673,8 +678,10 @@ igt_main
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> -			igt_system_suspend_autoresume(s->state,
> -						      SUSPEND_TEST_NONE);
> +			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;

perhaps a helper function for this long repeated line?

but up to you...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
> +			igt_system_suspend_autoresume(s->state, test);
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
>  					  NO_RPM, 0);
> -- 
> 2.43.0
> 
