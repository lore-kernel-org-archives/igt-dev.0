Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D2C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 03:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05BC10F761;
	Wed, 27 Mar 2024 03:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p+t8zUCK";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2122.outbound.protection.outlook.com [40.107.220.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15F10F762
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 03:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzeNJh2dZpyUamIYGVZxjsK9Gb94NJgDluBhZeGorcai7GdUVxpWeiUSlypq1/7/0kFTGqzreF/f3uv60FGDuWR8vNFK9+5gcKoneTEzND0M7CtvtZ5QHKx3Q/9DqCrTM0B5AKiuDdyH2G5+8R8oHpCBcmumYjvnzQBr58ekyU7DH44a1xl42c6f2uiNrLAiUmtG5PAMs7yoHF2Zj9ttfApJ2mzXq2uOZoCpnQzaLM8mHURaO67TN1B5A9b2CI9gPRVQiXvDZIiW50w3zmEvhHs9h+8eSZBRm31OgYT1dtBIIfQbYxi2G6NhRADOOSkDW+2ZNGxQqnwHPPDRfOhVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxOI+SslcHW4R2UbVRp+gPBVDczehruoI8JbeGeHpbY=;
 b=JWrTGqtVp27jsnGnWdfi87okOTRGTO4mX8CiF13IO4Qum3sQAo4qYO0Qtc/+kap5ye/uJcWWHHlWCzMX6D9gpfyaCrgJ2QIC/uyZL/E0xq93S5vQDPCrIsl+DpzuU8gYy27Bva/VGVx4UgBIMmbAOYs1C3VMXtSPt08NlCBPTHFz2JAKQ9eebz/IG0fpXD9NjoXt6Ld+YjPbHTvV2RJgvLSlxr6beAVOl79JhJZVKz9H2OqEI+ssUxsK6bVdCBrz40wNJqIBJ19BOeDN55+nXet8GOgO8rtGyy/7jAs1WEyQNidjUFhQMeuuysW5D/noS+rpnlRxceXZfJaMu0E0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxOI+SslcHW4R2UbVRp+gPBVDczehruoI8JbeGeHpbY=;
 b=p+t8zUCK/LgF+UUTcd5Bq7w2L6JEz+qase17//pwF3ACSjVCJOjGsReSWv1hwUQJDRCxKjtWbFdph1UvQzQRl3KjIeWwMFk8FWu/qX8Oxt6deRCSx5PA/2iM0NaP/Bdal80MvDmfnu8dySESpLQmqe2U2/ffZRpkNE8t9w+RH5A=
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 03:30:02 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5%5]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 03:30:02 +0000
Message-ID: <f534e42b-c412-4527-8ca7-cbfd4229be33@amd.com>
Date: Tue, 26 Mar 2024 23:29:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240326023440.2460660-1-jesse.zhang@amd.com>
 <20240326111902.rj37niyehgeolj5a@kamilkon-desk.igk.intel.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240326111902.rj37niyehgeolj5a@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0317.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|LV8PR12MB9333:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KE3rgf7B3dDxTAf1CROgIKZPLysL71zcdbGDDIlJ/0wLqu9mhHgNJusJQo71BkBNPv15CA3PIRrRoK/c034rul+fjXE//ROmroiROxkkMo8rJjrUdSI/qqDZcuzx1He5CYJ3cSsZpRb6qFUevJaN4l6qrRptcKRpZ0gaiNc98ktZMeRzjV6bLDHkw5gkOlKp5WWJ1Den9Ko+UZ3OWVX8j5STlCg029ZCWDmr0wAjJMuzctsuoCaZVZlVDMkguF0GcBWGk/cF46mb7mBlPwZ2ZyQfRqNmqVDaOQLyLK1s7XDNBgmSWYvq8XlXxE+zULJd5Yat9Q6vzqleRQqSbaiflJ/5Pu+OXPTv6oZfpAvaMUocZZBrGfm2QnIMbL/ewEnJWMIRh8pks+dE0qPGs3bOrfnV06f9XXxhhyDajaMalm3Ke5jPO/l1T2VkhtZphQ0P5yDLgs4DnFgwOrzxnG9h3iK5MY7YOO9KriU+7hS2CmhHiN9sFFvFu2THfB2e/JlTI5ylNJ02YBf0hBrNRj/WaoWslnHMBYkKYAmmGKKeJxI4kMG7BvBw5jn8qT/1FuiNIZCIStXXRFJMHKSTWMfMElejruyFPRPrxdHB09nKSSF4g3g9ux/BSpUwEbEjzropTyIPstZYyDocOUTzibNNwJLpy8AErw2jJkhDKlNyaCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pOeWtyQnVpUXJTeVVoZ2RteTZpdUVNS1R5RnI5MVFKQ1FPaVUwUW1lUHRJ?=
 =?utf-8?B?Q00zVkZabWRwMlNXMFlZdjRVVUdCcG5jTXdld0JxRjNiR3Z1bVZBekhKZWtz?=
 =?utf-8?B?a3p1Q3VPWTUwMlF5dUR1clYwZkpNSG91eWh0YnhQSXpZVHUxYWdBZHF5UU1K?=
 =?utf-8?B?cUY3T3EwTVJ0Z0F0SWNNNlJuU3JZbWFiMERydDg2Vnh2K0xJWENIUmZZSGZw?=
 =?utf-8?B?OHdSd01pdGwyTTBCcFNVYmgxbXVnamlUbVlYNVlnSnFmTWJkYWY2UEdFT2R0?=
 =?utf-8?B?TzQ1TEorNWErTVpmS2Jod0dMRnh4QXJ4YmNJMUw5QmhvM2tXS3daR1hGQWNj?=
 =?utf-8?B?bVI2VG50MnpHbTFOeEZrNG5DaFRGZUhickNsZHIxQUtEU1VPTDNCUEpETFBS?=
 =?utf-8?B?bVEyK0ZJRlo0SkEySHI4Tityc3BhMXJKNURSTTJsMVNwc3N4QlpKRU5odGZz?=
 =?utf-8?B?c0tiZ240aTZneWdIRlhTR2dUYUhRc3JGZGlmdEhXOE9pUVd4bzlzTGhqRzJx?=
 =?utf-8?B?b3hIbHY0cHhJUmdFU3UxQ2R1aE1HOWJyRlRMSXhyS00rNGczK2NYVzJKVzQx?=
 =?utf-8?B?bXdHT1JaYkp1cjJ3NzArR08vNkg5VGNDY1JqRVFBcyszVkZueVNieEt0MU8y?=
 =?utf-8?B?N3g4dERIOEVCOTFHTHRPd0s5TXFBQnJUbWUwVUcvZi9JY0NHNHhIRURPRVk4?=
 =?utf-8?B?ZExYdlJXcEdjekNoR0NpMGJmSTl2dGJKdWx0d2FlcVl0T2FuRFFESitQYURO?=
 =?utf-8?B?cW5CSW0wMTVVWEdrYVhrb1pMS3cvN3BNSkZNamxRUG5JTTlkOVF3NkU1aGtj?=
 =?utf-8?B?L3FxTWtnWWZUV2J0eU9Gc1JVdGxINXl2TnFOS2p5QXYyWmpGK2JXd3ZLV0tj?=
 =?utf-8?B?RlFFUUNlS09YWkpsWWc5N3JmOElaMWIvUXREME1aM1g3TFEyWmp2ZGtQeUdM?=
 =?utf-8?B?U0NENkVQcXZLdGxNcXdMVGlpNU80MFI1UnI0SXZ0aU04RWpqWjBsUHgvRFJt?=
 =?utf-8?B?MXoyVmRLMjJtOWRtNVhVcFFHdFhDQ2YxVCtoZENsYTJMSk8yaU1sdWRuZzA5?=
 =?utf-8?B?R3dhamcza0dBLzhaKys4VVhxa0twSi9tVXpQeFRNTmprVi92cnJuWHp1VzZs?=
 =?utf-8?B?aXplb0FkaS9zdVlhTk1Ma1dmb1RDdC9CSWxMNTFwQmJoNGZ2dEYxZEYybnZF?=
 =?utf-8?B?Um82TmpkT05MNEgrZ2M2SHZ3VXpSTDZ4S2R4bDAxbFJNclJkcEw1MzFhZ0s1?=
 =?utf-8?B?d25jUU44Y1dqSkMxL0h0U2JldTFFNDhORnRZL1VzWEJyQU05dVhxLzR5SnQ0?=
 =?utf-8?B?Q09tNGdRczJBTXF0ck02Yy9pOEV3TDc5N0pZQUlaOXVkQVR4RUViUXF5Z1Ry?=
 =?utf-8?B?eWVsQTdpRG9OS2NFTUtmNEFVdmVXWTVwdkdIaDhrTkM2VGNMczM1Sjk5bjZ4?=
 =?utf-8?B?a3pxbHVCakcra2dFT2VKK3VQSzkyRWllcDV0VTRRYlNJRkhJWXNvSHNuYmxj?=
 =?utf-8?B?eFpsNWJMU09Odk9pS0dZMW5SYWdDRzhBSTlBcG9pZ2MvVmphZGNoU0NDTWoy?=
 =?utf-8?B?amQxeTRJT2ZSTy9tRHZ4TFFpR2FLclQvY2NSNmhQVnlWbnJkcnhJbXJ6cUp3?=
 =?utf-8?B?MUhYQ0ZoM0Y3ZTBxeTJyTjVoQ2xnaDZtamtUbktwR3NLNldQeEgyTkhqMTBN?=
 =?utf-8?B?TnJWK0VUcllmdnJkejZ0SUh6UytyRlIxNi84aWE4NFUxZzdsQUpPRnhueitV?=
 =?utf-8?B?QWNYU3JyKzI2ZkdRaHlrY0dZUnJraXVIOVNSYU1MZlBKUmpOOEpGc0E0VHBy?=
 =?utf-8?B?NHRVUENZUHNaa0MrWFg3dW9SVU84NlR4ZDlIZ0xodW8xei9ocHlma21xc0Iz?=
 =?utf-8?B?NDJvMEVnUkRpM25ZSTFYLzZXeW9nTjJZcmlZb0hRYzRpK3M4WE9TbC9zZEVN?=
 =?utf-8?B?b2JkQzRrMWxTNzhiMTd1VkU1RjMyV1FDZHVxTTFEblBlT2lvKzZIMlQ5REFO?=
 =?utf-8?B?dzlRbWMwSWlHVVZiNU9HSXlWcUdxWndCSkdMWjZmNDRaVkZJWllNamNkWmIz?=
 =?utf-8?B?Nyt2WkRhNEl3R2N1dmtvdk5pY0RrR3pVT2Z6UDBDcFN1QnNlRk1MYkpTQjF6?=
 =?utf-8?Q?58Zh0Q03Q3bLJeQTt/An6JrKl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9a76a5-7e85-423d-3911-08dc4e0e2fdb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 03:30:02.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIhz8OHiWBSvjU/fyAfqiKHtJQphT9XV08AVA7sSX3kZGs1sUlWibJxXlrqZSKReDSxAHTeui4y4f4BU0blITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333
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

