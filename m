Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79996F9EDE8
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 14:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A97189C69;
	Wed, 22 Apr 2026 14:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p5cTHsR7";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9646B89C69
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 14:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plTQYEIfc66/OP8SSYg64JpKH26z47Gyi5qeRAXINRZPe+iOSpDXt3UyxzosWS2yEjL4TfqkUSodbIMaMTRwkbvm41IZLtA+IlOzipRt1NDgQQXdZNjE9WrCTUjzoMSKBzXpJEuh0XNiNKOWqGP6qUyM9M3Qo1m4dIfwq3XwJ643hLDy+Yaot3SDmug6kOWa4ER6A3D8QNTlQoKlYqR5V3FXUCHy22tbFdmCEkhKRCaRtfqhstvgeuYdAu4BOWgqCDHrPcJRjyPNEYo6sWmOCkuCUuQie+RxjpKtkvG+keaFgSEzn6gjt7hTC6q0sfiF3jmOQN1ZOol9dHlE4NhCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMqvlJf75O+aFJs1CtgysBzJNkUC4yO3ocv6apikHlQ=;
 b=Uw7yTnzM/dWvCkTeFDwfh3ePEgBqUPmeDwTMerPykK7egSkRmFz5cCar7l23BrSGpUEElcgWNxD1HliIfvgGIXOM8lmfb3Tt+FZohSiv5A78pIvuy+LXD9qANt9tOsap8EGKkPvIuz7eF4NYjaFfsc4K8G3r/Kn7hw30tFN7pbv9YvI/2AszeRQcap5abR/CLS3bClEaHaVDQVC/m0FfVk/Y+7ybxrvAhuwpV4w1thd6SYJNTGZSxshKLiKkeC32RYHKhjjzVkIZLWh6XURz51eKvpoKjuaralXU3jYTYSNg1Ds7JH2gi+Va2oJLggOF/fJfgGELqeh4qrgft7J/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMqvlJf75O+aFJs1CtgysBzJNkUC4yO3ocv6apikHlQ=;
 b=p5cTHsR7NY9Vvfcjz/LAZRdxuApozTCDqkxxSZgKDPI/TyW6027Nvnjs2h4SwXElMGkfa1IQp9Roggl8dsLKlMyzQN9LBxPKr25qy093o9jQvYXcdqjmlEAyArOWO+NGNFCy36OiN/DRfRaimIkdykjWoZ11YB/M04aMaVg6mYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 14:40:09 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 14:40:09 +0000
