Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC66C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 18:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27AE10F792;
	Fri, 12 Apr 2024 18:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC2SnPnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511210F792
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712945796; x=1744481796;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T+YnUNxVRg0oltDNmlMTOapyTwEs16oH1+3oNOFb7AI=;
 b=MC2SnPnWsbO9rRFfK4GP3EfTngGKjmkvP001Ya8FkpUAzEjLIrnKRTaI
 btEvMACwRjVaMIkmfqGR2yoVCFgWb2dfc9DVNIYrGhh83H9gNAP1PFtaQ
 1AHkCBict2CF71yknI2DszUUEpJp5Py05eIHCx0VTYGww9ndVuW/csYXK
 xrSpWZ8sZbSwmgSONRw8cPFpFtnet93GRQjReeb1wo73RqOwZIQGrRhdQ
 yg6ixsN45r7Xp2tykQZYVzCWyhKxWoxk21x10CBinESFgzwK/LppE0PIO
 wuTq5rhqy9On5GsUuH7OGek6KdMZPzoMHBdIpFBop/cFfDCb3+SKt4fDP g==;
X-CSE-ConnectionGUID: VyIXU7beSomcqk9pPz9OjQ==
X-CSE-MsgGUID: 7cKVoQxYQ3WaS1IWx3Ousw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8629965"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8629965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:16:36 -0700
X-CSE-ConnectionGUID: vPu6rmFdTl+7TSb6FgxJ3A==
X-CSE-MsgGUID: hLwe8o11RvOeks1N4T3oXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21372815"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 11:16:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:16:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 11:16:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 11:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSPSe8TJht9x4Vxz07T+is/6T2KqNV/7QtV9+3Ecq3EdmBVK6OfJcW+w+I2H2cMOTfpmjJeT46jZG/yCLj4wbNJ3NsORKcW08Cvn3LAPOJDCYNLfBrdWA6A1u1QVRu1vhqkVaQ1MaqkSpdXEH9fJzN5iZsTaL6puvrtg0FeNBHWiDsxLd0PLC8VRIomULp2jL/gkeyT0T8/uv1qsFqjjWZYqzKf2Jn071LTBSB/Egm8QOD9/unYpsTiHfGuwED7eZ1Rgo52vodHCY1V47pyP0VS1VKYfbQJAaS7tKXpr9hmjYQST1LH1PE/OdLONV/LiVPppv1PKHVu5MSejzW2p5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i0NWI48UFLRhHGvOEiAQKQpLyL70tiieXS+wTa9Y2k=;
 b=iYCsQ7v+eouHQrrfz/PEhbSIBAIbpqtshHUcq0MHSQmyQWUSyMk2H35N/3d1xtANeAMofWklktihotgs1pzvaIfBqJDV/oRpm1vOvfHWVvwVmSMnHOMnE0SSdvvx3cpbDI9/6oDH2c9n6DIthbLD5GdNpLagID/i5F9Bey3HAMc4Ds7OwnqzKZiV6HgAeA2NLgS0dNZuWrmm4paWS60XFcVIeCuXq5Utyxr5XepW7RSkJ3XFk82wUfhiefoXDeAY34LrBmIWe7r58rzNtwGDbcSkCMBoHwRSpAzsG09Gtgk/iSvPxlFcDx37MEeizCSIdULOfMvNSzjV6peFR9j4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 12 Apr
 2024 18:16:32 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7430.045; Fri, 12 Apr 2024
 18:16:32 +0000
