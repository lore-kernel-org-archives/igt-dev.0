Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD4CD4F24
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 07:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20E510E1B8;
	Wed, 13 May 2026 07:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IsNP8hf/";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDAB10E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 07:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JS/xLiWuZ085NCP9pZEX2sXnwMs0wTb99C090uqrQC1lpdHY2NWrr7IAabzcXI8rI+C9GCihL/I1FIIOCVVxNTSUDrtUbG4/mXadQS36YB60989EXE0KO1/TTEozS6Brs0bJD2V0KmCu4MHNDpmBoos0gxorxSL98g05GiTt6oLOALppc11lJBqIywHSqb3QfTFhcJSSnUBNhC24YB3VnhjS4orIG46TyKeOwEUOxV59gxMM4qhnX6fmyjUSlsKd5gZGblSUiuxD5wZQmeM+SviZVhPcT0quq75/dKcKZ1Qcva45OIW9mfqVZrlr9oqBOErGZPmfx8TpJnMh+QIuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIfgTDcd+TjxQ9nsnCF8Nu6JgwoDbuhpirYHYa3ULr8=;
 b=ZBnHo97aBoIyO0d+oqwqvodz83PtVBcSvVN7Rt48wVN3YHxzOWr/jqaT8Ik/FhKib2vce1We2Ka2JG0JHXRrs6XcOUsRuKUJWC9C36otDGiLspbXyfyyafl0r0XO2jH/aNPHe9f81/Vn5kaT0txJC7UOt63soz/I1SQLFftzzQ2GDKz3jRsb+ZoYkpISUdROHoS3D8nG/tAR8nflnNFjmnkNeCVLAcCrzc9zvnUOXnEwsODK7DDdeA0CG4vaJZAYvYPqqjqd7XpsSJva8wJtznQBT364L/eKLROHwzrLnNEIyl+gQSI2c8e6E0tl3Ge4z+KCGi+OsfcWvTlQobGY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIfgTDcd+TjxQ9nsnCF8Nu6JgwoDbuhpirYHYa3ULr8=;
 b=IsNP8hf/V3F7vxfw+63T2GlWY4subragIJUrviG18abX1bW9myYopNuT2CwhBsv13SmeTOHkmWu/NLsbr4xtXkP50xOxNU7Rn2CzjL+sVXMA3Fb0su10fv1Gh7iovldJGuig9a7XQWo4AhVPqM4NLIKtND3HBXbTuDAOs+M/1WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:03:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 07:03:03 +0000
