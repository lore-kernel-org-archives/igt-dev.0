Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBCE109193D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 09:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0A10EAB5;
	Fri, 20 Mar 2026 09:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J+ZgHX4n";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F2410EAB5
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 09:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaNqwiS7XtNMrD/0ekaFhKgvmPPjYM2BcCRW5HbrEf1QzIrQjAAPqMElKKEbZYT2+i1sdKayYG+J1MnsfObV5VwT16XlU2zQPijXvE6trJ/na5XZzjc4IQNDROrHzD9wd4V8FJ3y43qt9GDeChqlkPMmg3xI+mQID9cDEnG4sW9qcaWPb76+aqKbSBJScb99mZHv1uADpyOJ8/MYrtr4hw4nhDFjqb+uSG3V/SK7FT5mBkMyYdC9SzAtfPCQ2KAA3J9EdtoG581OfbPQ6Y19IsNthlePOkO3HY1gwhZBODivAiyIVPE9F9EVvPA75ESzcZ/gOWPZZPXJDGJAWM+M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49QTWUCNlX90540d8haVphevcZs0udmhGIx6Wq0ndqE=;
 b=ZVgeMH+HEzgripivz7DWSxy2nr+WaZsBap4B/6N1GuwtcgdwegqVBB1Xj4rOK8Pkasi6Ve1F7JmBXE/GtxBajKfjlM3V/jyN95OYQeZRHwVEFtfrcQJxuG9HUQ5nocQmysMO19T3ZBScqKKnA771ydUe4SHEdYSTZjCpCP+rV1kcOyRvhjkA0qObrSX9K+MqnM2i34J6qIxB6rbaaCZBuTXh16gYb46aJBLQXW/vl3OHyyP6F8w60atXBkLlDS3uuqyZ1JSA8ftUphpMHWrtrJ/fWcr4rBt8cgt4uNYVxNKJGCjUS+jyDjccWNwA+6LmXdrB1xlwfOP/hAPaUnL7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QTWUCNlX90540d8haVphevcZs0udmhGIx6Wq0ndqE=;
 b=J+ZgHX4nz1ywaqCmSVqWCaDMzHLm50gbCVMXkie+sYCSG/Afp6jSl8PnD+b3i55JKGt6e1pf1ynkcMtNKQCgPHCBOKBTlHB/kuxiFwQzCuAdGtMagi+0xljJIcurtcDhLzc3s4Sccu3ji17UzR6r0G6CDfKlW0IFUUxlwD1L8i8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 09:33:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:33:08 +0000
