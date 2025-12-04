Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C41CD29FB4
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A3B10E036;
	Thu,  4 Dec 2025 19:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X66C+8Rc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E7110E036
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764876200; x=1796412200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NRseErjWj9Yn/2vg277b0vJzuzPw1nJK+NSPfdVjc+I=;
 b=X66C+8Rcac8jImm1tOJbC3RaOFfjaWU3Vtnt7CJeyEyJyZI4TwH14JAO
 SZJsTxqtMWRfUVhkScxa1Xk4YdBxoYflYWqLMnYqut6BM5g+nfXXs5A+P
 qAMDPRYaSrUoyjzqf6MFRUUFDqifLYKMTG0dUsTfLV5Rk9yFcJoWLYqnp
 uqTPZdUzj/CedVrJAGw//WZOcUtet4N5EkI7LcC0lSCB+CHKfthwqAY45
 EnRkMKY4Kn7EEyIKxdKAgojRQWlfPUWUyRH8umDTgY4NeLOM7ngu67TBd
 +/hRkdUGSUhlHTGNpNvWMmREflPCeOyn4CeygBUd2CKccwAcZX4yngkAB Q==;
X-CSE-ConnectionGUID: Eiy+kzyWRf+QDbfKfikYJQ==
X-CSE-MsgGUID: 5hawDkMtTaefHaetD7CqKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66631274"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66631274"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:23:20 -0800
X-CSE-ConnectionGUID: bdgrER7oSDW12kRLy/wn8w==
X-CSE-MsgGUID: u9mt0ErkS1SjOKbGPJ2F2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="200195865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:23:19 -0800
Date: Thu, 4 Dec 2025 20:23:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH] lib/amdgpu: fix build without amdgpu_device_get_fd
Message-ID: <20251204192316.kmd4yp3sh2qwitlq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20251204181442.45975-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204181442.45975-1-vitaly.prosyak@amd.com>
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

Hi vitaly.prosyak,
On 2025-12-04 at 13:14:16 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Building IGT against older libdrm_amdgpu versions fails with:
> 
>   amd_ip_blocks.c: error: implicit declaration of function
>   ‘amdgpu_device_get_fd’ [-Werror=implicit-function-declaration]
> 
> because amdgpu_device_get_fd() is not declared in <amdgpu.h> on those
> stacks, and we compile with -Werror=implicit-function-declaration.
> 
> The tests already have access to the DRM file descriptor when opening
> the device, so instead of calling amdgpu_device_get_fd() from
> get_dri_index_from_device(), pass the fd down from the caller.
> 
> This avoids the dependency on newer libdrm_amdgpu while preserving the
> existing behaviour for resolving the DRI index.
> 
> Changes:
>  - change get_dri_index_from_device() to take (amdgpu_device_handle, int fd)
>  - update the declaration in amd_ip_blocks.h
>  - plumb the fd through tests/amdgpu/amd_mem.c and call
>    get_dri_index_from_device(device, fd)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Thank you for quick fix, this LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/amdgpu/amd_ip_blocks.c | 4 ++--
>  lib/amdgpu/amd_ip_blocks.h | 2 +-
>  tests/amdgpu/amd_mem.c     | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 6ce207fb2..73bdace5a 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1768,7 +1768,7 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
>  	return (ret == 0 && glob_result.gl_pathc > 0);
>  }
>  
> -int get_dri_index_from_device(amdgpu_device_handle device)
> +int get_dri_index_from_device(amdgpu_device_handle device, int fd)
>  {
>  	/* For AMDGPU, the DRI index is typically available through the render node */
>  	/* We can use the device fd to determine the appropriate debugfs path */
> @@ -1778,7 +1778,7 @@ int get_dri_index_from_device(amdgpu_device_handle device)
>  	int dri_index = 0;
>  
>  	/* Try to read the symlink from /proc/self/fd */
> -	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
>  
>  	len = readlink(path, target, sizeof(target) - 1);
>  	if (len != -1) {
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index c591d21c1..51f492da2 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -436,7 +436,7 @@ int
>  find_dri_id_by_pci(const struct pci_addr *pci);
>  
>  int
> -get_dri_index_from_device(amdgpu_device_handle device);
> +get_dri_index_from_device(amdgpu_device_handle device, int fd);
>  /**
>   * is_apu - Check if the GPU is an APU (accelerated processing unit)
>   * @info: Pointer to amdgpu_gpu_info structure containing device info
> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
> index aebe22e66..39abd4f66 100644
> --- a/tests/amdgpu/amd_mem.c
> +++ b/tests/amdgpu/amd_mem.c
> @@ -1401,13 +1401,13 @@ cleanup:
>  	}
>  }
>  
> -static void test_gca_config_basic(amdgpu_device_handle device)
> +static void test_gca_config_basic(amdgpu_device_handle device, int fd)
>  {
>  	uint32_t config[MAX_CONFIG_SIZE];
>  	int dri_index = 0; /* Typically 0 for primary GPU */
>  	int bytes_read;
>  
> -	dri_index = get_dri_index_from_device(device);
> +	dri_index = get_dri_index_from_device(device, fd);
>  	/* Try to read from debugfs */
>  	bytes_read = read_gca_config_debugfs(dri_index, config, sizeof(config));
>  
> @@ -4223,7 +4223,7 @@ igt_main
>  
>  	igt_describe("Test basic GCA configuration reading from debugfs");
>  	igt_subtest("gca-config-basic")
> -		test_gca_config_basic(device);
> +		test_gca_config_basic(device, fd);
>  
>  	igt_describe("Test allocation of large GTT memory buffers");
>  	igt_subtest("largest-gtt-buffer") {
> -- 
> 2.51.2
> 
