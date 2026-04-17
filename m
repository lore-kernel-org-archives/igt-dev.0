Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F27F99C63
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 23:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928A10EA79;
	Fri, 17 Apr 2026 23:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z/YJi0cY";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012004.outbound.protection.outlook.com
 [40.93.195.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFE710EA79
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 23:57:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj0o+h6dW+ff8S87o82JeJTFL9KaV8ej76OoNd5Xyv+AAffSbAMI4gTW7k0Xi14yWmqxJbf4dDbug8TWYyHry9c0L954ux2uonwOY9MTAdLWmvFnDHz29DktjlqSDg7VUWTFAiuruTC3EM73/Lu07xt/Ahe+wjF162lYPq+PXS4F5ioJblPOrBha7YoQA5d5lGgIt3c8srFsLxEusaRQDe2zDu8RUh/93GYVoDLjYXY0jUDY8ynrBT/gx3yujp0SKgfhhdh94SRnNoiUksGkvHWwfSr3TZl3qtnK0hw+3WPvFOS0tI3zoDiEic2ZFGNwerc7pJJXcVd8YmVsukvOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiTL2Hw4n0gf7xQcXHvC9D9MpZA2QjQS5DG9FNqLDUQ=;
 b=jAVF/xjcTbE9+XMIHDN8ngo3CGKMxv8GJvWb5cYM2P51oGc1/PIBHBi6pkIltSs9YZBYEJygO0evxlcRVRC9753EVEVmC2pYZhkoUUstRZdT8rcPIITNV5366PPBjBR66WZee6hmkqPA44mk7ENIFVUBaigsDphh6gdwJnSlwGQJc4OY3/luH/CEIXanJXBnjxfcIBpBzRpTg/24RfLq8DS9GnoDUkRYJVLaU075tph0Tj6nOVJ6HqL2UzA7pw2BKqYPEYl4HPp1aVseQ+FTMNROMfFb/Tr18uC7ux3SCrGJuWuEnrFbObY2FlV/f7MHpmtI6U/4SQXCZxpQb90euA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiTL2Hw4n0gf7xQcXHvC9D9MpZA2QjQS5DG9FNqLDUQ=;
 b=Z/YJi0cYenW7J8y3uqHx6hnbYFdSXubbQuBvstIXWRsdet5XqA0v3pHhyIRpWHhPH94DGP2q7me4Bxn+/LeYX9eSDvqAbb9DAjvEWsrhgwvihIkUGyc07M2w4Pke4tOSZLIh8dkeNuGpigpNTLbmjAw2Am2F1EYs/sjbeTE0UYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 23:57:22 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 23:57:22 +0000
Message-ID: <3bda07ae-91b6-4812-8f75-47b0b6c1f1be@amd.com>
Date: Fri, 17 Apr 2026 17:57:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 0/8] tests/xe: Add purgeable memory madvise
 tests for system allocator