Message-ID: <ba59280e-905e-4622-bbac-0c55b4d9cd47@intel.com>
Date: Fri, 12 Apr 2024 11:16:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_vm: Always have at least 2 pages bound
 in munmap hammer sections
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240412041841.491326-1-matthew.brost@intel.com>
 <20240412041841.491326-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240412041841.491326-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 90643ea4-7c82-45d8-755d-08dc5b1cae1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3rC/AtWwi8uQ/RXZyBt4Vxd8ti9igHQI3jCd9mS+rqcOTiWxwIRW6KyKOVzT9EJJZPBiafSgZ86uRk9Rl1qd4D4zwDw8S7tNezAGs+z1+e6/XxblrwVH+Yhhj++iStgYp89X0fahUJoQbnnXCIrLOw34M7k6J5qWlT5peV5wBR3cQqykjQJ/AhidHBqPQlAyn3Ox1CfcgPwlIjPdB0Vxa5UHay9nn7lb1qbit5JomkaS0KN/kt3Or32vQ+VZ3yQU4wgLCjqQL0TZtj59TeHOdsTKM/ArPS3rGOxXSsK7sUkOe8VJWicsajEP/yMnyElXznnkQw+KDTOk7WKsL33whMxyeBy7pCDYhjMztfYJAglfEj3QXdvS756hRbb/gAOi0MwHM0zPhsiFD00rHg/hNUBubTUTItFXMKUpmUqgvfDBHobFe2eXo+32qmzid8BfVe8uoazOWaCyGd4AJaa0cClmo/yWh53UCqqbs3XOVGeT+WvBkEzsYS8ToYJUU3W/7lSl3Erwwngxr3n4d2HfwE6kSr/RkSGY3FwN/l72iyayuhCsZbQnNeT5XLagDrcszZXRjHotoXWVlR5+XpJhTDThObwJuE1pJrbVEJmBU/dReo247e9uBXou79j1Z4JOxm2+l7mALnnY3l5Nh8oGfBPysTviiSBvVg6Ks8OTGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1MwTWNieGJnbVZCWFpGZnQwT2tYbWNkR0FwTHp4djlCemthb09UMEN1QVha?=
 =?utf-8?B?dlZRMENtcFJoVFo4aTBlL0ttR1MrTnUxcXgwYloycjVkNVp6L0p6R3RCSXZO?=
 =?utf-8?B?bURWYVUzMnRsa2F1eTRoNlJMZE9kMU9udHZrZk9iU0NVQWxTMVdiM091Wmwv?=
 =?utf-8?B?bitMYWlqR2g0THBIUW9HUW8xajJjaWVrdnZjZVJPMDZXTGZBTStNNzNsK3JX?=
 =?utf-8?B?UnlERXM2Zy9YVGFnajBFR21LajhpR2lOUi9rMm1xSm9lQ2NxSVRCQ1krT0Nv?=
 =?utf-8?B?SFpxbHBUaWdOSTlFNUpjd3l4WFJDTjk1eC9KNVNBdHduRnIrOTZDMW9NME8y?=
 =?utf-8?B?LzVjbjAxSHhzUldFcXFsdnh4Z0ZKWDFxTUs1T3grUWNLY2NpdThBQUIvZ1hT?=
 =?utf-8?B?eCsvWkQwRGxMOG5Ua0FQRVpndHArZjRmNU9rN3NaSFlEdlJCN1F1OFJyNVV0?=
 =?utf-8?B?Q2k5WGFkZnFZVDN2Z1JOMHE1MExtVExGbVk5NEtWQWxJZWVhSjNVNmwrYXMz?=
 =?utf-8?B?cUFpQThHdkFGVWkrNktvaU82d3FsQnRVakwwRTZidW00SW9MVHEvc3lpRkpo?=
 =?utf-8?B?MmN6VWhGdjFPdlNQNWYyYms2ellQNjd4N3dGUmkxNGRydnBiZnpIMk5DeTBU?=
 =?utf-8?B?QkR4VFBUY1U4QWNRb3dIMzJlZ3lieDhDQkZWWHowVDBYc0tpanEvYlV3Yi91?=
 =?utf-8?B?R1YycGJMRTMwZXlTMW96anc0TDJqOXc0SVBKQmc4UDRZRVFFSmp4ZFV6bWRK?=
 =?utf-8?B?eC9ZNnl3VXAwRHRGNFo3eUxSY1p2NitrcklUeFVhRWVLdmR6M2RXNWhzcXR1?=
 =?utf-8?B?Tkd5QXAwbHVRV3ovVXpBSkVSWWkzNjB2c3FuVGV5clRXRFdMNlFydGt3Y094?=
 =?utf-8?B?K3Qxa0tVdDRFY3NGZ0pGOGNLL0diUndtZTYxYno5Z3FWVW5vTVk4cVd6U25p?=
 =?utf-8?B?T2tCY1NBL2F4VWgvSXU5ek1HR2k2T3JSd3Zldml3dTdKempCV3JZcENveFZN?=
 =?utf-8?B?SjJJRStQdEIyQ1E1Q2h3dS9VSHBSUS9abllXZFNSTnk3THprajBUOVZDS3pY?=
 =?utf-8?B?SS8xc3VwUEwyTElCWjVhVW5PYk0rNm1YdW10QWtjY0luLzRyY0pQcDQ1WVhM?=
 =?utf-8?B?OE83QmlYenN6Y3cxaWZLcFZUMmtVK2ZuYTY1ZmRJTjVaMDdFdDlsYVJMUUNr?=
 =?utf-8?B?bSsrTUpnZFBrZHdvMk5aaEZPMjNGNHFuWFc1dTl1QnpPV2NLeStjTjhBdjN6?=
 =?utf-8?B?Q1pqelhUd0txR3B6dmF3VDdpbjA5Q1VuOW1RSnFCMzlCUjAzUFFna1FNUmIy?=
 =?utf-8?B?SUVkUG1kMjlXS1I0S0d2TnY5MzVjTUZNNXBZMFJnem9HNDhCcjV2NHlmYzQy?=
 =?utf-8?B?VENYWi9ROGZJcUU3Y01DbG5JWVpoeXdERit2aW5UcU91b0tXMHMvbnRVdjhM?=
 =?utf-8?B?amQzMXpWc3ZWVEpmZTdBU2pvMUtoYjZTZjNkSmJOanJwdE9KVUNuUjd1Z1dh?=
 =?utf-8?B?OHhNZjhWa25XRW9zckxFVFIyVlp5TloxSFhHNEpCSHhadi9WTkt0amZqUXJD?=
 =?utf-8?B?VnVDaDMvcEJweXc4TlVWK29LTEp0NTZ3WEh6OXNDY2hoTjd2QkNzMWdTZ2Fo?=
 =?utf-8?B?Z2MzVVBWNEQrUXVJblkyTVZjWXlkbFk0SStjWCt4Mjk4bDZDZXVFUjR5RWxQ?=
 =?utf-8?B?M0p2S3J1cVp5N3VWVld1NENvY0ZJczdFUC9HekFZUzhrMkRFQU1EcngxTDBG?=
 =?utf-8?B?UlY4d1VpWmloL3B1UmRGU0VqcjlHbEJBMElqS2JicXgxS3ZBUHh3Skx2Q0tt?=
 =?utf-8?B?ZDlmWWkzL2ZjcDdaeDExVGQwNEZ3eFFlS0NjZWtEVWNzdE9YOGpCNGhkL3hS?=
 =?utf-8?B?RUc2SW1Pa25RNlJ1eitTdVVtVFlGT1R1U2F0SzdPU2VneGljSUJvZStRbSto?=
 =?utf-8?B?ay9HeFZpcmZ1aW92R3p1TFVwTmx4eVhKV3hTUEZjaGR6SWRkZFp2MUhSMFNM?=
 =?utf-8?B?SzlmZ21KTllMY2ZGaEJrRnphMHpjaFZyTE04WEQrS3RaaW5WMHJNOVNqN2xQ?=
 =?utf-8?B?UkdtR1AzaGNuVGxuTHhvaDJyS2dUUXpsVGY5OVVEVkp5OEVVblgrR29rTmwx?=
 =?utf-8?B?UCttR2tSdGNHZWNtYzYvNENJWW1QVjRmMDBnRmhLeDN0SFllczN1ZVhHQTRF?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90643ea4-7c82-45d8-755d-08dc5b1cae1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 18:16:31.9621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDavHEkX2UOuk4UszjUbni+5us/BSCf9I0fzd+NfUp1/oWjeZC8rooYC10U6gyRP2J0ew9JlueyhkOnOOq8/tLkZuUzTKdJOeWV6XG4PIoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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


