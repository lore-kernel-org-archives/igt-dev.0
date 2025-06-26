Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A7C7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 22:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5B310E913;
	Thu, 26 Jun 2025 22:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vvWp0vJ2";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524B110E913
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 22:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCYKRdm/WxkdD1WfU70z21EVJyvdzjfdCH37ir615itjDFL5CqldeelFnYMgE8scCA57cjZPmoEB1INBl5VOsYWxWBSzoFAy+kQOXIZ5VWVxlvU022JySLd8DSYDm30YJBcdyepCrNw6+V/HtGXYOy1FUpo9aTC4gKbAEJ2m+i9EXHKZkH4ec0Gq/sUQe+dg3ifQ0qaoXX2uTEKAwWtXY8hPdQ85OleICB9BJfTeFSeWVXFlfbjBzgOuPl4E2xj8gGwAXh+Fw+B+0z4F2EhuEA/g5g5cKSDijLkpqN76GqsMqU9uZwKBApk54nt6LFF8/WBE5uKp7O3Z2n4sPlpOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veIgeCkB/srdGPfjJfu9YQfyYnfMKp3+OHa7GAiu1yA=;
 b=uVHmWvMRXSHS+nmIz06BZsvaPrlH6UhUq61UK4maPAqS6S+KIQXWo5nfHDHEES4nbsGttMvliTa5nmpWueD8zkz2ZEKz0JKUfru5sTSqdgko0qI8zQfjZGaSneXY4Mr5/VGa3MWtZh9j3X9kmGCcle9AIlxpsyC3x4euCSg8euzT5HfWto/7CkhXyt3kMWXUrjf+AR6xeLBXygOTotNcdY5EI+N+PgyPRCUwBGAu5tcQuY9vUIGdtFwNzlgzum/T6GAYuIw+6J+ZnK5RZDqQvxRyGzWSmpNFn/xNLjYXb5t/kt34JLXyJ9m924JcbUPfcP0F7haCz/Do5yeQPNHBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veIgeCkB/srdGPfjJfu9YQfyYnfMKp3+OHa7GAiu1yA=;
 b=vvWp0vJ2L+7htsmUmVySmmNisqlLSYWX5ygNkTLI21UYELDxHOsA4pU+dZRWe8mAWdJfmF8xrpcT16DaL84P5AQePXkatYgXVM5vN6Nx6rWYS9C/ZFIB92R/38J8OSh9DmAV5EadNkw/hrYO3RSsVK/XXVx7TYs9aAJGjxywJqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 22:18:08 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 22:18:07 +0000
