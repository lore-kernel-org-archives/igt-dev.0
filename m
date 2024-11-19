Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45701D60D06
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED78B10E596;
	Tue, 19 Nov 2024 01:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaVZ2cai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338610E596
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979287; x=1763515287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j4ze6P9IUobBHuIwx/4rFiB5QfOSJnUqUSFn/oXxoa0=;
 b=IaVZ2caiqS63vK4nFnXYKyOA3YY9pRBwvKqk7KwYy7k/e0nsBTvs+WkR
 JGRUD2mvbHKa9r4Dkxe3jn/WbjQbvgwP5mYbVVjqdsP4SAiwsUCdqMoKi
 JoLpsKjQxqWlGtp2ZphUnrG7I/uXDZXlsTXLaIhw0SwNqIwfEeeXVbx3S
 qD67jHfmWKovATBD7wI0H5mL2p3vu9gSKHnO1MKGJtzAjF+jRIXeLUzPO
 zX7/uq9TaRRlEcA1lBhr9grPY2Q5k+iOkOtTYq15xjXLA0NCxH33bV97b
 ldLHxtV3gq/3WXwjevYzfjo2sGWdnKGhQGVFG8k5ksV11O6zsVEJlODXR A==;
X-CSE-ConnectionGUID: jYtNu/FhTkCM4KV//k+NKg==
X-CSE-MsgGUID: /TOxqE0mSr6xHAUfiengyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32063283"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32063283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:21:27 -0800
X-CSE-ConnectionGUID: mdFt+RvnSraPkgVXAeU0XQ==
X-CSE-MsgGUID: 6Qqbd3ZQRYeIP+COChUazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89176761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:21:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:21:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:21:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oz290KCL07L/2sy2EVRlNkTJJdgFolftO63CWu3+6DBdnqQwJJj/zgPCOife+SL/RJln2t3McxxgwFAT2gPIWhudI0971Lns69dnUfoA1FRAf5Ntwx/HdIjxMpS8tI6GmGi6dmkwPaUs+bsFeSu9cwnwcOItYrFBvxyhLAGWd/C3c8chjvvddJvYSLYWXF81sdRU1s0tzS1W/V5DU1nqOycfsJ8Sq3VC2Iy6aGoSD7HgDJUWa3Ry7u9HIYeNH2YLWm37A/zgMoIbjj3ZZPB95VjUAHPtaufH8PSgMlVJ6zK7iYTpSZlwSQ8hPnE1CXDr5WXyEKTp/V56l/EV5YEHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMlalJmcKDV1dXOW0n3G4/+WgJSpWcwE9xW0Bgb6O5w=;
 b=trcSdHHZgCdIdmfYbzOHhduSINiQBdnszR8R3DfGE9J2GZayLKvbYMMNM/fXCoG/3zYGGWQvl72HtoDAhDzEbhucAF3k0J6msnrNEwfS8QFnpLHpgI6Ab3+EWrfPPbi7FKbn19rlPXTPHaDhOLgzF+SiOVJBSAyE/mzHUJzeByPp0PFtGDA+olB0n8Q3VvVceqthW95KO/qe5Mvd1yioTJXFQC7Z5dFJNqafOc43GKhkj/OC8Rclux347/WrzectNpBFXg+X3J3RJbHGyo0tujTOOnMQ0wy67TLm1rIcbfidsDma84Vj4uaHGjo5RPT6/7euTRXAfV6ZTb9o9vOYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 01:21:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:21:22 +0000
Date: Mon, 18 Nov 2024 17:21:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/9] lib/igt_kmod: Remove unused low level
 __igt_intel_driver_unload()