On 4/11/2024 9:18 PM, Matthew Brost wrote:
> If the prefetch buffer is 2k or larger the munmap hammer sections will
> prefetch the next page, if the page is unbound a fault will occur.
> Account for larger prefetchs by always having at least 2 pages bound for
> the hammer thread.
>
> v2:
>   - Missed table entry
> v3:
>   - Don't modify mmap section (Jonathan)
>   - Add assert to ensure no prefetch overrun (Matt Auld)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_vm.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index bd4973cc38..13cca27520 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1263,6 +1263,11 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>   	int exit = 0;
>   	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
>   
> +	/* Ensure prefetch will not fetch an unmapped page */
> +	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
> +		igt_assert(unbind_n_page_offset * 0x1000 >
> +			   xe_cs_prefetch_size(fd));
> +
>   	if (flags & MAP_FLAG_LARGE_PAGE) {
>   		bo_n_pages *= n_page_per_2mb;
>   		unbind_n_pages *= n_page_per_2mb;
> @@ -1843,12 +1848,12 @@ igt_main
>   		{ "all", 4, 2, 0, 4, 0 },
>   		{ "one-partial", 4, 1, 1, 2, 0 },
>   		{ "either-side-partial", 4, 2, 1, 2, 0 },
> -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
> -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE },
> -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE |
>   			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> @@ -1857,7 +1862,7 @@ igt_main
>   		{ "front", 4, 2, 1, 3, 0 },
>   		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
>   		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
>   		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
>   		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
