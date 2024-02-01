Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6812AC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 10:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEC910E3EB;
	Thu,  1 Feb 2024 10:00:21 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80410E484
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 10:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CceNSD/Yhl8wb9FrzbdZbJbRld/8Efh4i/HFDkZbC8Rrkx3Le6le20xkiT1x/gGsVt+ZgdUUPefmxOZjmxgm6WmSmNTmNXjlP3CY2UQOYq16sXSTtt+WREDqz4vsUMmCpHhOZ6IpGgP2Qv09mrZptkcft4/DVc8tP2SFhKimZScAHmf8TcD4PsnntvmcAKgtjwf2LEElSGz4P93i/t9w9E3MrtNX957yVOfq+z7TxvARm7bM1zEbEwSh7xh1aMWrbvppcGyiPWW8iYd4SEa1e47DEYGwFqxmYA9X3SXCTTd1AwwcicduTp0+Hh8CE0CGJ1/3KK6IUMnZ9psSSSguPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjySRK8vmGGYZ94Ofc/erLNzB2v5mb0354NzFr5S54s=;
 b=n6g8xh2guo1qJ4cRZMtYofINGsna5uQOczIilIfaPjGT6DIg75DUgoVRxDNTfyT09k68SFGtrgK4OMZOq0VC1mrLXODz7flOuiEFg0j/A7LhFo/QcOafmOxSraexzdQlqiN1fWy/zg5kxu8A3fcjkfd5LNap0y8HuBvCYxZFboLpZsCUQpEI6CAHYtDT/FLESWA383dryHEshi4MzscxHXb1jvSveiZr2q6vSUJtmGTtYjvod7hxkEjtPIBqAH4okT/TQaO7UB4gsx0HG4h/1YzraDZIN0C/iFKywQXrg4Fub24jI8SiF+9SNFE5k2AsfnDnFUjbC0DbuCkzyWduhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjySRK8vmGGYZ94Ofc/erLNzB2v5mb0354NzFr5S54s=;
 b=wybOWPRvNvMLGwl86iryHCVPcE49IAwnYYeSLqy3egYunJ6Vh7mAHrv2kfTZbGUQoPCzMnow7MTvtIhm9fPvbRylp/Ngk8SDoTy/viw3lB8j99Zk8KSfH4zNoJi9WeAk78YvXfafiY4be23iPDlYEboEMn8oYycKu81ExIBE3pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9216.namprd12.prod.outlook.com (2603:10b6:408:1a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 10:00:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.009; Thu, 1 Feb 2024
 10:00:16 +0000
Message-ID: <9f85c331-8d67-4386-b665-203f60f3abdf@amd.com>
Date: Thu, 1 Feb 2024 11:00:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/amdgpu: add support for gang cs
Content-Language: en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20240201045330.610006-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240201045330.610006-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 02edde77-f5b2-4ec1-b986-08dc230c96e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uusgXLtw7r54EXO+G+AXghRP8zLJOeAa2wG4wnkXlQHFza4zZkdeo54kv/Lpd/20ZdPEyRygIrQ2YOc7ukPThCLGCF3ea6dCj/bK4uDCeDm02tB+cYP2d6T58K70swLM4GJNFB5xnFqQeOg7nPudsEoAyI3zkxjhUFLM+q1chcBeIKGQq+WanLTxaxcf6YxbiolPNrl2l2U2jycIgqW0ALu2cdil68wLn1+8TrHEW1R4fblxaYA7BWibTgX/55UKKnC+P4cTUOM8VFOpTFjejcADLRMKKODiAwvWgCn/T7rdkwFufIFIf36t1N06py3heI+a0CqubG6HKAS2ctWhpS7Ruk2tDBipJH7brkaa1PNtkwYxlNUmqM5Kmd37UR+r9OtdojEUf489+/XaJCawXpWipAtZVkf+O6nwdlD2aKOsj2Fp8wFGM1ErUyjTBSCRxnpJzLH0HzYtC+TIpvH5Trwyf8uI6KQocSSneY6afDZEH5tJY9YJJ0Nj50lzOy/2/udLs9Zy/uPNzx+J6ihrrBQ0mxcN9DE+eyC1UZgzLA4+DNaJeVOz7Z5Jfeu/oxCua42JbaBZuWujkyoNZ3K5c3hP0QgOrmNUy+g06UTsO/6IxAMoPzhGOdozV8gMc/GfE04RJdmoZOyFTN63bil4Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(8676002)(4326008)(8936002)(2906002)(5660300002)(31696002)(54906003)(66946007)(316002)(86362001)(66556008)(66476007)(6486002)(36756003)(478600001)(2616005)(38100700002)(6506007)(6512007)(6666004)(83380400001)(26005)(66574015)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3RFYzJ1TlR0WnZTeEJOS1FaZmN0TFdEZlljK2ZBN1dPWTcvR01QSnVVTEN0?=
 =?utf-8?B?ZnVXdzlSVmM5cDREWHF1RXdCRjh6b0REdndEMDhnT0ZVSnpTUHZWc1BoWmpV?=
 =?utf-8?B?OTc1eTl0b0w2QkpaWGx3Znk1QktoQWVTd3ZQZy9Jak9GK0lkODVSb2pVNnhK?=
 =?utf-8?B?VzVOaTMrSU9lam54bm9jMk0wVGQ0YzN0Zm9PUFZpZXdkZ016ei9YR0VyTTVj?=
 =?utf-8?B?VFdXUTlYL1FTN1FGVWdHOFJiR01iWmdMV1oxWmQ1N0RjQ3puVFo3V1M5dTd1?=
 =?utf-8?B?aGw4U2lpWG5XM0FvSHhzajhYWDZESGkzNlhRWXdlQmdNbW5LbytoaTlZRHdY?=
 =?utf-8?B?dTRpOTY0bXAyMzl3UEwwQ3dRT25rc3NsT09nZEdwL0IvUlh4UGZGa3Fqa05D?=
 =?utf-8?B?TkxQeG1tWS94MHlNanFkWTI0ZGtveEpiTHF5ZmlLTXF5QmhhMlAwQmhjdGhj?=
 =?utf-8?B?bmhxTUhpcDRzRldTckNtR1NTR2JDcytlTnAwQUdYYnRMN1lhOUMzdDJZWjFa?=
 =?utf-8?B?cHVLZWJSNndLN1VzQksxdG1YbEUzZVM4ejJsb1B0V28yWk1mQ3YvdlZUZk9Y?=
 =?utf-8?B?c09VWXh1cGlMSGhOSmx6ZmY4N0ZCYy9qMFc2WW5QZlhTMmtxd2JZZlJtUUhZ?=
 =?utf-8?B?ODZSblYxRUNma2pZOWRVWk9OY0UxK3ZlUjI0RUtsZGV3YUFlSFBZTFBDMkh4?=
 =?utf-8?B?MFV0TE9ra0FuRUZsRTVDTTM2dy8rQ2h1ZEMrRDdnYmNlMDVuTkpYR3phSWlM?=
 =?utf-8?B?ZFlacEd2YTZ3REI4V1dPMzVKT1pWVGVXMnhKSXRmZUhzVytVMGROMS9YbUdY?=
 =?utf-8?B?MElSaGVVMUNNUzBXR1hieTlEamhXQ3RUVlZFQ09ocHlVazNxMkpFOHduR3ZE?=
 =?utf-8?B?dHdRcnVDdG05eXVLNGt3NWV0TGxZcUtOazFRRi9QN284ZGJ1WUExSVZzdWI5?=
 =?utf-8?B?TzY1NUYyYm41TjlmTHpoOU82SGZxMjZhYnY5MGpmeGwyVVFFRC9rSWVpMWlQ?=
 =?utf-8?B?RTZlbUZiRld2UC91TUV4RU1CRndZM2lRT1grVEV5TTcrZ2c3cDlJWXhvUW1p?=
 =?utf-8?B?NjdodEZpMWhHMHFjMTVNSTVUZlJrVzZPY0Z0YmJJenFzVmR2UGJIZG41dEw4?=
 =?utf-8?B?SXU3Und0TEJGQ3l4aENkVkRQUHR5YWtDeEpzVXRNQzRrSVNoQkhjSVpjTzRQ?=
 =?utf-8?B?d1FjQkdBd0pkYysvQWtMb2tDeElFYy9FclJsNEcvSXZ1aDdDTWR0dEE4cUNv?=
 =?utf-8?B?RjZBeDRTNUQxK292d1hWYyt4bGY1MDh0Y0VMZUNnMW1TR0NUa0loUjRrdmE4?=
 =?utf-8?B?b25RQ0N5QzNsOXhmUHVzQSt2WjdjMHJxbUJENVZZR3NYeHhFN1lVbDBHMFJG?=
 =?utf-8?B?b0lib3F3RWkwdjk4TjlYRXNUcWZSemtSeVQ3L1JBb1RBMjE5RURyblhBNytX?=
 =?utf-8?B?dDN1MU1QdjhvYTZaRXg1WVlGczAzSVZHcEpOakJ6U3BicThrUG8xK3lneHh6?=
 =?utf-8?B?MzcydDhHMm1mNVZBcklKSEtIaFZIVGZwaHJMaURmV2tDVzhUSmVtMVI3MDVY?=
 =?utf-8?B?K2RJQXVwZlhyY2xKNFpGSktWWktIVG1RZTBrR29nL25ic251VEg0QmJoU3Zp?=
 =?utf-8?B?ZmUxNGxXK0NoMlhxUmdSRHFWM0RsbkQ1MGZqT2V6YVhGSUI2dkw4ckxIa0k4?=
 =?utf-8?B?R1Y0TGMxZHh5UVNaY0Z3eU5nZ3oyeWVHMFRJdGxzQnV3Y2txU2VZOW1UQlBM?=
 =?utf-8?B?a2ZKSHJ4aFYrQXREa3hieHRiYkFjUlY0TGV1UVRTR3U1Q0xHVzhXYWFsUmNH?=
 =?utf-8?B?SWFMVXpiall3SVlsUHUzWnZEb3c2OTdaNG8zQ2crSHBCajN6ZXd6VEJYa0NR?=
 =?utf-8?B?b2ZjeEQxVHFLUkRUb2txT1gwRDRqVm9STEpvV3RTNHJaNVE5ZFZMYWc4dUFP?=
 =?utf-8?B?Uk5SYmxKWnphSExNRVVHOW56L2JQZzltOVd3VEFtSVBuODZqMjlpQzRhUmc5?=
 =?utf-8?B?RTZkOHdxWEVFYWNOWHA4bFRyUHMvZHhtaE4ycEJTbk5kcnlQU2Q2WXNqKzV6?=
 =?utf-8?B?dU5TWmROMnl4NHFJQVdGcitSZ0gxb3RxTWUydXhCRUcxRVBSSEhOR0RwdERS?=
 =?utf-8?Q?Syqk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02edde77-f5b2-4ec1-b986-08dc230c96e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 10:00:15.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmGsmEtsxtl0k6RBu44TPHm77jXv6VBzgPbZME0XbUG07WDVjAvS4QIaszkoXYWu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9216
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Am 01.02.24 um 05:53 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> When gang command submission is used we need to add fields
> for the second buf and second pm4 packet.
>
> Add ASIC-dependent implementation of WAIT_REG_MEM used to poll on
> location in the register or memory space until a reference value
> is satisfied.
>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Acked-by: Christian König <christian.koenig@amd.com> for the whole series.

> ---
>   lib/amdgpu/amd_ip_blocks.c | 35 +++++++++++++++++++++++++++++++++++
>   lib/amdgpu/amd_ip_blocks.h | 20 ++++++++++++++++----
>   2 files changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index a7ccfa38b..79ce7b5a8 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -288,6 +288,39 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>   	return 0;
>   }
>   
> +static int
> +gfx_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
> +			const struct amdgpu_ring_context *ring_context,
> +			uint32_t *pm4_dw)
> +{
> +	uint32_t i;
> +
> +	i = *pm4_dw;
> +	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
> +	ring_context->pm4[i++] = (WAIT_REG_MEM_MEM_SPACE(1) | /* memory */
> +							WAIT_REG_MEM_FUNCTION(3) | /* == */
> +							WAIT_REG_MEM_ENGINE(0));  /* me */
> +	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
> +	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
> +	ring_context->pm4[i++] = func->deadbeaf; /* reference value */
> +	ring_context->pm4[i++] = 0xffffffff; /* and mask */
> +	ring_context->pm4[i++] = 0x00000004; /* poll interval */
> +	*pm4_dw = i;
> +
> +	return 0;
> +}
> +
> +static int
> +sdma_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
> +			const struct amdgpu_ring_context *ring_context,
> +			uint32_t *pm4_dw)
> +{
> +	int r;
> +
> +	r = gfx_ring_wait_reg_mem(func, ring_context, pm4_dw);
> +	return r;
> +}
> +
>   /* we may cobine these two functions later */
>   static int
>   x_compare(const struct amdgpu_ip_funcs *func,
> @@ -336,6 +369,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
>   	.compare = x_compare,
>   	.compare_pattern = x_compare_pattern,
>   	.get_reg_offset = gfx_v8_0_get_reg_offset,
> +	.wait_reg_mem = gfx_ring_wait_reg_mem,
>   };
>   
>   static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
> @@ -351,6 +385,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
>   	.compare = x_compare,
>   	.compare_pattern = x_compare_pattern,
>   	.get_reg_offset = gfx_v8_0_get_reg_offset,
> +	.wait_reg_mem = sdma_ring_wait_reg_mem,
>   };
>   
>   struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index aef433e7f..4cad30d1e 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -31,22 +31,31 @@ struct amdgpu_ring_context {
>   	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
>   
>   	uint32_t write_length;  /* length of data */
> +	uint32_t write_length2; /* length of data for second packet */
>   	uint32_t *pm4;		/* data of the packet */
>   	uint32_t pm4_size;	/* max allocated packet size */
>   	bool secure;		/* secure or not */
>   
> -	uint64_t bo_mc;		/* result from amdgpu_bo_alloc_and_map */
> -	uint64_t bo_mc2;	/* result from amdgpu_bo_alloc_and_map */
> +	uint64_t bo_mc;		/* GPU address of first buffer */
> +	uint64_t bo_mc2;	/* GPU address for p4 packet */
> +	uint64_t bo_mc3;	/* GPU address of second buffer */
> +	uint64_t bo_mc4;	/* GPU address of second p4 packet */
>   
>   	uint32_t pm4_dw;	/* actual size of pm4 */
> +	uint32_t pm4_dw2;	/* actual size of second pm4 */
>   
> -	volatile uint32_t *bo_cpu;
> -	volatile uint32_t *bo2_cpu;
> +	volatile uint32_t *bo_cpu;	/* cpu adddress of mapped GPU buf */
> +	volatile uint32_t *bo2_cpu;	/* cpu adddress of mapped pm4 */
> +	volatile uint32_t *bo3_cpu;	/* cpu adddress of mapped GPU second buf */
> +	volatile uint32_t *bo4_cpu;	/* cpu adddress of mapped second pm4 */
>   
>   	uint32_t bo_cpu_origin;
>   
>   	amdgpu_bo_handle bo;
>   	amdgpu_bo_handle bo2;
> +	amdgpu_bo_handle bo3;
> +	amdgpu_bo_handle bo4;
> +
>   	amdgpu_bo_handle boa_vram[2];
>   	amdgpu_bo_handle boa_gtt[2];
>   
> @@ -56,6 +65,8 @@ struct amdgpu_ring_context {
>   	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>   	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>   	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
> +	amdgpu_va_handle va_handle3;   /* amdgpu_bo_alloc_and_map */
> +	amdgpu_va_handle va_handle4;   /* amdgpu_bo_alloc_and_map */
>   
>   	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
>   	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
> @@ -76,6 +87,7 @@ struct amdgpu_ip_funcs {
>   	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
>   	int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
>   	int (*get_reg_offset)(enum general_reg reg);
> +	int (*wait_reg_mem)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
>   
>   };
>   