Message-ID: <558d511c-e72c-486c-8f87-9a720ed3ae13@amd.com>
Date: Wed, 22 Apr 2026 10:40:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: Add ASIC filtering system with family ranges
To: Jani Nikula <jani.nikula@intel.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>
References: <20260422041725.172582-1-vitaly.prosyak@amd.com>
 <4d020ccc16ddc6cc0d222a7366e4802af3bfcefa@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <4d020ccc16ddc6cc0d222a7366e4802af3bfcefa@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0320.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::13) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 3190cf5b-e9df-472b-665b-08dea07d0d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: kxcHzPnQmokS22HWAahqYn8SHUXM/9Zd2xzGOYNMtkZcBQ3oc44ymRBitZAUjkVQqMbdBadqFm2+r5dmXBVAGOkHA/GjRsG9IueVoHR95B1QB4Ude2dyoEtaI6uh3aOgYnGXBUXsI8uS1Drb8hoSiiQ1iZ45H3/thPQrwd5Kmi2SCa+5f+S4+e4by7jC6lMMqpKRX84zdFXLUJLI7lbebRv/zu1PGHqFS/eOBchN6oDGjTLPM0gUyowl9cI/EiOc9m3owhTZ2mzAGXfyT/fxSBk5Rh94jAyZtGcp3QEihhWLxdvKTaIzmZ4ffppWe+HZXLz5ZoAncoouJ1OXmTduvtVxU59tmPK0q+lzRGHVdMg+0D3P3TWw/IapasNjjjbGBFlDMWrXhA6Q0e6LHLQs01Aja1bX+KqA2QwU7Bg1CJK4P90Avlim/9bxrAW9EiE9L9Zt5y6v9Etld9L7rWZ3158FVg0RfY/C+UqzuPOxr/0w+UC5Q2lJH8LKKkRKtpRklJGlupvqPqytpey2CcQKmu1Pqmxh2TNE25aYoZg2vvLr6tS9r0UFulNlJNOKtPQXNQZxXsf9QWRZEmUCLQExCSM6VOVR8pRlHS3j4dg2lQfjsBUeNhfugT2EWqxX9PmaTKffgdSE7yyY8BlrpeFP3qkhMrmTJ39kB7BA8nULU3+PVzC72dYD5Ybb8GevRLQVDjNDqSxgbuB9BfGvQVmS5aVyIYkMawpAJUmy+WoKgjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2V0ZWJwVEF4c0ZnQi9Yalh2bVg4dis3RDQ2Ync3K0FvbjFjUG1xQ2FGMDF2?=
 =?utf-8?B?djFMRUF5aHE1akc5YUxOQjBXbDlvbTZROWxvVFlIaXBPbmh0UFFjOTd2UlhG?=
 =?utf-8?B?QXhrQnZQTUFHUi9VTnkwMGFxYXVlZFEySlRrMXA5cUprWFlGWnI2Yk1rbWY3?=
 =?utf-8?B?MFdDd0JwZHJVeVBZOXdXSXBta3A2S2ttTzdXUWdFYTBJdUsyb0NmUkhTSzQ2?=
 =?utf-8?B?SUJKK0NReDZMWjJjSEZBejl3YXVvTFM3L2xkcmd1ajk2Y0pNMHBuQXFsYVBa?=
 =?utf-8?B?RDZMcTQ0cE15c1k3bkp6ZzVDMzZJeElxaTJyV1FiSmVCSlQ4cFl3ZytCeUdE?=
 =?utf-8?B?blhMelBDMnIzS0FKWHV1amREYmswSk53Zi9MNXF1SW1aWmNISFJmT1hwSzl3?=
 =?utf-8?B?NXVTcU50NEZON2t5Sks4d0dhak42RzM0YWgrUXdKUVJ6aWlrYmd5TjVaWlVJ?=
 =?utf-8?B?c2NSQzA1OUhUendGcU9GS3pTTWtONGVramI5ZWZSTjNqdnMzODZCcXJmcFRi?=
 =?utf-8?B?bThLRFM4UTNVNi82WnRxTitmZGwyVTZuSGs4TTRTTExLbkJVd3Q4VFBoZHcz?=
 =?utf-8?B?MWFDclFHVllzYjdHWjV1ZVY4eGVlQzQ4b0twMjRVK0EzUUhiSityUVhXaEpG?=
 =?utf-8?B?aWJLZXEwK3d1OCtjT1JoUmtOWWRYSTVSWnRKVmE1aWNyQXluWWxUZDRLbGRO?=
 =?utf-8?B?b21qWmc0K3Q5Zy81cHR3WXFnRXI5SjJzckNNZlBsN2FvRStqeGFDc04zeEVO?=
 =?utf-8?B?b1NueG45cFBUaE1jaUtIeU9kNml6NVQ4SmFGUzFReWxLQlh4UTQ0UDhMak9C?=
 =?utf-8?B?bjI4VjkzOVhpNEc2VUtTZ1pTYWNudEEwcUNCVXRMSFNBWFhmaHZUMUdDK1Nu?=
 =?utf-8?B?STlBYVo2RWVVb0VJS3p5dnF0L2hFSmJTYkh6NnBKMkFwa2lOU3NmNDNsVkJ2?=
 =?utf-8?B?KzNtVTAvNGtTaU5uUzhQRi85U3M2OFBEOEVHSFRvUjhKd05RUG1JK1loQ0pq?=
 =?utf-8?B?K0RadkkySU9PdnM0QldLckxpc2QzTTJ1aVZadkgzLzdpa3IxUkNQeENuMkNU?=
 =?utf-8?B?NkRUNmN3Q1pjUkZuUml5NkN5NzBrZ1VoMkJiK2VFOFBvcE1JSUlrZW5teXFo?=
 =?utf-8?B?SFBUZkZ6QWFxa1MrdDV4L0hFL1NqQkFaK2VQNXVqSDZQekcza3lpQStmcTU2?=
 =?utf-8?B?dFpML1UwRFpFbUNqdW9BVGtpbThsb243TmpJNW9jYzd4ek81QjBVVlF6Vm9B?=
 =?utf-8?B?MmZsR0tEL1VBOEJiK0h5bUlLUGJYekVZbzBLVDFLckE2UmY0VXFJSjlCVVM2?=
 =?utf-8?B?R1J4bjBBY3dTMWpKT3hqT3ArTDVUWXlZNXI5U1JwZ2wyUzJRS1VMRnRwYlpk?=
 =?utf-8?B?T2FRb1c3QytuZjhlbnAxeStsTzAzVHZscEVyK2xMVjUwbVY1clNqeCtkVGox?=
 =?utf-8?B?SGhOdFhWVEF1U1VNNlBNbWhIMWdYamZJYmowVUh0ZW43ek1yUUhQZVQzMURl?=
 =?utf-8?B?dDhJam1ONnJWSzVreElndk1FNGhzNzdpY1hYQWRZR21rNUxWVXczZDNXNWE2?=
 =?utf-8?B?UVN2UDRldndUbHM1Q2EwUmRGYW5lR0dCbXB6Tml2czRUaDVFbEdLbU9NRE8r?=
 =?utf-8?B?RVFDMzdFMUNYaUwzY29ucThEK3RTSE40Z0NoZ0VEcFIrVVRqejVYWmw2eE1n?=
 =?utf-8?B?UWRQNEJtTUZlN2dUOVZSaElDUkk5dFQ4c2MxOEJEZ2hqTTAyWVhNbWV5WG41?=
 =?utf-8?B?QXdiWUFUMGd2THFrVXc5UXFIOEd6a0NTRWNHNFNMN3VKb1FEajhEWmZWRkVI?=
 =?utf-8?B?ZkhwVk1hTXlNOGRqWGJGMDNNLzNkYko4NC95L2tWYnZLY3pXeDdpU0ZZSXRn?=
 =?utf-8?B?bU50TE9waHBpLzg0MTBCdkwrSm0xNWtoVnhVcWNnYTVkWFEzSU5walpqbDRB?=
 =?utf-8?B?WEZZMkd0Wi93d3lmdGM5d2pGT3FjMGF4azAyVkZWc2M3TzlWdldnTmxyUW1H?=
 =?utf-8?B?MUxlWG5XWSt0VzNubkFFVHhkMXJQREdPbW5wb2ZxWnplSmszS2lXZWlKYThN?=
 =?utf-8?B?Y2Y3dmV1V3JBWFVLMithbWNRd0ZMb1ZuTmZ6emJFblNJSEJudHhiNkdmYWJJ?=
 =?utf-8?B?VTFJZDZiN3dxbXlZWUE1OThqb25Jb3NpN0xEZEpZb1BZbk0yYXFzNnl3dGVk?=
 =?utf-8?B?UTRKS1ZLY3YvbmZTbUIyRVEyMEVaUmh1RjhnQW5sVkdaK1dpRmU4c1VPaEpX?=
 =?utf-8?B?REp2UlpDZ2JJa0phSnZxdldXeUthMUxvem1xdmtSYjJKNXI1Y3ZQdHJLUlho?=
 =?utf-8?B?bVlQY1l0TVpUWitTOFMzMVkzemZBUmozWUpSVUNVK2VlQjlLazNpZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3190cf5b-e9df-472b-665b-08dea07d0d8d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:40:09.5121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VcnYN3hCf/sqOeVN27AdU8P/Tjpc657nPX2SF9AhBSQehYKFkSTIlwuNsuTiUqFb+Huil70sPAkFiTWtR8e3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
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