Message-ID: <5e55fa42-8f8b-4729-ba16-0d0d4df09ddc@amd.com>
Date: Thu, 26 Jun 2025 18:18:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: Generalize command submission to
 support SDMA
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250626055655.3641497-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250626055655.3641497-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0058.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 281d18f9-4977-41ad-efc1-08ddb4ff53cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTdPQURzSnF0RGhmR2s2VStCL29YZjJ0R3hCM0R1dWxPYzVDV3Z4aW5zKzVt?=
 =?utf-8?B?K05QYXVoTzJzWHBla0dweG1VRStjWFJaNVlKd1NmYW5OUllLWVFxRGI4eTdP?=
 =?utf-8?B?aW0vd2Q0U1AvNlRFWGd3dDhtYUtuMGZVNVBzbmNTYkhML0JJVlQ1anphczUv?=
 =?utf-8?B?ZHRDK3RLZUFSemxteit1OGJlWWhmM01WWUZHMFRUYzVQUWVpVWdYR1NPc1dE?=
 =?utf-8?B?UjcrMlFlbVRqbHkrRnUwSU5OR3VOMGlPSmtNVnA1ZlRVdjBWV1dvR3VMbnNa?=
 =?utf-8?B?YXN5UDBVZFJvazZzNGg1YjYzQWwxMTZrYVRzckdxUlBsUkF2R1k2UmVkZjll?=
 =?utf-8?B?Ni9sMVZFT2p4amU5c0N3Y3lmRzIxamlrZFpEL1o2QjUrK1F0bXNwRVVJeFhI?=
 =?utf-8?B?b216b1pvNThmUkVDUk5uVDR2NXArSHVYTmxFWjFGY0VPSUFzOTNHUlNRUklB?=
 =?utf-8?B?eGFlTDJ1N3ZZWGxjeXZnb2dlbzM2aXg5M1d3cjN3QnJrbnhVTEFsZWgyNE1o?=
 =?utf-8?B?SWR2OVAxZjNrWWZGdWJXZmhwVnJURVc2WGIrSUVCNmQxYjlNRkJiTWN6UzUv?=
 =?utf-8?B?c0NaQmJGWEh3SXFHWDRZWHF4SUZEa3BDQTZUZEtGaDFHV0tmeEZmVmdaMHJW?=
 =?utf-8?B?emgzaFB1V3lOcFdNSlBSRFNHbStBenNaTC9wbFBvOXlWbWE4ejBIR3Nia0t5?=
 =?utf-8?B?WWU0NTVrYTdMMWRDelpTdTlJZFVWdlFLVStmY3o2VTV4RlcwUGxPU3BDVVFp?=
 =?utf-8?B?eVcyYkE1N0hPVzFwY2VpQkFwRlJWSGtyQy9GYitPaFhSTkJmTVdKQlZHUTVI?=
 =?utf-8?B?a1J4WjBpaFhNdGdlRFRQVmJ2dE5teDFvc2dOZERYYjNqaWplS0ZjWks5U0Uw?=
 =?utf-8?B?RllMQlcybWdJbnpTRHVTN1kwZ0VDZ0dCL1dubWt4WUtON2dHWTg0VWc2UTdL?=
 =?utf-8?B?RytIS1d3Y0pIWFU3c1lTRndpTmNOL0RoZWhKd0Q0S3ZMalNaZ3ZBbHBodFZL?=
 =?utf-8?B?Yk4rSkQ5WXUzK0JRaGhJOHY5NUVPL2lLOExWY3FTSytheHFoTThVcTYvZVVJ?=
 =?utf-8?B?VzNIRmFLazZ5dkQ4RG45Y3Npc2VIM1VmTGhYK2RiLzFxZXk2OGZxbjBvVHZ2?=
 =?utf-8?B?QjBRTzIvUXp5MFlkNENJSTdXUTd4d0p1TWJjZmxueGt5UmdXS0oyUXAwanRq?=
 =?utf-8?B?aVV5WVZDb21sQzMybDNDY2cvZTNEem9tSEYwaDgyMnloMVZDYUc4a0cya01s?=
 =?utf-8?B?ei9ncHQ2dGIybSt2TStub05jNkVWbS9YNXdKcWpBSDEyR1VNVUhwREVtVVN1?=
 =?utf-8?B?ZTVmUld4Yk9ZUDc5eDcyMGlMZjNIaC91MHdNMTFJSGRGYUFJY0cvdWM4TUYz?=
 =?utf-8?B?ZkNVbG5kdVN5blltWVk2enNjMHp4SU1COTA1TTFGYzg5TEV4NWNtOWlUNGhW?=
 =?utf-8?B?UVN2SVpLdVlTdTJqcEQxL04xQVhGSmtBeDFMWk5uVGRzaGxOVHJ4T2pxL2NH?=
 =?utf-8?B?MmtBY1pLKzdNSHJyY2xGSUNFczNNVmM5Yyt4NzhHQzZNR25POTJpaHh6RmRD?=
 =?utf-8?B?REdCdVlxc3NEMEkzM2ZLSXNNR3l5NEcwSk5VejQ4WFZJcHQ1UmVMQXB6czFY?=
 =?utf-8?B?RXNLdHRhRnBQcmlkZjZ6THVsdmlIekY5ZVQvRVk1bHZxZkpJcjUrQmtuVCsr?=
 =?utf-8?B?c3p2STRWTmVZM1hFai93eHNQUExDRTFOS0cyQlBqTzZZVTMwV0NKTEVwVitN?=
 =?utf-8?B?clN2QnVnTzNTREpGV0wzZCtpTnlmR1F6b282WVhSRnIwZDBsQVpxTjY1aTVP?=
 =?utf-8?B?bEd6djA1dGQvQ0M5RW55UlZSbHBRdVVCMllKS3d4RUwvMDdpSytEUGFPZWlL?=
 =?utf-8?B?TTFpV3d2Z0dYZ3JGYnBEdURtOWM1dm1pZDFQTTF1M29xZnV6anFYc21FaEh6?=
 =?utf-8?Q?+sU+Fb1sHm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0R4M1gyT0VJZ1IrOTFOS0JXMG4vaTh2NkJrSFBpYlljNE9oZnlQTkFpd0Vj?=
 =?utf-8?B?ZGRvcDRWbUVCc2pwcG05R3FhMVlpUDdOTm9PeUpDbDVVVW55bU9pTEM0NTRl?=
 =?utf-8?B?Z0pqUHovR3NaTHUyOGtXRnMzUk9KcUMrWjNPVi9aOURCNWNmOUpBQ0NMZm5M?=
 =?utf-8?B?N2Z3Njdzd25GN3BvYVJhQjl5d1hPeUV2NjMyQ3A1NjlhQktTcEFESDBFWlcy?=
 =?utf-8?B?TDgrajc4YWJrWEl5NVFtQUg3TjR0dVM1czZGdlFDRzdpUDNkM01YdzZtMGRV?=
 =?utf-8?B?OUpuUkZUMUI2bWJrek1oNSswL012YUpQdzg0Q2ViaVhJNm9yT1M5SEhrbS9a?=
 =?utf-8?B?QVFSQytRR1lFVWxhci9IQkx5ckNxaUtIeVd4KzdDTHZBTnkrSFdMd3c5UE5l?=
 =?utf-8?B?c0J6SmVFNG9veUdWc0l0cCtxZzY5TTlpTWRZK1IwWGcyQWJPTXlXMnNxTmFk?=
 =?utf-8?B?SXZYcElhQWsvcDl4NzMvcXFsUE1SUENvQzFVMjdMdFNuSTFUQzFjaXhsV2cz?=
 =?utf-8?B?Z21hWi9PN29ZZ3QzTUVxOFJUWHUxQTlIUVhNRjJVYUhCQS90TVpubk5CMnB5?=
 =?utf-8?B?MlhKdTZhM1lKSkxhVUtxUVQ3ekdDakYxN1lpL2hWeGVXQVVmU0syUjVhdjJs?=
 =?utf-8?B?VS9Sc3QrMHpxSW10K2RvWU94VmI4bmNQZVphM2doZ2w3QVlzMjltS01ZUTlj?=
 =?utf-8?B?QXllajVkK09tS1grS0RhRGYyUjhuVnhkSnBxVjVFckRtN1dEQnlPalEzQWZN?=
 =?utf-8?B?RUtvaTNnc0pzZ2dOekZLeWkrTTN5Y01lbDJ4NWk5a08waGdKMDl4bUVBM2hD?=
 =?utf-8?B?YVFBeVpFWVZ3bFB6UStJaVFZdExRdmluRHg4VXc5SjVsbGVMY2l3enpaYTY1?=
 =?utf-8?B?U3NlZ1VlYTQ4aTJzdkdhSTUxMHRYdnFsbUZnVy9VVEY0RjFHaGg3Y2FiUUpP?=
 =?utf-8?B?WTBuOVlUY1lBVTFxTktiUUpNUlhrY2RTbUhlSVF6dFM4NG9aekxVVGhwS0tp?=
 =?utf-8?B?RlhkOUpKbGZPcTNmQzZwOFpwZGs2NjE0ZmQva0hSNGR6OFN4WVlyaDBQL0Rv?=
 =?utf-8?B?a2dqZzJ0UXd0RjFkVjMrTXJxM29GWFpoWmg5K3hGdjdwMXZJTWJhcFA1ODBV?=
 =?utf-8?B?RVNBTGRrVnB5V0dqT1Q1WUNJVXNJWkx6MjFUU3pyWlhuaTNFYkI4bkJIUFRY?=
 =?utf-8?B?T1lRTk5iVEVDdUQ2NGIveCs2OEszUEFGQkptMWtVOHJBYlhQUHhiaVlwc3kx?=
 =?utf-8?B?TWtyUmlJcEt3NFdxeTFhSnd3R2FBekZXcG5XcU9wcFJpUC93amhDWGtDQld3?=
 =?utf-8?B?RTJUOXBSMkZVTWZZMDR5VUUrbGxLZFp1RzJ6OVY1NnlxU0hlWWJscXJjaDIy?=
 =?utf-8?B?Q2hYNWpodWRuSDNDdm84MFRxNDZLYnVyVGdJU2NyallSdkVvV3djOXluRUhu?=
 =?utf-8?B?UzdGWUdkS2RBL25IaHR6RTNRRFBXZkdwYmpPazdMTHpIRHRxVjFLV043dUsx?=
 =?utf-8?B?MWNIZzVQUlZVU3FTaWJ1b2VQV2s1STJOMFRTYjNEUTlOdzhXMzVZRGtKVDkr?=
 =?utf-8?B?SS9JODIrTkc0MzVycG8xTE5EZ1M3Mi9pUU5zTkdVR3dFTENvck9TRklheFdz?=
 =?utf-8?B?Wll0OU5xQTdaOG9UR2JvdmJ1Qys4amxpWUJ4U3F5NU00U3owYm5aakwwK0Yv?=
 =?utf-8?B?YWVzY1h3NExkVnlnMmFOQjlPc29EYUxCcEhQSlNMblhpdFhNWGRCQUJWTlFN?=
 =?utf-8?B?eHNTanlRek8wc3h5NGxlcU9rcGxaZkgyblU1dFlzMWc5TGZ1c2RpdURPcDZ6?=
 =?utf-8?B?RTdCb3RxL1pGZnRoWnN6YldxTWEyVE9GUThrbFlSTzU0VHVtWVdVTEQvMzN1?=
 =?utf-8?B?dndjL3NkMjNtMC9janBnZXkxYzBWM2o2Y0V1d1hIYkVBWGxqcksydzlWd2xQ?=
 =?utf-8?B?bzlCRmZrem1yTlZUaHVXeHlhV202eXZzck9xV0t4UHZOazczbk1mM0ZTSVZ3?=
 =?utf-8?B?RUJLNmMwclRuU0ZSVkdaNlB2d052Wk1DY3lMRnpQeGFqZkFFdWVLZDA4TE1t?=
 =?utf-8?B?d3FEbllZdXIvaUFpa2lpUlRZc0JWdmFIZ2c4cG9HaEcyeFFMODdpWG9oam5O?=
 =?utf-8?Q?y2pmdRaCjuY/e8njjTTOQCqaI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281d18f9-4977-41ad-efc1-08ddb4ff53cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:18:07.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vG1lFqAtbV94qYLF5RdBFr4/ad4G0TSfhRSeDul70t5HL2EndiKrzfwkh2TJKWKzBRlN0aYkg5uM2jzl7a1aAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
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

