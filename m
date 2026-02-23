Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FACEEC285
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 21:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5E10E28F;
	Mon, 23 Feb 2026 21:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un9Cc4P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1C10E298
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771881530; x=1803417530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H9UQJ2104454/yrLCLo4/++2tmfGYAvzagZbsEkJy9I=;
 b=Un9Cc4P7kORvACWDfMoumy6bLKSWWp16w7abpUIs8ZQXtK+rHuMYuopc
 W+cTzMgG81BBCPTwwVlf8qwI8CUHlSPqs9u8GESIKbz8TNaL1r7uPoEfq
 aQjzzrt1tf8FhU96eQkVceJO36E/pARemggpZjJQ/hfxYFCIEAj4o/DNm
 EIz2qDRHbtp57THI0W3gUrwYwu8CGmubhXH0Fq+JpE1vHIFBYebH7WI0R
 ysyRzatBKnWMGxArA92HOc6UVlnWHeLi3kpBJp4/ov6ySkQm0DYececfw
 bKnVvSnORL1j2+NSbJpldJYE2hvDKzB/YpJ+Fz6aM15M5LX/8UeNfTgHB Q==;
X-CSE-ConnectionGUID: fCxawbKmTM6YpuxLVzc+6A==
X-CSE-MsgGUID: cg07jyE4Q6mYjMU/QIPRCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84340560"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84340560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:18:49 -0800
X-CSE-ConnectionGUID: hy1PHwD3TrGmWesiwrsoQQ==
X-CSE-MsgGUID: acOV10eaShCdGFouZuY/AA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:18:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:18:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:18:47 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:18:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lycqS12jeOLjsbGLHDVyAyJgAWo2vjj5AmNVww2MbQ/2v9lJU0xgJx7GbtPpkDfimlS4RccmNAQkbElUd5o0K6P/MmpDIykyPv+3eWKhbwBIcGdLRDO34suVcHZReslrW1vm3Jvly21L9VXRb/iwbf4RMlL4Y6lO40ySCGYGNPN9jOndnFUqi+FJwDtKaMu+m5Vy/2rzEniwKAO123lxhNPbKjiV71jbJe6ZiXcy7VjWzdV3xXSReie3GmmaSYEoPSVWyp/0lNuyyQNQ+RsbhwFEogthTtsGU6+njLB5/+J5fKsb8JiTr7vi1FB81wDlQ0KCTCjz92b2iobtO2x/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F43Uo0nSlYpmDOTAe9v0RN09haKmSxm9xzU8qLb1M4o=;
 b=bBf3pSLcyjk4DrW/6Rzy0SonV4AmsHqWqi/x9haYGB3GmBAzeR7luUDbOrX2fW9LwaNjb/ZY+ELSg+2P4vQKw+5aMcqrog1dOBUfhoLsnCScdU+KmFoYBkj/kIPo422+xon0VXB/3UR5/WPG/AGSmCX1BrRddSVFEg04QDIWy7NRAOwkrlmDY4kcvRucwIOhwRW1DFIClBQ4Ju8vw5Pw/n0yXoNGlxoafuzb+h9gfOlgdvZVWyUUNTLSnFU7L9JAfyMPtqqYZpHEwlDhbuHTAnPD8yDO7l6NDW8nejLu7K3wDnJPGM9TTUCvHNwhIQftq+y2IBlLP4SWBSPC+GEbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:18:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:18:45 +0000
Date: Mon, 23 Feb 2026 13:18:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <himanshu.girotra@intel.com>
CC: <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_pat: use kernel debugfs as authoritative
 PAT source for Xe
