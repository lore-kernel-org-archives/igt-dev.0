Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0C1C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 11:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BF910E337;
	Mon, 26 May 2025 11:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kmn1md6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DCB10E34D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748258842; x=1779794842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qtJwiMTQmTsOWII0sc0cfztS1mCfZF9YNyrU5EDcfLA=;
 b=Kmn1md6eglRIhppIUKiRJXZKl+Ozoo6Orye9JhfY2YfzfL82DNrQNXp5
 WRfvmH2tF/5AGW3Rlrq58vbJ0gToICWu/jhDtcuHSgc04JBVY9uz1kgoT
 nYuTpCmYeM/SiLbsZBGxPNM9jj52TSASx3PVcQxq5bNQEfFBe2pZfZjs5
 xCf87IPIIg/3Rz3Nl3YV6OhrfQQFJ0V0m3BmT4BFCyV7OsBettL2rYpbM
 8tcb08hHxw9Biesp59vvp3yrJ2bu6nhKPZEadtMwrGDZ+WGDObwg7Q3TM
 CgIjgPx8VqEX+Drfe3ctfbGTrepW7IuN4Zj8k9qluswm0fF8lZq0TOC0p g==;
X-CSE-ConnectionGUID: hPStNgI0SOiVbV6ZsWpgUg==
X-CSE-MsgGUID: lpzF6iHnTTa+8PxBgJtwkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50117256"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="50117256"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:27:21 -0700
X-CSE-ConnectionGUID: dKGLtjNzR6Wp7usP2TSVMQ==
X-CSE-MsgGUID: XVpnYLkbS3uZjluGVKbvFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142338789"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:27:20 -0700
Date: Mon, 26 May 2025 13:27:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v3 1/8] lib/amdgpu: fixup print/scan formatting for
 files in lib
Message-ID: <20250526112717.ejv7imuriagj3rpc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
 <20250526080740.67790-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526080740.67790-2-jan.sokolowski@intel.com>
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
On 2025-05-26 at 08:07:33 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Reviewed-by Vitaly Prosyak <vitaly.prosyak at amd.com>
> Cc: George Zhang <george.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 98251061c..1fcaa6745 100644
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
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" SCNx64 " > %s", sched_mask, sysfs);

s/SCNx64/PRIx64/


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
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" SCNx64 " > %s", sched_mask, sysfs);

s/SCNx64/PRIx64/

Regards,
Kamil

>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> -- 
> 2.34.1
> 
