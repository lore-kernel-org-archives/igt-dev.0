Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6D9C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E12710E52F;
	Fri, 29 Mar 2024 05:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIf2wy52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281110E52F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711689494; x=1743225494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q/SXoeuJsSjZFv7sMWyqDHXpvgBX8Y/qEcXmLSxzVGA=;
 b=MIf2wy52MCMgIhLSDPwz8HqO72Zbi3nkUs/v5I0qiofWsv7wchG1NKd6
 t18eXY0XETeuEU6yHqPJzrDX+T8bj7u6zQJzgF3QOJO6hpAjwhcePjJ8Y
 hrRR4RljOz57xnJtXBZzkX2d28TzZlsdFHttIXlrVwbuxl2xQGHswfd5H
 IX8hhbjMYN8kD8jNXT5Lrmo0WEbGhujulJ7gdFJuTTr4HXP8AZRqEgw8r
 Rbk18UHsJVfCJitLe/fA5D1B/xxLo0Nj2oyDRVP88AByF8zEZFxYvPNxW
 ezwpMS4ktwjgZcDhRozIVJ5iT7ET9GTCOb0Kn/o5gK0kFnKhK/8nhKA+2 Q==;
X-CSE-ConnectionGUID: WFmqe7onTwWjn4M8sF15YA==
X-CSE-MsgGUID: EywNFVCSQGet7giL6OIWLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6730974"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6730974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16756603"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 22:18:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:18:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 22:18:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 22:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oH+pnr+7yAOyFutNuJUV8MorZlCASHN6uaHxO7uHfUFklgk6z4TLhM8xbmkSpxnp0oSVY8nqy9XZSoN5g94w2PlxkxRyD/pP4dojfnaHKl1BoeCcAuiZe7Wj+fkqsiraTyUIvY4wlKFznPgeVQYHb0EHHss0J03hv1McONzCSDzkCvZUQzG0qoqZ2nFAOvSWXy1lIXA5VEwyepfAM4a+brXUnYOb90z2TWfbYWc+gQwZTeZfGo5FmzKmeCjQwXMO14lQmI/mn6Ny/9w99nxEugLZazvhaXU8w5MT6/Zv3KnTAJxdWe07pWQExDCtVzMhNsGEES005Tv5CSytLjG9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a2AwEfbMV+L9DUIqQuaKtT3CUqHFqIwqXN73F5ZV9c=;
 b=DCK02eouNaj5/5Gfaigwvw8kY7CChi4nF36WcPKG+oVhS4SFH6XaKfmnKsf6Ua1eEHh3cR6ERLp16BlRvDcPEkFIdLOnvh2xadBOjrBbj3EKjru/GIpVLNjQm0ZzBqlHaB/Bzd7LaQE6CWsRQvvYQ/LEv2fK7/Wz9byCUJAm2KYJRMM3PV+KBWxLJ7rsFH0eukv4Qe9WBLy1MlnRU+Zdgn06U7VaMyH1VhRGU1Xuj+Yy2rnXAencMc6s/dt/OIMHuXeKWd/nIdkKV2l3pjx4AzStAPQCI3Mfb7ik1fnolxmwS8IIuNYImYtKMaMg9hYRMWJmbIoPNvX7h8v4ktslWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH7PR11MB7985.namprd11.prod.outlook.com (2603:10b6:510:240::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 05:18:09 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 05:18:09 +0000
Message-ID: <07a3ac74-53a5-4f84-b4a2-b449b7da3802@intel.com>
Date: Thu, 28 Mar 2024 22:18:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/xe_ccs: Update compression in config
 based on platform
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
 <cb8e514071a09bbcf1492005daaf53083616b1a9.1711729400.git.akshata.jahagirdar@intel.com>
 <20240329050515.q4tqnnxj45onvsgd@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240329050515.q4tqnnxj45onvsgd@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH7PR11MB7985:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfBPQYSZNwLuliSIJmVAkQhXXD+XbyaQ4NFUhtXJrBqNfnhHv5UBWvIdhhP0VlYCunsZE1YQmUYp9rD9UJ28ch3VQALhZMQt3zpCt0SgDmx+a1WC3leRRHdbvf7GcIp79QQXywKdJeTUS3P/i5tuelxTWZ/QvNlRlfMF/BGzOgbDrjoh75A6/yqU56VZ7goAc0DbzG0MIMVe+cYbrMXU66PsyFx4GvEJrwBPpm1JVxN9sE09bDc55xxhmyemAWXK8AnW4Jh+Gx0eFALiVLLl9ge6KtQwC6gHSJ3uDRqG86kaTNVOsjRVvAKeAS/PhcKWv54K2gyVxZfBP0CxREybW1gmUxzvHhmFnD2lSorSCc8P++bAGE4aeeKS+KxqAIysDIFOg3QzhK/li0gRNYNhA/Wr/mFRKnFs261eEZxnP5yzH+viY+cwZ7oUWimEAuGQhDBnjIePuZUD6++c5NlZZKMnBb5xJIlcoxLVuRcr3XB/YgiOkVH5rDq8GzUNbBgW6xp3KZoGj43/S+xxIioTVNWUJ0+jRceO0HpHqsb76los63yJ1gD3MfKDQu23T17KdIHvc9IwzoR23xKykA7hkzN9vzjdIpMIQ7H5i7BNPZiZM8GKqXtxr99it51gVRl0X6XcLIXfgs9cV6XRaor/mbgjja61enqjoBtq5JrVtK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHkzekpNQy9FeEF2NTg0bkNPVDVIUEhyMUxhM3dZVTE2VkNQVVVuQmRlT3pS?=
 =?utf-8?B?YVhRWTZhaHNNMnRiVDBpWWljQzMyMVJoYUQ2cHhCT3BnR3k2a2Uwa1kyeGJh?=
 =?utf-8?B?SDVoM2I1TWl1RWtSV3AzM3FiTC9VUnlBQ2ExekZpWWlVdE9vZFEvVTA5b3hE?=
 =?utf-8?B?TGZPQysweHREUldaT3RXU0RreU9BcFJYaUhvcytRS1lTM2Z1THJLMDN4dk8w?=
 =?utf-8?B?RjNreVRjdnFBWVk1TlByT0MvWGRwZithVkpaNGtGWlZJaUNzV1JqVnI5YUpQ?=
 =?utf-8?B?NTZVQTl3Zm1pcDJEdUxONzhtcmJ0Uk9uNDA2UUxUNkYwbkpUTUlXcG41TmVp?=
 =?utf-8?B?bThEQXBrYlB1ZHo3VHFvOHI2V2Z3c2xjc1hPMGNlMzhDQWZBeGVVVWcvNEJt?=
 =?utf-8?B?dFBuQnIydkZNS09ZbVJFczRHQnVyajFUeEszV0dlVGNtV3hTT3U3T2o1d2hB?=
 =?utf-8?B?QlExNE1BNjhybGVVcTdaaGhzSEhwcE9ERmk0b3Z0UWpmV0J1TElNVmtRR3pN?=
 =?utf-8?B?SkFzOHN0TUsyM241c0lmRW9xUGk2OU42ekxiTEdORlZhanJrSzdtYnZtSDY4?=
 =?utf-8?B?MFpycTRlUkd5N2RyaWFMNUZwalVxRVc5RW5UZ3NEbDdkTkpGb2Yvenh6T3Aw?=
 =?utf-8?B?aE5EaTNuQURuNFhQM3FJRkttdmtIdm9jU2hJZUpaQzA1NkN3NGRrU3FtUDFu?=
 =?utf-8?B?TlZjMllob2ZhMy82d1QzTWJmakRvVkYyVitzRVNmc3REeGtxOERrUGg0bFBy?=
 =?utf-8?B?RU0rMXdUTFlyaFlyWGg1ZkFZZ0RNZXdneUxwa2hLakNZcEQ2bmdRd1ZoRjM1?=
 =?utf-8?B?T2xCMUhNWVBjWjlQbmY1RVBXcmc0UmVoNHRobnFxOXZHbG9uNFpJVXUrblBS?=
 =?utf-8?B?UlI4RlVBNUljaGRBWVFVVGlYT2xFYnQyRDhVS0NhODl4QzRycUVSQVRJZHRj?=
 =?utf-8?B?QXc1S3ZjLzh4alJ4a25NdDlSSmtjU3dXaHN5dVgxNVdaWktHMkozL3lReTVt?=
 =?utf-8?B?T2RNT1ZnZ1l0bDFhTmY0S294MnhGbGJPQnFzSkRGRXBuSm9MbWYva0xEQWlH?=
 =?utf-8?B?T3FxN09aRmpWZ014b1paRXdHUlVlVEtVUU5pMVRJOUU3UU9Od1RaWW95Njhy?=
 =?utf-8?B?UFI1aVREMXdoK3hSTDNQbXlZVkFDdTFYL2lXQXJxV0w4REo3Y2N2cFgzOElk?=
 =?utf-8?B?TU9sVkNEVzlzSWJGamJmY3RScVNMWWkrazRmcWlwNEJucXdyNE5MbFhmckpJ?=
 =?utf-8?B?TzB1M25Wd3hhOGRLWmpGY2pheFg1ZDhTaTFENDlCTGhMK2dzL1FjTjBUMFJy?=
 =?utf-8?B?NlB6V245RlozT2x5b2d3bUR2QzM2QXNoWVo0OTlrWG9JbWRaUThXQjk0bUJ5?=
 =?utf-8?B?YWZhdERKV0YvSDRROHdNdjREaGgzUGVwZmVtRUYzSHVUemV0L0JEWFdMRzVX?=
 =?utf-8?B?eXkxcmhoS2RGVUsrcjlnZzZSalJXYWV3NTA4cjkvRFlBRUFCekhrOEw2RXZ4?=
 =?utf-8?B?K0ZpWVZpLy9Xa2kxV0dpVXE4a2lMSWY2S3JTR2Njb3ROdm52MjlnSTlQRDcw?=
 =?utf-8?B?VVZNa1ErSU9iWSt1Vnk3aU0rSWN2RnFyeTZTcUtJekV2SE5sZ3o3ZTVZbkVy?=
 =?utf-8?B?Mjh6NUZRL0grSXhaajNaSmRLRkVYbDZkYmExU1B3ZVBOQnA4ZmRubUhtZDZH?=
 =?utf-8?B?b1NNN1AxOVlyUG1NWE1NTGFuUndsZDRPaG04U29MeklYV1VvMFdja0pCdzN5?=
 =?utf-8?B?U3E3Tzc2ZUoyRTRJcWd6ak9EWlJEMEd4cXVsdlVHQ21Nemc5NVBDb1d6dHVL?=
 =?utf-8?B?NlpteUovNzdPOHJBL2F2cVB1NzMrR0k1eFpLMklBWXRaclRiTHRUNkpFeHhM?=
 =?utf-8?B?a3B0MURMT2dHQnJaOGp5blJmMkNLM2E5YnVNb3ZXazU0MHJiWFNwcDJNNGpy?=
 =?utf-8?B?K3pqY3dMT3gxclhYNXc1aGE1bVNycXZzdzBCRk4rZTZ6ZmxTUmF2eC9oaThh?=
 =?utf-8?B?am5lbTRzdEwxZXlmcGQrZTJLVXBvMzFDN1ZvNVR3dWwxVUZjazhWS0ZqQSsv?=
 =?utf-8?B?TWdlUGd5OXQvd2R3NUlGNHc1bUZwZDNiclVvZlNzdGdYcGoySHJFcUM3TGJ4?=
 =?utf-8?B?NDZJQ29Tb2M2cGE5M1I1bFBqTTZ3QmU1ckRvcnZrblp5OXRNbnNqdkdiSUQx?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a3b1c3-f720-4568-da09-08dc4faf9f88
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 05:18:09.4929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mSD4kFQx+lvMETY7hiY6tmMSgmbvCV6vnFyh8c2U36UCD5l5KyFZKZ3tgjBp5+uGj70yrAWrTh/dhuSs4CHgVZplSosMsnllceisE0pLXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7985
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


On 3/28/2024 10:05 PM, Zbigniew Kempczyński wrote:
> On Fri, Mar 29, 2024 at 09:30:13AM -0700, Akshata Jahagirdar wrote:
>> In Xe2+ platforms, we need to run this test regardless of the status of
>> flat-ccs. The entore flow of the test should work even in case of flat-ccs
>> disabled, Everything should "just work".
>> Check if the platform supports compression and has flat ccs enabled, before
>> the execution if this test, and if it doesn't, then update to compression
>> disabled and proceed with the test.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index ad2eeb259..9f427e730 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -116,7 +116,6 @@ static void surf_copy(int xe,
>>   	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
>>   	int result;
>>   
>> -	igt_assert(mid->compression);
>>   	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
>>   		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>>   		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>> @@ -193,7 +192,8 @@ static void surf_copy(int xe,
>>   	intel_ctx_xe_sync(ctx, true);
>>   	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>>   	result = memcmp(src->ptr, dst->ptr, src->size);
>> -	igt_assert(result != 0);
>> +	if(mid->compression)
>> +		igt_assert(result != 0);
> I'm working on a patch which extract ccs data from the surface and
> verifies it is containing non-zero data in case of compression enabled.
> I'm going to send it today, so along with your 1/2 patch we'll fix
> flat-ccs issue when it is disabled in BIOS.
>
> --
> Zbigniew
I see. That would be great. I will send the revised 1/2 patch soon.
-- Akshata
>>   
>>   	/* retrieve back ccs */
>>   	memcpy(ccsmap, ccscopy, ccssize);
>> @@ -747,6 +747,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   	igt_subtest_with_dynamic("block-copy-compressed") {
>>   		struct test_config config = { .compression = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>>   	}
>>   
>> @@ -756,6 +759,10 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   					      .width_increment = 15,
>>   					      .width_steps = 512 };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>> +		igt_info("p1: config.compression:%d\n",config.compression);
>>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>>   	}
>>   
>> @@ -763,6 +770,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   	igt_subtest_with_dynamic("block-multicopy-compressed") {
>>   		struct test_config config = { .compression = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>>   	}
>>   
>> @@ -771,6 +781,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   		struct test_config config = { .compression = true,
>>   					      .inplace = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>>   	}
>>   
>> @@ -779,6 +792,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   		struct test_config config = { .compression = true,
>>   					      .surfcopy = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>>   	}
>>   
>> @@ -789,6 +805,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   					      .surfcopy = true,
>>   					      .new_ctx = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>>   	}
>>   
>> @@ -798,6 +817,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   					      .surfcopy = true,
>>   					      .suspend_resume = true };
>>   
>> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
>> +			config.compression = false;
>> +
>>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>>   	}
>>   
>> -- 
>> 2.34.1
>>
