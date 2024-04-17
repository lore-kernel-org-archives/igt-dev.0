Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E4BC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 09:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2310F061;
	Wed, 17 Apr 2024 09:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZIz19Bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC6B10F061
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713344910; x=1744880910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1FSVi/sqBOe88hMsjhANiHLOJuMXzhiflnoIkmgZMcQ=;
 b=jZIz19Bj8AGwOsERO+QlXEBSqd+JkT20M/5Cjd69udGoJ65ELCfxWm62
 wwS9+p4efHiHxCU65Kphhwxhoj6dOl3u1s2RHpgDt4d+2Bq+CTD3sYet1
 PwlRuVhUbrY1N3SFh6XJAILS2URfQLiUzNrIwFpS9ALFf02YZ6e7c7UBb
 1fWxXZSo3vha6aQKffJVpUzJJ/Xz1av3qzZNY1tyayfRvLcTK1VdtSw3j
 TQelXIkzJ20OjyRgsqO9keRQyFekS1CJ8bhLctyuklRuE27iXJ9CgVkcC
 ZMiNK+SSjhjW1giMBbjft+cIN2BAUQJ84InBERqQ+MIr6TESNqKsxWaVb g==;
X-CSE-ConnectionGUID: fQgulQ2uSWuPUzsC+n3ocw==
X-CSE-MsgGUID: zFqk38YyQe20cdfg0x68tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31307775"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="31307775"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:08:29 -0700
X-CSE-ConnectionGUID: cM5q0hghTm+UgFX9xCLWmg==
X-CSE-MsgGUID: JUunJJCFSnC/0U4oTnkgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22429914"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 02:08:28 -0700
Date: Wed, 17 Apr 2024 11:08:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: add check for deadlock test
Message-ID: <20240417090809.tu2bpfo5bebm5oo4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240417011701.321744-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240417011701.321744-1-jesse.zhang@amd.com>
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

Hi Jesse,
On 2024-04-17 at 09:17:01 +0800, Jesse Zhang wrote:

imho you could improve subject, was:

[PATCH i-g-t] tests/amdgpu: add check for deadlock test

and it would be better with:

[PATCH i-g-t] tests/amdgpu/amd_deadlock: run only on GPUs supporting reset

No need for resend, it could be changed at merge.

> Only enable deadlock test  for ASICs supporting GPU reset.
> The issue report by:GMP, Vikram <vikram.gmp@amd.com>
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed by:  Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index dc7ec4366..7a27fae51 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -9,6 +9,28 @@
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  
> +#define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
> +#define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
> +#define AMDGPU_FAMILY_CZ                        135 /* Carrizo, Stoney */
> +#define AMDGPU_FAMILY_RV                        142 /* Raven */
> +
> +static bool
> +is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
> +{
> +	bool enable = true;
> +	/*
> +	 * skip for the ASICs that don't support GPU reset.
> +	 */
> +	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
> +		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");

This print suggest other name for this function but as it is local
to this test it can stay as is. As it looks, you could run this test
on these GPUs but then you need to power cycle GPU (or machine?).

Regards,
Kamil

> +		enable = false;
> +	}
> +	return enable;
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -34,6 +56,7 @@ igt_main
>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>  		igt_assert_eq(r, 0);
>  		asic_rings_readness(device, 1, arr_cap);
> +		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
>  
>  	}
>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
> -- 
> 2.25.1
> 
