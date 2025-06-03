Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6682C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 14:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C62910E103;
	Tue,  3 Jun 2025 14:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqCCjoJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1910E1F8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 14:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748959690; x=1780495690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VG0Fzy51WumhJlYgbiQlF7eZQyHCjpm0ZcCpIIEGWiM=;
 b=AqCCjoJjr2H0Usk/xUpmPyXwWE9oRKDZmg1MoBu4N8k0KZelTNBYd5vy
 9OqYl9gikEkgK50xkY2eb6aS2Aa5GnDCpre4PTcVAG5Q5mrsIsB6o7cVD
 /8NH40Ux0teEQmt71saVfdgq9DdBHDCYcvWZtU2S84i4Y0f9g3izCeyiM
 aoLOexz0qGqQH6qDjK99EYGQ/mpcQTzRWoP3yX7csItc1hVcYwYohtXAW
 VkNm55ynEo+CeJ9aNvi8ZdBJWg6V8fUDIoLhlr+S87cF+Ae0aSs/p2hix
 sTBZ856EHGsD8G+QeyHZe0fx5JZvsjMObruN1DSoPFn30xA2FZk1/jKJ+ g==;
X-CSE-ConnectionGUID: dnVBWl/xQE6sM1YIiR3yaQ==
X-CSE-MsgGUID: Kmp5G2rmRJubaaLEUqdcDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68433271"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68433271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:08:10 -0700
X-CSE-ConnectionGUID: EeGwVSJ7RTeF0GZZe+Kevw==
X-CSE-MsgGUID: MZL4HMnTTTeb9n0cFF12vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182042371"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:08:09 -0700
Date: Tue, 3 Jun 2025 16:08:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 6/9] tests/intel/xe_sriov*: fix print formatting
 for 32-bit compilation
Message-ID: <20250603140806.chtwgygpqr7hnsyb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
 <20250603111107.3170529-7-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603111107.3170529-7-jan.sokolowski@intel.com>
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
On 2025-06-03 at 11:11:04 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> Add a cast to uint64_t to make printing st_size easier.
> 
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

You already got r-b from Peter in v4, so I am repeating it here

Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
>  tests/intel/xe_sriov_flr.c               | 12 ++++++------
>  tests/intel/xe_sriov_scheduling.c        |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 9ef5ed79a..451c3c5ca 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -58,7 +58,7 @@ static int ranges_fair_allocation(enum xe_sriov_shared_res res,
>  		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
>  
>  		if (igt_debug_on_f(current_allocation != expected_allocation,
> -				   "%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
> +				   "%s: Allocation mismatch, expected=%" PRIu64 " VF%u=%" PRIu64 "\n",
>  				   xe_sriov_debugfs_provisioned_attr_name(res),
>  				   expected_allocation, ranges[i].vf_id,
>  				   current_allocation)) {
> @@ -183,8 +183,8 @@ static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
>  	for (unsigned int i = 0; i < num_vfs - 1; i++)
>  		if (ranges[i].end >= ranges[i + 1].start) {
>  			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> -				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
> -				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
> +				  "Overlapping ranges: VF%u [%" PRIx64 "-%" PRIx64 "] and VF%u [%" PRIx64 "-%" PRIx64 "]\n" :
> +				  "Overlapping ranges: VF%u [%" PRIu64 "-%" PRIu64 "] and VF%u [%" PRIu64 "-%" PRIu64 "]\n",
>  				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
>  				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
>  			free(ranges);
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index a98d6ce70..0c6a0c97e 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -562,7 +562,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  			continue;
>  
>  		if (vf_id < 1 || vf_id > num_vfs) {
> -			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
> +			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
>  					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
>  			free(ranges);
>  			return -1;
> @@ -634,7 +634,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
>  				 (uint8_t)vf_id, &pte)) {
>  			set_skip_reason(data,
> -					"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
> +					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
>  					vf_id, pte, pte_offset);
>  			return;
>  		}
> @@ -655,7 +655,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
>  				   expected, &pte)) {
>  			set_fail_reason(data,
> -					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#lx at offset: %#x\n",
> +					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
>  					flr_vf_id, vf_id, pte, pte_offset);
>  			return;
>  		}
> @@ -712,7 +712,7 @@ static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t
>  	}
>  
>  	if (st.st_size < length) {
> -		igt_debug("Mapping length (%lu) exceeds BAR2 size (%lu)\n", length, st.st_size);
> +		igt_debug("Mapping length (%zu) exceeds BAR2 size (%" PRIu64 ")\n", length, (uint64_t)st.st_size);
>  		close(fd);
>  		return NULL;
>  	}
> @@ -750,7 +750,7 @@ static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start,
>  
>  	for (; start < lmem->size; start += step) {
>  		read = lmem_write_readback(lmem->addr, start, value);
> -		if (igt_debug_on_f(read != value, "LMEM[%lu]=%u != %u\n", start, read, value))
> +		if (igt_debug_on_f(read != value, "LMEM[%zu]=%u != %u\n", start, read, value))
>  			return false;
>  	}
>  	return true;
> @@ -765,7 +765,7 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
>  	for (; start < lmem->size; start += step) {
>  		read = lmem_read(lmem->addr, start);
>  		if (igt_debug_on_f(read != expected,
> -				   "LMEM[%lu]=%u != %u\n", start, read, expected))
> +				   "LMEM[%zu]=%u != %u\n", start, read, expected))
>  			return false;
>  	}
>  	return true;
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 2cd18c982..d69315690 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -346,7 +346,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>  			common_end = stats->end_timestamp;
>  	}
>  
> -	igt_info("common time frame: [%lu;%lu] %.2fms\n",
> +	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
>  		 common_start, common_end, (common_end - common_start) / 1e6);
>  
>  	if (igt_warn_on_f(common_end <= common_start, "No common time frame for all sets found\n"))
> @@ -671,7 +671,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>  	int preemptible_end = 1;
>  	uint8_t vf_ids[num_vfs + 1 /*PF*/];
>  
> -	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
>  		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
>  		 duration_ms, num_vfs, job_timeout_ms);
>  
> -- 
> 2.34.1
> 