To: Arvind Yadav <arvind.yadav@intel.com>, igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
References: <20260414061703.2604112-1-arvind.yadav@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260414061703.2604112-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3ea972-fb21-4b78-5533-08de9cdd1148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: UDoBadxEtYIc+hKVxKIgy8HmkgfECLnnTOh9qETB29sRowljRZoaHCydw6ykieLed8hUJbtj2zYTJXKVtGZisB5LTbmkYq+fH9BbzTE/VpLik1DhKCNYVXfmXmwtYoS4bOK8s20ZZTkStGWspKnlDTH5/XK/ivQBMTmz8EStD0h3EoZRdeucbRpEKFvu3cxBKWORNsIw0JIGSiqSN4YVA5rMNjc5FQg/nFN5EenKTkz/OPTquzAquvYMlsb7aSrlSxwFN7hxn1eFUpVwpcrYfo42yk7kD1qKiynbJ1bPXvHMcLQlPjrQfs4agT/lARoK6iA2S3bqhxiwUFqR72tY9o/xK/BViJ3mi5/Rn9h0i2TW2wY1qbOj1GjH7KXjBDS96Nb+4krcOfObgL24DG6p7vun6oWDXA+++rZWYcvzHQ8opcxmU0ebuMMc42cl09iQmHPKz3/NbPzDl2AvGy2p0AvoRY8EfNV6jBB7eBLbUVwi7bvSvHzkUKpvnL13yp15NKTxN8VJZeGqSL8rWeoDsP5E07Elf86lj1AAuJ+dkCd8FsKlkTv09L85V4mk7BWOZygGaCnvBh9Z34QiyhWNNNzL2EA3mYamy8hBB40nOUAyxhnmIs4b8+SPDlDt0iG1HtaSVExn5iFFum294xmYJR7dx9GrTE1kKEhECMIy1adqiybbPZUpDZePAbra+utS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K21va3VtTlhGcUJENEdYTytvRTBFZE1zTnJyazdYY0R6NDVVV1JDVitQZU9I?=
 =?utf-8?B?bEJaQVFoZ0UvdU1zRFRIdVUvU3RHWE9ZYnRJc1o1OGJodFJUbmRTOC9tYXpR?=
 =?utf-8?B?RU9RRkRWOWp0K3k4M0treEFNTVNkcUp0eWhFWXowKzlTMlhjSTJ1V2o5OUlo?=
 =?utf-8?B?VnFubHA4TlJ1T084WEhIUEtBTnRIZno0bzVnaWVkOFlSWVZSZWJIeGJDdDdF?=
 =?utf-8?B?aHJ2elZuRjVTd0tYUWVWNi8zSmJwajc5UlZJUGVTNGVyQ1ozc0JUT0pBMzJy?=
 =?utf-8?B?OVlnTk9uRXlCNGV3WFNnbERCS3VxSU1tQ2JiMGYyOUhCTFZ3T3NrODlWNzVM?=
 =?utf-8?B?RUtBaVIrbkx3NW9FanlyZFE0aXhoV2x1ZFFvUmZwTlA0RUhoSmE2TzZ6dFgv?=
 =?utf-8?B?OE9OclFWNG1kaCtjcGxSQkYvVnlDaWJpQ3hadXA5ZzUrV1FpdXV2NW4yckVw?=
 =?utf-8?B?THBPMmsvL1ZYZXc1dVFPR2NpNnptUFVhRHJVNkozL0tnWjIzZGdEcGZnNGEr?=
 =?utf-8?B?RGFpUUtwL1B6VFpOb2htYWQ2ZjdteWNnZHB6ZkpGd3Z2RDl0NXh5ckh0R0RD?=
 =?utf-8?B?K1hITUhPdXUzNXpjRXJEQ1dIems3TWordFpOd0ljUDRkVFIyOHRLRDNINWJS?=
 =?utf-8?B?M01iRkh4Y1ZBZ3cyZjFkR3RuVmF3S21SQ0tnY3FublBKcWFjc0o0Z2JqbUhX?=
 =?utf-8?B?N1k1ZWZpSTZHRXNpeExBSndibm5XNFNxRFNwK1JSbHRLNEdxaEdwcjhqc0ht?=
 =?utf-8?B?cWhsaHlYaGVMR25yN0RoZVB4Tm8valdZYTErdGNram80cWwrbXhrY0g5NG9P?=
 =?utf-8?B?bURqSkxiR2ZoRGs2MHI4RFpob1dlU2czQ0FHV3RBdUNKdDBwcGVoaEN6cXR4?=
 =?utf-8?B?a1FxR0FzN1ZIOEVMM0lUd3lCZWNSejhpdzlJc0FFZXpKelFPc2RRdmRJOXFG?=
 =?utf-8?B?SFA0bnM4a3pZdjlBNTZNcVcrK0NpTlFpRURlcVhJRTcvWjBxZmg4bTBNNmpt?=
 =?utf-8?B?RXluczRqYUV5UjJZV0l4TWhYR3ZPd1NETmZCTElsSS9aOTFqRUVORjZZRHY1?=
 =?utf-8?B?c0tBQk9jODhqZ3JaTnczUXczZk9mbTcyRHlhUytRMVlzU0xTZ2JxSmRQWU9t?=
 =?utf-8?B?eGJjQ25YbzFHSDdhR0FxRStDNlUxOTU0QUYzOGQvS2d2UzZuekUzMnJTZThO?=
 =?utf-8?B?Z043RlY0eEw0eVp2RWFCZWROUm1vODhQcXJhU3BoNW9Ia2hKN09qN2xySmlL?=
 =?utf-8?B?WUs0VHI0TFdXT3IzaHQzanhveW1Vc29YVE1GL0lYUlBCL3ErYkFxczU3Z0hk?=
 =?utf-8?B?NC9FanROTzIzTkcweVVlQ05wKytmVGxjTzZESS9jdGlFZDA3cFVONDhPdzNT?=
 =?utf-8?B?OWhNMDh4YmxmK1h3aU5KZkg5YnhPS3VMUnB2NG95L2ZFRUNUOWdsVGhzeUJE?=
 =?utf-8?B?Rk1icWtXSFQrSjJIY21pTnpneGRNenFWTjJkRVRYMkhlclQyZVR4L0x4dm9n?=
 =?utf-8?B?cFQrZFpXdFJqK25yUm5hQ2ZvVTFuZ0ZnRGx2RVA3N0c1R2NZMWhVNTFZZ3c2?=
 =?utf-8?B?SHNzTjk5ckIvMkl1UFVwb2t6NXJvM3ljZ3JQZmN6REtzczNwVC9WUGVwSTly?=
 =?utf-8?B?V3FNSXBIU3VPd1N2b2xGVjE2aWVJN1FlNUpha21rdUMycGNNM0o4U3NWU01i?=
 =?utf-8?B?MHMxNTZYS2NIUFovWmlrK1B6MWFqc1FTcUk2UWlBMzdZRnhCN2JUK1VrelBY?=
 =?utf-8?B?TDk4NXM2YWNWUnJWMHNWOEYySVRZTlZ6OS9jTVRkUTVVSTZjakd6VjIrS1NX?=
 =?utf-8?B?SnJYallGbXczZlNkUnFPOStRMW5jckt0eXAvVU1mMWpicGxTNmRwSEF6TVhE?=
 =?utf-8?B?cGNSbDZiSE9Ja01Dc3locE96bXp2cXZ5cDRUOE4vS01XY3lHVVZIQmlkbktV?=
 =?utf-8?B?WUxtUHArYmVtRkQ5eUJKa1gxNTkxTjVVU1IzYWk2bjRwTU1kQ1RveWt4V0tQ?=
 =?utf-8?B?dnlNRDd6WVMvYmgwUVNpU3VSN1pySzUvREVxRXVMeWsyRklPd0JCWVljMUJF?=
 =?utf-8?B?UFFBT1VWNXJFamZnZDM5VGozSmprYzVrazNTRlNqUUdSVWJPK29FYTZYcERC?=
 =?utf-8?B?SG9xdDJBd1dHcGc0U1ZuMUxiL20zVHZHak92RkNPb0srV0RhYzhQR2tyNXZP?=
 =?utf-8?B?MDJSWGRvZjlQZkhBTjVOYkhPZngyM2E3ZWt5aEljeGxjWEQ2UUFVYkhmcTUw?=
 =?utf-8?B?NndOdm9nQUMzOGtlOWpVcVpId0Q0cEhkamFncU9scGFNQ1VJbEg0dkRXU0RF?=
 =?utf-8?B?cldqUEE3QnU2N29OVWdNNnhDZ0JuV1NnMG1MbmRMUFgrSlBBMmNSQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3ea972-fb21-4b78-5533-08de9cdd1148
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 23:57:22.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hnYIeveVreJulXnJkYy/ZGbznX0/x6PBDctzh1uaMFyDBPRZR0kSKIF3BYcPCyqD2goE/fJChZiQNRbsxSTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642
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