Thanks—yes, this is a fix for the previous patch.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-06-26 01:56, Jesse.Zhang wrote:
> Modify amdgpu_command_submission_nop() to handle both compute and SDMA
> command submissions by:
> 1. Adding SDMA header include
> 2. Using the passed IP type parameter instead of hardcoding COMPUTE
> 3. Adding SDMA-specific NOP packet handling
> 4. Propagating the IP type through fence status and IB requests
>
> Fixes: 7e75d12 (lib/amdgpu: Generalize command submission NOP function)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_compute.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
> index 29159af4c..87faf8333 100644
> --- a/lib/amdgpu/amd_compute.c
> +++ b/lib/amdgpu/amd_compute.c
> @@ -25,6 +25,7 @@
>  #include "amd_PM4.h"
>  #include "amd_memory.h"
>  #include "amd_compute.h"
> +#include "amd_sdma.h"
>  #include "amd_userq.h"
>  
>  /**
> @@ -53,7 +54,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
> -	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &info);
> +	r = amdgpu_query_hw_ip_info(device, type, 0, &info);
>  	igt_assert_eq(r, 0);
>  
>  	if (user_queue) {
> @@ -86,7 +87,10 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  
>  		ptr = ib_result_cpu;
>  		memset(ptr, 0, 16);
> -		ptr[0] = PACKET3(PACKET3_NOP, 14);
> +		if (type == AMDGPU_HW_IP_DMA)
> +			ptr[0] = SDMA_NOP;
> +		else
> +			ptr[0] = PACKET3(PACKET3_NOP, 14);
>  		ring_context->pm4_dw = 16;
>  
>  		if (user_queue) {
> @@ -98,7 +102,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  			ib_info.size = 16;
>  
>  			memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
> -			ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> +			ibs_request.ip_type = type;
>  			ibs_request.ring = instance;
>  			ibs_request.number_of_ibs = 1;
>  			ibs_request.ibs = &ib_info;
> @@ -110,7 +114,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  			igt_assert_eq(r, 0);
>  
>  			fence_status.context = context_handle;
> -			fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> +			fence_status.ip_type = type;
>  			fence_status.ip_instance = 0;
>  			fence_status.ring = instance;
>  			fence_status.fence = ibs_request.seq_no;
