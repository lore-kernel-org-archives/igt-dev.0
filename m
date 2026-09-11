Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F52AC88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 20:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384A10E1F5;
	Fri, 11 Sep 2026 20:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0NsFGFHj";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012002.outbound.protection.outlook.com
 [40.93.195.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E72510E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOid6MAYg+sjE1MBLBPAEjyseSOfPWgFUu61WDPW9L8zA9Wh/kIr4pEp8nyIvU1x+x7yASrG6iRjifF2m0D7HdZOrDkzQkCKIxawdRM1Z3WRy1AWZAcJPc7JccgUb/xRndw59VK3H1MQkvPt14C9jQE8AHCrpKsfcm1o30CaygYxgvXOMT2XxlgbBIbJ7Jq3W4g3/IWGhIQLITk4cbOxGXgbqf/GwU+0xB16rR3ArMTU/mWzaQ8ew4C1Gpy8xtR3xmhyFFilOMdDG8UJYcw7/DCGmsVt6+yWzepkj+Pr7hEA+hdyX6gMofvON01thqMRJHFvKqAw86fkfz+xwT3fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UFMJdkSs/TaDQsr0Nn0EqkRLDbagrPLti9EzNXX6ls=;
 b=sL1eJl/aSO7U097MAw6mBOzQilxhNIPKEJGki7/jCiTVDXA2cBz4KB6ZdhM+KGr5kYLaqOPVbY4w2Ovf4WWL2nvj2NC39R5aGMZgbADy3xdLyT/QyZ/S1sHA02RpylEbaPfoOhixdLP4xIh2gj53el0mwPE1GvnXM7nEIrJOxAhQOi2Nq2tobnEsvXnGDW0dPeZY7S2OL8b2Q8zmBDuB0Begxphz7qWQX6hiTKHvQ4mlBTJGwC4CthzXWwvYy1eacSuNwrBA4b2w5bRvnamb0KN+OtVD7nuSQx2mcmgTJThhiPQyuckma7G8bxgdLHdj53Rcc3b2N2KTU+U7/G8QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UFMJdkSs/TaDQsr0Nn0EqkRLDbagrPLti9EzNXX6ls=;
 b=0NsFGFHjXhH3rZlVwQltYZsZwrVxPMTSXCwpdl/3hyjiUONMQ3RRwWsA2xE99lxE8SPWUzQJjvmFtdaQQNyjaN8kNT/lWzFKz5lu5FP8ojBjPvRSlJvhD0Y4yElv4ACuPn+x6KFuzioyE1ozBG638D/9RL+EpsjGEXse9lyTJ5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:53:04 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:53:04 +0000
Message-ID: <b4934c00-3947-47fd-b35e-b6852d0ab729@amd.com>
Date: Fri, 11 Sep 2026 16:53:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] lib/amdgpu: skip command_ce_write_fence when CE
 CS is blocked
