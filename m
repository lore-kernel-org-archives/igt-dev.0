Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8944EC54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074D10E18F;
	Tue, 27 May 2025 16:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOH4h/Vl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0242210E18F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748363103; x=1779899103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u2OCQgB2ZXBUTQbRjwkG8LbuJSIF1oFRChPv1Dbt5hg=;
 b=QOH4h/VlZR1EesBaFIp65qp5wRXHs+qlyO6mTncKCcgiu384GK/iRqrd
 EeuDexjJNRRifdqgPjScppKl0LgyNZdP7W19h3o2jcgGikhEQrgqwYHZL
 Rd61o+R+DYXevYA/EFhIzob8uolb+vI8bU33qb5Ni7mRbXJWt/GBywC86
 pQKg5hRoCy5oO/tj1B71XbAYEhd7+YaNaea9uF7XA4Dp3wESQIeed7stf
 o/rSgbdJRFxC2yZ6dmfpusecmp6SjexvIubivfehB5R6+/ITEjLBF3Sk8
 eUWuxd1fNvCrcFkYXGL2A/R+bytFWhkK/c9BMzHvE59W8m2sRU03Avcyk Q==;
X-CSE-ConnectionGUID: jITKvBsPRuCNB7JoCjBfWQ==
X-CSE-MsgGUID: D/dceNosSiiI9AGS7RauqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72898332"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="72898332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:25:02 -0700
X-CSE-ConnectionGUID: J5jBDE3oRN62luKN5WLsTg==
X-CSE-MsgGUID: 8mUGl6Y4QuCBw6HTNFjKkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="180087464"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:25:01 -0700
Date: Tue, 27 May 2025 18:24:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 8/9] tests/intel: fixup print formatting for
 files in intel tests
Message-ID: <20250527162457.njgml6vti4pzk2f6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-9-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527120421.79026-9-jan.sokolowski@intel.com>
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
On 2025-05-27 at 12:04:20 +0000, Jan Sokolowski wrote:

please improve subject, for example imho better:

[PATCH i-g-t v4 8/9] tests/intel: Fix print formatting for 32-bit compilation

> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 

You could consider adding to Cc developer(s) found with git blame.

> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_compute_preempt.c       |  5 +++--
>  tests/intel/xe_eu_stall.c              |  4 ++--
>  tests/intel/xe_exec_capture.c          |  9 +++++----
>  tests/intel/xe_exec_system_allocator.c |  8 ++++----
>  tests/intel/xe_oa.c                    |  6 +++---
>  tests/intel/xe_pmu.c                   | 16 ++++++++--------
>  tests/intel/xe_render_copy.c           |  2 +-
>  7 files changed, 26 insertions(+), 24 deletions(-)

