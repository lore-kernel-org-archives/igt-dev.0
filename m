Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F11D60D00
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B11E10E2A5;
	Tue, 19 Nov 2024 01:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPVTg/yV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB9A10E2A5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731978953; x=1763514953;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uKJnlNnXfdrtOb3tJ/XotTooh3JflFWocOtlw6u8Z2g=;
 b=kPVTg/yVjhVYXiBfaKvtdTbDoJsgmaDu02oMz1iXeSp1IOhXK0P/1+zD
 1ybNquCEx0QKpZQ/dDw/SJ1dRgRdfgAJGWizUwiocUUUIdNefuJ98ApJR
 wvWkwfac882qHeCy53LjmRe5OENqVqCEjLgJvsPmFiL8LfzyWvBi7Ip52
 oB9maHpy+Ya4MU2NL48zCpShW8feYruSLV4FCglYqyZg7xWO3xxO/sx5B
 oDqmKAio9r8VhZWQIBhXnL2mXlukd35IbOoVSDYTC8jK5At3fW34Zg4JO
 zjxUmBQNkEBQuE7NdzQIFy/c7IFU0W0R3DL0sLnEx+9vIfKTjRPs53l/G g==;
X-CSE-ConnectionGUID: gvlyhwEiRW6WZFgWHx6jgA==
X-CSE-MsgGUID: FLuy5OuWRuyAngJrIpc5DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19570205"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19570205"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:15:52 -0800
X-CSE-ConnectionGUID: jmcboNHLQv+n9k2jRksuLw==
X-CSE-MsgGUID: NBOUAcmtSr+ujYYmoNwT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="93853019"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:15:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:15:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:15:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:15:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBJe7TqG4uWLS98CmoSV4sjJb66CVmCVAPe/TTKtl18G83eaPPEdRKePenIk8hX/dS/cvi7sQSneDdZ6F2zCmPejxCFHfkWjH9GLE8+BphLR+j1ggHuS3p+EqWXlyN6bV0QoCD2kaeYouuQpfXYoVQ0tSVHMQyXm9r5Y4dcilysgFHrGSRx/V1XDa+5E9G5m6SPAYXhl5ppAcQ3EYkX8GTwyeVwBORH4et2mrEtm9ezLamsT+PBIEMX3lqiPzWccYYHFtp7aMOt/8gHadcDqsS/I+g0u1lCRT3V2xuxEv3+oitG2f0kfIXmFD4KBuVaKj/58zjhMYpw4/CzK009NyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reyVDu2r3apNs3X2U4Drjofsp1qzARrxlw1hHFS1wZo=;
 b=HzUA8qxvwbiuW1UKdLzj8mhn5k6FcYFUDUMe7UT2mHhPpCjhQMEag/+iqU0MCzePDD9yrrjBgDGD5+/zt+Vnh/ZVV9HjyzI/BPsmhTSPjy8OCMyF6XUe/iFJsdGxiMn9tKUu2/nKclMSdJXUGXYS8+4JJvhLzLo0jj7MN1/NK5GYFiCW5Na/JYB1NLOO2XXIeEN+AN/Oboctmd3mhhgU5EJxTLlD2f2F5hUEwmB2jVlNjL7lHZASO+fFLpJB9vRViXz1Re7Z4BgfwFRj/W3AmBszQz1tahD0zb6ST2itNqRSLZ9wEUkJ2DkvsH6hA7l/Qd1V08eFx76r3AzhXsxjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 01:15:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:15:40 +0000