Message-ID: <20260223211842.GG4694@mdroper-desk1.amr.corp.intel.com>
References: <20260223040137.19588-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223040137.19588-1-himanshu.girotra@intel.com>
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dacf514-c537-401b-d1c2-08de73212030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iJx+H/56wBXQVhBIrzk8ZUTMbbeKznu5W70GGrlgTxStxD1n7BZ1C4GF57kK?=
 =?us-ascii?Q?/qdqrZKJg21Ee4C1thl537YIwPhns3Wv7kF8b8+9FfF8zM0S6BEjEhA/Vjgm?=
 =?us-ascii?Q?hruuJBzUqEMrHgBlHj+pRGBofB1cvEdPg0ubxtbjALxMByonKB6xxCgqla7c?=
 =?us-ascii?Q?NpmVhf2vhN6OclgQ5UEi+MD0KioHznj8/Yn52cS4UeeVBMK3pUZjbBytVrd7?=
 =?us-ascii?Q?VYTRljR0BJ3qkPxr1UOkO/CGFitztA0ReWXhy8+3KB+Z/Dzdw6ghj5Qwlx3F?=
 =?us-ascii?Q?nwT8/vZxNxmxjXEPq60VQcnkmvyuYnqKBgWePfjov/LMN6dgJJNy19uANfPz?=
 =?us-ascii?Q?ApIecT7oZE+Vl8iAV2D28Pr9tlOWCH/uhZy8NEbTMFGdXAqIhffQRpjCrXlz?=
 =?us-ascii?Q?PzvU3k1N/0jkxegVscKsrCC8Z8E07iaBoJG3u9kIbl//Dy7dtQdXaAVUq12o?=
 =?us-ascii?Q?we2QX+CbtMezufDB+kMW19UHx/ZIICJ9dSiyuk9FLrKdEtfk1XE7Z9jE5SYZ?=
 =?us-ascii?Q?NTlq6TeTAyg5F10Vmp8V/SVhb2O+8IPv0IPXdHIvT5tu9zIaZGUWxq8N3lgq?=
 =?us-ascii?Q?BGxOTKKA3W/DrmgH9Vh6G50n3q2sJJ1Pm4O+RQQ0Koei76PxBc1EI8amVfkC?=
 =?us-ascii?Q?G9Zwi2DxQY89WesPHFMjhwbQZ7dqHKWxYRVPJbt4eDJfx/V90Bxo5AyrT8pj?=
 =?us-ascii?Q?3IiCWwFxvmEIo8jwlWtnyYE0ntQeZw/v1M2iMtly0d1ycIUs1tpPKrouLljR?=
 =?us-ascii?Q?wvLprcPG9Choj54sDkUrv7/+hfp4Y9JM7xH2vQa9xuEfizJ/JQoVYuzpcB6o?=
 =?us-ascii?Q?DUXs9n56RqXwh7SxLhJKgYtB4R/dpg7QjKyI0Ypmc83edahcG6m3tS7sU0et?=
 =?us-ascii?Q?IXad1scS1nPl4sVlBpQBa+TGTkwXKuYkjxahrsERtqs6ni+Nj2Hg2Dz209AF?=
 =?us-ascii?Q?EesuVYEJaPmSrUepzXWl8naog1WCMhk1dGRZpUXmIQSliZYqtIeFSdUOVNBH?=
 =?us-ascii?Q?NyYMAbqIiWQXXe2DZuNvZbznoWHXxvPsOpe/rt96T1l5U7H/0RBKQCw4TrrV?=
 =?us-ascii?Q?hqX3gSI1yMaepvRMkXhHEd6UswjnISOxTR/mF/Bal88UQMMEOjspzKCSEA9W?=
 =?us-ascii?Q?s2NC1eexrkxffE1RWlqDPvYybJJY5WSoaRJi7VP5t8hkkmRe6DsB4yqE5Czq?=
 =?us-ascii?Q?TfU0o3vAlcmZzoH9bslsBlzFJeEjm1F1x8iEfDFxWPFkFrao++X+6BW2PJ1A?=
 =?us-ascii?Q?rOHbnEGZD35CSy6g4pYQafsl3YRYYHau2b/T04lCqyNoEMsl7fpD02psxIK1?=
 =?us-ascii?Q?jMX8QHjMJWgvBcPPmjmh5xsl7Xet0XFk+C8x8aznsb+66k6hqrO1VuY2bjc8?=
 =?us-ascii?Q?8fUct6jANDZSpOfc0Jr219HJWNKaRLhxUhWw7l3jiPs1z2bDMF2I/WDoicT6?=
 =?us-ascii?Q?ZLSvKNh1ILAwhAj0BM+2eAkL4TBFZHTk4p8kFvAF1I1ggSMc1rypi23tZc7H?=
 =?us-ascii?Q?ACwqdXv0M3iwoAz161pbtbSggp/AY0iggFIFS7VHueAWeIpe/bnQmauRXBcD?=
 =?us-ascii?Q?iLnh1hWWNlsKxgJaT+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P8IJtTzMvwsYUib1p49Tssp0wqZ7rsqWOaiYZBn1768Pnks6kNJtxnVcPwX8?=
 =?us-ascii?Q?EGLSRydxykIl6fVPwiu44vluUX1Y1AclOo4h7YXPh3e2H+pKBjC6pk6cTJ4/?=
 =?us-ascii?Q?iSb9LzSpdewgjBAfDNQzAnIWy+aBPViguJQCUGvVzwuP9hV69qubmg6Dv3WM?=
 =?us-ascii?Q?+PSLqu2BL7qAphYTzKg7ePwiiL+3+Xdc46NUxeA083ouJ6815tb/LQ95yYEN?=
 =?us-ascii?Q?mtne/QKYHddMaUTn8zPuiOaqLoYl87rOq0y+nFtxogmmAsl+tCfuTK4BdUdL?=
 =?us-ascii?Q?UwSVhERk9bIaDatXooKlameFY1XdQM2/Vl33n+mrF3NDbkCqSghmtoGO1Faz?=
 =?us-ascii?Q?0jpRj23C7gNLA52b4hnVfrjvNgzSO5tqeRFjARRr/4coEXq2z5uP3igT0kip?=
 =?us-ascii?Q?amVp9LXG63HbAQvyorL+tNRHBtqeLBmeykqUVNA7MVbM5Kh8nvnQRXsM0IRo?=
 =?us-ascii?Q?CxjWQs7+BIKQphQORsOODg+HGrkPWdwARiF6Z3MxiSBCv8y2cmOX+8rSZhu8?=
 =?us-ascii?Q?mUJt2iUuxrGvXe5G+ikCUCz9pVzIhx7cTexYLidTTJXa0FGVAzBUvQmnsu42?=
 =?us-ascii?Q?ro+7AaUfDdgqNQ9OUh2UwpnZYnXfx5Q4xJYyJ5Mb2xzFk/T7zOzi52tRtEdR?=
 =?us-ascii?Q?LdC4hmxZmBZZOhjRgkKIPn1K/U82VGFtCjoW0OxDqDBhfwQU/d/7XoZ6EuGZ?=
 =?us-ascii?Q?323DjT8BXc+4giV02FXl8UJ+zzjR9lHbgbkSc9ARiNS8/+KOxwgpQYo7exR3?=
 =?us-ascii?Q?Ae9jOCok0Pn8W/C7NJSw+a2LABr4h7J7k3jDKQd9zO9vsRRVos07/d05CONM?=
 =?us-ascii?Q?f0HWk/Z5+hdSXw+aClE705T6o4+bcdHTW4UgwQLzrf/eUZyjAl3tf2HLNcuQ?=
 =?us-ascii?Q?eyk3PKfJhqWYYwEpsTnME1Ns7zWWUqwttw1OaHoL9zvBoUxIxS7EOAW/yDmr?=
 =?us-ascii?Q?1dQA12e8z8WYwRRlNC8Qqf2cVgaNOAQlxeA7YD3/7UY5NxifMGVZ6Q4+SqwJ?=
 =?us-ascii?Q?Sc3hYvYhLMq8s0+995NuuAGFkSkue1DoAIvRaQwVXFGVPcgdIbdCav/M+1qs?=
 =?us-ascii?Q?qwmls+0fXxEU4VStmnB9ZrFy7py0a3KQgTDE2/WSuZ3cgnqTXr1m0T6eUQ+e?=
 =?us-ascii?Q?5dGqpaT7ayQna9klkroAoa6G7qcBzcxf8v/GxZnk+NG22dNcRvlNT7CB4LSr?=
 =?us-ascii?Q?Qx9afetOc+84NoMvCLWffS7eV0qyTjefdXWVJqIpIIFqCLKMMKqawzPU2hpD?=
 =?us-ascii?Q?XITlYOewLqte2zkfmWkAB6V8x4JgSssIVX0g7BnDfTR8XQ7C47gAtdVnmdEz?=
 =?us-ascii?Q?vjTcUwdyBNJoEG0dOgIVGaOydrXyN0dMGmJtxMbHeOUnSj9OxAsRk5v0mdDA?=
 =?us-ascii?Q?KPYklFZSpnQR6zFbDpcskSt06XE+/2ffuSIlC69jqYI1hSl75GpnfWx9oOns?=
 =?us-ascii?Q?3p97dX4R4E5K1uqdN5rkp1bf3E9gIBmW1toUJl8l8UXl1EKRTiidJJaca0GK?=
 =?us-ascii?Q?dTMzAAmdTOQ4pIX/98lml1IfqDDDRGbSzdVGGHcd+AQSL29DUseAgwDwMcZ7?=
 =?us-ascii?Q?tmZ54o0kXcQcrhxvULjUb0+UBnKNGYLAudBFJhKkuq6nOpXLeWTv8QOuR1hp?=
 =?us-ascii?Q?07WfFQrRKXkdONLc4+e4twAhZhmWnyfLPkvvRBtjGcyZmdHGFMU+Ji9gNudM?=
 =?us-ascii?Q?qQK8AjN0p0s9wAiaZhpj02q2xSTw42LBuXvuUs3bCm6FAZGq/Zl1Z4DnTIUY?=
 =?us-ascii?Q?XsG/maew5xpHKMboW4A5d7DorIZ/S8o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dacf514-c537-401b-d1c2-08de73212030
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:18:45.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgg+HA80vuC9yLJCy0eK0P/LywDbBqABjmMm0a67HzSgyGGnAXav9ns5Yzwlqlq9kWtTvh5NlxVSiSsnN9ofChr01WiE+9gzYKBmUXWrV8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
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

