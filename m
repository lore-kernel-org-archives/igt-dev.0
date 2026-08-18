Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C91C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 18:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF210E050;
	Tue, 18 Aug 2026 18:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZO9pTwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196BB10E050
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 18:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787077542; x=1818613542;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iAdnw8p8KefN+bpxFmjI9lyvkIHqjFJK2bmo5sNHRyw=;
 b=bZO9pTwLvkmf95kjR5OKcBg5T+ThXNMwR16B2mAS0vsA7VtIeLG9jHJI
 MFx+ynT05w4yzlb8nwqvaRnq1L5bU84iRb80ZinJzesu2HUcQqmOOwD0h
 KtSRsP8FmaBBdzuBvfhVG/j02ssSzcObRUcGm2rEve/qgFdVjVk/cJhA8
 nb9Nz0jB1BDU0yxlvx66wK7J/i6692PzCyPffaIxo19V3Xm3oGDWRwEs4
 EHCTQyohzYVC6MpNMdtdi6gqGXELJKWy2SycWJVqdh9kN6DOlhZh5q0cE
 MBczE1g4z8ipLxQh7N3h/cHYTqFeukndXah8u9EqtLlCKoLxy18eyHIiI A==;
X-CSE-ConnectionGUID: H8HjBrqhS/aJoJ9GJS8mVw==
X-CSE-MsgGUID: M2JFL7EbSRWBWEIVdno9Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87703932"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87703932"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:25:41 -0700
X-CSE-ConnectionGUID: WzFVh3TRQUelzs+5siZYEQ==
X-CSE-MsgGUID: phL+Ylg5S2m68/WPpuuMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288819163"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:25:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:25:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:25:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKF5kcZebD9TdWeUEeUrT6AMSJuSUO1hJ6Uo6xHsBeIX+/eDNqo76Mg3aGP0fCaOUam7CV1UV+AALxBaYf6g9xMe83JNANfyaXuUwbLwweKO1+aaKFcHxUsnJ2Zx4uOtQAwvC2zMrwFjveluyeX95tJQmu6ahYeyBZ4Er96KQ9+oNWWCJLUOjaVpc06YInKFwzVOTn/OWvlIBrWaRojJtoZDWd4XbaiW9IRgxj2i9R/yLrx863v1PNqXKxp8qh64juEUfC+6/Ycv7e2e/uUM7itc3phinsnrIymuYjild9T6+WgJli85VAgFEPTSShS68fFJqtusMz0PKDJwFx9Znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p07qOv7YqFK9uJyHzIvfCxEmnpsfSPBQxkIx9KgCNgE=;
 b=WlzI2bmrtjqPn9EZKjPe2MkmVmJChxdqYbuzBsJub6QjTvB29jqFS9w18hPhXKY7cg7IpK9qr+44CuMNrnhpGF3eriDuMOZh3daVtJ4O10PWxKnsBl6pZUPJ1Jadb6x2l0n7oFjaEbLgmxyIFREoRoSPvDRXW8GDYoMn/Jj/c9eKn5YBPUUBIOgQoAgwHygF4LcO4DH7FJwUfVih36F0KkbkTojc7QUcpSiVxPODo1BeIGy3PFa1vEl8g1azGairGiIjaBQrKpCM00L5Rezln5x+r40tdx+1XMnxzc+GlHz4MrJM8rKTYXtf8HOA9EzJufct2JzhcAie24WtOGNXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH3PPFC80959CE8.namprd11.prod.outlook.com (2603:10b6:518:1::d4b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 18:25:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Tue, 18 Aug 2026
 18:25:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
In-Reply-To: <20260729223532.GH7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
 <20260729223532.GH7790@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 18 Aug 2026 15:25:34 -0300
Message-ID: <87pkzfb80x.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH3PPFC80959CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 821e5d39-361a-4443-6877-08defd5619f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: dpK5Chp3bhkxYH48Q0lBrANwzqSzsaonevLWlySJ0ZJLWXJNZzrBmG93nYZLj9ML+FO3L5g2lHKArVWu4EjM2u5FWfG4ZjAuam+TtCUlk9pye33lADlaT3voKCdfZK4it1OdXcSpuU3Qkuy7NWPaDTGncxmTSBTkjmm2sP4NULGDA/oa4daLrAwU2sipKkKvUnKrPp1vxng/NrZIf+u0CP3tLHRJmdWQg2EIYcodao5ydJ8ME1GN0SElnbL67ca4fn3j0nfY03iOQ8K9QsdqTAuUE7WfmiaLqBzugKETgc73iqx5hnrf8ljds2VlAvHFL3skV8TogNLXOX1KsbTcz5Jtt5U8uRrYGTUfzO1P7r6PztglBbTA4J58UcsbHUiqqO2x/RU1d4ni4YiuQmukE/jtHgQ4U9sTa3ippRkQH6xTkis6cD+HULmr3Fzg+xSMwdivYCmyPYsVRZGHGTbFYTdczto3tsekAuNTyj8Xk78dR7+cg1GPrgqkB8LyCMNFl49KeKtCvaxyN0G3D9Vi7ZsPQ8d5utwFqou90+ov923kqmIZpetAch5NHvVxHheta6mWvIVQPInYm5qmqRlduUW7Q/TENVbnqoyHPzN5Q6aDItlyzTXNxJzUjrQTEKUKq7rNtY86hPJYc61b4+kvryrXJetuW5xE76rZ4J55SPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7S/gpbh1EoK4uBObVFLXWE1KXnWKYOyn6SAG6dFkBMssLRorR9KGv4FHG0V2?=
 =?us-ascii?Q?JR7Qq4SW9vcDakJ5QkNcYCZZKGH1mS/DTVedhTsFUkR+VADdIm44T9AmgsQF?=
 =?us-ascii?Q?RPEofBSEYace1GQ1O1g01qdUS7a3KL9X+zcCgMRNrjIH77GfWvf2lg2lJ+Zo?=
 =?us-ascii?Q?p/l3W5Qew3kndTYWfa+5FAXG0tYeHxUnfb5cKaeoSgbiv8TQAPcNE/n87Cch?=
 =?us-ascii?Q?1zFT9HXrEMIsFxezaJjTKx6oXlYvflT1fAh0rajGu2cPUsfdCAithLbVgidb?=
 =?us-ascii?Q?99sUl9t6s0L51HjfdGJx5XjXGBMOvCOJk68ehrmDfuhJ8Vmawo1AWkcvYtTy?=
 =?us-ascii?Q?JRnoqWJNUYubWfYpO9NGsbztETcJOnmVFWfTpPByQaDUH/qaGYymtVtA6aKX?=
 =?us-ascii?Q?VxROpyk7fd+PBf92oMtGkgXcvI50weY4xXTHgKRg4PQFlf5Bv0Jrl0ZuY2v9?=
 =?us-ascii?Q?OI03b9hpE2hRS6jQIwzOQm6JuHNIm/epLUTraCfMOMyAEe1Nv8aG6P0Swj26?=
 =?us-ascii?Q?fqPIynP4xlvW+AIPcnQM+EQofc9qY955IAVy1ugbZ3JFX2CumysyhK40nDYv?=
 =?us-ascii?Q?+z2SG28gIls5D6sjNbqK+gUKjNDr0Twz2zeH+wrxw7lJ7+bn2G1XqP7BKGYU?=
 =?us-ascii?Q?YBpvLuuRTN1pgvQndyFi2wuALpf4Xy3j92U813weYBtPu25zLQmi3piRWam7?=
 =?us-ascii?Q?BrIaDB4xbbzhWpYxLh4rE6z3gqZ0KMWGC/pM5NwTT71LDSNcLpwYJ59/SSv5?=
 =?us-ascii?Q?rFAszYGayfVAFNijT1I/PjXuU6HtfvHlrdkYj4LbnFYLzQDYds+/HZmhuwR8?=
 =?us-ascii?Q?POmIwmju4N+gJQzDSHMzqZ7SL9n0tn7cm3JlKTPvfEO76sLLYBxprSjbHSki?=
 =?us-ascii?Q?+6wt0V4k2mcyAknkcnblp4502mGAf2VVky4hbPsi37z/xZvZ+/NBr3NTDuNa?=
 =?us-ascii?Q?SAUYY//kCthEAgun5dSxjBNFwk/y3cQ6Iu9UOEcZKeQnOCbQj/5U9vO7nKTs?=
 =?us-ascii?Q?G/VyshNQg2YDMuiah2EXZr6baVw63cp/guELvpaOtiVXJxnIrKksTKGhVlbw?=
 =?us-ascii?Q?DndkjJZsHJH7eP2UeDcolo4YkGgv6aaKTvzDxefaZhXu42vgDusqHCHyJlHA?=
 =?us-ascii?Q?QulcZUYEKapO1DKsG+tsktCcSpbtyYujSl6a73ffDBG4ZdQMk2QmC4pv0i6L?=
 =?us-ascii?Q?hjeh5f4Vi9Nto/Mn19zH/Q7+EWWzGMcATFkvKWWNRvy4sVroIpJnJhXKil4Q?=
 =?us-ascii?Q?eRQiBMM5AoMxRVmEHepv3up+SWUciOdx3qN2i6Z28J6Xxe3J1DAEMRkdC1+d?=
 =?us-ascii?Q?j3SczYikO5Z4HQpa5XNDqbxKyrMhI2r3ur3gop6nlUgRzRKiv5lYlmWNXnhl?=
 =?us-ascii?Q?NrzvAYHoPb+uJanBv1sgZHpXLeRwZaEKpDmXnI2jWPOeMbjwf1qftWPuNU3S?=
 =?us-ascii?Q?+VIBps/oKW3MChE6WTb1QtOtEYKPUr/UgNu3qBcykr17S3YDE912cEcr+zJH?=
 =?us-ascii?Q?z5iS1DMnWwxLSr4O8LEg8q187kIIBefzfJXL3y0RKHCeg+xx+0IS3D6cH8jk?=
 =?us-ascii?Q?aC/oMZbH7QOYtyS3YFsi61rQUX5Q9upzdHlvgDRDSu/+uu603b1LuGiqhWmh?=
 =?us-ascii?Q?uNc+yG5NGIW6Oz3vykMleYH0mxuMe7OhoK5XlaLPN0oRbAGerMAIn6Yuyj5v?=
 =?us-ascii?Q?ObKYtHW6GaoGMTGWs7+T0kb3vWq6IgBnSm/XVl9XyY00HMld3k5O+pOxSHZa?=
 =?us-ascii?Q?z5tab4C1Kw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cD4KDz6S1T9LGw0WuM9gRu3nKrqXHhfuPKJJgNPYG1GlAQQdipG7xDop3/oK5iDR5cioApPntb3qxg6cVNcJ+zwywF/PpM6czbJ1tfjrObPcloFZixRm8AhR/UdyuyiYFehQfWmr2RZydsbaiWTAHW3bEGU32PjqcsKioxQ4wmBaGxckyshSWO3LxvXOwZvj6r5gXLne6lUcKXrxpappqEo8NmdI+chsBcJw6lQSvW/Bx88Kx8WrF6x7drx/CgwMhOtR3vP9F8h9Bw2fVWN1qr/mRFPxdVoIl21htmIkZF/dakEm4w3OpVJYRUyoc2wtiShU1/pTKw4Tioz8frNCfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 821e5d39-361a-4443-6877-08defd5619f3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:25:38.3864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h74ysS+JNWNJO4lfPtimVf6AEQD+IS/cijRgInAglAAJEzJai/cai91/ekff+w1wkSq8FabwgB8ZRCwK+VrewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC80959CE8
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jul 21, 2026 at 04:00:01PM -0300, Gustavo Sousa wrote:
>> Currently xe_device_get() manages the PAT cached information
>> information by itself, by doing the necessary memory
>> allocation/deallocation and calling xe_get_pat_sw_config() to
>> initialize the cached information.
>> 
>> Such management is arguably better suited to be implemented as part of
>> the intel_pat module and encapsulated such that xe_query doesn't need
>> to know the details.
>> 
>> We will introduce changes that will require an extra logic for
>> initializing the cache and having such encapsulation makes it much
>> easier to implement.  Since we will touch this area, take this
>> opportunity to move the existing management to intel_pat.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
>>  lib/intel_pat.h   |  5 +++++
>>  lib/xe/xe_query.c |  9 ++-------
>>  lib/xe/xe_query.h |  4 +---
>>  4 files changed, 34 insertions(+), 11 deletions(-)
>> 
>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
>> index 2f35bb77249f..14935e3c4692 100644
>> --- a/lib/intel_pat.c
>> +++ b/lib/intel_pat.c
>> @@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
>>  	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
>>  }
>>  
>> +void intel_pat_build_xe_cache(struct xe_device *xe_dev)
>> +{
>> +	struct intel_pat_cache *pat_cache;
>> +
>> +	pat_cache = calloc(1, sizeof(*pat_cache));
>> +	igt_assert(pat_cache);
>> +
>> +	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
>> +		free(pat_cache);
>> +		return;
>> +	}
>> +
>> +	xe_dev->pat_cache = pat_cache;
>> +}
>> +
>> +void intel_pat_free_xe_cache(struct xe_device *xe_dev)
>> +{
>> +	if (!xe_dev->pat_cache)
>> +		return;
>> +
>> +	free(xe_dev->pat_cache);
>> +
>> +	xe_dev->pat_cache = NULL;
>> +}
>> +
>>  /*
>>   * Hardcoded PAT indices for Xe platforms, used as a fallback when the
>>   * kernel doesn't expose gt0/pat_sw_config in debugfs.
>> @@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>>  		struct xe_device *xe_dev = xe_device_get(fd);
>>  
>>  		if (xe_dev->pat_cache) {
>> -			*pat = *xe_dev->pat_cache;
>> +			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
>>  		} else if (xe_pat_fallback(fd, pat)) {
>>  			igt_info("PAT sw_config debugfs not available, "
>>  				 "using hardcoded fallback\n");
>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
>> index a31b60e86e2a..fc9ef9b650bf 100644
>> --- a/lib/intel_pat.h
>> +++ b/lib/intel_pat.h
>> @@ -13,6 +13,8 @@
>>  #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
>>  #define XE_PAT_MAX_ENTRIES 32
>>  
>> +struct xe_device;
>> +
>>  struct xe_pat_entry {
>>  	uint32_t pat;
>>  	bool rsvd;
>> @@ -40,4 +42,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd);
>>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>>  
>> +void intel_pat_build_xe_cache(struct xe_device *xe_dev);
>> +void intel_pat_free_xe_cache(struct xe_device *xe_dev);
>> +
>>  #endif /* INTEL_PAT_H */
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index ea095b207534..aa81db45a41a 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
>>  	free(xe_dev->mem_regions);
>>  	free(xe_dev->vram_size);
>>  	free(xe_dev->eu_stall);
>> -	free(xe_dev->pat_cache);
>>  
>> +	intel_pat_free_xe_cache(xe_dev);
>>  	xe_wa_free_cache(xe_dev);
>>  
>>  	free(xe_dev);
>> @@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
>>  	 * should be extended to cache PAT entries by platform version/
>>  	 * revision instead.
>>  	 */
>> -	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
>> -	igt_assert(xe_dev->pat_cache);
>> -	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
>> -		free(xe_dev->pat_cache);
>> -		xe_dev->pat_cache = NULL;
>> -	}
>> +	intel_pat_build_xe_cache(xe_dev);
>>  
>>  	/* We may get here from multiple threads, use first cached xe_dev */
>>  	pthread_mutex_lock(&cache.cache_mutex);
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index f70476945dee..82f72314f072 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -20,8 +20,6 @@
>>  #define XE_DEFAULT_ALIGNMENT           SZ_4K
>>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
>>  
>> -struct intel_pat_cache;
>> -
>>  struct xe_device {
>>  	/** @fd: xe fd */
>>  	int fd;
>> @@ -78,7 +76,7 @@ struct xe_device {
>>  	uint16_t dev_id;
>>  
>>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>> -	struct intel_pat_cache *pat_cache;
>> +	void *pat_cache;
>
> Is there a need to change this to a void pointer?  It seems like we can
> just leave this as-is and avoid the cast earlier.

The rationale here is that intel_pat is the only unit supposed to know
the details of the cached information, so I think it is best to make
this a void pointer to make it explicit and also to keep other units
from using it in the future without going through the proper functions
provided by intel_pat.

--
Gustavo Sousa

>
>
> Matt
>
>>  
>>  	/** @wa_cache: cached data for xe_wa() and related functions. */
>>  	void *wa_cache;
>> 
>> -- 
>> 2.55.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