Date: Mon, 18 Nov 2024 17:15:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/9] tests/intel/perf_pmu: Remove trial unload
Message-ID: <20241119011538.GV4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: bce3dc11-e26c-4f26-f84a-08dd0837aee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DCGGkTjXVoCEaAAy5Lokh/FuO10tbqj2xKMufDVXhug8yP4SG5JFy9KHYhGZ?=
 =?us-ascii?Q?vs9sTLFD2dZpsVBwphfmK99w15252L0DVvgD0+GhaNZxAw0Z7S9UP74NGTmB?=
 =?us-ascii?Q?KPRPnAeY7HQeOK6NNDcwY5KTxSDGXYhMOlrxMNIFG5UJGyPEdmvYwq0Hx583?=
 =?us-ascii?Q?eiYComq+h35r8ftEMzJO0Uk9fR42hk3T+H6v1IEFrpMpEHETvR/LrmpXBOuD?=
 =?us-ascii?Q?eLr+xO/MDybK3gUnf/oaEk+K/3UEdW3aBiR4gltYD2i3q32QcadiPxnpQjmR?=
 =?us-ascii?Q?EHY3SSpVQ/TcffOUdVT9SejxUIKBGIfy+P/Z4o28jSvoW4kjQxJDyUVIQH7C?=
 =?us-ascii?Q?SwB7wCPTjl7UcCtVuFyK/DMzi/sqIamHFLfdiwBk/fYZHh5MCH54jls4FohR?=
 =?us-ascii?Q?qg4Ra65ij9po50JsJEFubYElj6KXZU3F2XbQvr4DruzgdGUqtDekH4Gaa4wH?=
 =?us-ascii?Q?lGSSepYl1wjE3pfUEe9/aK7LB1j2zD5QtPzY3AJPPIIPZmJUK3Etn2pIEvQ1?=
 =?us-ascii?Q?uhOyPs8gvnNLYgFzM8bjr3RJQff0J+j91rBktBafWD+a2fA7YUnycIxPTeGN?=
 =?us-ascii?Q?r1ZZvxtngmbGl+mRDzUTyjj7kWc4cVkQ4wP1VNFoglnCvogjC8auEMM8vb8Y?=
 =?us-ascii?Q?79/YB/rkqmL3RgMbYQbuWHxj80jvuaS/ITcYsX+Hg3OphzfWK+yBFsQZX1Te?=
 =?us-ascii?Q?CUpfqQ4mClVddEEkR5cz/Z8NgpH9NagyAcjw9pgu/UQfkVrVsVyEacRNMnpY?=
 =?us-ascii?Q?3iU9Xp084wCVV+AWykqbCuwgKlm/qy0PDp4ooL8hKeKtS5hCGelMKOA4sqC5?=
 =?us-ascii?Q?VqhUd8nZfo8xZ1lwPGz9DL0xpc3tS0FftwpuWsq0uFumzugr24+RDD8f3aBi?=
 =?us-ascii?Q?dRP8+DJWLbM8yZMCVgfMN6WOtFbqrSMkV3IGrm0wiAAXu0Y9T4tQ2gnYHQNK?=
 =?us-ascii?Q?zQj/727Jo9wVA1EfOhwP5MrEdgUvTuHBebTrvO8JRxt71oDen662htH98fWX?=
 =?us-ascii?Q?Acj75Vo9q9kJtyAMjLYX6RS8QgF5MietBfe6on0ArjiqgHEVaXfNek/Q1a9B?=
 =?us-ascii?Q?wbIDe3RvxbWnU2KDZTs6TDasuOmSRj128GzkutHYbudqr02KabRkKeIVj8gO?=
 =?us-ascii?Q?3xZfSZ3/LKVs8kVjO+bz3WqJMjTXzf6zxwJI+bkykgXq285O0KiOcDy70x38?=
 =?us-ascii?Q?7DwVi6wY+7G2tqregHR5Dsv8yQdQNj1MXImN7/hGX5+ng5hTHC3Swdfphg8H?=
 =?us-ascii?Q?p93tG1atoejecJmljlb8DQ6nVOf650k25Vo8Rar1KYj7+ZZ5FFIepJNX0MQM?=
 =?us-ascii?Q?YMk1gcbWtGa++4Ddq3iJWMGD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnrMgNkiMnhC5mW9ptsNT5fZBmLWc7YG7eBec7as0DGUj8as/1XD9TzjgJrB?=
 =?us-ascii?Q?G/HwY4mh7iCwkxaeC31zKJKTqMBKySEUgz4vwFuF0P8IzoWeW5hji5YoLgCz?=
 =?us-ascii?Q?YMO6N5A9n4587tLdCmhitA2X+Pc6R528fQbBmONU0RHEzqD7ZgLa+rkABcjP?=
 =?us-ascii?Q?UOJXGi6mFasd/Yoq80xEzhgaqTOYD4GiqF07ZY51WEruXAE9CNPmw5EE5oQ2?=
 =?us-ascii?Q?UleyBEY2lAaxmNjc96YzwMTFCFmcrlP+WLQVNwMdmn+I7zXASbSN9rPhegwG?=
 =?us-ascii?Q?5rNswRWXbjKXFSckhW9NMCnL0aezxjUKVJ0S876mBmOq6BKN6uKyybEHsTEZ?=
 =?us-ascii?Q?Qa5iGQFfZirhmjOGtFZ4K948NIR0itjHZA874OjnzBzPYMJhCRPqDIIApl/E?=
 =?us-ascii?Q?iEe5PyylUdq40efZrQX5caIN1IEnWtNOqRgWr8EqCnqxkdE2ECEuuAU65f2O?=
 =?us-ascii?Q?JR8AWPM7C3xYxxHLf65EzIfC4KA9aE7FivXxIQ0EH1Ewh3SWwWcZyXSV7H54?=
 =?us-ascii?Q?Ik6Ge9yg91tgCu9iDPG4seGJrGIehATrz9e8zCRb99ZnpwPGkBsK8BBcG+sn?=
 =?us-ascii?Q?a+c+TBhHIk+KBTzxUI1NzYVuSq0FBNbSXf/c2BV3BqpJgTVG0JkTJ8x4XDk7?=
 =?us-ascii?Q?Z+mdg8dufFGbZ+7rIiqP3f3HZX/OHwlYbM36+rZC8HFajn+niAVLW05p5BcX?=
 =?us-ascii?Q?Ny4kNI9VtxOTpDb0Obv1lfzQuAlAnDfnftemU9Rs3lM/8O/Jxy9YNVFQHSEh?=
 =?us-ascii?Q?r8/K4h8g9Ake/vWjyDtYqkF1Q820HQzi7TEUhFXKnUjB3W5yCtbCm0hGI4au?=
 =?us-ascii?Q?NCwTNLHXJhARd3TLQsqIfEINUkfbs2MMNkD1UfFQrN+HnrIGbVe0CUNV/hTq?=
 =?us-ascii?Q?2O8hZETICTYl6Jqpnqh7+Z5ofq2mvRV13f84PWBJUA3IlLMXLediC4Y5Hizh?=
 =?us-ascii?Q?1uBeod+FfDgyuTVZ977c6w6zsmDG51ZznoXihEHqzSD6Kc1uTB6rkWc0B8Fh?=
 =?us-ascii?Q?5VWS16KHMaFtAbKGRpcc5P9e2LJjpNTdjqgyzbLK7n3fLycPuWPVVocrmv4/?=
 =?us-ascii?Q?wR+KYcXPbOyWDVxm/Alo393FrkRhGdHlQQm1N+U69iohFoNGu5FiHs4Hiy6I?=
 =?us-ascii?Q?2sRVW+8kahMMfnMdzoIn0fE+AWXZhwUF0YvDVcnCupVwK1J8BtNrNdZMnTYs?=
 =?us-ascii?Q?DTe2Vst99DJ0OoxfPig+gu8+ldMV+YM/7/pjzvQfr8AHeiG2CHeBhe44s7qx?=
 =?us-ascii?Q?TN5gDE6Hu/AjgbIxKxNb4kXdrqkvR5Mj7JI4gM/rGZAXhbTGf2a1aFWCLzPM?=
 =?us-ascii?Q?utkvdTMU/3l8qsEC3PZA3RP+8Uw6QLc2CZhAnCUwpXWdU4WqBVqDIslc7JON?=
 =?us-ascii?Q?FlmqZPKq8mflV7xl9wpwgO+ROPcgj9uM0KtUef50HiGl1XcgKaRAjep/RuEz?=
 =?us-ascii?Q?Ewu2keIBM/7poF6qGmRsD5lPsZNFfpGrdBv7rQ94UVc6rLRyly3raaE9gR4B?=
 =?us-ascii?Q?vhfZL/jeNOOldHmx3zIiNfcTOtTPkZKnE2fo2A2cAx8XMM4TFrYPjLjwNLXA?=
 =?us-ascii?Q?1MOsfDtkdjV9kOyJW7wun66QDIRn1ZzXtNaoXNfTABhJUY7eqRJ0HBznAefp?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bce3dc11-e26c-4f26-f84a-08dd0837aee7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:15:40.8845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WXPELjI73zpkQhFLemy4EDNIXtOaLXmGhKuszXbdKDTsGqRWGjVng2ZdaQGK8cs7Wd+h3sJp722mYGH2zsFcqxXKmJUGYd1DSaf9xgGFg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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

