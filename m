Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBBBCD6E7C
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 18:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D55711AA65;
	Fri,  5 Jun 2026 18:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sgrbs50Y";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013050.outbound.protection.outlook.com
 [40.93.196.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBF411AA64
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 18:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLy/OrtFRVInONl4CAkpRhq7e2m+bBb7p7xm6S6TomJxTvy/Si9n5qIMBWEhINcYBNMOfeZilhcaHtjgTdH8gk/aqpdu9pNO6V+NqBwSgIpKO+9+/SfZYQio7VOJqfQ/p1poLSLcDkeFKOawbdYdHIAOP95qzDttkmTjtAl+J9wKhJ/fSaWhYHgUMeFyOFgrHNm/t6r++iDklgffw1KvDUa5Y7+6SJ03sKbMiPEHxKXO65Cx9/vZWV37lDS/lfIIz/B+luY0Y0OeTllgZpRK9sSnHQTTDKtr8/gc3BA8lj+78ofM2MiC65QgTFJ5GqRxFu0qXF/ZQF1zGw12MrJodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LvfbFX/ljZbLXhOR2ocyIYFQBCPTaX53XO/xjfGmys=;
 b=uJWqyyKiu1wGPnb0wG+SNTWv6lrLS0xO2n5ViWkT295d+zwfi9MCJN1YtJP3mDiJGyKzMvURcoSRb6eStRLSgfBJQmaOizhxDwllvOnr3LOnsRpczre8rCklyxmZet9BH2gT4bhD2ZshqjWRbD6c+5uDyqcCdc9IF7PeiOrFlOzd6X5WeisnViUFnlJNsNDzFq8SIBgEk8Qtxe0f7DRalwgx9UerCTSftpKcWW3xAb6XDIf2Z3HPOkxvCwPZ+EsvOAcbGC2oWydhnB+/OoaGhFHxOp8swwVYN3i916M3q+YuZBjXwK+ajuDAyyElErAbyPr91/96fHS/dEJMbg0lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LvfbFX/ljZbLXhOR2ocyIYFQBCPTaX53XO/xjfGmys=;
 b=Sgrbs50YY7QSLNV+O5C7/FhbNMLMssNJ1kt020E4QUaoB/LmDKwDZ7Ov/vKjxEntJkKtXSk9J10kCCdoSaW9Ek5yBACljkhcDCQ/u5dj6C2v84DIn7ewEln4Vjm/ePlmLtjjcwEedpzZGMY2okjW17Rox90oMC+Wly7ny8BUzNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:39:16 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 18:39:16 +0000
Message-ID: <f14e731f-2247-4117-8a48-4c4150183852@amd.com>
Date: Fri, 5 Jun 2026 14:39:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lib/amdgpu: Use correct GFX doorbell offset for
 userqueues
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260605082204.2478714-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260605082204.2478714-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::11) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|PH8PR12MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 724cb92b-b86b-4270-deee-08dec331bf42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: pJubJilpNrMeGPAT2A6SrhGNRVqe7buWCGPQaHYZBNBJnKM6BoYtDN9rVZbQ5BI+g5VlDai0VaDgeaECwX+LnScSZfmUX2xQR4n/VHY4dgTq5c0JXtpJjvwSGDzgEsTJEm14TlLKV9rC0+GHtkQeNg+wzl5waNEwimyfcay/E9EtxzMmnMvZvWjSL5FCA47MqJrRiqkoatiWoHDFPHdkUqrQbiSltcHMQuc/Eo2vSAOC4BYC4xH+5wsnuCvuJAt2kTyth6Cu5G4hNEEY3dj89BHM5IsB/0sCIQgCRb2m8nxEPnEtVcjcTYx0ZxfMP/3RvZFmpI0AK6gKE3VjbEk8tj+4996aXPIQqtPGCTaGaKOxOzffeIA3rR8CTvmit1qqZGGuDPrs4todaGSC8Iwj6z3CNq5fxvpRhgIUp6uDzk0SQi3mNrf73U1OzYAymacAqfjKNCBy/N/wOqqX6wkad1jqUXVQDS8KqWLsVbljXcWehM3G/GmquXRUU2G62Sm57/fiIZPukd56Euiukv/DvUJhQ15T6e8EWBHmOQ0fObblBozEAlJ+N8TlGGGJBiVNFZsM7cyeiCPzn4SHQQc41BRm86qgXsZbH9JaKMtgDZRtXiqlIgkqPwh/5KsnBZGTHR/BcMsc8G9tNmlw++nXh+GfbzZd1K1iPd4TbispS9DuhpW9HltnhTW8VExC2mnT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3dDNThjTEJDV21CUWkwbnF4WXFvSXJhZVdTZ2RBQWJUU1RQYXBlMkI2alc1?=
 =?utf-8?B?QjlHM0VHSGVzMlB1dmNWaU04aTRKemNtUXkvSzkxWThaaU1paVZUdjdJSWVm?=
 =?utf-8?B?QWE1UmQvUExqR2loZ1o0c0Q2amVDWnB3QjJtTFVQYnlLaG1GbC9XZTNNemNo?=
 =?utf-8?B?WjVzaXY1YXV2TnZhcExhT2pidVhhdm5QMDVIbjV3dndadHE4WDhxQ0tscHZX?=
 =?utf-8?B?WjdCRnluSkEzY1dzbCtXTi9VSzQydyt4M1dGNmo4NmRMbDNQNjNJWFNkWW1q?=
 =?utf-8?B?eTVqbGZKUEtNRXBPMDFmSWNJT01lNjZBemRmWnNRQy9zK0hSZFdhUmpnZ1Vi?=
 =?utf-8?B?aFdDRUdaK0ZFVE1kRWxIa2FxWE1SSTFUQ2oxUmtuTmVXNGhueHp0K1c4Ryti?=
 =?utf-8?B?QUZwbEI1c1AxNU1UUS9QNjg4Mi8yK3dzbFJReHN6UVFwemZPSlJ4aFFhNkZj?=
 =?utf-8?B?T2poMDNVRVlKckZsWjFwU0JPbzB3MS91Wit2eWY2OW02K1JISWZUTjFoR0pu?=
 =?utf-8?B?ZUx2RnN1aU9BNFAwaStrMFJRME85WjhIekJGT2hQZDh0dXNJN0YxZ082Qm1i?=
 =?utf-8?B?eXBiNTBGaFYxd3pOTmZvMHhBYkpLdjViWldrVmw3eDNNYW1YZDhLTmZrTnR1?=
 =?utf-8?B?TFhpcWhURThzejEwbEN2SThYYjBQMk5uNkNyZGlGS1dTRit5NndXOGZBY2pZ?=
 =?utf-8?B?REtqWlNyQjNkVjdOUjA3UHd5ZVgxUWRmMTFzQUpLK0R0a1pYSVVrbjlzSFhs?=
 =?utf-8?B?MXlSQ0xaLzNhRHJkREUyYWJueXdIN2tvYjNVR3lVdHIrMzByb0Z0WmZSSmtj?=
 =?utf-8?B?bnRFeHY1QU9UWnBKL1hoa2VpMnpGTzU4aHAwVjdLdmo2Y0ZyblhzVEEwV0ZF?=
 =?utf-8?B?VTJCTlhPdEdEQlJybmwxWG9TZFpObjFDTzk0U2FkY1hzT1Y3MlFlclBHakxr?=
 =?utf-8?B?MC8renQ1RDVkOGJTTUF3cVBBaUY4YVBCNWJUZitQbFJyVVJzbmY4U0kxL2Ux?=
 =?utf-8?B?MjNtQ0NsVVp4WVBxTnZtdVlTdDdwOXFNdWhDcEN1QlJvbmZtdVFwK0FMRWt0?=
 =?utf-8?B?SjBlcDg0aEVSekVySWJURFNDK2JFU2luN0Q0YmhzMWw1RVQ3ckVGeXNHcmJk?=
 =?utf-8?B?YXNWQXRWZEhQc3dZWFpocCs4TnQ5eVBJeWtqdm0xZmJibEhVcTIzZUNSdUJk?=
 =?utf-8?B?K3NYTWpXR09RVDRTdUNWemtYaFh0eVFGeHRxQ2c5UTFRci9UQ1lBRXNVSk5R?=
 =?utf-8?B?cEZtc1FpY3VlTXVmRFVDcUhXeHczR250eUFTeExSbGF1MEJjVFN0UDFNUGJF?=
 =?utf-8?B?eXIxWGQ2b0lmWFZrbGNFSzFvK2hHZGFQV0gxdElCM3AwdzdPMEVGKzQxbDZ4?=
 =?utf-8?B?M0dDTWhPbmNHNG1Wd0o3N0o0UERLR0I2RWxjbEhHN0REUmRvZkVpTVpQVmNZ?=
 =?utf-8?B?TVF1b2FRbFN1Z2dMVHdQMVp3clR4d2FaaXdHRUdzSEd3c1pBTHB2UDkxTVhK?=
 =?utf-8?B?c0wzbFpONnBiQXRFRUtVUlB6V1BQcjRBZFIvSis0U1RBemhIUklVekpGZnEw?=
 =?utf-8?B?ME5mVGw2RDVDMnNPMnExcTU3UXM3VzRqVm1sN3VRaFJQbW9QaXdhUW81Qmpy?=
 =?utf-8?B?ajJvTEMvbWFPbDNudmpKNkNacG1QanNKVllVS1ZDTDdhMjBncXlVYjkyOUo4?=
 =?utf-8?B?cndBampabHU2bFVSVUhDdVNhdGZrVFVLdGRNRUlMTTJmdnFha0JrTDlSTEtL?=
 =?utf-8?B?K1BiV1FvWXN3NDFYODI2d1dCV2xqRC9DOVdMNTBjTUdXT1o0cVdSSTY5TTN2?=
 =?utf-8?B?ZUo3Mk5yaWkyK01vcmdlMVZJL1JRSkM3MFdJdjVMTUVOaVNHdkE4ZmtxMXV0?=
 =?utf-8?B?Y1RQc2V3Z3J4c0xUNUZBd1BuR1QxeGZ2ZzFYdEZzOWVtQ3ZLS2Z6bC9OdDBq?=
 =?utf-8?B?VXBDM2FsS2JhWmtiL050eTJjSkRZaDFESUlQOWorNm1YQ3pZU1lUSXJmMjFa?=
 =?utf-8?B?N0pXMExlMDRsMjljTFFMK2dsS3JmWVBuZGVwakVoMVRGM3dZR1F2ZFhxVzRG?=
 =?utf-8?B?TWVPUU9sYmRHSjRuWVBLRGYvcHMzOWx3T01SS0swT2pVQ1hhc0VmNm1NOWZl?=
 =?utf-8?B?YWdYK3NkSXhUa1VienJKc3BYSkMxbGRvWlRqTVBqSmVodmtTWHV1ZjVLNFk5?=
 =?utf-8?B?QWNmWTRBTTFoS3c2OWdWRU9weHVJQVp0QVFlTGttQVlDQVk1dC9XQkp6Ri8w?=
 =?utf-8?B?MUhyWHRJTGpCdVlkTmw0YXE1dGg4K1ovbytlaGttT2dMZ1hObnRDdG94V2Uz?=
 =?utf-8?B?YWtnTEpxT0VvTEtMWno2TmhnVXZBSzhBYVBMMVVaMms4OVRJTW5GUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724cb92b-b86b-4270-deee-08dec331bf42
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:39:16.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKAWQSv/7CL4I440w1y6uhXNV/vqOwE3uUS8nhIunzYp0ycIH4jt/+abdFI9jyoHTBDfrYjGC+/wwr37nqxTog==
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

