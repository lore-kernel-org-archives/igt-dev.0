Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC6DC53200
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 01:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B518310E0CB;
	Thu, 30 Jul 2026 01:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lcZcZorx";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0010E0C6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 01:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1l3SeBTIuOIcZTQcmtujOGu85v/BXrIrn8dbCpAcI1pFpZEjzujH+fLlGfI5Nj2aV8aWQbn6Kgyt3z228hOgCzWOaCqIKjhS+v1JBl7PYu92JJKXy70oZK6h667/VECrpAsKr+eM+R8LlmA6Yb3vpP7bRqwB4qsffdahIwVAu1l/5TY3ngsz6HK9+ls68pH1qqCSHr4jMm3oBzAKP4KMJlk/wLQh7HXkQ+INoqQgswhZFXkJF9+iJP2yKbPyrP0jI/uNsreXSFO383qPFMZgE4nEjOu54zyxfWRsoucBzgOj11vh4wzXFCkMd3GQLjfaull8bqsfzNaTtTO6Rk2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkRARyG4jzjXNqt1N6oXbBnZfW4UdYZJ04Wx+hei4+A=;
 b=dBfhc1eziJ4PUA3qaGeAlFiZar3PNH8rxKDlGApYAxsZOWuSlwHLr6ogI5qAsySoATSndLp+xNxDm0udpkmXyqXXg4NIQ81WcxS0fNAgbhkiSUN4NJKsz7UyO3aZr0XVuN38JpkoV8HaCZWxJvErpnix/ryUs2MY9ct9NJ06vN14K7pqxtr7Lqb273bM5xdCfYyGr7NGJ4kHjyT5tetaE+rMyJ8cDr9rOzhPt/B2RIcgpB/17kJzM/PxPBLPTiTUzx7BDYahjGaB6VbBx7lpYI5xxej2dKcQVWJUlwUNKYcawWcycEGqAIfr9Cj2JJfLAIZyeSXr8HgCKJavOKM6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkRARyG4jzjXNqt1N6oXbBnZfW4UdYZJ04Wx+hei4+A=;
 b=lcZcZorxoIY3vgJObfcMrXaAvLjVpqaGdGubJPBhxQZ8/yy1RHTR/U5DQi1eXBHMqfdZUJNbAu49blEdTXQ/uNNENeNZwm353h1jyhmXihGPtIozEl2cjeDRJN6mQdGylD79OiHXAeL0bty19T9DVt2E7xSOH5kzZU5ziqcGReE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 01:16:00 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 01:16:00 +0000