On Mon, Nov 04, 2024 at 10:18:38PM -0800, Lucas De Marchi wrote:
> Remove the trial module so there are no more users of
> __igt_i915_driver_unload() and thus i915 can start sharing the xe logic.
> Later when perf_pmu_unregister() is fixed in the kernel, a new check can
> be added for trying to unbind the device while still having open events.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/intel/perf_pmu.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index bfa2d501a..f916ded53 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
>  		int fd[4 + num_engines * 3], i;
>  		uint64_t *buf;
>  		int count = 0, ret;
> -		char *who = NULL;
>  		int i915;
>  
>  		i915 = __drm_open_driver(DRIVER_INTEL);
> @@ -2337,23 +2336,19 @@ static void test_unload(unsigned int num_engines)
>  
>  		igt_debug("Read %d events from perf and trial unload\n", count);
>  		pmu_read_multi(fd[0], count, buf);
> -		ret = __igt_i915_driver_unload(&who);
> -		igt_debug("__igt_i915_driver_unload: ret %d who %s\n", ret, who);
> -		igt_assert(ret != 0 && !strcmp(who, "i915"));
> -		free(who);
> -		pmu_read_multi(fd[0], count, buf);
>  
>  		igt_debug("Close perf\n");
> -
>  		for (i = 0; i < count; i++)
>  			close(fd[i]);
>  
> +		igt_debug("Final unload\n");
> +		/* After perf is closed, we should be able to remove the module */
> +		ret = igt_i915_driver_unload();
> +		igt_assert_eq(ret, 0);
> +
>  		free(buf);
>  	}
>  	igt_waitchildren();
> -
> -	igt_debug("Final unload\n");
> -	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
>  }
>  
>  static void pmu_read(int i915)
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
