Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E546C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096F610EB23;
	Fri, 16 May 2025 16:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBXAkhym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C040D10EB23
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747413603; x=1778949603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G4Qg1Vm9nTmZ6BhTV8uNn4+xqa21D39ySLwgGy740bY=;
 b=GBXAkhymvW8waa1JfU4ll0xtCd9b1UVC+cKREoHLEHw0GTwxR9dfDFxH
 YewssCDgOEypWnmz0PPv+wzldJjna0zy5Pgdi5joiicZZwHhrrMVMpQF4
 qf5jfpzJ0RoSnsyh0sZoe5liG1jF76RaIgasy+o+Hs63ZhHxCWxoTUehz
 SnzXxfImUI7zPLeBb8DnzibyxjUCom3CpyDCSKaz5k0CVTxkJtCR45zaE
 PlU+TQQPNeNCURXc/NUnOXUf7AwkhlT0CwEIVde1XOQIPp8vATOA9MoP/
 Tu7cm1n7ygIg2B2BwEEvq1H7lp0nKgyCsVx5KOFuR5JTXkG1I5NYYNbdE w==;
X-CSE-ConnectionGUID: LqMSLu5nReW/6FusOzEV2w==
X-CSE-MsgGUID: MJpqbgTSRJq+7518YZg5+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49498063"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49498063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:40:02 -0700
X-CSE-ConnectionGUID: N/NJofgETJqvbpNJV26JQw==
X-CSE-MsgGUID: tvEEKhkCQ/uU0lCbg2ZhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="139747661"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:40:00 -0700
Date: Fri, 16 May 2025 18:39:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t v1 1/4] lib: fixup print/scan formatting for files
 in lib
Message-ID: <20250516163944.ozlkn743ha2tuuze@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20250516115811.135889-1-jan.sokolowski@intel.com>
 <20250516115811.135889-2-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516115811.135889-2-jan.sokolowski@intel.com>
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
On 2025-05-16 at 11:58:08 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
>  lib/igt_nouveau.c                 |  2 +-
>  lib/igt_perf.c                    |  3 ++-
>  lib/xe/xe_sriov_debugfs.c         | 18 +++++++++---------
>  lib/xe/xe_sriov_provisioning.c    |  2 +-

Could you split it into four groups: lib/amdgpu, nouveau, perf, xe_sriov
and also add to Cc respective developers, here:

for amdgpu
	Cc: George Zhang <george.zhang@amd.com>
	Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
for nouveau:
	Cc: Lyude Paul <lyude@redhat.com>
for igt_perf use: git log -- lib/igt_perf.c
	Cc: Riana Tauro <riana.tauro@intel.com>
	Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
for xe_sriov:
	Cc: Lukasz Laguna <lukasz.laguna@intel.com>
	Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

or at least please add those dev to Cc when sending next version
(if it will be needed).

Regards,
Kamil

>  5 files changed, 23 insertions(+), 21 deletions(-)
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
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
> index fdf6020a3..62a53c8b1 100644
> --- a/lib/igt_nouveau.c
> +++ b/lib/igt_nouveau.c
> @@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
>  		gob_height = 4;
>  		break;
>  	default:
> -		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
> +		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
>  			      modifier);
>  		break;
>  	}
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index fb2b73915..2b7170094 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -5,6 +5,7 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/stat.h>
> +#include <inttypes.h>
>  #ifdef __linux__
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> @@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
>  		return -EINVAL;
>  
>  	buf[bytes] = '\0';
> -	ret = sscanf(buf, "event=0x%lx", config);
> +	ret = sscanf(buf, "event=0x%" SCNx64, config);
>  	if (ret != 1)
>  		return -EINVAL;
>  
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index 8f30fa312..b81b3532a 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -105,18 +105,18 @@ static int parse_provisioned_range(const char *line,
>  	switch (res) {
>  	case XE_SRIOV_SHARED_RES_CONTEXTS:
>  	case XE_SRIOV_SHARED_RES_DOORBELLS:
> -		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
> +		if (sscanf(line, "VF%u: %" SCNu64 "-%" SCNu64, &range->vf_id, &range->start, &range->end) == 3)
>  			ret = 0;
>  		break;
>  	case XE_SRIOV_SHARED_RES_GGTT:
> -		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
> +		if (sscanf(line, "VF%u: %" SCNx64 "-%" SCNx64, &range->vf_id, &range->start, &range->end) == 3)
>  			ret = 0;
>  		break;
>  	case XE_SRIOV_SHARED_RES_LMEM:
>  		/* Convert to an inclusive range as is the case for other resources.
>  		 * The start is always 0 and the end is the value read - 1.
>  		 */
> -		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
> +		if (sscanf(line, "VF%u: %" SCNu64, &range->vf_id, &range->end) == 2)
>  			ret = 0;
>  		if (!range->end)
>  			return -1;
> @@ -232,8 +232,8 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
>  				  nr_ranges);
>  			for (unsigned int i = 0; i < limit; i++) {
>  				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> -						  "%s:VF%u: %lx-%lx\n" :
> -						  "%s:VF%u: %lu-%lu\n",
> +						  "%s:VF%u: %" SCNx64 "-%" SCNx64 "\n" :
> +						  "%s:VF%u: %" SCNx64 "-%" SCNx64 "\n",
>  					  xe_sriov_shared_res_to_string(res),
>  					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
>  			}
> @@ -504,16 +504,16 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
>  	while (getline(&line, &n, file) >= 0) {
>  		switch (res) {
>  		case XE_SRIOV_SHARED_RES_CONTEXTS:
> -			ret = sscanf(line, "GuC contexts: %lu", value);
> +			ret = sscanf(line, "GuC contexts: %" SCNu64, value);
>  			break;
>  		case XE_SRIOV_SHARED_RES_DOORBELLS:
> -			ret = sscanf(line, "GuC doorbells: %lu", value);
> +			ret = sscanf(line, "GuC doorbells: %" SCNu64, value);
>  			break;
>  		case XE_SRIOV_SHARED_RES_GGTT:
> -			ret = sscanf(line, "GGTT size: %lu", value);
> +			ret = sscanf(line, "GGTT size: %" SCNu64, value);
>  			break;
>  		case XE_SRIOV_SHARED_RES_LMEM:
> -			ret = sscanf(line, "LMEM size: %lu", value);
> +			ret = sscanf(line, "LMEM size: %" SCNu64, value);
>  			break;
>  		}
>  
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index aa265247e..26b7ed8dd 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -75,7 +75,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>  
>  	*ranges = new_ranges;
>  	if (*nr_ranges < MAX_DEBUG_ENTRIES)
> -		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
> +		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%" PRIu32 "\n",
>  			  vf_id, start, end,
>  			  (end - start + sizeof(xe_ggtt_pte_t)) /
>  			  sizeof(xe_ggtt_pte_t));
> -- 
> 2.34.1
> 
