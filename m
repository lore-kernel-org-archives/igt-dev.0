Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155CC54F2E
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 13:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FBD10E2A9;
	Fri, 23 May 2025 13:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddmdCO7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CDF10E2A9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748007211; x=1779543211;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UURkhsUaEcuHstz+hAk/MV72P18Uzj9NzHbjFYLSPr8=;
 b=ddmdCO7f8DMb8FGEU6zTRSVU6/cVA6Y4Uba3XLbryURQ/ndXViP0Cv8v
 kbIK+kqFXjWG7F+pjmtCiIx6zkNmlm6DeTmDmFn5BNvgwpmQPpaFunFR7
 kpVuqQU+F8lJnEvbcqqpsSDb/9pEWF6jvmuLwMlElNdbUK+OMXRQr+aME
 3WRFf6nczR7mjFSk0CWq+BMj+t+/4lT4+iOLNTbCUloVNRT2iI3jgEk6l
 WkQo9MX2bZzjDKU6iLWcFabP0lKMVXH7EFWI9Zgax9+GmRcHFJ+QUvkU1
 YQDGFUHi8/0+9hYRzOmfQoMutXLAfVifusVjWQIQ2t9SC2dKtpzZNaHzt Q==;
X-CSE-ConnectionGUID: XPJiUsajTK6z4X0CQxpiow==
X-CSE-MsgGUID: JUNlYXj8R6iRrJCO5e+bkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49769618"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="49769618"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:33:31 -0700
X-CSE-ConnectionGUID: 1C/MYx8yQsejQd+Tq26G5A==
X-CSE-MsgGUID: anaChz+6SWeZNckOkZLRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="172040264"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.155])
 ([10.245.254.155])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:33:29 -0700
Message-ID: <0ddec057-9ef8-48ff-a7fb-ceb736452531@linux.intel.com>
Date: Fri, 23 May 2025 15:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 6/8] tests/intel/xe_sriov*: fixup print/scan
 formatting for files in tests
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
 <20250519113010.125751-7-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250519113010.125751-7-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 5/19/2025 1:30 PM, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
>   tests/intel/xe_sriov_flr.c               | 12 ++++++------
>   tests/intel/xe_sriov_scheduling.c        |  4 ++--
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 9ef5ed79a..451c3c5ca 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -58,7 +58,7 @@ static int ranges_fair_allocation(enum xe_sriov_shared_res res,
>   		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
>   
>   		if (igt_debug_on_f(current_allocation != expected_allocation,
> -				   "%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
> +				   "%s: Allocation mismatch, expected=%" PRIu64 " VF%u=%" PRIu64 "\n",
>   				   xe_sriov_debugfs_provisioned_attr_name(res),
>   				   expected_allocation, ranges[i].vf_id,
>   				   current_allocation)) {
> @@ -183,8 +183,8 @@ static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
>   	for (unsigned int i = 0; i < num_vfs - 1; i++)
>   		if (ranges[i].end >= ranges[i + 1].start) {
>   			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> -				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
> -				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
> +				  "Overlapping ranges: VF%u [%" PRIx64 "-%" PRIx64 "] and VF%u [%" PRIx64 "-%" PRIx64 "]\n" :
> +				  "Overlapping ranges: VF%u [%" PRIu64 "-%" PRIu64 "] and VF%u [%" PRIu64 "-%" PRIu64 "]\n",
>   				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
>   				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
>   			free(ranges);
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index a98d6ce70..91d9730fa 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -562,7 +562,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   			continue;
>   
>   		if (vf_id < 1 || vf_id > num_vfs) {
> -			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
> +			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
>   					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
>   			free(ranges);
>   			return -1;
> @@ -634,7 +634,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
>   				 (uint8_t)vf_id, &pte)) {
>   			set_skip_reason(data,
> -					"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
> +					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
>   					vf_id, pte, pte_offset);
>   			return;
>   		}
> @@ -655,7 +655,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
>   				   expected, &pte)) {
>   			set_fail_reason(data,
> -					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#lx at offset: %#x\n",
> +					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
>   					flr_vf_id, vf_id, pte, pte_offset);
>   			return;
>   		}
> @@ -712,7 +712,7 @@ static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t
>   	}
>   
>   	if (st.st_size < length) {
> -		igt_debug("Mapping length (%lu) exceeds BAR2 size (%lu)\n", length, st.st_size);
> +		igt_debug("Mapping length (%zu) exceeds BAR2 size (%" PRIo64 ")\n", length, st.st_size);

Why PRIo64 ?

>   		close(fd);
>   		return NULL;
>   	}
> @@ -750,7 +750,7 @@ static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start,
>   
>   	for (; start < lmem->size; start += step) {
>   		read = lmem_write_readback(lmem->addr, start, value);
> -		if (igt_debug_on_f(read != value, "LMEM[%lu]=%u != %u\n", start, read, value))
> +		if (igt_debug_on_f(read != value, "LMEM[%zu]=%u != %u\n", start, read, value))
>   			return false;
>   	}
>   	return true;
> @@ -765,7 +765,7 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
>   	for (; start < lmem->size; start += step) {
>   		read = lmem_read(lmem->addr, start);
>   		if (igt_debug_on_f(read != expected,
> -				   "LMEM[%lu]=%u != %u\n", start, read, expected))
> +				   "LMEM[%zu]=%u != %u\n", start, read, expected))
>   			return false;
>   	}
>   	return true;
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 2cd18c982..d69315690 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -346,7 +346,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   			common_end = stats->end_timestamp;
>   	}
>   
> -	igt_info("common time frame: [%lu;%lu] %.2fms\n",
> +	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
>   		 common_start, common_end, (common_end - common_start) / 1e6);
>   
>   	if (igt_warn_on_f(common_end <= common_start, "No common time frame for all sets found\n"))
> @@ -671,7 +671,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   	int preemptible_end = 1;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
>   
> -	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
>   		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
>   		 duration_ms, num_vfs, job_timeout_ms);
>   
