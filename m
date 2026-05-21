Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9DBCD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 15:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7010E1A1;
	Thu, 21 May 2026 15:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCljevUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB7B10E1A1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779378780; x=1810914780;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kjTPUDNa0EyXIwCc6DfLVemi4sLXYi0GfZ3is9rxoR8=;
 b=SCljevUvf8uUJuNF9vjvn92QDCmMTvSdAbAYR3yWgTmT6b9iD8rUwZSl
 0FfLFekQ6BM9l7G40LsJ3bRyiW2wdwoB58/6OV7RYenNwPZXJizT8vo2P
 u2T8kl6mybKfgU+It1GqnEO2g6hCVnhnL0dWr3cGfes5YH8kRnVNXB+8Z
 psI1vE8HpuC0gtWwKkqveoA6CL4flpI0bjfJsed4r27Ska4NAtjUFdtlY
 sRA7fv096cI/MGKXgQLK2deAolAi4aAwcBiU9qw4NlGyTZ5B23QOuYgtt
 c+1xF99Gxlbrbz7sxgQkv7OOhBD2y/Z8AZLxjGRq3ChifVy5HxThIvVmf g==;
X-CSE-ConnectionGUID: Fve/TkIvSiShtJ4DP+JUEA==
X-CSE-MsgGUID: tdTgPnNnQ4mPUFoenWjolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90991334"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="90991334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 08:52:55 -0700
X-CSE-ConnectionGUID: p7h69z63Rv+RmQ6HOlu5WQ==
X-CSE-MsgGUID: 6hmO7EkzRxar1c6EwD9v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="245602572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 08:52:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 08:52:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 08:52:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 08:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFNH30LRDwPrMVyfICAGrMStun4dJVObkv5QlYUuHxqBtGl1z/J3o7T6GuCe+ZTaT28V7n0QbAryTIkisDbEue4wPpZ+7IFiqoGQ9dSf6+vJbQliYJ+LtGkfFLcWozXtARcNNt6tQ87oSr1MTmMduhxkDk5K1L81ib68MlbD/lZay8apE7hmJdmhoIWCHZ84Xwjg5EVPiZKQr9hCxlfaXyhyAeYGab+AAKt3x3XRPhb/XZKKhcoNXzGor7GJghDn5z1sG2DbN0bU/mZADFmhO/CjDR9i//IP5woh+D1H6ZTxT4wtfkqUv2gGA12qFvXwOKfkIRXM2+Fw/aLQLOexRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VODJPCxBI87ELSCcqyQwyxrkMrSOZa+ElNmcc+OweY=;
 b=SHw33cTanuAA9fnyb+UuknvGarCrjpixitO5R1VHd0z5f9RUs0UGF9G2r/5y0ak1keToV+vgePPXDKMshxEQmm0bhakvIzxJt6n2Q6jbsiaA/UmtMZcORq0NJgf/8oTiDQERlQ7W2j0us5dnX97M/Q+Q0N9M+nUAHHUSacv0k6Q58X0GTAq274tkE3/3qHS9o4JhQAfaCVgi7z8ON7YUK5dF/U0Wco1EmQSN3yMdyOki+AE+FjZXaon1dkIDwQdXCP70QVeiQODJGd2xYMfj52LsfXtbm2bAQK34FJ8FMUYrpG39Umc09UWq/j7gOKCCZlw4/NhslzqvHrxS5WawKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by EAYPR11MB9970.namprd11.prod.outlook.com (2603:10b6:303:2d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 15:52:52 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 15:52:51 +0000
Message-ID: <e0dd9bd9-180f-408e-999f-d35a2d278ab4@intel.com>
Date: Thu, 21 May 2026 21:22:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260512024712.176696-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260512024712.176696-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0346.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::7) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|EAYPR11MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: c4451386-0242-45ab-4e5f-08deb7510227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Sq5Iv0ECFmdbt92t6S9oMhakOYqn2lRXo/VN8Oo1YwSLcn980iGaazVD7vkPUJ0jH5mNz4xUb1cNZo8DnGk7fiY+ek/UPnxvUh42GLfIfh1GNSkdY4L96dksQfyrGUvY5u3Qt+0Jfb9XEs19Z/yHCpFd7tQyuHe2bE43is2sv+OvjZGv40JpsC+LstZFyZQ+BI2VDEmcFIwGjN0FNVeHfcQEHjzyCWsfd5SDS9m7EatgMS6jVKhTrA8Od4Y6OY7Ustmu0QaAHQQ6cjmpg4q5cJM1SQ7MqjInK0+VMOIbnaPZTN82+TK+E3+tK6t9HUMH9KqAx0n2f/QvCF4nOcgEJ7GzsLdWmJMESibpLqZ0+02435jjjwlmK1yOe9x36xPTIrn9Lnhdq3T7gaKsvNVgCFeUN+rZRqRV+Jq8Og1t/bvCaWKYUKFca9dAAMpeNcp4GG0N0uS7m1EyoJN4svNDSCH6+cOBEWN6Ohk667CH0m793vufHqwcbVkdE8DLOiiA7Xs1AAf/147M70A9tKwrCNY9SeKVyGSMB8EIJ/tD4bCd3+uxMlwcZSGCnSlkgjnjq10rEbBqs0y9pZUj0D6Y/aOfAfoF2eSHkbalwhMmnOST0kFZmEk30mw29emCB7zoAzi3QLins1xD8kkg5d0SrVoQhwi3V3e6EIGdH7AkDnsJXBIeudItvX96/7XsZOiy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJxOE53WWdiak9ZY2JER2pVazUzdEhhOWlmWTYxVDVyZWtlUHZnNTBEQkVV?=
 =?utf-8?B?RGdFdlBVcFN5WUM2SDJJTFR6WW1kUC9Oc1B5YjUrTVc5UzE2bWtUY0ZRNEV5?=
 =?utf-8?B?emxjWmE3ZzBZOEgwWVNBQnU3VVhNdG1UZkgvOGdGN2tDc3ZiUDVNM25ib1Ru?=
 =?utf-8?B?THBFTDJNeDJZRldLc2czNUNrRlUzMkVSYkZxQkxIY3dIUzlacHFwRFJrMlZl?=
 =?utf-8?B?YksyTU55TXhwUTg1QUFVSElSR2RsZHR1KzV5YnVyM21Ga09Fa2Y3LzFraVNU?=
 =?utf-8?B?a2hOeFRVNml6bjltZ2Nha3NQUTBnSGE1RENtQ1RFaGpyYTBTNitneTIzZThF?=
 =?utf-8?B?endJanpKNDNHcGpXdUxyT0xNV3R3MWpHbmszQjdhc2VzY2JJcjVCc1FXWkpN?=
 =?utf-8?B?NHEyNzZmL3BoRC9RUjYvREpHT0wvN0VONHF0K1g3SGRxenZ2L0lPeWVrSE5i?=
 =?utf-8?B?a040WlptcitUTmM3Q0Vsbk9CTy9zaXlRUzZ3ZkJEaWkyR1U1dmdJc3EzZ1o4?=
 =?utf-8?B?d3ZCeWxuQm1lRmhSOTRUUGkrTXlXbkFrSVZMKy80eE1kYitTNTV4TEh3aGxD?=
 =?utf-8?B?S3h5UVZZOCtrbzdGVW0rUlE5N2srMTdEeDhVNWxwYnh5dzF4YzRtSVpweHpx?=
 =?utf-8?B?Vm95anhOOUNOa1JvOWg2U010enRJYXZVa3EvS2xreS9jdTFkSjJKaEsrc20v?=
 =?utf-8?B?RFpEeUNEQ3A2NTVWVXhkQXVYeVlLU3pYZ21GOXBVeGNSdys3bGYvTmxNWmJh?=
 =?utf-8?B?b1JPaFg4elh3cituY1pHVEUyUUxKY01Sdkh1ZXRKbHd2eFRYMVZlRDlWYjRj?=
 =?utf-8?B?T1pGR0E2d1lXcW4wNDlHMXBjeHZTd1VKMDJlOXkwb1ZiZnhPTk41WCs5Wkg2?=
 =?utf-8?B?Z3N6cTY5OUhHSmtyc0xGSnRFZFFacUM0SWtkS1BJbUE5bkNXRFRYd0JUakds?=
 =?utf-8?B?NkoyOWF5Q3FVWDVQZHp1UlZpalpSdDhQUHBERVp3SlJhem9zNkhzVXh3T01v?=
 =?utf-8?B?VDN1MzJieE5qNExSb1N6RCtmWmJNSEZCeU9ZYmJmSHJIUWxGdHdLdGN5VUcx?=
 =?utf-8?B?bFV6TExvTXVnOEJ4enZmdkV2K1p5Wk1uQjdNL2xieDBkUUpRZkU3R2RvRmo0?=
 =?utf-8?B?MndBcDl1WXNNTm9aV2JYcGpiZlQ1VEZNWDkwSmI0SVZJcGZrbkxpWlJHMUVH?=
 =?utf-8?B?VnVhVjBDY2g5RUdoeTBmbmY0c1pXQUhvQndMV2NSUVRHc2UzQXNpQlJGZUJ6?=
 =?utf-8?B?RFhhME11TGJDV1AyVUFSMTY0QWIzTUtZaTRndzRrQ3JrMlp3d1g0ek92aDJP?=
 =?utf-8?B?L1FLbzU4Z05RaXZwak5SZFpFcGE1WFd0RjF2RVBSSlprV2hHc1hYd3Y0ekln?=
 =?utf-8?B?VjRUcS9SRTFKbjBoQ1hIS1pISWtCZjAyQVpRcGI3aTZjSGJmZzJmN3RzWHhT?=
 =?utf-8?B?SURxRXRUM1ZIVkJvUGNsakpSQS83MXR0Z0xFRS9yUWhQaTJkd3AzU1BxTXB4?=
 =?utf-8?B?cXcvZjhXalZIYkVvemUwRm1XWE1nRXV6V0FNRVRBd3RyVWxaVXdMQVlqTnU1?=
 =?utf-8?B?N0NxeFpmNUJ6TXEwbTBxZ0F4OUh4NjY2SmErZWUrbmRvYVdhcGhqNWFxeUhl?=
 =?utf-8?B?Nnp1R3Z5eTlsMi92V0U1NTQxdThHdHo3ekZoYUF2TGJ5ck5nNi9ka3FlM2pD?=
 =?utf-8?B?Q3pOV0xlcnA0Z21Kc25WS3M2WUxtdVUreGhnSGVjaEMwTTlSUzJ3bkJRejdj?=
 =?utf-8?B?NUR6dk1qQ2V5YXNRd3FKclpwK3VLbk1NTzFaTkJSTEZ5L0piL3J5bFF0Tkhr?=
 =?utf-8?B?RENuYVVNV0UrTU1BMUdXUnhobUlLYXZvdjl4K0xVcEZPUEVPMng4Smh2S2JP?=
 =?utf-8?B?VmRTcERBZGx3WjNFbjNKK1c0aHM5U2hmc3lCVmFJc3E1MnlUL0U2MWR5QWFW?=
 =?utf-8?B?ZG9Ib3dlUWI3emU4WUg1SkkwZFBnWGJkdEowU010Nm5QRWhYZ25ydEdQb0RS?=
 =?utf-8?B?elZ3RG5YUE16N1FTUlh6eU80QjFZOTIzMjFpMyt0bnlKS1V6MUFscHptRW91?=
 =?utf-8?B?TzBoVk5OTS9BMVpHbWtoNGRMbnp5UDFlMFZFYW5XUk5qdmUrQThPdG5IYWJN?=
 =?utf-8?B?NzREeU5oa3Z0NWxQS3o5dDJqREJsOXRRZFREY0RCdmczZzh6OWp3eGh3ZCtv?=
 =?utf-8?B?RW5kNTFsNkFoam1yWFJLWjFwakZqdnhLM3lmYy90bGRwU2ZFTWZFMDQ5UnVv?=
 =?utf-8?B?NWttMHNLKzR4cEFBdEZtYUtTU0cxcVUvTXVFQy9DKzVNQjZhVFpzMHdEelhx?=
 =?utf-8?B?aXZpWVRWVTJkT3JjVmxBelVubi9TWVdGOWpUQXVQdWVVQnY0NnR6Zz09?=
