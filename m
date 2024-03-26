Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822BEC54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 05:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2072610EBD4;
	Tue, 26 Mar 2024 05:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+GNY+wL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAE510EBD4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 05:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711430973; x=1742966973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TsxPKBeCGBx/NOJqI5dGG4zp5Hfh98JHDZ7KwRecnKA=;
 b=O+GNY+wLXQI+ErjxrIVf7YcD1kSRAP77BCxQcw1ZZ+i2pHGNS5UF8fxy
 4yKI74zB5vtAO/HlfuWKF7LAKb+GwFdt45TLYQcUGI0WDGu3pWsEuJbdE
 u/Nr4gQRouLEfUruuJWO+O98KTXfiX00DyKq519Rj8NjOt3pEOFofykkx
 OG73WOYBWWuVoUeF6BGMiJ1O+IodYhWstUxvXgq1UyR7cSWpmyUrpLB9l
 kj+8InC8tBax/jW/94cueyf08kXYsnhM8e/2MJKENVqvr4djjC8I10z/E
 3hU0Bo3oGFnC9Q4UiIPuSu8YGWL6+n52r/MQmwy0MCG3WAWYZ3cYok8An w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6327667"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6327667"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="53311476"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 22:29:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 22:29:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 22:29:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 22:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk4ipV+AeONOgexVGfqKmRepXj/9Voa8hJ5FzPME7n+NdN81+O2C5NnY5bEfgPs4c7eJ+0Yp6mAn+xYXpJ3p8Agic8mvOkfb0zlexdwN9XQh3L4a0JgrobsuzeSdYhFVi1YH6a0S0Cz1vNbqMTbp7oqJKDuib93lmeU6MKRaaHXY5qJiytFkWxUGw/ZRg40eWBh6krxjQubKkeXJNLlFBJEudTSYoS5O4VOeZlf4VT/qdHajC3YIoQkJfxoD2e1Z8NutOG0kSwnVYzchb0ZmF3bBqJVDPHiBCQ5Z70B+TmtLFMK7R3jG5VTZ40f9eLoPLvPBC/qXU8i8KOlvoPpxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe1NHbpQW3msv5ZAIjQO2hgzwUVvwi5sd8fzh1jEuJ4=;
 b=PjbtOWGP6n3S+6we7U1w4E/qfEooNrfwDUlt4yO5X0y/X+eTdQ5QppphVZWR6xpyiIGZW9x23Zor0SXcy1gdV23u32PTmf3BLaHKm88xjBnR5GD5kUM3cRducAjHkyzLFGQiPFblHu6QaYhsnlOCU08lFAvvtlBjRQGiIc/KjFaM/ZE+6YfNJ2uXndd59op5LR/h7ybZl1JZGNbMhhK0xZz3wYwA5kSAPdM/LnT3W/TdAfI1zrmJzO5Oyl7q1BuOSgSGUBQd2YxlcQ4nQKr3l+gLnHUEAVocDGzsO0KpeWSrVnA3wArWXXzEbdKRUVCU8FpOmopzGh0vg/aODtDHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 05:29:29 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 05:29:28 +0000