On 2026-04-22 03:57, Jani Nikula wrote:
> On Wed, 22 Apr 2026, <vitaly.prosyak@amd.com> wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Add comprehensive ASIC-based test filtering system following IGT
>> coding standards with three-tier priority configuration.
> I would have expected an attempt to make an IGT shared filtering system
> generic enough to plug into any vendor's platforms, instead of going
> all-in on AMD only.
>
> That should be the mindset anyway, try to make it generic first. At the
> very least the commit message should explain why this is AMD specific,
> what it would take to make it generic, and "we didn't even think about
> it" is just not good enough.
>
> BR,
> Jani.
>
>
Hi Jani,

Thanks for the feedback — that’s a fair point, and I agree with the general direction.

My initial focus was to solve the immediate AMD CI problem (fragile user queue tests on specific ASICs), which is why the current implementation is AMD-specific and uses amdgpu_asic_addr.h definitions. That said, I do agree the right long-term approach is to make this generic at the IGT framework level.

A couple of thoughts on that:

The filtering mechanism itself can be fully generic, but the data (ASIC tables, ranges, identifiers) is inherently vendor-specific.
What I have in mind is:
A common IGT filtering framework (core logic)
Per-vendor backends/tables/configs (e.g., AMD, Intel, others)
Separate config sources per vendor (config file + env), while reusing the same infrastructure