Message-ID: <20241119012119.GX4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c08eb3f-61f9-4140-83e9-08dd08387a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bdx7fJJX2E3SyhXovK7lTYccn0xqVWv6p1JTTUG/FJnsxZ4i4RZxf1ZhqxT+?=
 =?us-ascii?Q?0FwpggcPHW8oyAqhrW7sHb1Fv7YsRUcKBx7jvjChmF+RWdtvEWDN9jk7x5F+?=
 =?us-ascii?Q?Vk+eZVj+QGJE5AK2ks5NKddQAnlhpGNJnjQq0MZbn1CKycc7ubwoG/dqWp0z?=
 =?us-ascii?Q?LpMMrbHBVmPxSFexzZwvO0khPyXSFF+DjU1VcMkIytwBwEmkqO4m7Vl/7iz8?=
 =?us-ascii?Q?KybAlBaGuiP4T3CkNCCbTCoCEd5AVfl7zn2clXIo1mLOZD9gObvP/89O60hq?=
 =?us-ascii?Q?HvkDxyZaGAai5gkMVCl1Cyl5ln0mXhqy3nXCZ4p6tQ9ULTvAkYF9UA5oMgQ9?=
 =?us-ascii?Q?fCXtH42uMuahal6c/ZXUTRAIrBK8nebQSdMhe2xW8Re5aC7lst1e3EHg/bhV?=
 =?us-ascii?Q?cVOlJFwI5yY7/tQpm5PrgRfUg54H/QoNbCYWBWrsYdWxcVbNK3BkXCWU/r9O?=
 =?us-ascii?Q?26cEyLVlu/89VcMFGjyFF/GXcAArRJ0ogteNP2QuFyQSAzUUUQvhyxLpkiw/?=
 =?us-ascii?Q?IBnrbfPbIvBdE1G7jUfKbGj//qwjL60uZhanurAYtXBeFkLynEPUywZc9Lsa?=
 =?us-ascii?Q?WaVUkqsmBH+twaAk4I/aOYdshUd3hwCX4xdOMlqeMPiyjgKS5+g9a9ORIWIo?=
 =?us-ascii?Q?yOnKrcAPl9Y/EB7c2d9KFooPVdSELfjoIg/8OZs0A07DDcZSmqHRfqtqR8y7?=
 =?us-ascii?Q?FeEQ17PrY8vU/SEVRg1LHVhEGamaz9kr8Vg64TU5/MXl+/TH2UX4X+6u3JsJ?=
 =?us-ascii?Q?8d/YIFB0G737+Ptden6aiNHzDISvD737aBbicf005HTVFzOQ2Q/2bH2zexpE?=
 =?us-ascii?Q?p/pFXl4ppv5XdevP0EsdpMJ8U3blcTHzVqJZU4Jj3KTnoms8odBQvJ7c218R?=
 =?us-ascii?Q?hT+olIPJdE9kl+uKPKSu6ebhG/zSjIYgIXbijnz62GLrVSJyZei6cxRWIB0/?=
 =?us-ascii?Q?O2KY1SV7B7cYZRazrevASFR61FjfPqqnfAw2El+4ma7EgdFwkEhS/6IAMBDm?=
 =?us-ascii?Q?125ifeXdbwUZYFsfoB42jWWKjEeDQOcWN6t29qFB5gZWpXHRO+OGTb0xEuWl?=
 =?us-ascii?Q?Arx/W/oe9n0LNdewwKTaDTEnoLB0EzzOBIk323RAGD8vG0Gr7oAyvHzf6GrK?=
 =?us-ascii?Q?HmYb0FyH7sya0id0+cfkximHy2+OxFDIjwhB4CHrImBs8AgrDJj+MFH2oVjj?=
 =?us-ascii?Q?R1L97SAc5Kkij1DWZUl7aEu0MHOWEUOPKtA04YiJ9A0Gv1ZmRCEuFWra+l9n?=
 =?us-ascii?Q?VbmulTCHV3EWXCKYcAUoqNxn3vRQY4bsMytAHvQmpnip1P0zcEv5C90OCCcR?=
 =?us-ascii?Q?m8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hzh/1FpWg6Obz931G+p6NR67812XUGtxpPwLF9LEAZ9Rt3e9oZWiDGrqkORr?=
 =?us-ascii?Q?2dYrDHSZVVFRnlEcR256ee1K/dtjqhDjPQ141C8rlVPm6Zr9slFFicfPlvSl?=
 =?us-ascii?Q?72P4hSVhZjviRn6+MrdkH6Bmgj7USzJh2pOwWaP2ys91atHo7PKvZ4QlFMLa?=
 =?us-ascii?Q?wwV7vjXYp2gYXTgR3z0hTWliOaUoRB5hwb0WaVwNtO64HgnviZtKrzVKtYdY?=
 =?us-ascii?Q?pu/u9O3XqNhF/On+4Csl0zg4wuODU05L0ubPCCFqpPVu7TDMpSg5+hR9wEV1?=
 =?us-ascii?Q?TYZAVMWh+nqXd7a4l5c7aiojjIq/4NcGOOklxvqcAau/tzrJMji9rCd1PWiu?=
 =?us-ascii?Q?QXfvfp5mwh9k6mqElicah8L9u0SSNrHnxdzzHHxDebFfD1he3/77Rn/kNfZJ?=
 =?us-ascii?Q?YogN09RGS/WDeM3P/ytenP7k8L2MM5+DmZCDJTgfQSqeij/aWevW7UppuFpC?=
 =?us-ascii?Q?ellVEqPB52rJBy1BZ26wZjGBFYGaOAhuB9GQj3wZKer6MQBi8NwQI4uqZPYe?=
 =?us-ascii?Q?Y3ASjrhAB7K2BNegsfyKg3jLcI9U6Byc2U800SzIMs9wxGZ5n6FFXqdsjE7w?=
 =?us-ascii?Q?KxR/GJXj6jk4ybLUFhQ0kFkWluQ3odCQVINN/INI8TKDu9IHnae3XCrJGyPK?=
 =?us-ascii?Q?vCwsbJowlMuCx070/U3SuDRfEXGC9p0XV3YseCkWezSueezbd0XgN3Zd/EnH?=
 =?us-ascii?Q?NOck4QCnvLxN1rX2r+IZ+zJ6F2NCTHOrY9xKKCKjIsdCrh6uKUEEIncir/Qk?=
 =?us-ascii?Q?+OSXh2+cSBWISSl3ghaSeIM0pS6958j0A0eTl0T/LlXhihL3C7A5pqymzdHn?=
 =?us-ascii?Q?7XNNO2DuNx2jNZVSHiXmHDGd7FQdHi+7Fnal+k1A7bgBOjXHUPyeZ5sN/yg3?=
 =?us-ascii?Q?s1jUkUn5Ppo6Df2zizyjrNRxSeJjpHdcejjBIzxQce2T5q5+dRDaa25V7ryg?=
 =?us-ascii?Q?SAxoQcHqJUmsYVSPDjxE/CjE39FpNBF+IPUoRIAHKwb674Rvec7X7LGv4Qug?=
 =?us-ascii?Q?bF1He3yEfbvaBA0hoZ/Jdk3F81vE40GCaVnmyf54dGN+F5zhlOP79FooSOVg?=
 =?us-ascii?Q?leDnBo1LKDModdvTEm9Aj9ZksNqP2QlIFooLQa/x7Yqa9jDcwD2Gj0mhMCP0?=
 =?us-ascii?Q?5uQ5lfUBy1z8uMFvIbro3YSCWrzDz0ggV/MsB7Km1M9Sma1yiSpNlE4SIj4h?=
 =?us-ascii?Q?VSbMFWIjhuEsn1Hjk/k1mvQA97PoZ2WhK/7YpXjBXDYTSocmvABAhF8pOun0?=
 =?us-ascii?Q?f9RXX24vO2h0oAjs0dF1aBwgJFcjVWOu0Vsn5vk/mo+Delf3u5rBnAC7lyKT?=
 =?us-ascii?Q?XX7FwfrKFDzjoYKVRHza3y+41vSqf3BJFISRBq2MO0uGdq6bD5uuSC7YLWC8?=
 =?us-ascii?Q?n2keLCFlNI7TA7IsltUJ69T3PEetZLt2Av9ai9BdU1+kYTPebt7FpaORHpbN?=
 =?us-ascii?Q?HY98ohHtN72FEvAqzsK/JdtgYPQ2J5zkSyBXmk9eqyCBwc1SWkWR6znLPzq0?=
 =?us-ascii?Q?CPFbnM2Bdr0005xIeaHNXJyL1CAJzNAZ8h9A9BPMFAIHjSbOw5iNqCq9f9IB?=
 =?us-ascii?Q?58B1hmtUVSUa7gce7IkTcxOAr32NBYraff80W2Nffg0mzL//+VZ+zJm8Mk1E?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c08eb3f-61f9-4140-83e9-08dd08387a72
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:21:22.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC4TFsKrUs9rA0kiDyeSWEPlBjGqDXrXZyaqo6O5OmldSdq/CgQOYToeMiSzRbti8bH2J/zEF7VljSEM5nadyW6VTrrNu9D0NFOLurL/Ql8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

