Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03806CD6E7C
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 18:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BC211AA61;
	Fri,  5 Jun 2026 18:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d+gr7CiC";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF10111AA60
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 18:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDNF1Sj9vb7lN1A1kuqsxynfGSrQxP3tO/3C32LzV2em/t3gcIu8taVWZC21k86rycLNCYPYpjMrPcpkXkT2/0CiMV5JUuIMEGFcqigxFvu+I3Ep2JRI39vtLmwPfaIomgbKklbT9zvhI2RG4OyRzJC3slUQmAYO7GN4TdgA2ghBKjRDtDQV5rPNCSgmfKBPNeOaZBoSDpJX+yW50YvtCNt3u30tZSHBFIiDBO91JpCI7H0VEtFFp5q5R88NWoAdDksyQDXLEpyb7WDH6HsfH+R/H0WnzkPSyrK6QykwDkHYmoCy+TUS6vyJdgZCCJZtHMZtjpyD4/tjG11MzIiayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quiFx2Iy60fnkd1POILdT4k6qbp5dfRAc+JVgAZRnYM=;
 b=etqSj9Em8wzl95F5EeVYB04eSpwa30NsiAwvI+AMD77yqjcKFutjDDwnXHJk6n8uokjuT/onUVCZjepAkSLl2vr0Ug3E5dyB7k7c5ER5z0bWby4pNsa5+E3mWBd28PVGIhxBuvc1kLS6XBY6nifPwThOW5VeARtcmPR1lAQHkvnjKDDf4IRfVhxeC8oSjGyHk20w5ZE9zhlT7aCnduXpkLgu5EtvnlY+jyXveUkNB8MjRY+SOgaiTvAVpRoYcPg3dMB6FlofPASi+oAO+VHPWKra1BJ/5N0L3UcI+pAzxiwD2ohcvRihxjHxfVOW7mnebeyh3TPHiD2L4xAIqZ3+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quiFx2Iy60fnkd1POILdT4k6qbp5dfRAc+JVgAZRnYM=;
 b=d+gr7CiC0Wm2/hzQo44c7tgfRBUvNjEpHZlIq8r68xRgmVR8xMAC++cH6YcwolPYqT/8ixQJvXaA8uHw8i+udX5zDPP5wdpbPo1avdrRvmDKLDTAp7PEeJ3IWKiWyw+IrAPg0+pHM0uNCQekZgtX0f8CItpvQh4/M41SWtAgWBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:38:13 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 18:38:13 +0000