X-Exchange-RoutingPolicyChecked: CtNPOb9Wxatecyu1Ek+W897W6padun+XmtzWet8mFduvuUqx+dHscv4BKrY/He9+ajhlfo38sgBsUt3gRwi+ldRm+QCrjIdSrK5CITSvGAxzwF0KQLeRNX2KlPKdXAgQTaiDtrVn3tNnIqAvMC84KECOclez/essDzVjVsnKyGVTWpTuGl0SS7mEuHGCbLj7oKVAgmAIUZ8/clCoxXENLuWNHV9YYuFYIqTd1X4Uc3k0ac0qZUtJwdSokv14bXOKMz8FT/foQEwF7XdmLZNn7LHVGZlZ41OQQ7m4PvT9PnLr+GS3VnWAQmLjo2U2u3hM8lFXYABgeUMrvPvrHwvb/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4451386-0242-45ab-4e5f-08deb7510227
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:52:51.3107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoxA4xrWKb78jNFMliGH6RGsUcfxd87c5HgNJKaCGdjncB4gvNttfWzna8o+NKYpV7nFqKcSXnEQA3uXmN4FTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9970
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


On 5/12/2026 8:17 AM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
>
> v3: Refactored code to smaller functions.
>      Added check for available SRAM usage and keep the max process to 20.
>
> v4: Remove explicit macros definition
>      Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>      Fix xe_exec_with_retry (Thomas)
>      Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>      Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>      detection, since igt_ioctl returns -1 on failure. (Thomas)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 401 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 401 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 408bfdb71..9fa551e48 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,7 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   
>   enum overcommit_stage {
>   	EXPECT_NONE,
> @@ -29,6 +30,69 @@ enum overcommit_stage {
>   	EXPECT_EXEC,
>   };
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = { 0 };
> +
> +	/* Use first available engine */
> +	xe_for_each_engine(fd, hwe) {
> +		eci = *hwe;
> +		break;
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op binds[size];
> +	int i;
> +
> +	ufence = calloc(1, sizeof(uint64_t));
> +	igt_assert(ufence);
> +	*ufence = 0;
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +		.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	xe_vm_bind_array(fd, ctx->vm_id, 0, binds, size, &bind_sync, 1);
> +	return ufence;
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -3073,6 +3137,338 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	uint64_t tmp_addr;
> +	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +
> +	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (int i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct mem_bind_sync *bind,
> +			    uint32_t  placement, uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	uint32_t ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			if (errno == ENOMEM || errno == ENOSPC) {

_xe_bo_create_caching calling __xe_bo_create() which is calling 
igt_ioctl() and returning err which can be -1 for fail or 0 for pass but

it's not setting errno which you are checking in your code so this 
condition will never be checked. Either you need to add err = -errno in 
library

or need to use related function for BO creation which is setting or 
returning errno.

> +				bind->n_bufs = i;
> +				igt_debug("%s allocation failed at buffer %d\n", mem_type, i);
> +				break;
> +			}

__xe_bo_create() fail for any iteration without ENOMEM/ENOSPC, we need 
to handle that also. Like your first 3 xe_bo_create() passes, 4th 
iteration fails without ENOMEM/ENOSPC

but 5th iteration you get ENOMEM/ENOSPC

> +			igt_assert_eq(ret, 0);
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		int random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		igt_debug("%d", random_int);
> +		if (i + 1 != ints_to_add)
> +			igt_debug(" + ");
> +		else
> +			igt_debug(" = ");
> +	}
> +	igt_debug("%d\n", expected_result);
> +	return expected_result;
> +}
> +
> +/*
> + * In concurrent VM bind stress tests, multiple threads simultaneously bind
> + * buffers to GPU virtual address space and submit batch operations. This
> + * creates significant GPU memory pressure where the kernel may transiently
> + * fail batch submission when:
> + *   - GPU page tables are being updated across multiple bindings
> + *   - GPU memory is fragmented across many concurrent buffer mappings
> + *   - Multiple processes compete for finite GPU resources
> + *
> + * Without retries, transient ENOMEM/ENOSPC failures cause false test failures.
> + * Retrying lets us distinguish temporary resource exhaustion from actual
> + * driver bugs. Non ENOMEM/ENOSPC errors still fail immediately and are properly
> + * reported with full errno context for debugging.
> + */
> +static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
> +{
> +	int rc = 0, retries;
> +
> +	for (retries = 1; retries < max_retries; retries++) {
> +		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
> +
> +		if (!(rc && (errno == ENOMEM || errno == ENOSPC)))
> +			break;
> +
> +		usleep(100 * retries);
> +		if (retries == 0)
retries is starting from 1 and will never met retries == 0 so it's a 
dead code
> +			igt_warn("got %s, retrying\n", strerror(errno));
> +	}
> +
> +	if (retries == max_retries)
> +		igt_warn("gave up after %d retries\n", retries);
> +
> +	if (rc)
> +		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +
> +	return rc;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->n_bufs)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->n_bufs)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	#define MIN_BUFS_PER_PROC 2
> +	#define MAX_THREADS 20
> +	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
> +	uint32_t max_by_mem;
> +	uint64_t total_vram_demand = 0;
> +	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	uint64_t target_vram = vram_size * 2;      /* 2 of VRAM */
> +	uint64_t target_sram = sram_avail * 50 / 100;  /* 50% system RAM */
> +
> +	int total_vram_bufs = target_vram / GB(1);
> +	int total_sram_bufs = target_sram / GB(1);
> +
> +	/* determine concurrency from memory pressure */
> +
> +	pthread_barrier_t *barrier;
> +	pthread_barrierattr_t attr;
> +
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +	n_proc = min_t(uint32_t, max_by_mem, MAX_THREADS);
> +	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	n_vram_bufs = max(2, total_vram_bufs / n_proc);
> +	n_sram_bufs = max(2, total_sram_bufs / n_proc);
> +	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  vram_size >> 20, sram_avail >> 20);
> +
> +	igt_debug(" n_proc = %d\n", n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
> +		  n_vram_bufs, n_sram_bufs);
> +
> +	barrier = mmap(NULL, sizeof(pthread_barrier_t),
> +		       PROT_READ | PROT_WRITE,
> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(barrier != MAP_FAILED);
> +	pthread_barrierattr_init(&attr);
> +	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(barrier, &attr, n_proc);
> +
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = 0x40000000;
> +		int expected_result = 0, ints_to_add = 4;
> +		int max_retries = 1024;
> +		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +
> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
> +		srand(child);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		create_exec_queue(fd, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = n_sram_bufs;
> +
> +		create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
> +		create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
> +
> +		pthread_barrier_wait(barrier);
> +
> +		if (vram_bind.n_bufs)
> +			vram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, vram_bufs,
> +								  vram_bind.n_bufs);
> +
> +		if (sram_bind.n_bufs)
> +			sram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, sram_bufs,
> +								  sram_bind.n_bufs);