On 2026-06-05 04:21, Jesse Zhang wrote:
> GFX UMQ doorbell writes target the per-page sub-aperture starting at
> dword 0x11A within any 4K doorbell page (see
> AMDGPU_NAVI10_DOORBELL_GFX_USERQUEUE_START in
> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h). In qword units that is
> 0x08D, the canonical slot for a GFX user-mode queue.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 14 ++++++++++----
>  lib/amdgpu/amd_ip_blocks.h |  3 +++
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index b44441d0d..b56fb68b8 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -748,11 +748,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
>  	asm volatile ("mfence" : : : "memory");
>  #endif
> -	if (ip_type == AMD_IP_DMA) {
> -		/* Ring the SDMA doorbell at the page-modulo SDMA sub-aperture. */
> +	/* Ring at the engine's per-page UMQ sub-aperture (see amd_ip_blocks.h). */
> +	switch (ip_type) {
> +	case AMD_IP_DMA:
>  		ring_context->doorbell_cpu[SDMA_DOORBELL_INDEX] = *ring_context->wptr_cpu;
> -	} else {
> +		break;
> +	case AMD_IP_GFX:
> +		ring_context->doorbell_cpu[GFX_DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +		break;
> +	default:
>  		ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +		break;
>  	}
>  
>  	switch (ring_context->submit_mode) {
> @@ -994,7 +1000,7 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
>  	switch (type) {
>  	case AMD_IP_GFX:
>  		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
> -					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->db_handle, GFX_DOORBELL_INDEX,
>  					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
>  					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
>  					    mqd, queue_flags, &ctxt->queue_id);
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index e26ee68a9..2adea2f58 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -63,6 +63,9 @@
>  /* SDMA per-page sub-aperture starts at dword 0x200 within any 4K page.
>   * In qword units (USERQ doorbell_offset is qword-indexed): 0x100. */
>  #define SDMA_DOORBELL_INDEX		0x100
> +/* GFX UMQ per-page sub-aperture starts at dword 0x11A within any 4K page
> + * (gfx_userqueue_start in amdgpu_doorbell.h). In qword units: 0x08D. */
> +#define GFX_DOORBELL_INDEX		0x08D
>  #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
>  #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
>  