With subject improved this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 43ffb8dba..caed08a71 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -12,6 +12,7 @@
>   * Test category: functionality test
>   */
>  
> +#include <inttypes.h>
>  #include <string.h>
>  
>  #include "igt.h"
> @@ -84,7 +85,7 @@ igt_main
>  				 */
>  				child_count = ram_mb / 2 / CONTEXT_MB / 2;
>  
> -				igt_debug("RAM: %zd, child count: %d\n",
> +				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>  					  ram_mb, child_count);
>  
>  				test_compute_preempt(xe, hwe, false);
> @@ -111,7 +112,7 @@ igt_main
>  				 */
>  				child_count = ram_mb / CONTEXT_MB / 2;
>  
> -				igt_debug("RAM: %zd, child count: %d\n",
> +				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>  					  ram_mb, child_count);
>  
>  				test_compute_preempt(xe, hwe, false);
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> index 411c30871..b27f5685e 100644
> --- a/tests/intel/xe_eu_stall.c
> +++ b/tests/intel/xe_eu_stall.c
> @@ -516,7 +516,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
>  	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
>  	if (p_rate == 0)
>  		properties[3] = query_eu_stall_data->sampling_rates[0];
> -	igt_info("Sampling Rate: %lu\n", properties[3]);
> +	igt_info("Sampling Rate: %" PRIu64 "\n", properties[3]);
>  
>  	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
>  	igt_require_fd(stream_fd);
> @@ -580,7 +580,7 @@ enable:
>  		}
>  	} while (child_is_running);
>  
> -	igt_info("Total size read: %lu\n", total_size);
> +	igt_info("Total size read: %" PRIu64 "\n", total_size);
>  	igt_info("Number of samples: %u\n", num_samples);
>  	igt_info("Number of drops reported: %u\n", num_drops);
>  
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 92113cdb1..8257d8069 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -14,6 +14,7 @@
>  
>  #include <ctype.h>
>  #include <fcntl.h>
> +#include <inttypes.h>
>  #include <regex.h>
>  #include <stdio.h>
>  #include <string.h>
> @@ -290,10 +291,10 @@ check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo,
>  		     "Target not found:%s\n", tag);
>  
>  	result = compare_hex_value(output);
> -	igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, output,
> +	igt_debug("Compare %s %s vs [0x%" PRIX64 "-0x%" PRIX64 "] result %" PRIX64 "\n", tag, output,
>  		  addr_lo, addr_hi, result);
>  	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
> -		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
> +		     "value %" PRIX64 " out of range[0x%" PRIX64 "-0x%" PRIX64 "]\n", result, addr_lo, addr_hi);
>  }
>  
>  static void
> @@ -423,7 +424,7 @@ igt_main
>  			/* Reduce timeout value to speedup test */
>  			xe_sysfs_set_job_timeout_ms(xe, hwe, CAPTURE_JOB_TIMEOUT);
>  
> -			igt_debug("Reduced %s class timeout from %ld to %d\n",
> +			igt_debug("Reduced %s class timeout from %" PRIu64 " to %d\n",
>  				  xe_engine_class_name(hwe->engine_class),
>  				  timeouts[hwe->engine_class], CAPTURE_JOB_TIMEOUT);
>  		}
> @@ -452,7 +453,7 @@ igt_main
>  			store = xe_sysfs_get_job_timeout_ms(xe, hwe);
>  			igt_abort_on_f(timeout != store, "job_timeout_ms not restored!\n");
>  
> -			igt_debug("Restored %s class timeout to %ld\n",
> +			igt_debug("Restored %s class timeout to %" PRIu64 "\n",
>  				  xe_engine_class_name(hwe->engine_class),
>  				  timeouts[hwe->engine_class]);
>  
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 06daac8c2..564ea22b8 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -325,7 +325,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  			       &timeout);
>  	if (ret) {
>  		igt_info("FAIL EXEC_UFENCE_ADDR: 0x%016llx\n", sync[0].addr);
> -		igt_info("FAIL EXEC_UFENCE: EXPECTED=0x%016llx, ACTUAL=0x%016lx\n",
> +		igt_info("FAIL EXEC_UFENCE: EXPECTED=0x%016llx, ACTUAL=0x%016" PRIx64 "\n",
>  			 USER_FENCE_VALUE, exec_ufence[0]);
>  
>  		addr = to_user_pointer(ptr);
> @@ -336,9 +336,9 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  			uint64_t sdi_offset = (char *)&data->data - (char *)data;
>  			uint64_t sdi_addr = addr + sdi_offset;
>  
> -			igt_info("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
> -			igt_info("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
> -			igt_info("FAIL SDI_ADDR (in batch): 0x%016lx\n",
> +			igt_info("FAIL BATCH_ADDR: 0x%016" PRIx64 "\n", batch_addr);
> +			igt_info("FAIL SDI_ADDR: 0x%016" PRIx64 "\n", sdi_addr);
> +			igt_info("FAIL SDI_ADDR (in batch): 0x%016" PRIx64 "\n",
>  				 (((u64)data->batch[2]) << 32) | data->batch[1]);
>  			igt_info("FAIL DATA: EXPECTED=0x%08x, ACTUAL=0x%08x\n",
>  				 data->expected_data, data->data);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 2022c5cb3..cb59918ef 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -1015,13 +1015,13 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
>  		return;
>  	}
>  
> -	igt_debug("tick delta = %#lx\n", tick_delta);
> +	igt_debug("tick delta = %#" PRIx64 "\n", tick_delta);
>  
>  	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
>  	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>  		int n = xecore_idx[i];
>  
> -		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
> +		igt_debug("n %d: pec1[n] - pec0[n] %#" PRIx64 ", tick delta %#" PRIx64 "\n",
>  			  n, pec1[n] - pec0[n], tick_delta);
>  		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>  		if (pec1[n] && pec0[n])
> @@ -1031,7 +1031,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
>  			igt_assert(pec0[n]);
>  	}
>  
> -	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
> +	igt_debug("pec1[2] - pec0[2] %#" PRIx64 ", tick_delta * num_xecores: %#" PRIx64 "\n",
>  		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
>  	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
>  	assert_within_epsilon(pec1[2] - pec0[2],
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 02f23bd7d..8ed2fc3c0 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -200,9 +200,9 @@ static void check_all_engines(int num_engines, int *flag, uint64_t *before, uint
>  		engine_active_ticks = after[idx] - before[idx];
>  		engine_total_ticks = after[idx + 1] - before[idx + 1];
>  
> -		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", engine_idx,
> +		igt_debug("[%d] Engine active ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", engine_idx,
>  			  after[idx], before[idx], engine_active_ticks);
> -		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", engine_idx,
> +		igt_debug("[%d] Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", engine_idx,
>  			  after[idx + 1], before[idx + 1], engine_total_ticks);
>  
>  		if (flag[engine_idx] == TEST_LOAD)
> @@ -243,9 +243,9 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
>  	engine_active_ticks = after[0] - before[0];
>  	engine_total_ticks = after[1] - before[1];
>  
> -	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
> +	igt_debug("Engine active ticks:  after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", after[0], before[0],
>  		  engine_active_ticks);
> -	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
> +	igt_debug("Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", after[1], before[1],
>  		  engine_total_ticks);
>  
>  	if (cork)
> @@ -471,9 +471,9 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
>  		engine_active_ticks = after[idx] - before[idx];
>  		engine_total_ticks = after[idx + 1] - before[idx + 1];
>  
> -		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
> +		igt_debug("[%d] Engine active ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", i,
>  			  after[idx], before[idx], engine_active_ticks);
> -		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
> +		igt_debug("[%d] Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", i,
>  			  after[idx + 1], before[idx + 1], engine_total_ticks);
>  
>  		if (f->cork)
> @@ -526,9 +526,9 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
>  	engine_active_ticks = after[0] - before[0];
>  	engine_total_ticks = after[1] - before[1];
>  
> -	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
> +	igt_debug("[%d] Engine active ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", function,
>  		  after[0], before[0], engine_active_ticks);
> -	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
> +	igt_debug("[%d] Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", function,
>  		  after[1], before[1], engine_total_ticks);
>  
>  	busy_percent = (double)engine_active_ticks / engine_total_ticks;
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 60cd0fb45..19fdd43b0 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -629,7 +629,7 @@ static void render_stress_copy(int fd, struct igt_collection *set,
>  			render_duration_max = duration;
>  	}
>  	igt_info("%d render() loops in %d seconds\n", render_count, render_timeout);
> -	igt_info("Render duration: avg = %ld ns, min = %ld ns, max = %ld ns\n",
> +	igt_info("Render duration: avg = %" PRIu64 " ns, min = %" PRIu64 " ns, max = %" PRIu64 " ns\n",
>  		 render_duration_total / render_count,
>  		 render_duration_min, render_duration_max);
>  
> -- 
> 2.34.1
> 