Patch 2 & 3 seem to cause the following compilation failures on CI's 
build:tests-debian-meson-armhf.

See https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/97703144


../tests/intel/xe_madvise.c: In function ‘test_purged_mmap_blocked’:
../tests/intel/xe_madvise.c:201:20: error: cast from pointer to integer 
of different size [-Werror=pointer-to-int-cast]
   201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |                    ^
../lib/igt_core.h:796:20: note: in definition of macro ‘igt_assert_cmpu64’
   796 |   uint64_t __n1 = (n1), __n2 = (n2); \
       |                    ^~
../tests/intel/xe_madvise.c:201:2: note: in expansion of macro 
‘igt_assert_eq_u64’
   201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |  ^~~~~~~~~~~~~~~~~
../tests/intel/xe_madvise.c:201:35: error: cast from pointer to integer 
of different size [-Werror=pointer-to-int-cast]
   201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |                                   ^
../lib/igt_core.h:796:33: note: in definition of macro ‘igt_assert_cmpu64’
   796 |   uint64_t __n1 = (n1), __n2 = (n2); \
       |                                 ^~
../tests/intel/xe_madvise.c:201:2: note: in expansion of macro 
‘igt_assert_eq_u64’
   201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |  ^~~~~~~~~~~~~~~~~
../tests/intel/xe_madvise.c: In function ‘test_dontneed_before_mmap’:
../tests/intel/xe_madvise.c:343:20: error: cast from pointer to integer 
of different size [-Werror=pointer-to-int-cast]
   343 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |                    ^
