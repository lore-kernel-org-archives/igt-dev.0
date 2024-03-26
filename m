Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55964C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 02:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3C910E56A;
	Tue, 26 Mar 2024 02:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tUeN3euX";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3710E56A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 02:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oblNWAK6AfzVAENdIIvgAKA4Kp9BA7XgcyRYDJ991qOXFFBe56gwnKV3A4NmqAkkoAsWrEKZdFF7RsZC/vxaSuxcN1aJ6UGAx2uWAPCBT5afMRXEzF/YwP/UC6B25ISkEvrgyusWGfPAMrNl7PDBpncWgsfxfxnkU9WxvwzL+jIHhEZgAjz8gaS81g+tdHiPwIJlE7xrIvtyH0qL/xB8fWXjrf1okQX1/MSQ8lAV/KiZYnfrHwalIkhWiU6w53OQ57LZQy24yvNVsGfpoQDEUjJweiaSUOS/gOgGxwIwtieKqdUBmp/zc+GsrHAd8M4XlFUlcrjgIcCdKscnj2EEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nHf4MK9m03Ej6GGjaMIHjkNJL7Rn1ybvdEkxjiI5+4=;
 b=b1bMOoOJuBbb2MJuxuTABH00mgZw+7kq/zKpMZRDrPRrJb6+kIU5J/dZ6x7U9MRJlqdxpD4ey1inBAQvPAI1kAiFW7AthWmyD7cmfVFPuGxR7KUcYOdh+GswpD6BgwB4+w18llhdM9sZy/ls6nz+d56ujyyCw9zRRNYummdMDO5qxbFo5iSiHvO7bn3jI5W5whCQX8oE8ciLEwMFQSp8dyUgaUZ2CrvdrFGRk0/HYZ3rFK6BX9CIai/a7Bqmjm+xfl8fvL9ZUjPv99uMuBFbOao3Bb+v6yiCTLj09TjOwZzNX55IKMqah6YmszTIpum9NEv2hWTdq93oFVLulnzNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nHf4MK9m03Ej6GGjaMIHjkNJL7Rn1ybvdEkxjiI5+4=;
 b=tUeN3euXRxKZUoNYS+USnxFc5eJaiL68YI5JycF1kxQ+9nMwnoAiNxFP7Elj1jTaNfizWeJx475JsI9aKHdI1B98YhL1Cx/hytwY9wCm1P2U+KLCTuItsaeDUb3SjxijpwCdiajlIEZXSJoaBZ53dqJBVuWqhZdDXV6EFjDUCfs=
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by LV2PR12MB5799.namprd12.prod.outlook.com (2603:10b6:408:179::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 02:38:14 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 02:38:13 +0000
Message-ID: <151cc419-aa65-4c90-88d1-fee448810f30@amd.com>
Date: Mon, 25 Mar 2024 22:38:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240326023440.2460660-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240326023440.2460660-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0054.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|LV2PR12MB5799:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLRaG5uouv7FJrWmR6g3soQupTosxn0nDnRxT0/zkjN/i7km//IvUQqsRwHxMHa/VU4SceC/VpWe9dMhIYGY8HmVakf+TRp43EwrVAaoWLhmKCSfq6ew/2c6MKCTezITBze+Sh0mjCJ1mcMzoQmTDD7k+x67N2PbI5shAgREvTm0XMGp1m4WRknolpvZ0sUUMH+ej30iDETr1Dl0w3x8QJeRF8aE4t7FXw17vxYtL3f/BZui03hdNQW8P9QoFX+2QNbXPJhN2c4lOUgMSRkUF2xuwlFkZkvzBUVd3e8ZJCEYBkkUm1pCpf+w8DdsPdv2H2rHoLBo9KsJWkIqklYuCRzWjjBr98tD1OU2WuEg+wwAbJ5iRfCSRC9XJssCmYTMfVyixxpSi/i03V5UJ1RsZrr/JpxnkikXB/lhrzJwRBmZNBov+eaRmSbGhDA1CrGWF3RUh2J251ZGzakSmNBsNDBhQTQD2U35wGJByrG2Xbv09u7zajOMgpir4kiTaWhkdBcxIeKBWUkYJidjHTf4Y7r/bv4M8J0hxXRUeCHbF5M4Uq3nmV0yP16M4Hv5W1W8otgTrTeK7RBoFlet+QmTevC+HyFf1TKA68tvcYVNoV0rdsXZ5jcGo2oJSwJ7rBu7aEP2+6E6/lTXWLqzqguH28mLbFrHK2S6puzK5IVSvPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFU3MGFxb0NWUWZsbEZRR3lWQytqYy8zNE05ZjM5TklqRW5HdFlpa3FwRDVK?=
 =?utf-8?B?S1pobTNUTS9TSEVmdGlERHRaRUFQMVdSUmg4aDRpOXVwckZQSlNwTzBneDJI?=
 =?utf-8?B?bjVxL3JEWWRVRlIrOGNEWWcraURidGlCTlJtK2FIRitLZ3RhM1VtWlE2Q3A1?=
 =?utf-8?B?aE9NWDlydHQ1M0JpVzFwUXdxUGtlT2F2UlR0WmZmK1htV3BWME5Pc1BNT2pM?=
 =?utf-8?B?LytIUnVOcHh0bUxHODlEVWpuTnVQY2VieEhIczdyMVQ0aWs0eDRyQnluMmY0?=
 =?utf-8?B?SUVrNnpuMHJxNmNRZmlZZ2FVMjg0UmJ1ejNQVSs4a3dQQWpGL1ZPUlN2bjhX?=
 =?utf-8?B?VHNZWmQwYnRHUUFtN1ZLck5WU0svSjd1UWJNRGFiM0lMaWdIUFJUc3gwMzgy?=
 =?utf-8?B?SzJMZHBtNGRraE5oam9jTklFeWlrZWtqMWFndXBNM01OeFluRWlqWU82eGds?=
 =?utf-8?B?Q3lDYkt6a0tKS0VHd1dscHdpNzdRanhQTi9yaXhNZTR0ekU4aVV0c0dJKzk2?=
 =?utf-8?B?S2hNYXFzdlJtVCsvdURhMWg2cjJjVnRkVXl3NmIxNGhyUkdSeTNyR1ZTVWMr?=
 =?utf-8?B?eThVODdmSkd0NExLemtSVmtFcXI4QllRWkZjZnhpL0ZpdnRUMWdsVjJYdnhB?=
 =?utf-8?B?bXJxa2lKMlpjcDBRWkp3eGRPVm5ORFFEZHVuYUZ0YlMxcVRqZk5yaE1qVk9r?=
 =?utf-8?B?SzFFOFBHbnVwL2lZeFNDZjFLTU4rc0RCOWdERTFwZVNKM05BZ1oyWDluVjFE?=
 =?utf-8?B?QnVWSVlldG5SM0M2T1h2MUo4UE93cFJ2VHZqd01oc0lEamwwYm9MbE1RM0Ns?=
 =?utf-8?B?R1kwYm9ZQnRKRkdHQ0FVSXByaHFMSDlpejF0UXVXUlN5NUVIZG5xWDFUbFQ0?=
 =?utf-8?B?MVlNeStmRFpuZk0yb1hVK2NtNndTbU9xZnZVQmVCNGZXcmgyaUVFYkZubHFK?=
 =?utf-8?B?Z0FtZC94NkxDK0dxVHBsb2NEczA1UCtYRzV6bHEwSjZOVGR0UkJJbklkMk50?=
 =?utf-8?B?MFJiTHBqWG1wa2RzYmpSZE92TjIwTW8rZUE3RXR5MURMRmZabVU4UEI2Z3J1?=
 =?utf-8?B?NHNHVmVJaEx4djdPYW9ZRmZMMnkwQTFVdlFPa3RKaUZ4NnUxY1JsWnMwQXE4?=
 =?utf-8?B?bFpuR3lRU0Zxd1ZqdXFnaE1DZWRFUmR4R3V2eVdQcWhZT09STk1kR0taeEZY?=
 =?utf-8?B?VnJVdUxVNTB5ckFiRHFKTzVQNnhvbnE0WXBoSWhjRkllNGRrclBqa1VCSTdK?=
 =?utf-8?B?N0V2YVpIMFEvRktlTHhvbFhmSmROMEdvOVUwd0c3LzRoMUVFK3ZuNzcra1ZJ?=
 =?utf-8?B?elJzSG5lWnJUMVc5bWhmZjg4Z3RITS8vQ3JoWm9GT1pXWWJtTzNvdDdiaUFF?=
 =?utf-8?B?Tk9vSFIxSVlrUkl1S0NrejRnMzlBb1ZFOGlXRURjTlUxTW11UFlKelZYY1Jq?=
 =?utf-8?B?TG9NamNXQittOEpuSHd0MFUzZzBlUy81RWlxZkdIcThqdzNXMFZIOXBHcU11?=
 =?utf-8?B?eUNkTWZlUStUQmZhcGI4ZVY4V3paZitISG1OdUFub1ZScCtwbk1KMmU4NEoz?=
 =?utf-8?B?Q3NpakFtZ0xFb1hqbksxUlM0dXM4Ky8xOWFGdG03RHZYNTFIZXRqOXphaGRp?=
 =?utf-8?B?QUZ5Zkw0VHFDeXNZVWN1b1dHQVR2TzdYMkJldmFoYzM3eTlNalNmdk1BRlJn?=
 =?utf-8?B?ZXlEYndxMzV3QlhyWnN1Q0VoYmh5clIvNHhiall4NTVwNFFSK3hpd2Q0MHla?=
 =?utf-8?B?VDdWYjN3M3czL0JTM2Q0dU94b2JldFpZYlpidFdoTUkrbmVIQWdyMFVoeUZK?=
 =?utf-8?B?cFhlZXdBVDNpTG4zUUJhVzc1Q0I3UmUzckgvZjZONk5vbzFoOVVqWnN1K3lo?=
 =?utf-8?B?WVVNTnNnQnpPeGNaclQzVm9aNEJHblBZM0xXbHREbHdwVnB1OG9RMUdnMDNH?=
 =?utf-8?B?Umt6c2RZMm9qK0FaOUNXOGtESExhdHB2VGpOVFZ4S0ZuUUVHRlRvVzRlMGx1?=
 =?utf-8?B?cklLVWs2TC9NcDVxMGdhRndCRkhrb1pSMDFHYTBodnEvRTgvdVRUTjF6bVF2?=
 =?utf-8?B?eURvTW1TTE1nc3drSVpIM2RqYlI2ZEtOdGtMbjVxTEFOYWRGR3U2Zjlhc1FN?=
 =?utf-8?Q?xzVUYejNla8yYE1PVARWnZmxP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde9053-6055-4dd5-e93f-08dc4d3dc8c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 02:38:13.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMu+j+xeMLbjqTKn38KTRmxcTHzXNW1xOk7jxBFTjOFErxMXrDiK3jnnAJV26+nsHV0/BMls3ZlWg1fx2zaP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-03-25 22:34, Jesse Zhang wrote:
> Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
> Fail error: "Starting subtest: eviction-test-with-IP-DMA
> Starting dynamic subtest: eviction_test
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
> Dynamic subtest eviction_test failed.
>
> There is a case where the system size and gtt memory are smaller.
> When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
> Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.
>
> V3: Provided an example in the code of exactly the numeric number (Vitaly)
>     Remove the space and empty line (Kamil)
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 70e45649d..8819b9cd4 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -358,6 +358,20 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  				   0, &vram_info);
>  	igt_assert_eq(r, 0);
>  
> +	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
> +				   0, &gtt_info);
> +	igt_assert_eq(r, 0);
> +
> +	/* For smaller gtt memory sizes, reduce gtt usage on initialization
> +	 * to satisfy eviction vram requirements. Example:
> +	 * gtt_info.heap_size 3036569600, gtt_info.max_allocation 2114244608  gtt_info.heap_usage 12845056
> +	 * gtt_info.heap_size 2895 mb, gtt_info.max_allocation 2016 mb gtt_info.heap_usage 12 mb
> +	 * vram_info.heap_size 2114244608, vram_info.max_allocation 2114244608 vram_info.heap_usage 26951680
> +	 * vram_info.heap_size 2016 mb, vram_info.max_allocation 2016 mb vram_info.heap_usage 25 mb
> +	 */
> +	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
> +		gtt_info.max_allocation /=3;
> +
>  	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
>  	igt_assert_eq(r, 0);
> @@ -365,10 +379,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
> -				   0, &gtt_info);
> -	igt_assert_eq(r, 0);
> -
>  	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
>  				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
>  	igt_assert_eq(r, 0);