Message-ID: <829821e7-5c34-4c3b-b24d-c45741898550@amd.com>
Date: Fri, 20 Mar 2026 10:33:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/amdgpu: add DMA-BUF fence-outlives-module
 unload test
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
References: <20260320000553.91398-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260320000553.91398-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b0ce73-d508-4f31-d9e2-08de8663b1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Z91cKeDNshKLbElBPZheBKjYhAU0aBb0T4UtOV/FKTEp9myktQfsjQhQDPN7neBnvqB+Way/Qo/HHZLHWAeNBFLi12k+QJJloFjun0HrmDTljLIP1vvfVDcPPoN/nrs2MKaiA6YdAXi0xY9cAA8/jSFEKXcJVud6o3t14+UI1w7Xbqee25iF7tH5e2yzXyVB3Zy+tvxYhW6YzOH2S5tHZz7ZN9eZkazfb1zHmlDMWZKKAz+OL3o39i5cGen48G3rLj9SDe16fJZmDkZpbweD09W+l5jZo55m8E4HHVnouur6kO6vROZkNu9PVxFJ1FcWX8KcGX2uhdVphLCf9mylZf0W6Asa0xVFVqGvgPTvA69cWzM7BZ7Jsld/hN8n/5To12w5tSgrzvAZGOPcYfKgnOuGmPNEqJ6Rf+j9xWasOgASeEUTQZz6sG3naozMFf6BZb/teROfY39AKz48jV0/kNuf+lTBQ8lRgpiqOzMun1Ug5rrDrf333WEAL4f1/JsJPFfYs+fpv28fc5zBL2tTjfZXyyQ8i19Me9O2IBfxGCNgc4BgEWB0Gz9bY+9YOaJac8KRtaAlVzbwb6279C6O4F+J2b2/oTh7XIptzacpSvc8stHxWuDyGhCTznM0GQqgxQsAFiTbwMFAwkk4Zrk/blwmNpoYHrzSyCz0/8yL8YSy+I4inmt6FAE9K/7rczPb7apZf0yhC6z8Hw/CbYKtjz3tkkPvmKw4SnxkHLIvB3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emlnZ2JBYURQblFjY003MTgwd3pLUnNCN2pvY3EwbVhZdC85SWN6SlNFN2l6?=
 =?utf-8?B?T3VzazB0NTd6bkFJVkZnWm1OWi8weHhIZTQ3aHcyQUErSzhRbkl1N3FjSEJ5?=
 =?utf-8?B?aVp5NjBtb1NOOXZkWTZhR3hzMzFJUU9Ec3NMRXB6UVlrb2dpb0ZiZTFvbTFh?=
 =?utf-8?B?c1MwUUNabTlmVFVmQ2tsdFZPMDE0dlNqZE1tRDc2UlhqbGZsb2E5Y2lOV2dp?=
 =?utf-8?B?RTFKbHRJNitwZU5OWk5rMTlab3JVY0JjZ1ZkWmNFdnBINEZPWkt1aVhHb0JP?=
 =?utf-8?B?WE9iVE1wR2YxbFJlK0JEU1lkQ2NiaWVGUFNlQ2c0UnVZc3lpS0R4aU9Wczl5?=
 =?utf-8?B?SkZodElqMXlrUk9WU0VYcG9xSlZKR1pVbCtGc2RYbGZxMjhXT0tRMVRDZFB0?=
 =?utf-8?B?SW9seXB3RlA0bmdQaGFVYWNLV05lS1p0RXI4YkNSVm9YSGpKNVRSQ20xMWd3?=
 =?utf-8?B?a25lYnNGUU1LckdpQTdNUWx5UGQzTHYrbTJkNitsTElUZXRoTll1eW5yVTh5?=
 =?utf-8?B?bk41cWRUaU9md29WMndFYTFTYUVreXFrQ250T2hpVVllbWUzbVJkWWlndDJn?=
 =?utf-8?B?WEJEUG5WaGthN3pyeEQ3aEdya0pUWDJ4WmcvanlDaWltZHR5eDNjeVVBdmRL?=
 =?utf-8?B?aXVFczFFNDZUSVFhTW4xbloxOGdvZ0VlRENGNXUxcVR5dlRMdDNOOVhHa1Jj?=
 =?utf-8?B?MlJFdXlORjFYTk5hYTBYWTFFbHZJcmhpTStsNWZYNHE3QW1EUmt1T1hBNFJU?=
 =?utf-8?B?MHFEeDJPN3BLZ0ljU09uOUgxRjdIcHlua1h1Z1QxNVk3UHp3SXRQTFhQc0k3?=
 =?utf-8?B?RGZoVXY2bUhoTGVDb3pPUGVQNGN2ZXFIczBRVkU5YnRXbEFzTE03QlQvclJy?=
 =?utf-8?B?RTBoS3JHcFRtbXZEZUVTK2dhV2xCeWhLS0M4V1pDS29TbkNCSnVjR1JtUDJ5?=
 =?utf-8?B?UDlwLytYQU1weTBwUDZIRnVzOEdsWnJyR0xXa2E2cTFVa0JaeU9hL2tmOEVW?=
 =?utf-8?B?OWNROWNaVnBWZEFQRFI2cWhSTFdEYWl6SmJWLzc5a1BRQnVoblI3TzgzOGxr?=
 =?utf-8?B?UU5ncktTby9rWm4wV3FHeWpBa2dueW5sSHpBT2Rnb2lVNnhGV2QrQ2ZFaDdM?=
 =?utf-8?B?d3QrREFYYzBFZ0ZNS2JubWZ5TjdVbDI5SjhsS2I1anVKS0tVczFUQjFjTzA4?=
 =?utf-8?B?RUxiNzl0NGJsZTZoelJ5dktJcTNjYU5xNHJaZi8xWmY5SGlSZ05ZbFZuekdo?=
 =?utf-8?B?cENMME9hdlN2QjAwNTFHTldBUlh0RWhCaFhPajNXdWZnZGJUL203UWZvYTJq?=
 =?utf-8?B?YS9pbDJBeFYrY1hXZXpXdnRJVTVhT09ZVC9FOXhONWNqU1NGaTFtSHFnWnRp?=
 =?utf-8?B?TUdpL1crc3NQN3JMeU5nM3VCRmpRWFVRWnZtOVhOaWw2VE1Yb2lyd0owMG8w?=
 =?utf-8?B?QXJpdmE0d2ZoSkoyN3BMMnVkNnpIaDR1OUlBSzZNMUtRV0VaSWJ1SnQyOEJv?=
 =?utf-8?B?ZWJJTWNKWkcxZ3VPMURiaitITy9KQzhVSGQ0S25aUUJ6cjJsYS9jaXNjMXFC?=
 =?utf-8?B?M2JDK2I0S0p5U2dtUThoZGdmN3ZJS21zL01OdVdKL2s2eEVTZGlkMUdhdVo5?=
 =?utf-8?B?bmV5VnJUQ0tsaEpPOE1BcDlMSWM3Nkg4ZzVmU3AvZDVwRk16ZFo3MkNpeDNh?=
 =?utf-8?B?dDIvdjBjRWE4WVMvS3V4UVoxcU5wRzdodGJxNW50NVhJYzJtdVF5d3JpTll2?=
 =?utf-8?B?TklmWE80WCtHWmcvV2VPcUZnb1ozeHJnQ1p3VnVyWXl4Y0NFY3pqV2VCQlhv?=
 =?utf-8?B?WXVhUi92eURNa1AySXpaRXBmNHp0VS96Qy9ZZlo4UE4xNldIYnFxc2xJMjVK?=
 =?utf-8?B?SW4xRU14eVpRaG1jTktxdlVNbEd2ZFA2TEdKMXUzSFBtRml5TDRaaFBGK1Y0?=
 =?utf-8?B?TEJLWFdpUDlabUlRcyttQ2V3SGlMM3BrdDlDaFJJckFJZlZ5dE5QUEx0OEZ2?=
 =?utf-8?B?L2ZKZCs1bjdGMW93U2VOejhTQWJNOUUwS0phMXlxdmxNYUpTUUY3YXlSenBu?=
 =?utf-8?B?NE94Rk14SHlZQ05MZ3BIN0ZybGo3azA0UFYvTVZCZDR0SFp1bGdTOGkvYkZM?=
 =?utf-8?B?T09ZSloySjB4S3kzcHNoTkFGelkzYjd2TTY0SUcrRU1tN1J6dy9aUVprM21O?=
 =?utf-8?B?bmJET2lBbHVhM0o4NWl4R3QwSjBlSUt0bFQ3eVYvQWZFYXJEdVAxVDNwdmh4?=
 =?utf-8?B?Y1RGbEE1aXdBUkdmNHc5S3IvZG5HcWFLNjBrTUxQOXNGY2I4WUpZYzdZUGNR?=
 =?utf-8?Q?tS4iBoIc1QYneVvAnH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b0ce73-d508-4f31-d9e2-08de8663b1ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:33:08.1937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9gFhEuKgmshtfEekN4ad2Lgr5xIilzO2srHWSgyJfoZn0EcEa3rqBcQOUMF+tUO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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