To: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260911202023.1872466-1-Granthali.VinodkumarDhandar@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260911202023.1872466-1-Granthali.VinodkumarDhandar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::23) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 089898e1-225e-4f8c-af5b-08df1046ac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: v8CLOo3C3k1XClrRhpBWG7Cgb8WqpZd9aINbtyzoXqK/r/mWpe/6cSryTcudKS1FQs68Ltw6yIJko3UFXk1B6sK07pjRYvgzP+QCXcighYxcQVFES1HCX6OxYrk+lHsCUd0jpeFy3ZM4ACO4YcKNWsx6FEnw9WAvMMTMQ/iJpcHXWNho7lObm4sS/RZSGkFyjpFOIeyAzTXKquBVZK5brXgPTyHIkOUeFkHVnTj4g5VswN8pgM//wi6cNcSX9zOI8bJz5TdRzIUto+fo9Uy0XRakF3XkDnuYW4SgCJOpP9j4hppbxA5kwZciz6W4+51LxPSPkMmqFDPvLvdq2puY+KBZy8Pnjan2URf7Jaw8ph1QrcCmXcM+OEzu04TqiV61hLKf+iFcZ6HqfBOwmdJUYv2LlO5yWTvIAvFFZbnFpuwVEBn0Z8FOaP8Gk/Ym+xIdgh1Oo+wmOBcOsStD3rfNTkUFlXB/4EgmqxOQRI1cr38F9wbFtwOyfmxeOj8pv8aagmBw6ePGRnuK5T4N/fZyU1L971/a0nwUJBsCxPGk5/a3WDiGnRVxfh6wAUK2Vg8Mp9EvDzPAcPnQne5yv7TjS6mZJ+bI/sSs25o8wi1z6EYIFXpfuj2pbDgjZUuIOuFTMdLQGft7UE68NoqnbRidQuGYKZONtiV9/FRIQ3iFxaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmI1YmpwQUIvTWV0N0l1Z3ZDQVBjbFBDWUwrelZSVjlicHFSbm4zZlpsaVB1?=
 =?utf-8?B?Q25TR1g1azNVNVVPeS9iMXpmbmt2MEd6eEwxU3J1NUlKMXFYWW5UQzZqbGcw?=
 =?utf-8?B?dndvWlpzNm9MRTBjMXdmYzUwSmxFNDd0MjZoQU9XMDVnelVOYlBMd00rZWE2?=
 =?utf-8?B?d1dSajZnUEVqV2VHRnNBUmEzUmk4OUloZ29DVGRyZC9rZGo1Z1lReEd5c0hB?=
 =?utf-8?B?Vng3Z3ZIbElRQys2UWR4VkZaQ3F1Mm5oNjlKSDdyT3d5ajlwc2ZOVUVTK2d4?=
 =?utf-8?B?Sk1xcHp2YnNSTWRhOUZ6L0MrR0VaU0x3M3JzZGh2NzhqZ09Yb05ZY2Y2eVIx?=
 =?utf-8?B?MDNRQUtSdG8wbWZzeHR2NUpCcmNyNFVqUmo4Szc3aFpyRm0rWENpUEVZZzNi?=
 =?utf-8?B?aHlsdkVGRFQxbjZodGEyZU5YMUVEOTRaS3pzcFp0Y0J2WUJCT0VvOWJYZFMr?=
 =?utf-8?B?OVZMTzlwRWJxM1JxZTlJL2V2YlFJdW94Y0I4Vy9oWUJNaER4ZnpaTklYK0xp?=
 =?utf-8?B?SEl1RTZFSnNOV2dPSmI2VHRYck9WTmpRQzFiZWNTTGEyKzEyTXBjcXdzV2VP?=
 =?utf-8?B?cktKaktyUkdLc2RLM2ErS3B0cWFTSUZ3SHR2bjYwOXp3dS9BdVg5RmxqWHdm?=
 =?utf-8?B?MTZucVErN0FlNWxQeWlWTEpHdGlRamdzMzdyUEFkM2lpa1pjU3pDSFdOZlpG?=
 =?utf-8?B?bExRb0pWQUt3ZFBJQmtES3djTzdUdlIwU1dGZ2lTcVYzRlRQYlBsRmVzTnlp?=
 =?utf-8?B?cTg1MzZwQUk2UDdBTHNZVml5UlIxdVUwZWZJVnFsbkpwM1JsVms2eTloSGpV?=
 =?utf-8?B?SzNOeUF3Ung0N2Q1a1JGc082dkIxcUIvMlV0dlBIajRDenZpUmIzOHFKSGZx?=
 =?utf-8?B?Q0R1eEVOYXR3eEFSTEFqNGI3WUV6YUhRWnR5WVU5V25hUy9SVUlCNWZMOGRv?=
 =?utf-8?B?VHhENm8va0ljcE9Jd3d3YmEwT3pPR2tObmxUNFBoVkp5Q1ZOeVNiekVJNDNH?=
 =?utf-8?B?aHZYbDFLVTh0TTlzQUZkbkxpeXZ6VERyNklYaEY5Y2xyOEcwR3ptNEkzazNO?=
 =?utf-8?B?UGdhSC92N3F4bitKUE5nSFVKU0Y0TnY0TmtWYzBBcENKUTZDUGQyU2djNGc5?=
 =?utf-8?B?aHNoajArUUxkTDl2M3RGTUdNdlMydEZPZ09qWm92d0JBQmJSdDR2NHBPOU01?=
 =?utf-8?B?TmIzeXlYZzZ4VjFva0VQWko2Qk1jeXlIZFRUa2doOHl2SlpLekp3bHFCUVp5?=
 =?utf-8?B?a1htVytHNjh3NFhTbXMwbkgxOG9rSDlnNWVnSm9ad0VjSEdaQnZlZFNwM0M0?=
 =?utf-8?B?V0tXYjJxakNaOU01TmUwdkhjZXRBYkhxdzk0dmQyQ2s2OU1Bdk53bUt4ZC8y?=
 =?utf-8?B?WW5tZDFCak1EKzJSQnFwaUlWOFhvMmdlbDZxUkI1cFdVb3FwbWNOQ0Y5c043?=
 =?utf-8?B?amNaNjRNZzlYMjI4TCswYXpOWXV1WncxREMvb2VWbWc1Q1grYkhDZjc3azA2?=
 =?utf-8?B?RU9YWUNuT1dXbzBDYU5MMEU2VlBlUDhINHM0cjZpd2R4WDVwY0RqZ094RlFo?=
 =?utf-8?B?RkpKL2h1cTRweTZqUHJMVC9ZSG4zWUhRQUZHcVNTRmJ5UGduTXRYa3AyT3JW?=
 =?utf-8?B?MTBaVGVKVGVEZGZZSlpEOEhIdkkxTER4dVVUYjdGOHRBdWpoUDJnYXgzU3J1?=
 =?utf-8?B?UXFuSzYxMnpDNjYzQjN6M01NVFU5amw3SEJLUXRDMlBBSnpqMFNkL00rbUFV?=
 =?utf-8?B?MXRTOC9yZzNmalB2MWt3NjdHZ0lXYW1RMjloZGpPaVltazR3WGdIZ1g2bHd1?=
 =?utf-8?B?SGl3eWdmSzByZUR5ME1xQWdlbDFGdnF3TzVBVm9mZkdOWTh3MmsyNUpqdWlv?=
 =?utf-8?B?TmVOdEZBMUYyZ0JtcHpRQjc2RCtwVHFtRnovZDR5djVvZ2NRTXlCdDRiYXZL?=
 =?utf-8?B?cHNWZjg1Z0paUUd5NXVqQ3dXTFVEdDRjWjlLMGc5VlBrdnV6Z2JNZ2hscFVN?=
 =?utf-8?B?VFlrUWgyeVhNcE1hUTJpVE03L0pVYUk5bkQ4bWtLZ0g4cmZtQXlQVGY3L29i?=
 =?utf-8?B?UTJtL1B6Ym9xaERYWUJ2SWtSVjJaajduaExTYUltOVdVTVVwZ05PcElxV3R6?=
 =?utf-8?B?N2JDUUl5cEw2WVkyUnRtbkkrYnp6TlZ5bGlsYktPZ1BUcmU5ZmZYUDBNQWZP?=
 =?utf-8?B?MksreHVrNk0xN2NpMlR2M3oyclpTNVBSSkozQmt6TEd5NENXcStOYjJoMkxB?=
 =?utf-8?B?OFRXSmxKNmQxWTlTcVZpMjRqTnQ3ck50RllvbmtaSmdXcTVJWnVUOXRPUkZL?=
 =?utf-8?B?Qk5EMUZLVUpHa0xCQ3hzVkUvVlJod3FXcG4zTk0xQlNveVREVFZpQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089898e1-225e-4f8c-af5b-08df1046ac8b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:53:04.4171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUyC9eT6ekAXP+6Jpp6ps91nSQRXWN53HDnkZhbWvJAJpt93rG19RSYNM6a8KsJgePLwvPD5eIkJ8vOGZAeTWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160
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