../lib/igt_core.h:796:20: note: in definition of macro ‘igt_assert_cmpu64’
   796 |   uint64_t __n1 = (n1), __n2 = (n2); \
       |                    ^~
../tests/intel/xe_madvise.c:343:2: note: in expansion of macro 
‘igt_assert_eq_u64’
   343 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |  ^~~~~~~~~~~~~~~~~
../tests/intel/xe_madvise.c:343:35: error: cast from pointer to integer 
of different size [-Werror=pointer-to-int-cast]
   343 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |                                   ^
../lib/igt_core.h:796:33: note: in definition of macro ‘igt_assert_cmpu64’
   796 |   uint64_t __n1 = (n1), __n2 = (n2); \
       |                                 ^~
../tests/intel/xe_madvise.c:343:2: note: in expansion of macro 
‘igt_assert_eq_u64’
   343 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
       |  ^~~~~~~~~~~~~~~~~

On 4/14/26 00:16, Arvind Yadav wrote:
> This series adds IGT tests for the purgeable memory madvise functionality
> in the XE driver's system allocator path.
> 
> Purgeable memory allows userspace to mark buffer objects as DONTNEED,
> making them eligible for kernel reclamation under memory pressure. This
> is critical for mobile and memory-constrained platforms to prevent OOM
> conditions while managing temporary or regeneratable GPU data.
> 
> The test suite validates:
> - Basic purgeable lifecycle (WILLNEED -> DONTNEED -> PURGED)
> - "Once purged, always purged" semantics (i915 compatibility)
> - Per-VMA purgeable state tracking for shared buffers
> - CPU fault handling on purged BOs (SIGBUS/SIGSEGV)
> - GPU execution with purged memory and scratch page protection
> - Proper state transitions across multiple VMs
> 
> Purgeable Memory States:-
>   - **WILLNEED (0)**: Memory is actively needed, kernel should not
>                       reclaim it.
>   - **DONTNEED (1)**: Application doesn't need this memory right now,
>                       kernel can reclaim it if needed
> 
> Retained Value
>   When querying purgeable state, the kernel returns:
>   - retained = 1: Memory is still present (not purged)
>   - retained = 0: Memory was purged/reclaimed
> 
> Kernel dependency: https://patchwork.freedesktop.org/series/156651/
>   
> Test Cases :
>    1. dontneed-before-mmap
>          Purpose: Validate that mmap fails on dontneed BO
> 
>    2. purged-mmap-blocked
>          Purpose: Validate that mmap fails on already-purged
>        
>    3. dontneed-after-mmap
>          Purpose: Validate that accessing an existing mapping of purged memory
>                   triggers SIGBUS/SIGSEGV.
> 
>    4. dontneed-before-exec
>          Purpose: Validate GPU execution on purgeable BO (before it's used).
> 
>    5. dontneed-after-exec
>          Purpose: Validate that previously-used BO can be purged and becomes
>                   inaccessible.
> 
>    6. per-vma-tracking
>          Purpose: Validate per-VMA purgeable state tracking
> 
>    7. per-vma-protection
>          Purpose: Validate that WILLNEED VMA protects BO from purging during
>                   GPU operations.
> v2:
>     - Move tests from xe_exec_system_allocator.c to dedicated
>       xe_madvise.c (Thomas Hellström).
>     - Fix trigger_memory_pressure to use scalable overpressure
>      (25% of VRAM, minimum 64MB instead of fixed 64MB). (Pravalika)
>     - Add MAP_FAILED check in trigger_memory_pressure.
>     - Touch all pages in allocated chunks, not just first 4KB. (Pravalika)
>     - Add 100ms sleep before freeing BOs to allow shrinker time
>       to process memory pressure.  (Pravalika)
>     - Rename 'bo2' to 'handle' for clarity in trigger_memory_pressure.(Pravalika)
>     - Add NEEDS_VISIBLE_VRAM flag to purgeable_setup_simple_bo
>       for consistent CPU mapping support on discrete GPUs.  (Pravalika)
>     - Add proper NULL mmap handling in test_dontneed_before_mmap
>        with cleanup and early return.  (Pravalika)
> 
> v3:
>     - Added separate commits for each individual test case. (Pravalika)
> 
> v4:
>     - Move unmap outside the block. (Pravalika)
>     - Added proper resource cleanup before calling igt_skip(). (Nishit)
>     - Added assertion for xe_bo_map. (Nishit)
>     - Now using sync[0] consistently. (Nishit)
>     - Added clarifying comment. (Nishit)
> 
> v5:
>    - Document DONTNEED BO access blocking behavior to prevent undefined
>      behavior and clarify uAPI contract (Thomas, Matt)
>    - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
>      feature detection. (Jose)
>    - For DONTNEED BO's mmap offset ioctl blocked with -EBUSY.
>    - Rename retained to retained_ptr. (Jose)
>    - Add new subtest purged-mmap-blocked.
> 
> v6:
>    - Support iGPU in trigger_memory_pressure() by using total system RAM
>      as pressure baseline; raise overpressure to 50% to force shrinker.
>    - DONTNEED mmap blocking now enforced at mmap() time (xe_gem_object_mmap),
>      not at DRM_IOCTL_XE_GEM_MMAP_OFFSET. Update dontneed-before-mmap and
>      purged-mmap-blocked accordingly.
>    - Fix graceful skip (instead of fail) in per-vma-tracking and
>      per-vma-protection when purge cannot be induced. (Nishit)
> 
> v7:
>    - Commit message updated with kernel UAPI details (Nishit)
>    - Moved trigger_memory_pressure(), purgeable_mark_and_verify_purged()
>      and sigtrap() in 4/9 and other patch. (Nishit)
>    - Use xe_has_vram() instead of checking xe_visible_vram_size() > 0 for
>      clearer dGPU/iGPU detection. (Nishit)
>    - Fix purgeable_mark_and_verify_purged(): handle retained == 0 from
>      DONTNEED (BO already purged) as success instead of incorrectly
>      returning false. (Nishit)
>    - Drop unused vm parameter from trigger_memory_pressure(). (Nishit)
>    - Mentioned this new ioctl instead of __xe_vm_madvise(). (Nishit)
> 
> v8:
>    - rebased.
>    - Drop this "[i-g-t,v7,1/9] drm-uapi/xe_drm: Sync with Add UAPI
>      support for purgeable buffer objects" patch. (Kamil)
> 
> v9:
>    - Added Reviewed-by tags. (Nishit)
> 
> v10:
>    - iGPU: use igt_purge_vm_caches() to trigger shrinker directly
>      instead of flooding system RAM (avoids OOM on low-memory machines).
>    - Simplified comments in trigger_memory_pressure().
> 
> Arvind Yadav (8):
>    lib/xe: Add purgeable memory ioctl support
>    tests/intel/xe_madvise: Add dontneed-before-mmap subtest
>    tests/intel/xe_madvise: Add purged-mmap-blocked subtest
>    tests/intel/xe_madvise: Add dontneed-after-mmap subtest
>    tests/intel/xe_madvise: Add dontneed-before-exec subtest
>    tests/intel/xe_madvise: Add dontneed-after-exec subtest
>    tests/intel/xe_madvise: Add per-vma-tracking subtest
>    tests/intel/xe_madvise: Add per-vma-protection subtest
> 
>   lib/xe/xe_ioctl.c        |  33 ++
>   lib/xe/xe_ioctl.h        |   2 +
>   tests/intel/xe_madvise.c | 829 +++++++++++++++++++++++++++++++++++++++
>   tests/meson.build        |   1 +
>   4 files changed, 865 insertions(+)
>   create mode 100644 tests/intel/xe_madvise.c
> 

