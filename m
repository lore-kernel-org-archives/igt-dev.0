Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0559D1F9AD
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 10:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BDF10E8D8;
	Thu,  4 Dec 2025 10:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pwxbtmy9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891E510E8D8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764844138; x=1796380138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v+4INhmPYlc6zcVaY6RdrDkdje7hl4BRT31yJgaOyvE=;
 b=Pwxbtmy9Vvkm8TaY6AWwqNjKEququOaBMD9hRfb8PoOwa0OWzImYIPbm
 LKGrWY9c7Y7WbSSQ9a2qI5bROVR5axKroYNojEZPKz0CLAGptcfCpn/N5
 L1t7RsVlatVx0nGOUw3Wv9lUqOmAKLRs8gGQruBwLk6phhNYtPOZf9vNm
 Qf6yERbCon6yuxC2hx5DwNQklO1qEaYfBPnElvxu8IBxqv8xe5JZxeWKj
 Gz9BQVDHng9DLUBHTGpll5wzwtIkDYrlXBDnc1f+NpIGqss+DBhx7zf2Y
 ns21QcTGyqwTfNow5oTRVWKaQJuUfGevlo4ePk751G9tDlt7Z2YSQNl5Y A==;
X-CSE-ConnectionGUID: vjRqIXI6T3yix3zY/LpwmQ==
X-CSE-MsgGUID: wu7R3MZsTXKvutm9IGr7VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66745764"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66745764"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 02:28:57 -0800
X-CSE-ConnectionGUID: q87pzLBKSVa6j4esXv4tfQ==
X-CSE-MsgGUID: EFetxXYxTKe0bEXibgjExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="232277546"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 02:28:55 -0800
Date: Thu, 4 Dec 2025 11:28:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH i-g-t v4 4/6] lib/amdgpu: add utility functions and
 GFX1200 family macro
Message-ID: <20251204102836.adlroiq3xw3xugkn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20251203090307.467031-1-Jesse.Zhang@amd.com>
 <20251203090307.467031-4-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203090307.467031-4-Jesse.Zhang@amd.com>
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

Hi Jesse.Zhang,
On 2025-12-03 at 17:02:07 +0800, Jesse.Zhang wrote:
> 1. amd_ip_blocks.c additions:
>    - get_dri_index_from_device(): Extract DRI index from device FD symlink (supports renderD/card paths)
>      for debugfs access in tests.
>    - is_apu(): Check if GPU is an APU using AMDGPU_IDS_FLAGS_FUSION flag.
>    - cmd_get_ip_name(): Return human-readable IP block name (GFX/Compute/DMA/etc.) for logging.
> 
> 2. amdgpu_asic_addr.h addition:
>    - FAMILY_IS_GFX1200 macro: Add GFX1200 architecture support for family checks.
> 
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c    | 64 +++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_ip_blocks.h    | 16 +++++++++
>  lib/amdgpu/amdgpu_asic_addr.h |  1 +
>  3 files changed, 81 insertions(+)

This commit made regression on arm containers, see

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines

and for example job for amr64 aarch64:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/89159342

[5/1328] Compiling C object lib/libigt-amdgpu_amd_ip_blocks_c.a.p/amdgpu_amd_ip_blocks.c.o
FAILED: lib/libigt-amdgpu_amd_ip_blocks_c.a.p/amdgpu_amd_ip_blocks.c.o 
/usr/bin/aarch64-linux-gnu-gcc -Ilib/libigt-amdgpu_amd_ip_blocks_c.a.p [cut]
../lib/amdgpu/amd_ip_blocks.c: In function ‘get_dri_index_from_device’:
../lib/amdgpu/amd_ip_blocks.c:1781:51: error: implicit declaration of function ‘amdgpu_device_get_fd’ [-Werror=implicit-function-declaration]
 1781 |  snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
       |                                                   ^~~~~~~~~~~~~~~~~~~~
       ../lib/amdgpu/amd_ip_blocks.c:1781:51: warning: nested extern declaration of ‘amdgpu_device_get_fd’ [-Wnested-externs]