One key benefit of integrating this into IGT core is that we avoid having each test/subtest manually check whether it should run. Instead, the framework can centrally decide, which keeps tests cleaner and avoids duplicated logic.

Regarding your suggestion, I think it makes sense to:

Rework the patch with generic naming and structure
Clearly document:
why the current version is AMD-specific
what is required to generalize it
Keep AMD as the first implementation backend, but not hardcode the design around it

My proposal would be:

I update the patch in this direction (generic framework + AMD-specific backend)
We validate the approach in AMD CI for some time (since that’s where the need is immediate)
Then I follow up with results and iterate towards making it fully usable across IGT

Does this approach sound reasonable?

Appreciate your feedback — it definitely helps steer this in the right direction.

BR,
Vitaly
>> Structure and Design:
>> - Uses family range arrays similar to amd_queue_reset.c
>> - Supports up to 4 ASIC ranges per skip rule
>> - Intensive use of amdgpu_asic_addr.h definitions (FAMILY_*, AMDGPU_*_RANGE)
>> - No global variables - all state in struct asic_filter_context
>> - Read-only static const tables (asic_table, builtin_skip_table)
>>
>> Three-Tier Priority System:
>> 1. Built-in production array (checked first, requires rebuild)
>> 2. Config file /etc/igt/asic_skip.conf (development, no rebuild)
>> 3. Environment variable IGT_ASIC_SKIP_CONFIG (runtime, no rebuild)
>>
>> Features:
>> - Family range structure: {family_id, chip_id_min, chip_id_max}
>> - Glob pattern matching for subtests (fnmatch)
>> - Comprehensive deployment guide in source code
>> - 10 commented examples in builtin_skip_table[]
>> - Complete family & range documentation
>> - Dump functionality showing all three sources
>>
>> Documentation in Source:
>> - 5-step deployment guide
>> - Family & range reference (9 families, 18 ranges)
>> - Glob patterns guide
>> - 10 ready-to-use examples
>>
>> Files Added:
>> - lib/amdgpu/amd_asic_filter.h - API and structures
>> - lib/amdgpu/amd_asic_filter.c - Full implementation with guide
>>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Signed-off Vitaly Prosyak <vitaly.prosyak@amd.com>