On 3/20/26 01:05, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add amd_dmabuf_unload, a test that validates fence independence
> during amdgpu module unload with cross-driver (VGEM) DMA-BUF
> shared reservations.
> 
> The fence-outlives-module subtest:
>   1. Creates a VGEM BO and exports it as a DMA-BUF.
>   2. Imports the DMA-BUF into amdgpu and maps it into GPU VA space
>      so the kernel can validate it during CS submission.
>   3. Submits 64 max-size SDMA copy_linear operations with the
>      imported BO in the bo_list, attaching SDMA fences to the
>      VGEM BO's dma_resv.
>   4. Closes all amdgpu fds WITHOUT waiting for completion, then
>      rmmods amdgpu.
>   5. After unload, poll()s the DMA-BUF fd to exercise dma_resv
>      fences whose ops/spinlock/names pointed into the now-unloaded
>      module.
> 
> Without the fence independence patches this is a use-after-free;
> with them the fences are self-contained and safe.  Best run with
> KASAN enabled.
> 
> v2 : Update header SPDX-License-Identifier: MIT
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Acked-by: Christian König <christian.koenig@amd.com> for both patches.

> ---
>  tests/amdgpu/amd_dmabuf_unload.c | 264 +++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build         |   1 +
>  2 files changed, 265 insertions(+)
>  create mode 100644 tests/amdgpu/amd_dmabuf_unload.c
> 
> diff --git a/tests/amdgpu/amd_dmabuf_unload.c b/tests/amdgpu/amd_dmabuf_unload.c
> new file mode 100644
> index 000000000..05ca3cf2c
> --- /dev/null
> +++ b/tests/amdgpu/amd_dmabuf_unload.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include <poll.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +#include "igt_vgem.h"
> +#include "drmtest.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_ip_blocks.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_memory.h"
> +
> +/**
> + * TEST: amd dmabuf unload
> + * Description: Test fence independence during amdgpu module unload with
> + *              outstanding SDMA fences on cross-driver (VGEM) DMA-BUF
> + *              shared reservations.
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: DRM
> + * Functionality: prime
> + * Test category: GEM_Legacy
> + * Feature: prime, vgem
> + *
> + * SUBTEST: fence-outlives-module
> + * Description: Validates fence independence patches.  Submits 64 max-size
> + *              SDMA copy_linear operations on a bo_list that includes an
> + *              imported VGEM DMA-BUF, attaching SDMA fences to the VGEM
> + *              BO dma_resv.  Closes all amdgpu fds WITHOUT waiting for
> + *              completion, then rmmods amdgpu.  After unload, poll()s the
> + *              DMA-BUF fd to iterate dma_resv fences whose ops/spinlock/
> + *              names pointed into the now-unloaded module.  Without the
> + *              fence independence patches this is a use-after-free; with
> + *              them the fences are self-contained.
> + *              Best run with KASAN enabled to catch the UAF.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test amdgpu module unload safety with imported DMA-BUF "
> +		      "references from VGEM driver.");
> +
> +/**
> + * dmabuf_busy - check whether a DMA-BUF fd has unsignaled fences
> + * @fd: DMA-BUF file descriptor
> + * @write: true to check for exclusive (write) fences, false for shared (read)
> + *
> + * Returns true if poll() indicates the fd is not yet ready (busy).
> + */
> +static bool dmabuf_busy(int fd, bool write)
> +{
> +	struct pollfd pfd = { .fd = fd, .events = write ? POLLOUT : POLLIN };
> +
> +	return poll(&pfd, 1, 0) == 0;
> +}
> +
> +/* Number of back-to-back SDMA copies to submit without waiting. */
> +#define NUM_SDMA_COPIES 64
> +
> +/**
> + * test_fence_outlives_module - fence independence validation
> + * @vgem: VGEM device fd
> + * @amd_fd: amdgpu device fd (will be closed inside this function)
> + * @dev: amdgpu device handle
> + *
> + * Create amdgpu SDMA fences on a cross-driver shared buffer, then close
> + * every amdgpu fd so the module can actually be unloaded.  After rmmod,
> + * the fences survive in the VGEM BO dma_resv.  Accessing them (via poll)
> + * exercises fence->ops, fence->lock, and the driver/timeline name strings
> + * -- all of which used to live in the module .text/.data.
> + *
> + * Without the patches: use-after-free (KASAN splat or crash).
> + * With the patches: fences are self-contained and safe.
> + */
> +static void test_fence_outlives_module(int vgem, int amd_fd,
> +				       amdgpu_device_handle dev)
> +{
> +	struct amdgpu_bo_import_result import;
> +	struct amdgpu_dma_limits limits = {0};
> +	amdgpu_bo_handle src_bo, dst_bo;
> +	amdgpu_va_handle src_va, dst_va, imp_va;
> +	void *src_cpu, *dst_cpu;
> +	uint64_t src_mc, dst_mc, imp_mc, copy_size;
> +	cmd_context_t *cmd_ctx;
> +	struct vgem_bo bo;
> +	int dmabuf, r, i;
> +
> +	/* Create VGEM BO and export as DMA-BUF */
> +	bo.width = 1024;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(vgem, &bo);
> +	dmabuf = prime_handle_to_fd(vgem, bo.handle);
> +
> +	/* Import the VGEM DMA-BUF into amdgpu */
> +	r = amdgpu_bo_import(dev, amdgpu_bo_handle_type_dma_buf_fd,
> +			     dmabuf, &import);
> +	igt_assert_eq(r, 0);
> +
> +	/* Query max SDMA copy size from HW limits */
> +	amdgpu_dma_limits_query(dev, &limits);
> +	copy_size = limits.sdma_max_bytes;
> +	igt_assert(copy_size > 0);
> +
> +	/* Allocate source BO and fill with pattern */
> +	r = amdgpu_bo_alloc_and_map(dev, copy_size, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +				    &src_bo, &src_cpu, &src_mc, &src_va);
> +	igt_assert_eq(r, 0);
> +	memset(src_cpu, 0xDE, copy_size);
> +
> +	/* Allocate destination BO */
> +	r = amdgpu_bo_alloc_and_map(dev, copy_size, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +				    &dst_bo, &dst_cpu, &dst_mc, &dst_va);
> +	igt_assert_eq(r, 0);
> +
> +	/* Create SDMA command context */
> +	cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false,
> +				     copy_size, src_bo, src_mc,
> +				     (volatile uint32_t *)src_cpu);
> +	igt_assert(cmd_ctx != NULL);
> +
> +	/*
> +	 * Map the imported VGEM BO into GPU VA space so the kernel can
> +	 * validate it during amdgpu_cs_vm_handling().  Without a VA
> +	 * mapping the BO in the bo_list causes a GPU page fault.
> +	 */
> +	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
> +				  4096, 4096, 0, &imp_mc, &imp_va, 0);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_bo_va_op(import.buf_handle, 0, 4096, imp_mc, 0,
> +			     AMDGPU_VA_OP_MAP);
> +	igt_assert_eq(r, 0);
> +
> +	/* Set up bo_list: IB (src), dst, imported VGEM BO */
> +	cmd_ctx->ring_ctx->bo2 = dst_bo;
> +	cmd_ctx->ring_ctx->bo_mc2 = dst_mc;
> +	cmd_ctx->ring_ctx->resources[1] = dst_bo;
> +	cmd_ctx->ring_ctx->resources[2] = import.buf_handle;
> +	cmd_ctx->ring_ctx->res_cnt = 3;
> +
> +	igt_info("Submitting %d x %llu-byte SDMA copies (no wait)...\n",
> +		 NUM_SDMA_COPIES, (unsigned long long)copy_size);
> +
> +	for (i = 0; i < NUM_SDMA_COPIES; i++) {
> +		r = cmd_submit_copy_linear(cmd_ctx,
> +					   src_mc, dst_mc,
> +					   (uint32_t)copy_size);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	igt_info("All %d copies submitted -- closing immediately "
> +		 "(no wait)...\n", NUM_SDMA_COPIES);
> +
> +	/*
> +	 * Do NOT wait -- close everything immediately.
> +	 * SDMA fences stay in the VGEM BO dma_resv.
> +	 */
> +	drm_close_driver(amd_fd);
> +
> +	/*
> +	 * At this point:
> +	 *   - Zero open amdgpu file descriptors
> +	 *   - The VGEM BO dma_resv still holds references to amdgpu
> +	 *     SDMA fences (likely still unsignaled -- 64 x max-SDMA
> +	 *     copies take seconds)
> +	 *   - We hold the DMA-BUF fd and VGEM BO handle
> +	 *
> +	 * Unload the module.  With no open amdgpu fds this should
> +	 * succeed.
> +	 */
> +	igt_info("All amdgpu fds closed, attempting module unload...\n");
> +	r = igt_kmod_unload("amdgpu");
> +	igt_info("igt_kmod_unload returned %d\n", r);
> +
> +	if (r == 0) {
> +		bool busy_r, busy_w;
> +
> +		/*
> +		 * Module unloaded.  amdgpu .text/.data is unmapped.
> +		 * Exercise dma_resv fences via poll() -- this calls
> +		 * fence->ops->signaled and touches fence->lock, which
> +		 * used to point into module memory.
> +		 */
> +		igt_info("Module unloaded -- exercising fences via "
> +			 "poll()...\n");
> +
> +		busy_r = dmabuf_busy(dmabuf, false);
> +		igt_info("DMA-BUF read-busy:  %s\n",
> +			 busy_r ? "yes" : "no");
> +
> +		busy_w = dmabuf_busy(dmabuf, true);
> +		igt_info("DMA-BUF write-busy: %s\n",
> +			 busy_w ? "yes" : "no");
> +
> +		igt_info("Fences survived module unload -- reloading...\n");
> +		r = igt_kmod_load("amdgpu", NULL);
> +		igt_info("Module reload returned %d\n", r);
> +	} else {
> +		igt_info("Module unload refused (r=%d) -- fences may hold "
> +			 "module refs (expected with patches)\n", r);
> +	}
> +
> +	close(dmabuf);
> +	gem_close(vgem, bo.handle);
> +}
> +
> +int igt_main()
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	int vgem = -1, amd = -1;
> +	uint32_t major, minor;
> +	int err, r;
> +
> +	igt_fixture() {
> +		uint64_t cap;
> +
> +		vgem = drm_open_driver(DRIVER_VGEM);
> +		igt_require(vgem >= 0);
> +
> +		amd = drm_open_driver(DRIVER_AMDGPU);
> +		igt_require(amd >= 0);
> +
> +		err = amdgpu_device_initialize(amd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +
> +		/* Verify PRIME import/export support */
> +		igt_require(drmGetCap(vgem, DRM_CAP_PRIME, &cap) == 0 &&
> +			    (cap & DRM_PRIME_CAP_EXPORT));
> +		igt_require(drmGetCap(amd, DRM_CAP_PRIME, &cap) == 0 &&
> +			    (cap & DRM_PRIME_CAP_IMPORT));
> +	}
> +
> +	/*
> +	 * This subtest closes the fixture amdgpu fd so that rmmod can
> +	 * succeed, then re-opens it for fixture teardown.
> +	 */
> +	igt_subtest("fence-outlives-module") {
> +		test_fence_outlives_module(vgem, amd, device);
> +
> +		/* Re-open for fixture teardown */
> +		amd = drm_open_driver(DRIVER_AMDGPU);
> +		err = amdgpu_device_initialize(amd, &major, &minor, &device);
> +		igt_assert_eq(err, 0);
> +	}
> +
> +	igt_fixture() {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(amd);
> +		drm_close_driver(vgem);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index dcfb7685a..6bbe5009d 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -15,6 +15,7 @@ if libdrm_amdgpu.found()
>  			  'amd_cs_nop',
>  			  'amd_cursor_overlay',
>  			  'amd_deadlock',
> +                          'amd_dmabuf_unload',
>  			  'amd_dp_dsc',
>  			  'amd_freesync_video_mode',
>  			  'amd_fuzzing',