Message-ID: <84aceadf-b76c-4237-b666-7e47d59485cb@amd.com>
Date: Wed, 29 Jul 2026 21:15:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_deadlock: add gfx bad-opcode
 non-zero-count reset test
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260729063923.892313-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260729063923.892313-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0245.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::17) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 0153a2b5-17ce-4756-6107-08deedd81db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 4qAclH46MgPfrAomqARWkPVUNPKafPd32XCfPLBOviZlgWyz4xkGmUogNH496ovA/G1zkxeM/hcTNvmt+4NycrOsU2B7IehIUXz9rUeGZPZ0UxHN0+TZYJjc9M9iI1Mj3eUqvuAJNyBFy7IdezVD5aNyNJuImd7AebCYsWyrmfhxsthx9vMuVzOba8kMCQbqxDkjulmaEi/SAWMGN1yjsov4l7sXjDbFV8L1DwTd0alcCVOInUkg653bf0xRn4KoWOumZ/ZFh5jCEKGzX6sizpFH0mxt0Mz1UEO52lsyrDlIwDdJf1Zw4DLPH6MNx9NfAMKClaxl68CV0+GcrYY0T1NWnP4mMmbIZ1jFm0LFpzIkbZup1ATLFfzO+lmQ5ZJJAYi+dctbcq65ql9Ybzm+3LYCh+mfxBZ8OJvehCTTd8FW0q+xMqPpeoox0KIiKIpNafwBdiavigxWZajkDAPztK0R1hmwg2sTQWSdUtmBp3ZgoV8ccz79e5kzcWiQGIoQ2VDabh41hDZLrD8YTSpTHSwopW0n9ZbhrY1Nhd/TN8aKJYnf7EexERwqDiZ8DTQuuBFi0OvoYQjUY0BdSE4mzQBW0YhqPFCkxNAYMjBB3gizJqvh/joq5bYG4pN2NhQ1zDTOvN6Ub+ymIG1Dd1eR/wGfJODq+Lvek/RHmnL8nO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRwYmtJUFZabUhNZmNjaEs4Y3BPR2Z5UVRueGtWd3FFRW16ZGd2cGYvQ1Zp?=
 =?utf-8?B?QlNnRGZscGNyM0pLbG56VDJLYy93QkRDeHU5MlIvZSs4Q2psRlI3K0NEUDhh?=
 =?utf-8?B?SHhoMjJ3Lzd0TmdSdkVwZ1ZxYlRpY0RyMzVGRzFLalZxcEpLRXpHKzdkUHB5?=
 =?utf-8?B?RGlMRm5PNlVIMDcxa0Z6WDhiR3lDQWZRc3NLYVJveDRpbVJGWVQwNmpxb09T?=
 =?utf-8?B?emdXdHZIZUhsRVdKdHArVjlmUjdZWXNpU1pBWUxRNmJGVEp3ZmxLSEFXVkcw?=
 =?utf-8?B?VFNyTW9oZnNXZ1hsZlBSWlM1UUljY0NOZVdOUWxlWjdRRmNaZ211cE5TaDZr?=
 =?utf-8?B?UXcrUi9jNjExSFZDeVJ0azlHK2FXaysxaUVLRXRTd29abGpmVmNkSForWkRK?=
 =?utf-8?B?dEQ2VmJOcGZuNTl4QWFJMHVjTzQ4TjEyT01sQis1eGVWVDFEa3ZRMktLOHhn?=
 =?utf-8?B?cW1oUkhiNk5OTXFRU2pCMXRtc1p6TUdrRFU2ZWRyakFpL3RqdHppTUJ4VkJ3?=
 =?utf-8?B?TnUyaERIUE1vWGx1S1BuV2QyVzZrTDU4dU1wb25rY0dSWHF2SndQZ1VzZFRt?=
 =?utf-8?B?SENIVnRlR1pxWFJ1bDN5SWV2ZWs2TndhMXBRamp0cjNpR0xwNTJTQy9KTEUw?=
 =?utf-8?B?MlJUR3lUeHBKVStab0huN04rUXJKYmJLb2VGS0JXbEwxMGNWd2IzUUFRVHVT?=
 =?utf-8?B?ZlFMZzBleCtJWUNvS0NmNHA3UzlCampaSTlCaVlISEJGSnRIN2NuakNkMjVv?=
 =?utf-8?B?RkpsUEF1MTFRaUxwT2RKdnVUMDdNSEtHaCtFaUtwUVMyZ0tiOUJCZHZySHZS?=
 =?utf-8?B?WEV3RE9DMEk1SjNKRXM1UDdwMk1oa0xGTG9raFJxQjlMcHZ5eW9vN2FWVHc5?=
 =?utf-8?B?V3lQNzhiTG42VmQydzBvUEgzTkFaTjFXV2Q3RTVvOHNxZ3RaaWk4VUYvSWtr?=
 =?utf-8?B?UkxuZXJIbnk4S3BYTlJ2VlFFc3R0ZkpPakRnWklDRmFNWVZncXpjekpadGl4?=
 =?utf-8?B?a2dYSnN0RnJTVGN0YlN2d1ZhQmpoY284SUxBVUNPVnZJOHEveXVUUDg4aTFH?=
 =?utf-8?B?cXVLTzFwQ2tUcHNHblI4bHpseSt6SEJCbm03VmNnWEJsRm9seXFHWjNGYks5?=
 =?utf-8?B?NFZCdUg4ZW1uaXFjd054VVZEaXp5a0pyMjVQUXhPRDJJanF2QVBrdlVzbTZm?=
 =?utf-8?B?NTJFZStlSTBtS1NZSFBybE9XSXkvMW1KTUY0RjNBWGJjb1ZGVUUzZFQ2eGNN?=
 =?utf-8?B?eWlqQVVJWmJMRlFTUGJlcjNZek9DNml1Uld0UFRrWjNQaWFRZldmV0ptK09j?=
 =?utf-8?B?SFArbkhoQUVPY2o5ZlBYMmRLNGxqZ3paSFkxYnluS1M4MTgwaGN0My8vVE1I?=
 =?utf-8?B?UzZrTDNUcnZNQzR6bWt6RjRnR3IzV3VNUXJ1cXN1T2J5cmV0eFpYcDJhNGFN?=
 =?utf-8?B?UDRhZUppVGlFUTNPVFdnOFM4SWt5UVp3VVlvMy9kdm1MdXJiL1JEdkFGdmRZ?=
 =?utf-8?B?ajlqa3lzSVMwSWRxZ3ZmZVpiNjhmTkhwU0dXbWNRTDJTOWRqcThXc2dKOVJ4?=
 =?utf-8?B?TmQ3cmRvdGM3TmlwTkQrcktZOEFBLzdnMEhJNHBYNzlFbTFETEhpaFFLTlJI?=
 =?utf-8?B?cEJzNDFkZm5BU1RHWEExbis5NkE0dU5FYTd0R3krdXR4cDd6UHBESjlIbHor?=
 =?utf-8?B?WW0rb0ZSVEdqQjV6K1ZMY1U0a2Z4M2tyRE1jVmoydUNBQlNXN2N6cVA0QkpE?=
 =?utf-8?B?V1RxZG5ubittRWQwTjg2eGI4T202TzBUM0FKUWdwTlRqd3diQzhVL2pla0Rx?=
 =?utf-8?B?VUFFZm1MOHlhS011REVJeFBGLzJvQk04L2ZyZ3hZc1l3K0pDbmVjUVdLVUFI?=
 =?utf-8?B?aytpZGdUSTJIRlhtYUVrZ0lzdmtiSXpBMVhPcWxmVERxblhhekJ4M1lPdFY2?=
 =?utf-8?B?TFVzS2EwalFZTmxLZUk0ckNQbWRsaWFoSHFDb1M3T21IZE1GV1VPL3VYa1pQ?=
 =?utf-8?B?SjEzWFZ3ZUYvcHJDSC9XeGpaUGFXVWFzQndCY3ZDeGxaZ1FnZ0VvZXZHZ1dX?=
 =?utf-8?B?UnU4VW15YWl0K0RmWVpsZE9JL0RMSys2OFFtZkpFNXFhdzBxUy9jNmhFUnkv?=
 =?utf-8?B?WXQ1RUhoNm43ckhwTEtRcW9aVUJzWG1ML3NzRFA2WVNaZHBxZlF2ekZmMHZn?=
 =?utf-8?B?L0t1RmR1cnFad1NXWTYyZ2s0TnE2emdydGw5czNXdEgwWE5KQ3JwUDBabHRj?=
 =?utf-8?B?MUtxQXdQNG5DMU96czh2cE5MMGxNdm9rS0dQT2VPTWVOcDBMZmJDd2tOWUtP?=
 =?utf-8?B?ZmRqdlRPL0g4dEVtM1Q3ZEJVNzhZcGNFRDVvcUVtbFdoRDcwQUJadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0153a2b5-17ce-4756-6107-08deedd81db0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 01:16:00.1796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsNy5T8M1uCyrcCffxDQgYQb+DvGN7497VpTr8+4yV1drNwiBu1XIccW9CLX0EAbcOXX3o/j9n6862RaL5LhkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