LGTM, reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-09-11 16:20, Granthali Vinodkumar Dhandar wrote:
> From: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
>
> amdgpu_command_ce_write_fence() submits an IB with AMDGPU_IB_FLAG_CE.
> The kernel rejects that unless amdgpu debug_mask bit 0x400 is set at
> module load, so amd_basic_ex@command_ce_write_fence hits -EINVAL
> instead of skipping.
>
> commit b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel
> blocks CE CS") added amdgpu_ce_cs_enabled() for the CE IB helpers in
> amd_gfx.c. Export it from lib/amdgpu/amd_gfx.h and use it in
> amdgpu_command_ce_write_fence() so all three CE CS entry points share
> the same check.
>
> Fixes: b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS")
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 4 ++++
>  lib/amdgpu/amd_gfx.c                | 2 +-
>  lib/amdgpu/amd_gfx.h                | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 7210cffb9..c7b36970e 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_gfx.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  
>  #include "ioctl_wrappers.h"
> @@ -805,6 +806,9 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  	const struct amdgpu_ip_block_version *ip_block =
>  		get_ip_block(dev, AMD_IP_GFX);
>  
> +	igt_require_f(amdgpu_ce_cs_enabled(),
> +		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
> +
>  	/* destination buffer */
>  	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
>  				    AMDGPU_GEM_DOMAIN_GTT, 0,
> diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
> index 10bc74b5c..ff9f869a8 100644
> --- a/lib/amdgpu/amd_gfx.c
> +++ b/lib/amdgpu/amd_gfx.c
> @@ -29,7 +29,7 @@
>  #define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
>  
>  /* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
> -static bool amdgpu_ce_cs_enabled(void)
> +bool amdgpu_ce_cs_enabled(void)
>  {
>  	FILE *f;
>  	unsigned int mask = 0;
> diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
> index 90addf5bc..8bf108365 100644
> --- a/lib/amdgpu/amd_gfx.h
> +++ b/lib/amdgpu/amd_gfx.h
> @@ -32,4 +32,7 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
>  
>  void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
>  
> +/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
> +bool amdgpu_ce_cs_enabled(void);
> +
>  #endif