Thanks a lot, Kamil, for merging this change and making the appropriate necessary corrections!

Regards, Vitaly

On 2024-03-26 07:19, Kamil Konieczny wrote:
> Hi Jesse,
> On 2024-03-26 at 10:34:40 +0800, Jesse Zhang wrote:
>
> small nit to subject, please add space after ':', see
>
> [PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
> --------------------------------^
>
> This should be
>
> tests/amd_basic: fix eviction test failure
>
> Btw this can be done during merge.
>
> Regards,
> Kamil
>
>> Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
>> Fail error: "Starting subtest: eviction-test-with-IP-DMA
>> Starting dynamic subtest: eviction_test
>> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
>> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
>> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
>> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
>> Dynamic subtest eviction_test failed.
>>
>> There is a case where the system size and gtt memory are smaller.
>> When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
>> Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.
>>
>> V3: Provided an example in the code of exactly the numeric number (Vitaly)
>>     Remove the space and empty line (Kamil)
>>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>> ---
>>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>> index 70e45649d..8819b9cd4 100644
>> --- a/tests/amdgpu/amd_basic.c
>> +++ b/tests/amdgpu/amd_basic.c
>> @@ -358,6 +358,20 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>>  				   0, &vram_info);
>>  	igt_assert_eq(r, 0);
>>  
>> +	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
>> +				   0, &gtt_info);
>> +	igt_assert_eq(r, 0);
>> +
>> +	/* For smaller gtt memory sizes, reduce gtt usage on initialization
>> +	 * to satisfy eviction vram requirements. Example:
>> +	 * gtt_info.heap_size 3036569600, gtt_info.max_allocation 2114244608  gtt_info.heap_usage 12845056
>> +	 * gtt_info.heap_size 2895 mb, gtt_info.max_allocation 2016 mb gtt_info.heap_usage 12 mb
>> +	 * vram_info.heap_size 2114244608, vram_info.max_allocation 2114244608 vram_info.heap_usage 26951680
>> +	 * vram_info.heap_size 2016 mb, vram_info.max_allocation 2016 mb vram_info.heap_usage 25 mb
>> +	 */
>> +	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
>> +		gtt_info.max_allocation /=3;
>> +
>>  	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
>>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
>>  	igt_assert_eq(r, 0);
>> @@ -365,10 +379,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
>>  	igt_assert_eq(r, 0);
>>  
>> -	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
>> -				   0, &gtt_info);
>> -	igt_assert_eq(r, 0);
>> -
>>  	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
>>  				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
>>  	igt_assert_eq(r, 0);
>> -- 
>> 2.25.1
>>