LGTM

Reviewed-by Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-07-29 02:38, Jesse Zhang wrote:
> Add amdgpu-gfx-priv-fault-badcount-umq: a gfx user-queue bad opcode (0xf2)
> whose PACKET3 header carries a non-zero count field but no body. The pipe HW
> cannot find the packet end and stalls mid-packet, so a per-queue (vmid) reset
> cannot recover it -- only a gfx pipe reset can (once that FW support lands).
> Until then the case escalates to a full GPU reset.
>
> Add a priv_fault_badcount_hang IP-block hook to emit the packet.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 80 +++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_deadlock_helpers.h |  4 ++
>  lib/amdgpu/amd_ip_blocks.h        | 11 +++++
>  lib/amdgpu/amd_ip_blocks_ex.c     | 24 ++++++++++
>  tests/amdgpu/amd_deadlock.c       |  9 ++++
>  5 files changed, 128 insertions(+)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 71c82aa91..1ce46422f 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -529,6 +529,16 @@ static void gfx_ring_emit_priv_inst_hang(
>  	ring_context->pm4_dw = i;
>  }
>  
> +static void gfx_ring_emit_priv_fault_badcount_hang(
> +	const struct amdgpu_ip_block_version *ip_block,
> +	struct amdgpu_ring_context *ring_context)
> +{
> +	uint32_t i = 0;
> +
> +	ip_block->funcs->priv_fault_badcount_hang(ip_block->funcs, ring_context, &i);
> +	ring_context->pm4_dw = i;
> +}
> +
>  /*
>   * Fault a user queue with an invalid opcode followed by an endless wait: the
>   * bad opcode raises the gfx priv-fault interrupt and the wait hangs the queue
> @@ -600,6 +610,76 @@ void amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned
>  	}
>  }
>  
> +/*
> + * Fault a user queue with a bad opcode carrying a non-zero count field and no
> + * body: the pipe HW cannot find the packet end and stalls mid-packet, so a
> + * per-queue (vmid) reset cannot recover it -- only a gfx pipe reset can (once
> + * that FW support is ready). Until then the case escalates to a full GPU reset.
> + */
> +void amdgpu_priv_fault_badcount_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
> +					    struct pci_addr *pci, bool user_queue)
> +{
> +	const struct amdgpu_ip_block_version *ip_block;
> +	const int write_length = 128;
> +	const int pm4_dw = 256;
> +	struct amdgpu_ring_context *ring_context;
> +	int r = 0;
> +
> +	ip_block = get_ip_block(device_handle, ip_type);
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +
> +	if (user_queue) {
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_type);
> +	} else {
> +		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	ring_context->write_length = write_length;
> +	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
> +	ring_context->pm4_size = pm4_dw;
> +	ring_context->res_cnt = 1;
> +	ring_context->ring_id = 0;
> +	ring_context->user_queue = user_queue;
> +	igt_assert(ring_context->pm4);
> +
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle,
> +				    ring_context->write_length * sizeof(uint32_t),
> +				    4096, AMDGPU_GEM_DOMAIN_GTT,
> +				    AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +				    AMDGPU_VM_MTYPE_UC,
> +				    &ring_context->bo,
> +				    (void **)&ring_context->bo_cpu,
> +				    &ring_context->bo_mc,
> +				    &ring_context->va_handle,
> +				    ring_context->timeline_syncobj_handle,
> +				    ++ring_context->point, user_queue);
> +	igt_assert_eq(r, 0);
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +			ring_context->timeline_syncobj_handle,
> +			ring_context->point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
> +	ring_context->resources[0] = ring_context->bo;
> +
> +	gfx_ring_emit_priv_fault_badcount_hang(ip_block, ring_context);
> +
> +	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 0);
> +
> +	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
> +				 ring_context->write_length * sizeof(uint32_t));
> +	if (user_queue) {
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_type);
> +	} else {
> +		free(ring_context->pm4);
> +		free(ring_context);
> +	}
> +}
> +
>  /*
>   * Fault a user queue with a privileged INDIRECT_BUFFER (priv-instruction fault)
>   * followed by an endless wait: the privileged IB launch raises a fault interrupt
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> index 69c321ef6..0fd5eb59a 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.h
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -42,6 +42,10 @@ void
>  amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
>  			      struct pci_addr *pci, bool user_queue);
>  
> +void
> +amdgpu_priv_fault_badcount_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
> +				       struct pci_addr *pci, bool user_queue);
> +
>  void
>  amdgpu_priv_inst_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
>  			     struct pci_addr *pci, bool user_queue);
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 427010c2d..40a9735be 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -460,6 +460,17 @@ struct amdgpu_ip_funcs {
>  		uint32_t *pm4_dw
>  	);
>  
> +	/*
> +	 * Emit a bad opcode with a non-zero count field and no body: the pipe HW
> +	 * cannot find the packet end and stalls mid-packet, so a per-queue (vmid)
> +	 * reset cannot recover it -- only a gfx pipe reset can.
> +	 */
> +	int (*priv_fault_badcount_hang)(
> +		const struct amdgpu_ip_funcs *func,
> +		const struct amdgpu_ring_context *context,
> +		uint32_t *pm4_dw
> +	);
> +
>  };
>  
>  extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
> diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
> index 4655d9dcc..ad384ec33 100644
> --- a/lib/amdgpu/amd_ip_blocks_ex.c
> +++ b/lib/amdgpu/amd_ip_blocks_ex.c
> @@ -228,6 +228,10 @@ static int gfx_ring_priv_inst_hang(const struct amdgpu_ip_funcs *func,
>  				   const struct amdgpu_ring_context *ring_context,
>  				   uint32_t *pm4_dw);
>  
> +static int gfx_ring_priv_fault_badcount_hang(const struct amdgpu_ip_funcs *func,
> +					     const struct amdgpu_ring_context *ring_context,
> +					     uint32_t *pm4_dw);
> +
>  void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
>  {
>  	funcs->gfx_program_compute = gfx_program_compute_default;
> @@ -240,6 +244,7 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
>  	funcs->wait_reg_mem_hang = gfx_ring_wait_reg_mem_hang;
>  	funcs->priv_fault_hang = gfx_ring_priv_fault_hang;
>  	funcs->priv_inst_hang = gfx_ring_priv_inst_hang;
> +	funcs->priv_fault_badcount_hang = gfx_ring_priv_fault_badcount_hang;
>  
>  	switch (funcs->family_id) {
>  	case AMDGPU_FAMILY_RV:
> @@ -358,3 +363,22 @@ gfx_ring_priv_fault_hang(const struct amdgpu_ip_funcs *func,
>  	return 0;
>  }
>  
> +/*
> + * Emit a bad opcode (0xf2) with a non-zero count field and no body: the header
> + * claims a body that is never submitted, so the pipe HW cannot find the packet
> + * end and stalls mid-packet. A per-queue (vmid) reset cannot process it; only a
> + * gfx pipe reset can (once that FW support is ready).
> + */
> +static int
> +gfx_ring_priv_fault_badcount_hang(const struct amdgpu_ip_funcs *func,
> +				  const struct amdgpu_ring_context *ring_context,
> +				  uint32_t *pm4_dw)
> +{
> +	uint32_t i = *pm4_dw;
> +
> +	ring_context->pm4[i++] = PACKET3(0xf2, 0x3fff);
> +	*pm4_dw = i;
> +
> +	return 0;
> +}
> +
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 1d729eeb4..d66a58859 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -265,6 +265,15 @@ int igt_main()
>  		}
>  	}
>  
> +	igt_describe("Test-gfx-user-queue-bad-opcode-with-nonzero-count-recovers-via-gfx-pipe-reset");
> +	igt_subtest_with_dynamic("amdgpu-gfx-priv-fault-badcount-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> +			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-gfx-priv-fault-badcount-umq")
> +			amdgpu_priv_fault_badcount_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
> +		}
> +	}
> +
>  	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-privileged-instruction-fault");
>  	igt_subtest_with_dynamic("amdgpu-gfx-priv-inst-umq") {
>  		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