Could you fix it asap? imho quick fix would be to make #ifdef ARCH/#endif
or (better) use meson to check if this function is in libraries.

I didn't check if there are more problems on arm with your commits.

+cc Karthik, Ashutosh and Juha-Pekka

Regards,
Kamil

> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index b44c29819..6ce207fb2 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1767,3 +1767,67 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
>  	/* Return true if files matching the pattern were found, otherwise return false */
>  	return (ret == 0 && glob_result.gl_pathc > 0);
>  }
> +
> +int get_dri_index_from_device(amdgpu_device_handle device)
> +{
> +	/* For AMDGPU, the DRI index is typically available through the render node */
> +	/* We can use the device fd to determine the appropriate debugfs path */
> +	char path[64];
> +	char target[1024];
> +	ssize_t len;
> +	int dri_index = 0;
> +
> +	/* Try to read the symlink from /proc/self/fd */
> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
> +
> +	len = readlink(path, target, sizeof(target) - 1);
> +	if (len != -1) {
> +		target[len] = '\0';
> +		/* Extract DRI index from path like /dev/dri/renderD128 */
> +		if (sscanf(target, "/dev/dri/renderD%d", &dri_index) == 1) {
> +			return dri_index;
> +		}
> +		/* Try card path as well */
> +		if (sscanf(target, "/dev/dri/card%d", &dri_index) == 1) {
> +			return dri_index;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +bool is_apu(const struct amdgpu_gpu_info *info)
> +{
> +	return !!(info && (info->ids_flags & AMDGPU_IDS_FLAGS_FUSION));
> +}
> +
> +/**
> + * Get IP block name string
> + */
> +const char *cmd_get_ip_name(enum amd_ip_block_type ip_type)
> +{
> +	switch (ip_type) {
> +	case AMD_IP_GFX:
> +		return "GFX";
> +	case AMD_IP_COMPUTE:
> +		return "Compute";
> +	case AMD_IP_DMA:
> +		return "DMA";
> +	case AMD_IP_UVD:
> +		return "UVD";
> +	case AMD_IP_VCE:
> +		return "VCE";
> +	case AMD_IP_UVD_ENC:
> +		return "UVD_ENC";
> +	case AMD_IP_VCN_DEC:
> +		return "VCN_DEC";
> +	case AMD_IP_VCN_ENC:
> +		return "VCN_ENC";
> +	case AMD_IP_VCN_JPEG:
> +		return "VCN_JPEG";
> +	case AMD_IP_VPE:
> +		return "VPE";
> +	default:
> +		return "Unknown";
> +	}
> +}
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index c319ded6e..c591d21c1 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -21,6 +21,10 @@
>  #include "amd_registers.h"
>  #include "amd_family.h"
>  
> +#ifndef MIN
> +#define MIN(a, b) ((a) < (b) ? (a) : (b))
> +#endif
> +
>  #define MAX_CARDS_SUPPORTED 4
>  
>  /* reset mask */
> @@ -431,6 +435,18 @@ is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci
>  int
>  find_dri_id_by_pci(const struct pci_addr *pci);
>  
> +int
> +get_dri_index_from_device(amdgpu_device_handle device);
> +/**
> + * is_apu - Check if the GPU is an APU (accelerated processing unit)
> + * @info: Pointer to amdgpu_gpu_info structure containing device info
> + *
> + * Returns true if the device is an APU, false otherwise.
> + */
> +bool is_apu(const struct amdgpu_gpu_info *info);
> +
> +const char *cmd_get_ip_name(enum amd_ip_block_type ip_type);
> +
>  int
>  amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
>  			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index 63cea1a5d..e7326b0f8 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -50,6 +50,7 @@
>  #define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
>  #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
>  #define FAMILY_IS_GFX1150(f) FAMILY_IS(f, GFX1150)
> +#define FAMILY_IS_GFX1200(f) FAMILY_IS(f, GFX1200)
>  
>  #define AMDGPU_UNKNOWN          0xFF
>  
> -- 
> 2.49.0
> 