Message-ID: <f281d346-4e94-453c-8830-b86916f7355f@amd.com>
Date: Fri, 5 Jun 2026 14:38:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/amdgpu: Use correct SDMA doorbell offset for
 userqueues
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260605060417.2364146-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260605060417.2364146-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::10) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|PH8PR12MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 55022535-169f-4a2d-7bb3-08dec3319986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: oeefG5IZrL2fjvveFjlKNPUom7p79+yMEy9A6C7uhhv2Try5FkaCXDeYvnImQki68tfiRUenKWq9pewUQofmpcsrJaZsYlhmnvJ3Gv/YX149lI4ihBQwq1gLrayr6PhrMVaHng+dNEY9ZTR4HVwlGm9KFD5dSyJF1C41bWPlxDBaC0Q7erkZuZocyTMCQXxkh8G4vOPGxEUVlnzMsLTOFBmgeEZZj+hsY+4G34cVXZMfDVTpdxTRSV2DiDL945n845objDIw7eEP0ehv+1j2S9WEuUUsym7ybVEVPM/GUHJxEiMAsuRF423X+lYCV1FC6gGgm7i4h69JWkO2siCcHirA7RNivJOOlL71GKgO3IDXguJERZBjzh0h7PK8H440C1aQfaA30snOgMLFsXEw0q0GrAuER0qm7718QnRvCZGotBLhdn6ebWRALZA+IdAOB88qpwpp7Xl0EzkY73q0ABewHCEufkEs5jNb44o0u6mS9Dchb41UOmZuAqBEd1uoc8bvQpEf4/IGom9Tk5OUYdHgXaBrykFAHl08/6Ea0AzP480wTQ/vkPkt8tqFrcS3I/XdhA0cKtPCz9zMsfeMbDHIkhR34/934hR2D8Owrg/8WnJ+sLFDnKlIhC1CftnTUB9NUmZgzc5Dbc6Y8PqsnV6jyrKqMttaHMAiLrFCm3GyKU7QIy1AlNHKMss2fcDC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFNYmVHaFloOGZvWjg4V2tLVE1YSXlzTi84M3Mya0pTbEVkRWVFdHJxandp?=
 =?utf-8?B?eE9IamRZajlyNlBUWTJySFFPaCtKOXd0K0h4ejZlNGRlWTdNQjBMWEdTMGxu?=
 =?utf-8?B?bFE0U1E2TUtxakFDNUZFSmtTS3hhRWpjMTVLV0hsNUJBajVPWW90ODR3c29z?=
 =?utf-8?B?cExwcGl4UzZvN3FNOFBBY3AzcWpXbUhMVHlud0tRS00xQ3A4ME15ZTdvdGR6?=
 =?utf-8?B?YXNmOXlZTVdaY0JZeGhBUFU3VENuMkhIbVRKYldsdHVuY3c3b2NTamlYUTAy?=
 =?utf-8?B?K3A0R05FVmx0M2E4QlBMNTQ4TWlrVzcrcVM2aWdHcWNmcFIxQmVmaHlpbzNU?=
 =?utf-8?B?eGhRT0ExcUNhb2tFWEtCSnhnQTZ0UFFsY25sa0VVTzJKbjRTQ21SeSs3WFJr?=
 =?utf-8?B?bm40Z3JhZTkyQ1N5MlJubXBNOTMzRi9EbDlXU0ZzUWtRSWZxYUJiSDYyWnNN?=
 =?utf-8?B?SXhrWFlzaUtzSWxHZGFTYzRQS2tGaFE4K0pBSTZGSmpySEtIRW9YUmZJU3FU?=
 =?utf-8?B?SStmK1dUcHhCRldJbHdxMGsxNmRlKzJVQ3hURHJiUUlwRjJzc3UybjhtNEFX?=
 =?utf-8?B?aFVXZHpxanZKWE01WVdzcUFKcWgyVVhjTTQrcUUwVU9Zc1oxdzlKQ01hMFhD?=
 =?utf-8?B?OUZnck5MWUZDUlBjU2grZ1FjS1FSYnFyQndTZUZXMXh3eTYvWUVFcEhETFFn?=
 =?utf-8?B?TklYekMydUc1T0hXcHU0cllDYmxFajBLd25YaFB6WSsxVTRSWXVodk5ab0pG?=
 =?utf-8?B?K3NmT2d5WjlhcEYzMEdXbVY3K1p5Q0IwSVBwRjdLMXluVTlYRFRWMkVkQkJ0?=
 =?utf-8?B?emUwbGhrcWZFdWZ4L0Z5RTVDWjFWYTE5MXQ4UTRXdVdpVDErdGV0eFRtK3Rx?=
 =?utf-8?B?Y1NZcjRLVFpxcGFsbDJCTEkyaWlyZHVsY3JTTlJmeG9hd0NsZWt3aGFSSmIx?=
 =?utf-8?B?TE9mR0VyK2VTZERtWjRIMC9OSGcxZkdmb1RiWXRHek8zeWhWVHZGM2VLbGx6?=
 =?utf-8?B?eGJSOERpR2J5OXUvRThpREtsa3lDZ1M5bHpGSDk5TXRHeHM3Z2xCNEhpQXNR?=
 =?utf-8?B?cy9xZHZjY3RQS21ldXJSR1VweVB6N2ZickdhQ1d1RFA0endhKzlrRkZRTWlw?=
 =?utf-8?B?LzRoOXFhaGRDVEpLVldTenM0QUpFYWpzR2VLU09aV2dBRGd5bkVQV2tWZHR6?=
 =?utf-8?B?NjVEOVcrVmEvN3Boc0ZLdlR5VVlweEZIMzZaVGRsanFOTXNhT0RXRVN4eTdo?=
 =?utf-8?B?VlArTjlWRVBZYzZKRVFxVzJ6aVVubkdaV3BrRGtJZ056WlpJRDAzNWhLY01Q?=
 =?utf-8?B?OFI3ZitoRittdmRSZndSU2tDcTNzUzBiREE1bDJzbS84emRqa3ViZjEzTHRy?=
 =?utf-8?B?bFpzSE1RL2YxcEkzVmRUVFpaVU4ySkFPMjJyVzkwT1dmSGFKL2E0VlQ2Vkpv?=
 =?utf-8?B?SXZOWGZPNjlKb0t5alVEY1oyRFNhdkpCTllOclFYdVZkLzNaMThlREJmRlIy?=
 =?utf-8?B?S2pJKzRvTE5WbW1HbEZBRmVOVUhhRGxYYjhrbndGRnl4bzNReU9GMDc0ajhL?=
 =?utf-8?B?UXdjcytaSFdJSkRGRHdqYVhvWjdKQmtIdHBtL1JVdkJNM0pxNUsvSTg0OU5J?=
 =?utf-8?B?TGlxUFRiamFXVFJRaEE4MXZrenhlSzFHWG1RYWE0NDV1UUxsMUNHUGhqdGR0?=
 =?utf-8?B?Tmd5YXd5cGg0aTdBcG5oSGpmQ2VQb1VuaGZoWXU5QXpSbS8xZk5seWRaVVE2?=
 =?utf-8?B?aW9UMXNUY20vaE1sZ3Uxbk5lUHExU0I1S2FCaWoxTnMwU0FLWjVsQkxyWVVh?=
 =?utf-8?B?YnFoRm94RlNzeTcrcy9PNksrZVRKcHJNKzVFZmkvWm9qaEQxeC80SytkNDZQ?=
 =?utf-8?B?dU1YdENSSWJDQktoQlVtaVM4cytKK1VWVHlPYkRUdkN0UFhRQnJJU0ZFZUhL?=
 =?utf-8?B?Yi82M1Y5MzB2VVlWdXFuQWN4cjQwdDhENWZnelZtaU9DLzZtWWZnV09meEh3?=
 =?utf-8?B?ZGQrQWJBUFFGSmhMdTFYalFWSjFET05TcFBQZHdmaXhWY29CQTJZYkxXdUxi?=
 =?utf-8?B?LzRDbys4YXNYbFJvVEVHU2hrUllqK0wwZ0JwRks1MnNoY0xzTVVtcXBmYm4x?=
 =?utf-8?B?OXhLbUQ5RmZ3d1dJdlJqZkxneVVCQ0NnSUhGQlNPS0cycjJibGxBMEt6SHFV?=
 =?utf-8?B?UzJTeXRxbjk2RXlwbmJiQk9Wd3AzTHF0ZkdDSERqQUFFaFIvc3pVVFFNMXkr?=
 =?utf-8?B?Y2tiL1JqeUUwNkVkWVEvMUVwRmMrNGY2UHdJbEZqMTdMUEpQeFFVVnEvcE1r?=
 =?utf-8?B?TGJ5THhmdS9nSjdRdjBWblJadXpDKzM1MXFtUTJSRW1RT2FIeDh5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55022535-169f-4a2d-7bb3-08dec3319986
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:38:13.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIKc5pTcu05x62yhISUEP7RxlunCpvkTvSP0IzFp7vQWUjAmm++OA00Pyqa4OmyfldAYSqQpnfQ1gl9+8gEHYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697
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