On Mon, Nov 04, 2024 at 10:18:40PM -0800, Lucas De Marchi wrote:
> __igt_intel_driver_unload() is now unused and not needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_kmod.c | 47 -----------------------------------------------
>  lib/igt_kmod.h |  6 ------
>  2 files changed, 53 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 0c093ec62..972dc490d 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -605,53 +605,6 @@ int igt_audio_driver_unload(char **who)
>  	return igt_always_unload_audio_driver(who);
>  }
>  
> -int __igt_intel_driver_unload(char **who, const char *driver)
> -{
> -	int ret;
> -
> -	const char *aux[] = {
> -		/* gen5: ips uses symbol_get() so only a soft module dependency */
> -		"intel_ips",
> -		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
> -		"mei_pxp",
> -		"mei_hdcp",
> -		"mei_gsc",
> -		NULL,
> -	};
> -
> -	/* unbind vt */
> -	bind_fbcon(false);
> -
> -	ret = igt_audio_driver_unload(who);
> -	if (ret)
> -		return ret;
> -
> -	for (const char **m = aux; *m; m++) {
> -		if (!igt_kmod_is_loaded(*m))
> -			continue;
> -
> -		ret = igt_kmod_unload(*m);
> -		if (ret) {
> -			if (who)
> -				*who = strdup_realloc(*who, *m);
> -
> -			return ret;
> -		}
> -	}
> -
> -	if (igt_kmod_is_loaded(driver)) {
> -		ret = igt_kmod_unload(driver);
> -		if (ret) {
> -			if (who)
> -				*who = strdup_realloc(*who, driver);
> -
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  /*
>   * Unbind driver from devices. Currently supports only PCI bus
>   */
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 88d4a51e6..67ae6833f 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -42,7 +42,6 @@ int igt_audio_driver_unload(char **whom);
>  
>  int igt_intel_driver_load(const char *opts, const char *driver);
>  int igt_intel_driver_unload(const char *driver);
> -int __igt_intel_driver_unload(char **who, const char *driver);
>  
>  static inline int igt_i915_driver_load(const char *opts)
>  {
> @@ -54,11 +53,6 @@ static inline int igt_i915_driver_unload(void)
>  	return igt_intel_driver_unload("i915");
>  }
>  
> -static inline int __igt_i915_driver_unload(char **whom)
> -{
> -	return __igt_intel_driver_unload(whom, "i915");
> -};
> -
>  static inline int igt_xe_driver_load(const char *opts)
>  {
>  	return igt_intel_driver_load(opts, "xe");
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