On Mon, Feb 23, 2026 at 09:31:36AM +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> IGT should treat the kernel as authoritative for PAT configuration
> rather than replicating platform-specific logic and workaround
> adjustments in hardcoded tables, which is error-prone as PAT layouts
> vary across platforms.
> 
> For Xe devices, query pat_sw_config from debugfs instead of using
> hardcoded PAT indices. Remove the Xe-only hardcoded entries and
> retain the i915 fallback for older platforms.
> 
> Drop the now-redundant max_index assert in pat_sanity().
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_pat.c      | 37 ++++++++++++++++++++-----------------
>  tests/intel/xe_pat.c |  1 -
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 9815efc18..8660a2515 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
> -	uint16_t dev_id = intel_get_drm_devid(fd);
> +	uint16_t dev_id;
> +
> +	/*
> +	 * For Xe driver, query the kernel's PAT software configuration
> +	 * via debugfs. The kernel is the authoritative source for PAT
> +	 * indices, accounting for platform-specific workarounds
> +	 * (e.g. Wa_16023588340) at runtime.
> +	 */
> +	if (is_xe_device(fd)) {
> +		int32_t parsed = xe_get_pat_sw_config(fd, pat);

I think this should work for now, but one thing we'll want to keep in
mind going forward, is that it's possible that the kernel's idea of
"this is the PAT index I'm going to use for WB" may not necessarily be
the same WB index that userspace like IGT wants to use.  If I recall
correctly, the kernel's indices like IDX[XE_CACHE_WB] get used in places
the GGTT or a PDE where only the first four indices are usable due to
the number of PAT bits provided.  Going forward, there could be cases
where the WB PAT that userspace wants to use is actually one of the
other WB PATs (e.g., a transient-app one).  If we encounter a situation
like that, then rather than trusting the pre-selected wb index and such,
we may want to iterate over pat->entries and use our own logic to select
the "best" PAT index for a role.

Actually I think there may be a workaround coming up that asks us to
avoid 2-way coherent PAT indices on certain preproduction hardware.  If
that workaround materializes, then it means the kernel will probably
switch to using a 1-way coherent PAT for WB (since it's limited to
picking from indices 0-3), but IGT would probably need to use an XA PAT
(such as index 19 on Xe3p_LPG) instead, otherwise data would not get
marked as transient and might not be flushed as expected by PIPE_CONTROL
or MI_FLUSH_DW instructions.

Anyway, I don't think that's something we need to worry about
immediately; I just wanted to mention it since it's possibly something
we'll need to think about in the future.

> +
> +		igt_assert_f(parsed > 0,
> +			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> +			     parsed);
> +		return;
> +	}
>  
> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		pat->uc = 3;
> -		pat->wb = 2;
> -		pat->max_index = 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {

It looks like we were missing a case here for the Xe3p_LPG (35.10) which
just landed in the kernel.  So this patch also takes care of that gap
for us.

> -		pat->uc = 3;
> -		pat->wt = 15; /* Compressed + WB-transient */
> -		pat->wb = 2;
> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> -			pat->max_index -= 4;
> -	} else if (IS_METEORLAKE(dev_id)) {
> +	/* i915 fallback: hardcoded PAT indices */
> +	dev_id = intel_get_drm_devid(fd);
> +
> +	if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
>  		pat->wt = 1;
>  		pat->wb = 3;
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 21547c84e..53b0f5213 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -144,7 +144,6 @@ static void pat_sanity(int fd)
>  	} else {
>  		has_wt = true;
>  	}
> -	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
>  	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
>  	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));

These two asserts can probably be removed as well.  We're either using
exactly the value from the kernel already, or we're adjusting it (as
described above) for good reasons.

A more useful sanity check would be to make sure that the entry in
pat_sw_config.entries[pat_sw_config.wb] truly is WB/XA/XD and that the
entry in pat_sw_config.entries[pat_sw_config.uc] truly is uncached.
I.e., it would be bad if the index we selected for "UC" is actually
writeback or vice-versa.


Matt

>  	if (has_wt)
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