Message-ID: <8e8bb1f2-df0e-4826-9eec-e9b189b61c49@amd.com>
Date: Wed, 13 May 2026 09:02:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: add USERPTR PTE invalidation regression test
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
References: <20260512182348.115625-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260512182348.115625-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b989753-028c-4d46-fda8-08deb0bdacf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7DKmrAQCd4OAkcNZkMPjjWE/xT0KWEMebwdm6dBDJ9NCRE3g+sbD8SaP10FGK+NCTTrKfHqf2xs1Ax4ozm73AuCTuLf0DVEz2gi2sT7nE7F1oU5/NAEJEbWYj+8RwUgo89KZ9fVkPnB6uEBT7KBoT98MxMOqxZa+h1t9hOGoJpX0uUP6ZPLYrOP750Uf5uhDUc4e6N1FlCxM9YQMJkrp2C6zmbHTNGLfjT1ygrjChzDAZY1zf2PmVcIOU2sZt4T8pppkd3M1buLVQhkdfDDsEKglHNzCHgykJZWfzKXcr1j6OFvYGosRPeuGBdDWi9qCHRHDNG+b4t1S3VpoYlQjLaCZglFMHYhvJsJxFjrVAHgOvhwjNLdKcrNV4KOr3KQxRYlylgP7u7cS4PRvF5noqgSMyeunSzzR2cl4JuiuxniMSJ0x7cSsFXMsJWKMsZeQRmG0z7L326HthWf7QuaNsVOMSlb6ttY3k7DwD7a96WHfG/YVmBhhNtPWPsAaap38K1NLNHev7R0+a/GgiqazpPZHMX9HiF6nT4RhBnDs/2KrkkhTQXmziVDuNiRQNIQ/zLVoOxR9ykAgnfVv46lTCwjuSNcqMNM0JeDpgHfMoPHeLJ1AdenG+gul+tbufKD8vSFTyeOUE1GYBP9X17ZUI5M2WrARQGjI9SDpgBJRAeG/+u45eqN3Ao0V4D1CbmDQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(56012099003)(3023799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N203WnRxZlh2dmFFdlBpenVLWDhDWVJpbUJJa1pGM2ZpdkJYeDZwMDZ3MlIw?=
 =?utf-8?B?Y3VjSFpES2xYL1FIeUZObDFXVjArS2VaRU9TZGdRWkdicTN6eVh4dnhZWnlZ?=
 =?utf-8?B?aW0zbXlkQklkMkJpVE1Xcm9pL0NIVUpYZm95MThMN2MzeUlxN3hJR29tcWV1?=
 =?utf-8?B?V0M1bjJkd2pPdWhmTGJlNEpnZlZNVWtNTWx2Zkp6YWlhMCtpZ0tpdWQyWUk1?=
 =?utf-8?B?aFRTNkdsNGpuRHIranZMNUJSUzcxeDlTWjdGT3ZhbjRXaklvUjBZQnlrM0Fo?=
 =?utf-8?B?NFNuOFV1MWNUSjU5ajIzOFdXc1dMLzF5NVpjWTB2QTRvQ2J6WVRtUENFMmN6?=
 =?utf-8?B?VVAyd3owTFhlUHQrY3RyNW9ETGFoaXZKekloMWRiTktWbGxEa0JSTWY5amNB?=
 =?utf-8?B?TmhKN2F2NFcxWjlsSzhBVXF4dWYyUkR3anA1bng3aTB6NE1YUlplNkdNNC8w?=
 =?utf-8?B?dXdlU21iSDZqOVBiNDhJS2oyd0ZpRGFmMmtkdXVsM0hLemlXUzE2bGRMR1dM?=
 =?utf-8?B?U2EvR29JNGJ2dm1wWVhLenBLSDQzaVFZTU5aejF1ajVSWXZGQUpGSGlOOWd5?=
 =?utf-8?B?TzdJOG8vZU5wT05RNEFMbHhKNFlsVTF6ek9ZTlphY2pYczh1RFFpRkxCMTdU?=
 =?utf-8?B?dlQ1UHI0THdtY2RxT3IxUk1VQlpUM3pLT3FQSXFsd0htM2dzTHZrQ24rTFJJ?=
 =?utf-8?B?dHBSclhuMnZ1NEdpSEZsa0JuNGUyOEtOcWZlWmFXUFNHM1kydU00Q2pIMm9O?=
 =?utf-8?B?MXdHZEk5ZThXZVZycXRFVUdRQU16R0xCcXZHaStCZ2pFK3k5SjM3UUhlY3NW?=
 =?utf-8?B?SEtsZlBRNnZrTkVnOUVPN3EvQWNvZ2cxMzJUSEtudEhKVS9aYjdWWVVLRmpY?=
 =?utf-8?B?ZTR6NWtUSUpHQWt3MHZXeWFwNkxxTU1SU3NqWkR6QkJrRGhmQ1pMK1RiRHF0?=
 =?utf-8?B?a3lRL1dRK24rckxUcXoyc1FzMnRiMVZLMTVKaS9DbmFXYzV4amN2VE11V091?=
 =?utf-8?B?TVVaK25WY2pUSHBlbHp4RVYzaVk4eDhNZHpVSVFaYkZGOHlVbkYrb0lreDRo?=
 =?utf-8?B?YWxyRDZLVzREa3FYK2Z0T24xK3NCamt4aFMvQjQwSnJCT1Q3OVZnQldMVEpW?=
 =?utf-8?B?a3FpYTZMOUFJaDZPSERpTDl1UnZ6cUg0UWlDWWdtaXRnMXVFYUlkMjAyelpF?=
 =?utf-8?B?ME8zdEk2OXIxM1FYK0JJcHdjSi9DYXVCU2VSTVUvbm41dEJaSmd1RzJDVkZu?=
 =?utf-8?B?ejNtM29XektWd2tpY3dLV1FzUWtSa2VWUnBIZmxsZHExYkpKVmRVL1I1ZCtI?=
 =?utf-8?B?dlYzVTBzYnpmclNxVzhxSWIwd1N0bnZUVm9kcGl4T3BZZjZIN1VZT09JS1dx?=
 =?utf-8?B?bHllQnNoRmZZRjRFWWlyTmk4YklLaGd4TmY5RVhaZGIrQ05iZlFBWFR4enlS?=
 =?utf-8?B?T0pVSkJHdC9jejhseHJnWkUvZjRnU0ZnYUd1dzhhemMyejF2VDFMNXhBenRY?=
 =?utf-8?B?YTBvN3dvcGxZRTJsYjlpNkZuSm4vVUFvSHZVMlFkTExLMERRQUE1YkdsYlk2?=
 =?utf-8?B?T0t1ZUpocTVidGxrVmZudWlFZkdzWlhLajQvT0tpTC9hQ1NPVnVyYlc5YTJK?=
 =?utf-8?B?QThPU3dBQkxaem1IQThSdk12VUg5QUtwb3RZdE5QeStIQ0ppOTRJYWJ3WkJO?=
 =?utf-8?B?MVdTUUNsd2YzaXlaaThJUUl6bzc5NG5kUy9oSDQrZXRETSt0NXFTN3dBSnB3?=
 =?utf-8?B?QmhJWHh0dklQdkJicnpnMGZPTWJ1RmJFdi9WNXM2dkxFQTcweUlLZzIrQXIx?=
 =?utf-8?B?cDI2ZHFvRzFSc1grd0t1aXFneTEzN0JVWFdSWjRnSXU2QzBMOXVTeTFVNTFF?=
 =?utf-8?B?VUxiYUNWaG0ycHFBSi94SGFVc1g2K2pNMHdXbUMxZ0MyVG9KWm5GMlJpMUJu?=
 =?utf-8?B?ZXNkZWxRYTZWZ0lxd3g3OTFwZGdjSENaYktrMm9HaXo3d29mLzBPRXIydkJE?=
 =?utf-8?B?cFFmVTdWaFJVUGJGZENacFdPTmJ3VlBmT21SU01Nd3V4NUFEVXlieEVtL2s2?=
 =?utf-8?B?b012bkhmczRwVEozWDJuOFdVK1RreGdKb01vNGt4TllVYWo1VHgyaFp5MXdm?=
 =?utf-8?B?YXZwakt2UHJvWHozVFBPWHIzYXVibDFQWmk3T0x5RmMrc1pmdXlmeTUrVXlY?=
 =?utf-8?B?aVNSRExPbFV1TXNVc2ZuQnhaSU9yNVZMU0VlRUUxSnJCTkVKZDZZZ256cTAy?=
 =?utf-8?B?eGhOSC9QUDY5a3F1U0sreXJGWUZJU09iUTdrdTdGWncrNm8wajl4U3c2a2wy?=
 =?utf-8?Q?p1sL1pA6JPmb8C1nXA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b989753-028c-4d46-fda8-08deb0bdacf6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:03:03.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thQvaYIhtpypos1lnfgL5w0jRsI6AcJKSmfSv9uVtsjmBSjmMXoIACkrOldWruTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
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

On 5/12/26 20:21, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add amd_userptr_invalidation test to verify that GPU page table entries
> are properly invalidated when the userspace backing of a USERPTR buffer
> object is released via munmap().
> 
> The test contains two subtests:
> 
>   userptr-unmap-revalidate:
>     Allocates a USERPTR BO, releases its backing via munmap(), then
>     submits a CS that still references the BO in the bo_list.  Verifies
>     that the kernel detects the invalidated BO during revalidation and
>     rejects the command submission.
> 
>   userptr-unmap-stress:
>     Allocates a 256 MB USERPTR region, establishes GPU mappings with an
>     initial SDMA copy, releases the backing via munmap(), then creates
>     memory pressure with pipes and child processes.  A second SDMA copy
>     through the old VA range is submitted without the USERPTR BO in the
>     bo_list.  Verifies that GPU PTEs were invalidated by checking for
>     GPU page faults (via klogctl) and confirming that the destination
>     buffer does not contain the original data pattern.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Skimming over it the patch looks like it does the right thing, but I'm certainly not an expert for the code base.

So only Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>  lib/amdgpu/amd_command_submission.c     |   2 +-
>  tests/amdgpu/amd_userptr_invalidation.c | 590 ++++++++++++++++++++++++
>  tests/amdgpu/meson.build                |   1 +
>  3 files changed, 592 insertions(+), 1 deletion(-)
>  create mode 100644 tests/amdgpu/amd_userptr_invalidation.c
> 
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index c80e06fb5..1a5fd9446 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -139,7 +139,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  						 0, &expired);
>  		ring_context->err_codes.err_code_wait_for_fence = r;
>  		if (expect_failure) {
> -			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status%d"
> +			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d\n"
>  				 "expired %d PID %d\n", r, expired, getpid());
>  		} else {
>  			/* we allow ECANCELED or ENODATA for good jobs temporally */
> diff --git a/tests/amdgpu/amd_userptr_invalidation.c b/tests/amdgpu/amd_userptr_invalidation.c
> new file mode 100644
> index 000000000..6938c11a4
> --- /dev/null
> +++ b/tests/amdgpu/amd_userptr_invalidation.c
> @@ -0,0 +1,590 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Test for USERPTR BO PTE invalidation after munmap.
> + *
> + * When userspace releases the backing pages of a USERPTR buffer object
> + * via munmap(), the kernel must invalidate the corresponding GPU page
> + * table entries so that subsequent command submissions through the same
> + * GPU virtual address range do not access the old physical pages.
> + *
> + * The test verifies two aspects of this behavior:
> + *
> + *   userptr-unmap-revalidate
> + *       Submits a CS that includes the USERPTR BO in its bo_list after
> + *       the backing has been released.  The kernel is expected to detect
> + *       the invalidated BO during revalidation and reject the submission.
> + *
> + *   userptr-unmap-stress
> + *       Allocates a large (256 MB) USERPTR region, establishes GPU
> + *       mappings via an initial SDMA copy, then releases the backing
> + *       and creates memory pressure with many pipes and child processes.
> + *       A second SDMA copy through the old VA range is submitted without
> + *       the USERPTR BO in the bo_list.  The test verifies that the GPU
> + *       does not read back the original data pattern (0xAA), confirming
> + *       that the PTEs were properly invalidated.
> + *
> + *       Detection uses three complementary signals:
> + *         - GPU page faults logged by the kernel (klogctl)
> + *         - destination buffer containing only zeros (dummy page)
> + *         - absence of original 0xAA pattern in destination
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <sys/klog.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "ioctl_wrappers.h"
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_ip_blocks.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_utils.h"
> +
> +#define BUF_SZ			(64 * 1024)
> +#define PM4_DW			256
> +
> +#define STRESS_TARGET_SZ	(256UL * 1024 * 1024)
> +#define STRESS_CHILDREN		2048
> +#define STRESS_PIPES		200000
> +#define STRESS_SCAN_CHUNK	(4UL * 1024 * 1024)
> +#define STRESS_PTE_STEP		(64UL * 1024 * 1024)
> +
> +/**
> + * count_gpu_page_faults() - count GPU page faults in dmesg for a given PID
> + * @pid: process ID to match in fault messages
> + * @since_uptime_ms: only count faults after this uptime (milliseconds)
> + *
> + * Read the kernel ring buffer via klogctl(3) and count lines containing
> + * "[gfxhub] page fault" followed by the given PID on the next line.
> + * Only messages with a kernel timestamp >= @since_uptime_ms are counted.
> + *
> + * Return: number of matching page fault entries.
> + */
> +static unsigned int
> +count_gpu_page_faults(pid_t pid, unsigned long since_uptime_ms)
> +{
> +	int bufsize, len;
> +	char *buf, *p, *line_start;
> +	unsigned int count = 0;
> +	unsigned int total_lines = 0;
> +	unsigned int fault_lines = 0;
> +	char pid_pattern[64];
> +	bool prev_was_fault = false;
> +
> +	snprintf(pid_pattern, sizeof(pid_pattern), "pid %d ", (int)pid);
> +
> +	bufsize = klogctl(10, NULL, 0);
> +	if (bufsize <= 0)
> +		bufsize = 1 << 20;
> +
> +	buf = malloc(bufsize + 1);
> +	if (!buf)
> +		return 0;
> +
> +	len = klogctl(3, buf, bufsize);
> +	if (len <= 0) {
> +		free(buf);
> +		return 0;
> +	}
> +	buf[len] = '\0';
> +
> +	line_start = buf;
> +	for (p = buf; p <= buf + len; p++) {
> +		const char *ts_start;
> +		double ts;
> +
> +		if (*p != '\n' && *p != '\0')
> +			continue;
> +
> +		*p = '\0';
> +		total_lines++;
> +
> +		/* Filter by kernel timestamp */
> +		ts_start = strchr(line_start, '[');
> +		if (ts_start && sscanf(ts_start, "[%lf]", &ts) == 1) {
> +			unsigned long ts_ms = (unsigned long)(ts * 1000.0);
> +
> +			if (ts_ms < since_uptime_ms) {
> +				prev_was_fault = false;
> +				line_start = p + 1;
> +				continue;
> +			}
> +		}
> +
> +		if (strstr(line_start, "[gfxhub] page fault")) {
> +			prev_was_fault = true;
> +			fault_lines++;
> +		} else if (prev_was_fault && strstr(line_start, pid_pattern)) {
> +			count++;
> +			prev_was_fault = false;
> +		} else {
> +			prev_was_fault = false;
> +		}
> +
> +		line_start = p + 1;
> +	}
> +
> +	igt_info("  klogctl: lines=%u faults=%u matched=%u\n",
> +		 total_lines, fault_lines, count);
> +	free(buf);
> +	return count;
> +}
> +
> +/**
> + * get_uptime_ms() - read current system uptime in milliseconds
> + *
> + * Read /proc/uptime for the kernel monotonic timestamp that matches
> + * the timestamps used in dmesg.
> + *
> + * Return: uptime in milliseconds, or 0 on error.
> + */
> +static unsigned long get_uptime_ms(void)
> +{
> +	FILE *fp;
> +	double uptime;
> +
> +	fp = fopen("/proc/uptime", "r");
> +	if (!fp)
> +		return 0;
> +	if (fscanf(fp, "%lf", &uptime) != 1)
> +		uptime = 0;
> +	fclose(fp);
> +	return (unsigned long)(uptime * 1000.0);
> +}
> +
> +/**
> + * amdgpu_userptr_unmap_revalidate() - test CS rejection after munmap
> + * @dev: amdgpu device handle
> + *
> + * Allocate a USERPTR BO, release its backing via munmap(), then submit
> + * a CS that still references the BO in its bo_list.  The kernel should
> + * detect that the BO pages are no longer valid and reject the CS.
> + *
> + * If the CS is accepted, the destination buffer is scanned for bytes
> + * that do not match the original fill or zero patterns.
> + */
> +static void amdgpu_userptr_unmap_revalidate(amdgpu_device_handle dev)
> +{
> +	const struct amdgpu_ip_block_version *ip_block;
> +	struct amdgpu_ring_context *ring_context;
> +	amdgpu_bo_handle up_bo;
> +	amdgpu_va_handle up_va_h;
> +	uint64_t up_va;
> +	void *up_cpu;
> +	amdgpu_bo_handle dst_bo;
> +	amdgpu_va_handle dst_va_h;
> +	uint64_t dst_mc;
> +	void *dst_cpu_ptr;
> +	uint8_t *dst;
> +	unsigned int suspicious;
> +	uint64_t i;
> +	int r;
> +
> +	ip_block = get_ip_block(dev, AMDGPU_HW_IP_DMA);
> +	igt_assert(ip_block);
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +	ring_context->write_length = BUF_SZ;
> +	ring_context->pm4 = calloc(PM4_DW, sizeof(*ring_context->pm4));
> +	ring_context->pm4_size = PM4_DW;
> +	ring_context->secure = false;
> +	ring_context->res_cnt = 2;
> +	igt_assert(ring_context->pm4);
> +
> +	r = amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* Allocate and fill USERPTR BO */
> +	up_cpu = mmap(NULL, BUF_SZ, PROT_READ | PROT_WRITE,
> +		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
> +	igt_assert(up_cpu != MAP_FAILED);
> +	memset(up_cpu, 0x77, BUF_SZ);
> +
> +	r = amdgpu_create_bo_from_user_mem(dev, up_cpu, BUF_SZ, &up_bo);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
> +				  BUF_SZ, sysconf(_SC_PAGE_SIZE), 0,
> +				  &up_va, &up_va_h, 0);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0, AMDGPU_VA_OP_MAP);
> +	igt_assert_eq(r, 0);
> +
> +	/* Allocate VRAM destination */
> +	r = amdgpu_bo_alloc_and_map(dev, BUF_SZ, sysconf(_SC_PAGE_SIZE),
> +				    AMDGPU_GEM_DOMAIN_VRAM,
> +				    AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +				    &dst_bo, &dst_cpu_ptr, &dst_mc,
> +				    &dst_va_h);
> +	igt_assert_eq(r, 0);
> +	memset(dst_cpu_ptr, 0, BUF_SZ);
> +
> +	/* Release USERPTR backing before CS */
> +	munmap(up_cpu, BUF_SZ);
> +
> +	/* Submit CS with invalidated USERPTR BO in bo_list */
> +	ring_context->bo_mc = up_va;
> +	ring_context->bo_mc2 = dst_mc;
> +	ring_context->resources[0] = up_bo;
> +	ring_context->resources[1] = dst_bo;
> +
> +	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +				     &ring_context->pm4_dw);
> +
> +	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 1);
> +	r = ring_context->err_codes.err_code_cs_submit;
> +
> +	if (r != 0) {
> +		igt_info("CS rejected (r=%d) after munmap\n", r);
> +	} else {
> +		dst = (uint8_t *)dst_cpu_ptr;
> +		suspicious = 0;
> +		for (i = 0; i < BUF_SZ; i++) {
> +			if (dst[i] != 0 && dst[i] != 0x77)
> +				suspicious++;
> +		}
> +		igt_info("CS completed: %u/%d unexpected bytes\n",
> +			 suspicious, BUF_SZ);
> +	}
> +
> +	amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc, BUF_SZ);
> +	amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0, AMDGPU_VA_OP_UNMAP);
> +	amdgpu_va_range_free(up_va_h);
> +	amdgpu_bo_free(up_bo);
> +	amdgpu_cs_ctx_free(ring_context->context_handle);
> +	free(ring_context->pm4);
> +	free(ring_context);
> +}
> +
> +/**
> + * amdgpu_userptr_unmap_stress() - stress test PTE invalidation
> + * @dev: amdgpu device handle
> + *
> + * Phase 1: Allocate a large USERPTR region filled with 0xAA, create a
> + *          VRAM destination BO, and perform an initial SDMA copy to
> + *          populate GPU page table entries.
> + *
> + * Phase 2: Release the USERPTR backing via munmap().  This triggers the
> + *          MMU notifier which should invalidate the GPU PTEs.
> + *
> + * Phase 3: Create memory pressure by opening many pipes and forking
> + *          child processes.  This increases the chance that the freed
> + *          physical pages are reassigned.
> + *
> + * Phase 4: Poison the destination with 0xCC and submit a second SDMA
> + *          copy through the old VA range without the USERPTR BO in the
> + *          bo_list.  If PTEs were invalidated, the GPU will fault and
> + *          the fault handler will redirect reads to a zeroed dummy page.
> + *          The test checks that no original 0xAA data appears in the
> + *          destination.
> + */
> +static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
> +{
> +	const struct amdgpu_ip_block_version *ip_block;
> +	struct amdgpu_ring_context *ring_context;
> +	amdgpu_bo_handle up_bo;
> +	amdgpu_va_handle up_va_h;
> +	uint64_t up_va;
> +	void *up_cpu;
> +	amdgpu_bo_handle dst_bo;
> +	amdgpu_va_handle dst_va_h;
> +	uint64_t dst_mc;
> +	void *dst_cpu_ptr;
> +	int (*pipes)[2];
> +	unsigned int pipes_opened;
> +	pid_t *children;
> +	unsigned int children_spawned;
> +	uint64_t off;
> +	unsigned int i;
> +	pid_t pid;
> +	volatile uint8_t sink;
> +	uint8_t *base;
> +	uint8_t *scan;
> +	uint64_t p;
> +	unsigned int non_poison;
> +	unsigned int original_count;
> +	unsigned int page_faults;
> +	unsigned long ts_before;
> +	pid_t my_pid;
> +	int r;
> +
> +	up_bo = NULL;
> +	up_cpu = MAP_FAILED;
> +	pipes = NULL;
> +	pipes_opened = 0;
> +	children = NULL;
> +	children_spawned = 0;
> +
> +	ip_block = get_ip_block(dev, AMDGPU_HW_IP_DMA);
> +	igt_assert(ip_block);
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +	ring_context->pm4 = calloc(PM4_DW, sizeof(*ring_context->pm4));
> +	ring_context->pm4_size = PM4_DW;
> +	ring_context->secure = false;
> +	igt_assert(ring_context->pm4);
> +
> +	r = amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(dev, STRESS_SCAN_CHUNK,
> +				    sysconf(_SC_PAGE_SIZE),
> +				    AMDGPU_GEM_DOMAIN_VRAM,
> +				    AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +				    &dst_bo, &dst_cpu_ptr, &dst_mc,
> +				    &dst_va_h);
> +	igt_assert_eq(r, 0);
> +
> +	/* Phase 1: allocate USERPTR region and establish GPU mappings */
> +	igt_info("Phase 1: allocating %lu MB USERPTR region\n",
> +		 (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
> +
> +	up_cpu = mmap(NULL, STRESS_TARGET_SZ, PROT_READ | PROT_WRITE,
> +		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
> +	igt_assert(up_cpu != MAP_FAILED);
> +	memset(up_cpu, 0xAA, STRESS_TARGET_SZ);
> +
> +	r = amdgpu_create_bo_from_user_mem(dev, up_cpu, STRESS_TARGET_SZ,
> +					   &up_bo);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
> +				  STRESS_TARGET_SZ, sysconf(_SC_PAGE_SIZE), 0,
> +				  &up_va, &up_va_h, 0);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
> +			     AMDGPU_VA_OP_MAP);
> +	igt_assert_eq(r, 0);
> +
> +	/* Touch pages at intervals to populate GPU PTEs */
> +	sink = 0;
> +	base = (uint8_t *)up_cpu;
> +	for (off = 0; off < STRESS_TARGET_SZ; off += STRESS_PTE_STEP)
> +		sink += base[off];
> +	(void)sink;
> +
> +	/* Initial SDMA copy to ensure GPU has walked the page tables */
> +	ring_context->bo_mc = up_va;
> +	ring_context->bo_mc2 = dst_mc;
> +	ring_context->write_length = STRESS_SCAN_CHUNK;
> +	ring_context->resources[0] = up_bo;
> +	ring_context->resources[1] = dst_bo;
> +	ring_context->res_cnt = 2;
> +
> +	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +				     &ring_context->pm4_dw);
> +	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 0);
> +	igt_assert_eq(r, 0);
> +	igt_info("Phase 1: initial SDMA copy OK\n");
> +
> +	/* Phase 2: release USERPTR backing */
> +	igt_info("Phase 2: munmap() %lu MB USERPTR backing\n",
> +		 (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
> +	my_pid = getpid();
> +	ts_before = get_uptime_ms();
> +	munmap(up_cpu, STRESS_TARGET_SZ);
> +	up_cpu = MAP_FAILED;
> +
> +	/* Phase 3: create memory pressure */
> +	igt_info("Phase 3: creating memory pressure\n");
> +
> +	pipes = calloc(STRESS_PIPES, sizeof(*pipes));
> +	igt_assert(pipes);
> +
> +	for (i = 0; i < STRESS_PIPES; i++) {
> +		if (pipe(pipes[i]) < 0) {
> +			igt_info("  pipe allocation stopped at %u/%d (errno=%d)\n",
> +				 i, STRESS_PIPES, errno);
> +			break;
> +		}
> +		(void)write(pipes[i][1], "X", 1);
> +		pipes_opened = i + 1;
> +	}
> +	igt_info("  opened %u pipes\n", pipes_opened);
> +
> +	children = calloc(STRESS_CHILDREN, sizeof(*children));
> +	igt_assert(children);
> +
> +	for (i = 0; i < STRESS_CHILDREN; i++) {
> +		pid = fork();
> +		if (pid == 0) {
> +			pause();
> +			_exit(0);
> +		}
> +		igt_assert(pid > 0);
> +		children[i] = pid;
> +		children_spawned = i + 1;
> +	}
> +	igt_info("  spawned %u children\n", children_spawned);
> +
> +	/*
> +	 * Phase 4: submit SDMA copy through the old VA range.
> +	 *
> +	 * The USERPTR BO is intentionally omitted from the bo_list so
> +	 * the kernel does not attempt to revalidate it.  If the PTEs
> +	 * were invalidated, the SDMA engine will fault and the kernel
> +	 * fault handler will map a zeroed dummy page, so the
> +	 * destination will contain zeros instead of the original 0xAA.
> +	 */
> +	igt_info("Phase 4: submitting CS through unmapped VA range\n");
> +
> +	memset(dst_cpu_ptr, 0xCC, STRESS_SCAN_CHUNK);
> +
> +	memset(ring_context->pm4, 0, PM4_DW * sizeof(uint32_t));
> +	ring_context->pm4_dw = 0;
> +	ring_context->bo_mc = up_va;
> +	ring_context->bo_mc2 = dst_mc;
> +	ring_context->write_length = STRESS_SCAN_CHUNK;
> +	ring_context->res_cnt = 1;
> +	ring_context->resources[0] = dst_bo;
> +
> +	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +				     &ring_context->pm4_dw);
> +
> +	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 1);
> +	if (ring_context->err_codes.err_code_cs_submit != 0) {
> +		igt_info("  CS rejected (r=%d)\n",
> +			 ring_context->err_codes.err_code_cs_submit);
> +		goto cleanup;
> +	}
> +
> +	/* Scan destination for original data pattern */
> +	scan = (uint8_t *)dst_cpu_ptr;
> +	non_poison = 0;
> +	original_count = 0;
> +	for (p = 0; p < STRESS_SCAN_CHUNK; p++) {
> +		if (scan[p] != 0xCC)
> +			non_poison++;
> +		if (scan[p] == 0xAA)
> +			original_count++;
> +	}
> +
> +	igt_info("  %u/%lu non-poison bytes (%u original 0xAA)\n",
> +		 non_poison, (unsigned long)STRESS_SCAN_CHUNK,
> +		 original_count);
> +
> +cleanup:
> +	for (i = 0; i < children_spawned; i++) {
> +		kill(children[i], SIGKILL);
> +		waitpid(children[i], NULL, 0);
> +	}
> +	free(children);
> +
> +	for (i = 0; i < pipes_opened; i++) {
> +		close(pipes[i][0]);
> +		close(pipes[i][1]);
> +	}
> +	free(pipes);
> +
> +	/*
> +	 * Read GPU page faults after releasing file descriptors so
> +	 * klogctl has room to work.  Brief sleep to let deferred
> +	 * printk flush any remaining fault messages.
> +	 */
> +	usleep(500000);
> +	page_faults = count_gpu_page_faults(my_pid, ts_before);
> +	igt_info("  %u GPU page faults for PID %d\n",
> +		 page_faults, (int)my_pid);
> +
> +	if (up_bo) {
> +		amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
> +				AMDGPU_VA_OP_UNMAP);
> +		amdgpu_va_range_free(up_va_h);
> +		amdgpu_bo_free(up_bo);
> +	}
> +
> +	amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc, STRESS_SCAN_CHUNK);
> +	amdgpu_cs_ctx_free(ring_context->context_handle);
> +	free(ring_context->pm4);
> +	free(ring_context);
> +
> +	/*
> +	 * Invalidation is confirmed when any of the following holds:
> +	 *
> +	 *   (a) CS was rejected outright (already handled above).
> +	 *   (b) GPU page faults were logged for this PID.
> +	 *   (c) Destination contains non-original data (zeros from the
> +	 *       dummy page), proving PTEs no longer point at the old
> +	 *       physical pages.
> +	 *
> +	 * Page fault messages may be suppressed by printk ratelimiting,
> +	 * so the data pattern check (c) is the primary detection method.
> +	 */
> +	if (page_faults > 0) {
> +		igt_info("PTE invalidation confirmed: %u page faults\n",
> +			 page_faults);
> +	} else if (non_poison > 0 && original_count == 0) {
> +		igt_info("PTE invalidation confirmed: dummy page data\n");
> +	} else {
> +		igt_assert_f(non_poison == 0 || original_count == 0,
> +			     "destination contains %u bytes of original data "
> +			     "(0xAA) after munmap with no GPU page faults\n",
> +			     original_count);
> +	}
> +}
> +
> +int igt_main()
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	uint32_t major, minor;
> +	int fd = -1;
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +
> +	igt_fixture() {
> +		log_total_time(true, igt_test_name());
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		r = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(r == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +
> +		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +
> +		asic_rings_readness(device, 1, arr_cap);
> +	}
> +
> +	igt_describe("Submit CS with USERPTR BO in bo_list after munmap "
> +		     "and verify the kernel rejects it");
> +	igt_subtest_with_dynamic("userptr-unmap-revalidate") {
> +		igt_require(arr_cap[AMD_IP_DMA]);
> +		igt_dynamic_f("userptr-unmap-revalidate")
> +			amdgpu_userptr_unmap_revalidate(device);
> +	}
> +
> +	igt_describe("Stress test: release large USERPTR backing under "
> +		     "memory pressure and verify GPU PTEs are invalidated");
> +	igt_subtest_with_dynamic("userptr-unmap-stress") {
> +		igt_require(arr_cap[AMD_IP_DMA]);
> +		igt_dynamic_f("userptr-unmap-stress")
> +			amdgpu_userptr_unmap_stress(device);
> +	}
> +
> +	igt_fixture() {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +		log_total_time(false, igt_test_name());
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 0dc689e40..801239547 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -53,6 +53,7 @@ if libdrm_amdgpu.found()
>  			  'amd_vpe',
>  			  'amd_mem',
>  			  'amd_remote_mem',
> +                          'amd_userptr_invalidation',
>  			]
>  	if libdrm_amdgpu.version().version_compare('> 2.4.97')
>  		amdgpu_progs +=[ 'amd_syncobj', ]