if vram_bind.nbufs and sram_bind.n_bufs = 0 then also below code will be 
executed and we are checking over subscription

and it'll silently pass. Test should be skipped if nbufs above are 0

if (!vram_bind.n_bufs && !sram_bind.n_bufs)
     igt_skip("No BOs allocated; VRAM/SRAM unavailable, skipping\n");

> +
> +		integers_bo.size = ALIGN(sizeof(int) * ints_to_add, 4096);
> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +		integers_bo.addr = 0x100000;
> +
> +		expected_result = fill_random_integers(&integers_bo, ints_to_add);
> +		igt_debug("%d\n", expected_result);
> +
> +		result_bo.size = ALIGN(sizeof(int), 4096);
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +
> +		batch_bo.size = 4096;
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, ints_to_add);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		/* Wait for large bind operations to complete before binding small BOs */
> +		if (vram_bind.n_bufs)
> +			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
> +		if (sram_bind.n_bufs)
> +			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
> +
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +
> +		ufence_bo.size = 4096;
> +		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
> +							system_memory(fd), 0,
> +							DRM_XE_GEM_CPU_CACHING_WB);
> +		ufence_bo.ptr = (int *)xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
> +		ufence_bo.addr = 0x400000;
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = 1,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = xe_exec_with_retry(fd, &exec, max_retries);
> +		igt_assert_eq(rc, 0);
> +		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, INT64_MAX);
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
missing igt_assert(map != MAP_FAILED); If it fails below will get crash.
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
> +		cleanup_bo_resources(fd, &ufence_bo);
> +		cleanup_bo_resources(fd, &result_bo);
> +		cleanup_bo_resources(fd, &batch_bo);
> +		cleanup_bo_resources(fd, &integers_bo);
> +		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +	pthread_barrier_destroy(barrier);
> +	pthread_barrierattr_destroy(&attr);
> +	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -3486,6 +3882,11 @@ int igt_main()
>   		igt_assert(xe_visible_vram_size(fd, 0));
>   		test_oom(fd);
>   	}
> +	igt_subtest("oversubscribe-concurrent-bind")
> +	{
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd);
> +	}
>   
>   	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
>   		igt_subtest_f("vm-get-property-%s", f->name)
