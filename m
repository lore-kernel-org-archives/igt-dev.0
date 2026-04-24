Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51854FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C9E10E2E5;
	Fri, 24 Apr 2026 17:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jley3BXX";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012064.outbound.protection.outlook.com
 [40.93.195.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA6110E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 17:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl9yhg2+ZchUk5CszofkevGYpWPqd3CVsqnJqVhJ3V7ZSYsj1YVLzNN/4uvu/2/m4aaBqBH06Gzg056NvUDB5VHUbj/3ebQNWEvIByR0MIoRg6dzE0k8E+9ppt0oKhTifvvQrFsWpr8klopkuIeJCJagWic6w2ABJe193K9nJRJk0RIjmXxY4XLjqNHwO8OnblgR+riIgTBxfgCtZ9ug6qDQ0Z7mqNGT47FxYDjFFBKgbZtoFRekU+QhNGSVUEARSULzBbrv6gwAOvpYlIwUgC+PlqWFvsFA6XcMIqmOcHYgtv3qkYlsZDNOL+zdh90pcf7Oq7IKvzVSOFzZ+VaiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+hYsrKUcg/PAsn4AEUtdNZly+w8T+WxsybAJAPc4SE=;
 b=Xw8H1/MsVvh+tHzJn66pCxdxKU7TthiDDkE67tDX+SV9Yg2BwQU5yA2eQoTsFexYgXXRmt4gjmyIHjfl90m8HFaXzYZ8sGDAJAT5BNLdudLYNnFZExgJTEnS18QCaBBxN6SdZclIKL0S9Db7+qosV92sgcorLbNSRUsMxy5ET7uuKvIyaNN7N+kwXoe7jq4cV1Gie+5uvuzqfiN8bG3Cq3/FWa6qIcnNrlU/j6oxbbmK785wTMqWIXduvUrktT95/2tYg8Z4HooiPRZ+TjomMVdWmtV5zXqMvVKDrU2A2Ii6NduoLGV60nQGJM9Qk5RAg99qjo929p4obqXGO3JEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+hYsrKUcg/PAsn4AEUtdNZly+w8T+WxsybAJAPc4SE=;
 b=jley3BXX9H2UKcKPAQZWk62Sb+C0DPscKVRxDxyZNg4Gk5a3ppvloDzvdsWCqrjDyw790DBu8eLp+4u9DlHKFxnhZ3qKuANZCbebfHoRCY9/80Guiy12sEsZcbssH+7Cy5RTYvmeyoD8QwJ4ac33F80sF0NNxdHnnmutYC/MBSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 17:09:51 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:09:51 +0000
Message-ID: <724d7f4d-8510-4cb8-b95e-d8d92d34300a@amd.com>
Date: Fri, 24 Apr 2026 13:09:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: Add ASIC filtering system with family ranges
To: Jani Nikula <jani.nikula@intel.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>
References: <20260422041725.172582-1-vitaly.prosyak@amd.com>
 <4d020ccc16ddc6cc0d222a7366e4802af3bfcefa@intel.com>
 <558d511c-e72c-486c-8f87-9a720ed3ae13@amd.com>
 <5c99e331ee82b89449985c23ad0fd35b9fff2777@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <5c99e331ee82b89449985c23ad0fd35b9fff2777@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b9828e-f509-40ab-f9c2-08dea2244be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: KzPjpHPUxHGWmWazWrP6twMQP/R7YzE0xiB1oeElv9l90D/+emv9vzF3n8X/CfiMYcC3xAFu8urADE+xi+x1Ay1p7/mJg4wmhZaIoc/iW9BSq0WKs6a1lU3ohUoZeBgCVmSZ7C5y79o4FFj1GohY+V0WN43F+W3tZBHKwJZSkhuQjETl8KMH8XM4QfoENQen6kQHmfY65oBU+N0P2k7+i1hWfqqR17T79Kh7MchQF6Il79J/F8gwyhKGnHi1CUM6IbgQpADGZmNLQGPtkG7nIW9hhBNflS2fZQDq0Gj31XTrr4jUs/fWH/2Fm9bOaSFQ2GjJlXryj+Jg4uASl84u6jLXD1xHckND+Y/Xe+04SmzEptYZk5MRlohLQEXi3/EsgQ1bnbnUxSSP5SqhGpT/2a1v8JpEs19RrBlWfc7UbKRhUmWXpfw22tJLocloUzGOiCD7hoWUcw8EawH2ffK8WBKjvBZDFUPvKHzD5O53B+bA/b0CFxtGWkTxggxo9PbrhrLNSlpR9XVOs+x6TcIjsZyhucEbJgE3/bnJ6Oh3WjNyGLpaAyfBj5JbGkZKOFDlaOZmIBIPrAea0NdpjJXq70zr0QLoasQW5csObWS4fo0R1QohKOzz+v/guUbt9+7J6CF7n3v4Q190xm6XIb3FGm47jGx4vs9p2wXDHuKYjCLDIR/aiaIc4xwugs0HCnw7Y1ki7e1TNu58TnkOkk8QxUrSrPEysrI7+Z7ao8xyULg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpEdW9mMlhpUE1oeGZuOFU4RUlpY1VDZTB1NzNXalpoamNQaWRrai9Qcnkw?=
 =?utf-8?B?RVNXdTU5dW40TUVhamNlMmlCTUFDRVp4eWZHK3d2a09WL0dxM09wU0NxTHZu?=
 =?utf-8?B?NTlzdlU2YTZ2SnFSUis5c212a1JJUENKV0V3OWozZ0hQOFZmK1loNjFhR3dO?=
 =?utf-8?B?TE1KUlpiUXBZNFpjSUFRWFNkdVR5cENESW9QT2FSSG92U2xLMzJsdU1hdzVI?=
 =?utf-8?B?NnVmUWkvV05lYUVsaVBBa2ZQcGZPQXY1RGpiWVhwY1drK2lkajMzT2ZxQ1lm?=
 =?utf-8?B?dVc2ZWJsMjN6VXlZM1F3b1pFSUdDa2J4ZlR3QkNlajI5bzRXN3Q2TXhENGs3?=
 =?utf-8?B?Z0s3NUp0Q0laVndXSEYxQ0hESFU5T2hzNTNOK0RVWXdOcnhmK053bmpCandO?=
 =?utf-8?B?T08vQWJZa0g3bUUzUHlnRVg4c1dpMzlUVDdOUWc4ZTExNEo1WHV5a1BsdWlC?=
 =?utf-8?B?TzJMSU55Ukk3WW1zVVRDZEdObmFpSENyNkZOb3FjZkdhZXBER3hLYjdQYksv?=
 =?utf-8?B?OENwR2x4cnRkOXd1a0Vya0tWcENGdks0NVdvTHFRaEt5bnVqVlhoQk90bGF5?=
 =?utf-8?B?SUxZUnhTUHEvVHdTbEhiR3NlYTU3UVpuQ3h3TDZ6Mlo2eGlMTFBHci9rUWFV?=
 =?utf-8?B?Z3hLWDFXSUx3WGc2K2s4aXM2ODdPQUd5K1dZb2lyWjJHTHdKaHIzd0RaWmFS?=
 =?utf-8?B?dFlYNHZlRExkSU5QMDFiek5QdVZISXdmOVlQWnVaTlRFZ3Y1RVZrR0NtUGNK?=
 =?utf-8?B?YnZhQXBDenhxaitPMnNqQjFJMHRNWWJlaTlyWmZMVXlPRWk4RWZ0bnV0Q1dy?=
 =?utf-8?B?bkI4Z3dGSFo0WnZoY1hEWVZaS0gvd21rS1V6bXhyeEhXa093b2E2NGl6RHlN?=
 =?utf-8?B?K0RHMGIvbW1oQ2lOQ0tKTCt3U056Rjk4ckIzYnFGaDZlaUZHVW9Ka0RyMklW?=
 =?utf-8?B?TXdzREFZUGRDakFUaXQ1c1grakFtY3lrTHdyV2hDY29PZC9rTjhsL05MSW5r?=
 =?utf-8?B?L2Z5ZkpSdW0rOUJTQmMrTHU3OEw1OHUzYmhUOFBLNjJNbnNhdWUzNmRzMkZZ?=
 =?utf-8?B?WEhjUU4vZm5SYXMyNzZIdlRZRjhjc3l2WG1OTTkxKzN4SlM4K1JqOEFkN3VG?=
 =?utf-8?B?cnI1UktNaFc1Qk5iMStTYVJzd1dlVG9hc2JKb011SStJaTFRdy93aWJCLzFw?=
 =?utf-8?B?OUhVRFNJZjVxTzE1cHBTa2FGN1o0aStlV0FPN1BQMW85ckNXUDRSYTNZeGZj?=
 =?utf-8?B?ZUc1TFQyOEZPeG5vZkFEM3RZN0VtazZKYVkzalR0aERMKzJjV1N5TG4relE3?=
 =?utf-8?B?Q3kzQXF6VXhSaU9jTXpIc0l5WVRCQ09wY2hGbmxPZVFTd1Y4MG02RUcrTm1x?=
 =?utf-8?B?ZVhUSkZKSWVvUTVkRjR5QVNoRWl3VTlUWWtSOUM5QlV4M3BwWGVibXp0Uklj?=
 =?utf-8?B?MW90MkZsQ1dpUFVmZWRoQTN6TFo1Sy9meU9PTDFLcEFneU0reURJdlhUckR1?=
 =?utf-8?B?WG9OKzVDL1AvQ01vamFNNHcrY0x4ZGQ5ZHVsMGhjRzhUMS9pRE9TQkFKL3d6?=
 =?utf-8?B?eDVibHFXTVBUOTZGdnN4WXFub2ppQy9BRHVVU3dZUlZxb2RoUXNETXhIT21s?=
 =?utf-8?B?WHE0Q1EydUxFcVZSNGRkT3BhdUl6VlN6NjRibGpRdG5RcVF6a0lpa0JWMTI1?=
 =?utf-8?B?SFFmUzJEL0ZzZTgybUc1YkVuaWpHVnFHc3JKL2Q1RmVOTGlBdEg2QnVzRHhO?=
 =?utf-8?B?KzAvbFFoTlAvQkVMZGZWT1ZBQ1FITHUzZ3NNUENZb1lLU2gyWlRNMjVsU0Nv?=
 =?utf-8?B?a1Z1a2dzN20wYVkxOXovM0RxZXJQQk03VE5SWUVjVnBtZ0N3dlNTckhBWWI4?=
 =?utf-8?B?dTMvNm1QSnBuTHlJQU5NUzFsaGllSEQ3UjlXb2dvMUlncHZvM1IyeWh1eHJt?=
 =?utf-8?B?VjBuaEk1NUF2azlxaEZkYWtKNmhQQkhHUDhSREJPOEpHTmtzeXlDeVVjd0g5?=
 =?utf-8?B?WnBwQTM2R1Z5bko0L250TDVJU3F6cWZwU01OSjJuS3JCYnk3MXNrRFJsUXhY?=
 =?utf-8?B?OS9hNitYUUNqRHNwSTdJOFlwaDFFMFpxQlNnRk5HMVA1RVVVSGR6TnR2QmJ4?=
 =?utf-8?B?T2R5RlQrREVFeXo4YnNvMWIyeDM1QzMwWUZSQU9KRXVCbW5NT01LZE81NEgv?=
 =?utf-8?B?cXZmbkoxb3p6OGVoeUlBVGR4aERNLysyYzhVelhHeWJBQWtHOENqYzVkUjZk?=
 =?utf-8?B?K1ZxaUFMeEE4d1hRS0RMNzE0QkVYUmJ6OXI5V3RRQVRMV1A2dmlsbzE5NElx?=
 =?utf-8?B?TlpFM2dKT1ZOSDZIS1dzdDBRL2VaTEFERmdMNHpjYkpndW42Vmt6Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b9828e-f509-40ab-f9c2-08dea2244be9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 17:09:51.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsXITF+9hfqwUgOQoMs98RfcUVpeUEBhIgpo8bdfmj9cMten45rMJVj59lucb9jZeuxN/ZR25eGzQ7tjN73POQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451
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


On 2026-04-24 10:04, Jani Nikula wrote:
> On Wed, 22 Apr 2026, vitaly prosyak <vprosyak@amd.com> wrote:
>> On 2026-04-22 03:57, Jani Nikula wrote:
>>> On Wed, 22 Apr 2026, <vitaly.prosyak@amd.com> wrote:
>>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>
>>>> Add comprehensive ASIC-based test filtering system following IGT
>>>> coding standards with three-tier priority configuration.
>>> I would have expected an attempt to make an IGT shared filtering system
>>> generic enough to plug into any vendor's platforms, instead of going
>>> all-in on AMD only.
>>>
>>> That should be the mindset anyway, try to make it generic first. At the
>>> very least the commit message should explain why this is AMD specific,
>>> what it would take to make it generic, and "we didn't even think about
>>> it" is just not good enough.
>>>
>>> BR,
>>> Jani.
>>>
>>>
>> Hi Jani,
>>
>> Thanks for the feedback — that’s a fair point, and I agree with the general direction.
>>
>> My initial focus was to solve the immediate AMD CI problem (fragile user queue tests on specific ASICs), which is why the current implementation is AMD-specific and uses amdgpu_asic_addr.h definitions. That said, I do agree the right long-term approach is to make this generic at the IGT framework level.
>>
>> A couple of thoughts on that:
>>
>> The filtering mechanism itself can be fully generic, but the data (ASIC tables, ranges, identifiers) is inherently vendor-specific.
>> What I have in mind is:
>> A common IGT filtering framework (core logic)
>> Per-vendor backends/tables/configs (e.g., AMD, Intel, others)
>> Separate config sources per vendor (config file + env), while reusing the same infrastructure
>>
>> One key benefit of integrating this into IGT core is that we avoid having each test/subtest manually check whether it should run. Instead, the framework can centrally decide, which keeps tests cleaner and avoids duplicated logic.
>>
>> Regarding your suggestion, I think it makes sense to:
>>
>> Rework the patch with generic naming and structure
>> Clearly document:
>> why the current version is AMD-specific
>> what is required to generalize it
>> Keep AMD as the first implementation backend, but not hardcode the design around it
>>
>> My proposal would be:
>>
>> I update the patch in this direction (generic framework + AMD-specific backend)
>> We validate the approach in AMD CI for some time (since that’s where the need is immediate)
>> Then I follow up with results and iterate towards making it fully usable across IGT
>>
>> Does this approach sound reasonable?
>>
>> Appreciate your feedback — it definitely helps steer this in the right direction.
> I see that you're moving this to more generic direction, and already
> sent patches to that effect. Thanks for that, appreciated.
>
> That said, I'm afraid I don't have the bandwidth for detailed review of
> it. Please ping the IGT maintainers.
>
> BR,
> Jani.
>
>

Hi Jani,

Thanks for the quick follow-up and for taking a look — much appreciated.

Understood regarding bandwidth. I’ll reach out to the IGT maintainers for a more detailed review and continue iterating in the more generic direction as discussed.

Thanks again for the guidance, it’s been very helpful in shaping the approach.

BR,
Vitaly

>> BR,
>> Vitaly
>>>> Structure and Design:
>>>> - Uses family range arrays similar to amd_queue_reset.c
>>>> - Supports up to 4 ASIC ranges per skip rule
>>>> - Intensive use of amdgpu_asic_addr.h definitions (FAMILY_*, AMDGPU_*_RANGE)
>>>> - No global variables - all state in struct asic_filter_context
>>>> - Read-only static const tables (asic_table, builtin_skip_table)
>>>>
>>>> Three-Tier Priority System:
>>>> 1. Built-in production array (checked first, requires rebuild)
>>>> 2. Config file /etc/igt/asic_skip.conf (development, no rebuild)
>>>> 3. Environment variable IGT_ASIC_SKIP_CONFIG (runtime, no rebuild)
>>>>
>>>> Features:
>>>> - Family range structure: {family_id, chip_id_min, chip_id_max}
>>>> - Glob pattern matching for subtests (fnmatch)
>>>> - Comprehensive deployment guide in source code
>>>> - 10 commented examples in builtin_skip_table[]
>>>> - Complete family & range documentation
>>>> - Dump functionality showing all three sources
>>>>
>>>> Documentation in Source:
>>>> - 5-step deployment guide
>>>> - Family & range reference (9 families, 18 ranges)
>>>> - Glob patterns guide
>>>> - 10 ready-to-use examples
>>>>
>>>> Files Added:
>>>> - lib/amdgpu/amd_asic_filter.h - API and structures
>>>> - lib/amdgpu/amd_asic_filter.c - Full implementation with guide
>>>>
>>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>>> Signed-off Vitaly Prosyak <vitaly.prosyak@amd.com>