Message-ID: <3b2f7338-195e-4410-b662-290550587a3b@intel.com>
Date: Mon, 25 Mar 2024 22:29:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] drm-uapi/xe_drm: Read flat ccs value from
 drm_xe_query_config
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
 <64b587ec51ad3f803ec51afc32f894f05761aadd.1711444735.git.akshata.jahagirdar@intel.com>
 <20240326051937.d62ix7ni6sbbdbjx@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240326051937.d62ix7ni6sbbdbjx@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:303:b9::35) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|DM4PR11MB6065:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GS4YKwapubK79NTAajnP6ffHODFT6Xi0tuESvgV0Hsigyi7LGwNC8eLJvz5UZCy8v01ggAdP3Ihuozt29zeCpzVj0/mDgpSdmtKE2rapcV+Br9+wL8ICQBhHBfS6ogwaJgCOULZpl32LlNcQARbrV8C6liri1x5aEZz/+Jn2IBwTzdSuH6ufifu/wWPu3c+9ZJRMrs5az6dCJRy9HoTHCQBcCYA7yGAhgzV7Cf5ZI7t1ymdf4dCg9eLRluuPt6u/E5/b7YPqCwFZZ3rzIfYZ7BFYI2CT58capGm3xnTiaJqsgkahfR66ysQhKDx2sYulVfoeJzhbihpYBfSHiOPf40tldEmgqZo2BRuIlW7Ul+fju5d92OZtXURtj1ijpHQvwWz3GwpGSMnjVzVhfYLBmGYjKCYKppBtFO8Qh6d33QhPDzc+aNb1KM1muKACnLriJyNaZjcVRDzCxri2iLK9fL+LbBLM1tVttdPlnsoo7MbeToQIf2ouZ7l+GMkrbtmo/OATIdHT6Kgt7ORQHc9jgkCM7x1HpfZ1YQ8dN3COem4yIlDHNa8fi7IBD+J8x5Yb8JVOEuSkZw9bloWRjDDzXCB833OxpkDkZnCGd/ZYBw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmR3WW1GdzdlK21YVXhoOXJpMzFFSEhRdk5GM2IxRzFvNjBtbWt5U1FoUHpH?=
 =?utf-8?B?ZnpBUWU2Z2xqbXdxTzV0REgrWXFiTDZ1ekZ5aktXeTBvMzBIdXpiOXl6Tng1?=
 =?utf-8?B?NW1EZ0xHQWwxUkpWWGdtMlhTSWxTUG4xZ1gzK25YRUd6R1hPMXNQWHNqN0Zs?=
 =?utf-8?B?Zi9QVkdJK0R6ZVVIVzRzMFpWMEhCNjRSOXBUaHJvUnJmV2NCSzJDeTRPOHN6?=
 =?utf-8?B?Q053LzFteUFtc3hzblpGRFNLYzBoVFFyL3UrNVdKVHlDcmRJNTlGMDFKNnZR?=
 =?utf-8?B?MThOYTBXZU1nakU5STVWY2wvOGQ3OWwwcHVRZUpIdFYxQXpqeGt5MTBTcDcr?=
 =?utf-8?B?T0dvdjV5UVVyTmhHMVJlVmV1RkU4L2wvQWQ1OVl4NFlqcThMdDYzM3FRT0Q1?=
 =?utf-8?B?REFNd0VEaWNweHVHR0RIOFB6Y3g0YzZNOEQ1K2hEdXVHT1B5YzBHZDB3ODln?=
 =?utf-8?B?RGdMdzkyb3VnYVRnT1ZnMFh4K0pkWEQzYU9US1MvTTJCblVJQ1pKRHF6d3c4?=
 =?utf-8?B?bk03LytpWEtnOEVUWWVDQVZ2enpwQW1hME1EWmMreVlJdzV2V21CanlHYzNn?=
 =?utf-8?B?V3Y3WVZVSzF0ajhzeVF2WjA5ZmhhM0M1WmhXbGlGRUpIYzZmNHNxNng1aGVT?=
 =?utf-8?B?OVg2elc0d2ZQTGgrYnRBbDJnWWx0S3BjTWNqV000ZlU0V0JXNm9LaHExN2Uz?=
 =?utf-8?B?dnZEVExFNnF6aDFFNGxwVDlNbFYwbFlZYkZnU21tdHU4ajB3QWh1eFMxcjNW?=
 =?utf-8?B?TDhTOUpZOXlCVVNJOVdDbU5qUkxVWDk1WUoxZzJXdG8zMU8wQnIwTFIvblJ2?=
 =?utf-8?B?a3o1ME12Q1crdjUyQ0JncHhYTjZoUXc0MFZ6ZG1Ga2YyRWJHTnFKY3o4VDcv?=
 =?utf-8?B?WjVnZHVOa0FZclNpVWxSeHJ1WExNalR5TnZqb1NLcjB0ODZ5SnVrSFRTWm5I?=
 =?utf-8?B?RTBBbXUrb0lDeGMzZW5CS3JXZ1h1OUQvZmFHVHJiOXhiYm9OeEpiZ0twb3N4?=
 =?utf-8?B?ZThaYmYraVZPY2lPdmFmNTJHSk1yYzlnL2Z3NThJMG4xQ1E1SzVQZkFDZWJh?=
 =?utf-8?B?NjBiKzRZQTJoOVZ2NUxvTU95ZFJBUHNSRDVmdmFDdDFrVlhDNU1qa09XOG9m?=
 =?utf-8?B?N0IxdW5jUGdYK2o2Vkh3b2RPM1NtMGlEYmJmSkZudFAramhyd3NRL2t4VVpT?=
 =?utf-8?B?dU02UHFSVXpXdEdxMUVjamN0SHA1aEdGQ04zUjdmckxQWUlVbkJTR3VpS29t?=
 =?utf-8?B?TUhuWEgyUWFLQ3ZLL1czUDZLaXJ3bzFURVpkS28vRjhYNmhIRDFnZ1E3Rzgz?=
 =?utf-8?B?bmtTQ3FIZjRoNktHTDNDUWVROUJDU1FnSnVVRGQwV2grb0N1cTFQSG10bnFk?=
 =?utf-8?B?MVhWNzRaS0lLdGxJd1FxeTNHcXAvbENNNzcvN2MzYVRuYVVlZ0t0UERlZUcw?=
 =?utf-8?B?RHVaVTFIN1lJalRNSm04K2ZLRDZ4UXdXUFRlT0UzL0syWU1hMmd4OTJmY2lD?=
 =?utf-8?B?Vmk1eDJ1U0FtdmxOOGZCam10bm95VzRzZVUyb2tIbjRqZ3pjU2h4dUJyeUpt?=
 =?utf-8?B?Uk10ajlMeU5JZlpxdE16UUhQTzVSd25md3ZnMnQwY0dDZkQzbUJxZGsreDND?=
 =?utf-8?B?dUo3a2x5MHJwTWdSM1dKenNNcVRBdCttWUxQa2U2emxGTDFTaWhWWXJyRHFM?=
 =?utf-8?B?ZW9Dc3NuVjVKQ054WWpETG44Z1lybStTbkI5eU9aVitmazc2Y3JGSVZaNDlF?=
 =?utf-8?B?ajVJTWV3eU1lbkJwd3hDWUdBZVA3YWhZRkhaTFY0OW9pMk9vN2hOUnlYNjFa?=
 =?utf-8?B?dGJjbGN3NHlmVGgrMkM1QUkvTEZFNDlWUmNHQVdaVDNaV3JlL0JFOVR6c1dT?=
 =?utf-8?B?ZjZ2YXp2Sml0R1ZVc2ZYWUlxWGJ6Qm9zcXN6UDBBS1lsQUIwRys5eDVrVXlp?=
 =?utf-8?B?T0xVSHNYUDlHL1BmSzhNM2tHb3dSUkFqeUJpT2owdzFxWWlQWjJzOWZOMWRx?=
 =?utf-8?B?RFFrTW9VbmxhWFREbnY2NWxjejhiZHVXdkhqZzZSVG5mUmJYNzFHRkIrMzQr?=
 =?utf-8?B?dVJlN1BlWXVybmp1bzVPeFhBbEoyRGtCR0lSMGVWWEI2VDU2RFMxQytHZTU0?=
 =?utf-8?B?T3pKenYxUTNkMjA3M1Z3ZkZ2KzhhNzdyOEZBQ3pBSjVPV3grMlN0aEJzekZn?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e2eac5-5732-4721-e86c-08dc4d55b500
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 05:29:28.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYC+1+Q1QouM66YbQEXUu8OtfjAxLqF+Eescwo7zLOAPEtcCpp+BQbWj4c6cZ0c2FFgDOm0XNs08cff++TyH3OooOy3uZhFh1n/ZiGQRXXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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


On 3/25/2024 10:19 PM, Zbigniew Kempczyński wrote:
> On Tue, Mar 26, 2024 at 02:54:36AM -0700, Akshata Jahagirdar wrote:
>> Add an additional drm_xe_query_config_flag for reading the value
>> of flat_ccs of the platform.
>> This can be used in respective igt testcases.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   include/drm-uapi/xe_drm.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 4353595a4..b43c8cf76 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
>>    *
>>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>    *      has usable VRAM
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS - Flag is set if the device
>> + *      has flat ccs enabled
>>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>    *    required by this device, typically SZ_4K or SZ_64K
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> @@ -405,6 +407,7 @@ struct drm_xe_query_config {
>>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
> May you point me out which kernel patch includes this flag into
> xe_query.c?
>
> --
> Zbigniew

https://patchwork.freedesktop.org/series/131609/

-- Akshata

>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> -- 
>> 2.34.1
>>