LGTM, Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-06-05 02:04, Jesse Zhang wrote:
> SDMA doorbell writes must target the per-page sub-aperture at qword
> offset 0x100 (dword offset 0x200) within any 4K doorbell page.
> Using the generic DOORBELL_INDEX (4) leads to incorrect ringing and
> non-functional SDMA userqueues.  Define SDMA_DOORBELL_INDEX accordingly
> and apply it during queue creation and submission for AMD_IP_DMA.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 11 +++++++++--
>  lib/amdgpu/amd_ip_blocks.h |  3 +++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 80aa5569c..b44441d0d 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -748,7 +748,12 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
>  	asm volatile ("mfence" : : : "memory");
>  #endif
> -	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +	if (ip_type == AMD_IP_DMA) {
> +		/* Ring the SDMA doorbell at the page-modulo SDMA sub-aperture. */
> +		ring_context->doorbell_cpu[SDMA_DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +	} else {
> +		ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +	}
>  
>  	switch (ring_context->submit_mode) {
>  	case UQ_SUBMIT_NO_SYNC:
> @@ -1006,8 +1011,10 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
>  		break;
>  
>  	case AMD_IP_DMA:
> +		/* Per-page BIF decode verified: standard userqueue path with
> +		 * doorbell_offset placed in any 4K page's SDMA sub-aperture. */
>  		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
> -					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->db_handle, SDMA_DOORBELL_INDEX,
>  					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
>  					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
>  					    mqd, queue_flags, &ctxt->queue_id);
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index eb118c68a..e26ee68a9 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -60,6 +60,9 @@
>  #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
>  #define ALIGNMENT			4096
>  #define DOORBELL_INDEX			4
> +/* SDMA per-page sub-aperture starts at dword 0x200 within any 4K page.
> + * In qword units (USERQ doorbell_offset is qword-indexed): 0x100. */
> +#define SDMA_DOORBELL_INDEX		0x100
>  #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
>  #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
>  
