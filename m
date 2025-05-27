Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9325C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1010E523;
	Tue, 27 May 2025 16:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkKBOtNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358CC10E523
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362181; x=1779898181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kMDui/isoUwp+vhMG+SX1lYmetnXnJwO0YottEySh1w=;
 b=dkKBOtNxWMdypUUpQJnxZykKtMoosc3Spyom+P4Jee3PM+cI4skJIiNv
 VkP6a5R6JIQz6+C5iGRZwcXVOwPdt7c3kTzYWndxJdX0KI4E4YWxj2hrD
 WHeI5jEpepFpzzJTzCVydN/6dxXiVwaeGgur/ZRH3JPwriyqVUFZNcYmJ
 1L1mh7iHe0GAFvyPLwYswDe4KguaUfE4tr1j6Rx2rpb+wZ8x3JfqOJGLt
 69VaDgCgnqEG0V+OpL4BR9H5GsbSn2XvLMZm5KqAMf+jiyYJ1xw6f9+mO
 PcfyExiUp1/bDUyjZrI9V6/B+DWzP83ZVXbfxRr6tkxtuRYLC1AsJBHST g==;
X-CSE-ConnectionGUID: 2ZsPzgjaQBGwqwzhdW/nwA==
X-CSE-MsgGUID: ooZGHzeTTRyfoyrvwm+jpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60614743"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60614743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:09:31 -0700
X-CSE-ConnectionGUID: 8WN+39KUT4SNd304How/XA==
X-CSE-MsgGUID: ugoKu6zmTbaPT+XYek1URg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142799959"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:09:28 -0700
Date: Tue, 27 May 2025 18:09:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v4 1/9] lib/amdgpu: fixup print formatting for
 files in lib
Message-ID: <20250527160926.sy57ac3aknt7sgkg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527120421.79026-2-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-27 at 12:04:13 +0000, Jan Sokolowski wrote:

one nit about subject
imho you already have a place/file which you changed, so
instead of:
[PATCH i-g-t v4 1/9] lib/amdgpu: fixup print formatting for files in lib

better:
[PATCH i-g-t v4 1/9] lib/amdgpu: Fix print formatting for 32-bit compilation

> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Cc: George Zhang <george.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Reviewed-by Vitaly Prosyak <vitaly.prosyak at amd.com>

This is missing ':' and also s/ at /@/

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Vitaly are you ok with other patch 2/9?

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 98251061c..3b4822ca0 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <amdgpu.h>
> +#include <inttypes.h>
>  #include "amdgpu_drm.h"
>  #include "amd_PM4.h"
>  #include "amd_sdma.h"
> @@ -249,13 +250,13 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  			if (support_page) {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  							0x3 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>  				ring_id++;
>  
>  			} else {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  							0x1 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>  			}
>  			r = system(cmd);
>  			igt_assert_eq(r, 0);
> @@ -266,7 +267,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> @@ -523,12 +524,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  			if (support_page) {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x3 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>  				ring_id++;
>  			} else {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x1 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>  			}
>  
>  			r = system(cmd);
> @@ -540,7 +541,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> @@ -592,12 +593,12 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  			if (support_page) {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x3 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>  				ring_id++;
>  			} else {
>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x1 << ring_id, sysfs);
> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>  			}
>  
>  			r = system(cmd);
> @@ -609,7 +610,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> -- 
> 2.34.1
> 
