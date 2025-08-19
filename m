Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B80CCA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 12:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33C510E153;
	Tue, 19 Aug 2025 12:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RItes0MQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671D910E5BC
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755605754; x=1787141754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h8aPhf0/3T1znXaOYhsW/CsBphyGDt6LJFDVbbtu8uE=;
 b=RItes0MQ0xxgD0P3oofolSzxrRWRDla15VYqf1FUhZs13g98VzZhH42G
 Rlu07bsw032XixEHoJW9NgAbR/RK9fF5lrFYdKRiASfFfZ/bbwUo5c58V
 nPFHB4OWuTTHPD84TWkbaG+NHCdHzQ+2uHi5oWiCBz3F+wzomuIxrgrc4
 cisPeksN8WCnknNNV60f7R+VoxFp+8gkcfEwzAO26DNBHjFZQIJMeIolB
 gD/56wpitAJvD8hdnqRygb4xsmdYwLy09ewSBgmmn8jS5n/yxs7QenZkB
 eRLIuMWZI7MVtAlON9uoXWOqshyRkGzgbZx84D2EucdWZH3Xdu+hyIZ59 w==;
X-CSE-ConnectionGUID: w75fQQ4CRY6touIKlV0uvA==
X-CSE-MsgGUID: vU3jI+sDQD6mqJc7TyIG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75419104"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75419104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 05:15:54 -0700
X-CSE-ConnectionGUID: vXe3CRkATO6wVhDQccPZfw==
X-CSE-MsgGUID: M3TyqkMpTE6R9wy7qX0yag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167736459"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:15:52 -0700
Date: Tue, 19 Aug 2025 14:15:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_scheduling: K-in-flight;
 completion window; --inflight
Message-ID: <20250819121534.62p5yt67y6zi36rc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250819110055.453288-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819110055.453288-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-08-19 at 13:00:55 +0200, Marcin Bernatowicz wrote:

please improve subject or split this into more patches.

For example better subject could be:

[PATCH i-g-t] tests/intel/xe_sriov_scheduling: Refactor to better saturate HW

Regards,
Kamil

> Refactor submission/measurement to better saturate HW and make
> throughput comparisons more robust, especially with short jobs.
> Add the --inflight option.
> 
> - Drive a K-in-flight pipeline per VF using per-slot BO/addr/spin and
>   binary out-fences; add subm_exec_slot()/subm_wait_slot() (prefill +
>   refill).
> - Record complete_ts[] and per-slot submit_ts[]; build the common
>   window from completions [max(first), min(last)] and compute
>   throughput as count/window.
> - Push durations as submit-to-completion (complete_ts - submit_ts) and
>   print "mean submit->signal latency".
> - Add --inflight (0=auto; non-preempt defaults to 1; short jobs pick
>   higher K); print chosen K in the banner.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tests/intel/xe_sriov_scheduling.c | 241 +++++++++++++++++++++---------
>  1 file changed, 171 insertions(+), 70 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index d69315690..467eb1e29 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -27,6 +27,8 @@ struct subm_opts {
>  	uint32_t exec_quantum_ms;
>  	uint32_t preempt_timeout_us;
>  	double outlier_treshold;
> +	/* --inflight=0 => auto; >=1 => explicit K */
> +	unsigned int inflight;
>  };
>  
>  struct subm_work_desc {
> @@ -39,6 +41,7 @@ struct subm_stats {
>  	igt_stats_t samples;
>  	uint64_t start_timestamp;
>  	uint64_t end_timestamp;
> +	uint64_t *complete_ts; /* absolute completion timestamps (ns) */
>  	unsigned int num_early_finish;
>  	unsigned int concurrent_execs;
>  	double concurrent_rate;
> @@ -51,13 +54,17 @@ struct subm {
>  	int vf_num;
>  	struct subm_work_desc work;
>  	uint32_t expected_ticks;
> -	uint64_t addr;
>  	uint32_t vm;
>  	struct drm_xe_engine_class_instance hwe;
>  	uint32_t exec_queue_id;
> -	uint32_t bo;
> +	/* K slots (K BOs / addresses / mapped spinners / done fences / submit_ts) */
> +	unsigned int slots;
> +	uint64_t *submit_ts; /* per-slot submit timestamps (ns) */
> +	uint64_t *addr;
> +	uint32_t *bo;
>  	size_t bo_size;
> -	struct xe_spin *spin;
> +	struct xe_spin **spin;
> +	uint32_t *done_fence;
>  	struct drm_xe_sync sync[1];
>  	struct drm_xe_exec exec;
>  };
> @@ -78,43 +85,62 @@ struct subm_set {
>  };
>  
>  static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
> -		      struct drm_xe_engine_class_instance hwe)
> +		      struct drm_xe_engine_class_instance hwe,
> +		      unsigned int inflight)
>  {
> +	uint64_t base, stride;
> +
>  	memset(s, 0, sizeof(*s));
>  	s->fd = fd;
>  	s->vf_num = vf_num;
>  	s->hwe = hwe;
>  	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
>  		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
> -	s->addr = addr ? addr : 0x1a0000;
> +	s->slots = inflight ? inflight : 1;
>  	s->vm = xe_vm_create(s->fd, 0, 0);
>  	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
>  	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
>  			   xe_get_default_alignment(s->fd));
> -	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
> -			     vram_if_possible(fd, s->hwe.gt_id),
> -			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
> -	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
> -	/* out fence */
> -	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> -	s->sync[0].handle = syncobj_create(s->fd, 0);
> -	s->exec.num_syncs = 1;
> -	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->addr = calloc(s->slots, sizeof(*s->addr));
> +	s->bo = calloc(s->slots, sizeof(*s->bo));
> +	s->spin = calloc(s->slots, sizeof(*s->spin));
> +	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
> +	s->submit_ts = calloc(s->slots, sizeof(*s->submit_ts));
> +	igt_assert(s->addr && s->bo && s->spin && s->done_fence && s->submit_ts);
> +
> +	base = addr ? addr : 0x1a0000;
> +	stride = ALIGN(s->bo_size, 0x10000);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		s->addr[i] = base + i * stride;
> +		s->bo[i] = xe_bo_create(s->fd, s->vm, s->bo_size,
> +					vram_if_possible(fd, s->hwe.gt_id),
> +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		s->spin[i] = xe_bo_map(s->fd, s->bo[i], s->bo_size);
> +		xe_vm_bind_sync(s->fd, s->vm, s->bo[i], 0, s->addr[i], s->bo_size);
> +		s->done_fence[i] = syncobj_create(s->fd, 0);
> +	}
> +
>  	s->exec.num_batch_buffer = 1;
>  	s->exec.exec_queue_id = s->exec_queue_id;
> -	s->exec.address = s->addr;
> +	/* s->exec.address set per submission */
>  }
>  
>  static void subm_fini(struct subm *s)
>  {
> -	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
> -	gem_munmap(s->spin, s->bo_size);
> -	gem_close(s->fd, s->bo);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr[i], s->bo_size);
> +		gem_munmap(s->spin[i], s->bo_size);
> +		gem_close(s->fd, s->bo[i]);
> +		if (s->done_fence[i])
> +			syncobj_destroy(s->fd, s->done_fence[i]);
> +	}
>  	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
>  	xe_vm_destroy(s->fd, s->vm);
> -	syncobj_destroy(s->fd, s->sync[0].handle);
> +	free(s->addr);
> +	free(s->bo);
> +	free(s->spin);
> +	free(s->done_fence);
> +	free(s->submit_ts);
>  }
>  
>  static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> @@ -122,25 +148,41 @@ static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
>  	s->work = *work;
>  	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
>  						  s->work.duration_ms * 1000000);
> -	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
> -			  .ctx_ticks = s->expected_ticks);
> +	for (unsigned int i = 0; i < s->slots; i++)
> +		xe_spin_init_opts(s->spin[i], .addr = s->addr[i],
> +				  .preempt = s->work.preempt,
> +				  .ctx_ticks = s->expected_ticks);
>  }
>  
> -static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
> +static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeout_nsec)
>  {
> -	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
> -				0, NULL));
> +	igt_assert(syncobj_wait(s->fd, &s->done_fence[slot], 1,
> +				abs_timeout_nsec, 0, NULL));
>  }
>  
> -static void subm_exec(struct subm *s)
> +static void subm_exec_slot(struct subm *s, unsigned int slot)
>  {
> -	syncobj_reset(s->fd, &s->sync[0].handle, 1);
> +	struct timespec tv;
> +	int nsync = 0;
> +
> +	syncobj_reset(s->fd, &s->done_fence[slot], 1);
> +	memset(&s->sync[0], 0, sizeof(s->sync));
> +	s->sync[nsync].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	s->sync[nsync].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	s->sync[nsync].handle = s->done_fence[slot];
> +	nsync++;
> +	s->exec.num_syncs = nsync;
> +	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->exec.address = s->addr[slot];
> +
> +	igt_gettime(&tv);
> +	s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
>  	xe_exec(s->fd, &s->exec);
>  }
>  
> -static bool subm_is_work_complete(struct subm *s)
> +static bool subm_is_work_complete(struct subm *s, unsigned int slot)
>  {
> -	return s->expected_ticks <= ~s->spin->ticks_delta;
> +	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
>  }
>  
>  static bool subm_is_exec_queue_banned(struct subm *s)
> @@ -157,6 +199,8 @@ static bool subm_is_exec_queue_banned(struct subm *s)
>  static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>  			   const struct subm_opts *opts)
>  {
> +	const unsigned int inflight = s->slots;
> +	unsigned int submitted = 0;
>  	struct timespec tv;
>  	unsigned int i;
>  
> @@ -165,16 +209,27 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>  		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
>  	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
>  
> -	for (i = 0; i < s->work.repeats; ++i) {
> -		igt_gettime(&tv);
> +	/* Prefill */
> +	if (s->work.repeats) {
> +		unsigned int can_prefill = min(inflight, s->work.repeats);
>  
> -		subm_exec(s);
> +		for (i = 0; i < can_prefill; i++)
> +			subm_exec_slot(s, i % inflight);
> +		submitted = can_prefill;
> +	}
>  
> -		subm_wait(s, INT64_MAX);
> +	/* Process completions in order: sample i -> slot (i % inflight) */
> +	for (i = 0; i < s->work.repeats; ++i) {
> +		unsigned int slot = i % inflight;
> +
> +		subm_wait_slot(s, slot, INT64_MAX);
>  
> -		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
> +		igt_gettime(&tv);
> +		stats->complete_ts[i] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC +
> +					(uint64_t)tv.tv_nsec;
> +		igt_stats_push(&stats->samples, stats->complete_ts[i] - s->submit_ts[slot]);
>  
> -		if (!subm_is_work_complete(s)) {
> +		if (!subm_is_work_complete(s, slot)) {
>  			stats->num_early_finish++;
>  
>  			igt_debug("[%s] subm #%d early_finish=%u\n",
> @@ -183,6 +238,14 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>  			if (subm_is_exec_queue_banned(s))
>  				break;
>  		}
> +
> +		/* Keep the pipeline full */
> +		if (submitted < s->work.repeats) {
> +			unsigned int next_slot = submitted % inflight;
> +
> +			subm_exec_slot(s, next_slot);
> +			submitted++;
> +		}
>  	}
>  
>  	igt_gettime(&tv);
> @@ -272,8 +335,10 @@ static void subm_set_fini(struct subm_set *set)
>  
>  	subm_set_close_handles(set);
>  
> -	for (i = 0; i < set->ndata; ++i)
> +	for (i = 0; i < set->ndata; ++i) {
>  		igt_stats_fini(&set->data[i].stats.samples);
> +		free(set->data[i].stats.complete_ts);
> +	}
>  
>  	subm_set_free_data(set);
>  }
> @@ -334,16 +399,22 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>  	struct subm_stats *stats;
>  	uint64_t common_start = 0;
>  	uint64_t common_end = UINT64_MAX;
> +	uint64_t first_ts, last_ts;
>  
> -	/* Find the common time frame */
> +	/* Find common window from completion timestamps */
>  	for (i = 0; i < ndata; i++) {
>  		stats = &data[i].stats;
>  
> -		if (stats->start_timestamp > common_start)
> -			common_start = stats->start_timestamp;
> +		if (!stats->samples.n_values)
> +			continue;
>  
> -		if (stats->end_timestamp < common_end)
> -			common_end = stats->end_timestamp;
> +		first_ts = stats->complete_ts[0];
> +		last_ts = stats->complete_ts[stats->samples.n_values - 1];
> +
> +		if (first_ts > common_start)
> +			common_start = first_ts;
> +		if (last_ts < common_end)
> +			common_end = last_ts;
>  	}
>  
>  	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
> @@ -354,8 +425,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>  
>  	/* Compute concurrent_rate for each sample set within the common time frame */
>  	for (i = 0; i < ndata; i++) {
> -		uint64_t total_samples_duration = 0;
> -		uint64_t samples_duration_in_common_frame = 0;
> +		const double window_s = (common_end - common_start) * 1e-9;
>  
>  		stats = &data[i].stats;
>  		stats->concurrent_execs = 0;
> @@ -363,29 +433,21 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>  		stats->concurrent_mean = 0.0;
>  
>  		for (j = 0; j < stats->samples.n_values; j++) {
> -			uint64_t sample_start = stats->start_timestamp + total_samples_duration;
> -			uint64_t sample_end = sample_start + stats->samples.values_u64[j];
> +			uint64_t cts = stats->complete_ts[j];
>  
> -			if (sample_start >= common_start &&
> -			    sample_end <= common_end) {
> +			if (cts >= common_start && cts <= common_end) {
>  				stats->concurrent_execs++;
> -				samples_duration_in_common_frame +=
> -					stats->samples.values_u64[j];
> +				stats->concurrent_mean += stats->samples.values_u64[j];
>  			}
> -
> -			total_samples_duration += stats->samples.values_u64[j];
>  		}
>  
> -		stats->concurrent_rate = samples_duration_in_common_frame ?
> -				     (double)stats->concurrent_execs /
> -					     (samples_duration_in_common_frame *
> -					      1e-9) :
> -				     0.0;
> +		stats->concurrent_rate = (window_s > 0.0) ?
> +					 ((double)stats->concurrent_execs / window_s) : 0.0;
> +
>  		stats->concurrent_mean = stats->concurrent_execs ?
> -				      (double)samples_duration_in_common_frame /
> -					      stats->concurrent_execs :
> -				      0.0;
> -		igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms nsamples=%d\n",
> +					 (double)stats->concurrent_mean /
> +					 stats->concurrent_execs : 0.0;
> +		igt_info("[%s] Throughput = %.4f execs/s mean submit->signal latency=%.4fms nsamples=%d\n",
>  			 data[i].subm.id, stats->concurrent_rate, stats->concurrent_mean * 1e-6,
>  			 stats->concurrent_execs);
>  	}
> @@ -439,9 +501,9 @@ static void log_sample_values(char *id, struct subm_stats *stats,
>  }
>  
>  #define MIN_NUM_REPEATS 25
> -#define MIN_EXEC_QUANTUM_MS 8
> +#define MIN_EXEC_QUANTUM_MS 1
>  #define MAX_EXEC_QUANTUM_MS 32
> -#define MIN_JOB_DURATION_MS 16
> +#define MIN_JOB_DURATION_MS 2
>  #define MAX_TOTAL_DURATION_MS 15000
>  #define PREFERRED_TOTAL_DURATION_MS 10000
>  #define MAX_PREFERRED_REPEATS 100
> @@ -546,6 +608,25 @@ static struct vf_sched_params prepare_vf_sched_params(int num_threads,
>  	return params;
>  }
>  
> +/* inflight K selection:
> + *   user_k == 0  => auto
> + *   user_k >= 1  => explicit K
> + */
> +static unsigned int select_inflight_k(unsigned int duration_ms,
> +				      unsigned int user_k,
> +				      bool nonpreempt)
> +{
> +	if (user_k)
> +		return user_k >= 1 ? user_k : 1;
> +	if (nonpreempt)
> +		return 1;
> +	if (duration_ms <= 12)
> +		return 4;
> +	if (duration_ms <= 20)
> +		return 3;
> +	return 2;
> +}
> +
>  static struct job_sched_params
>  prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts)
>  {
> @@ -573,12 +654,14 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>  	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
>  									    job_timeout_ms,
>  									    opts);
> +	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
> +						 opts->inflight, false);
>  
> -	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
>  		 job_sched_params.sched_params.exec_quantum_ms,
>  		 job_sched_params.sched_params.preempt_timeout_us,
>  		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> -		 num_vfs + 1, job_timeout_ms);
> +		 k, num_vfs + 1, job_timeout_ms);
>  
>  	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>  		    &(struct init_vf_ids_opts){ .shuffle = true,
> @@ -607,7 +690,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>  		igt_assert_fd(vf_fd);
>  		set->data[n].opts = opts;
>  		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, k);
>  		subm_workload_init(&set->data[n].subm,
>  				   &(struct subm_work_desc){
>  					.duration_ms = job_sched_params.duration_ms,
> @@ -615,6 +698,8 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>  					.repeats = job_sched_params.num_repeats });
>  		igt_stats_init_with_size(&set->data[n].stats.samples,
>  					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));
>  		if (set->sync_method == SYNC_BARRIER)
>  			set->data[n].barrier = &set->barrier;
>  	}
> @@ -670,10 +755,11 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>  			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
>  	int preemptible_end = 1;
>  	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
>  
> -	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
>  		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
> -		 duration_ms, num_vfs, job_timeout_ms);
> +		 duration_ms, k, num_vfs, job_timeout_ms);
>  
>  	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>  		    &(struct init_vf_ids_opts){ .shuffle = true,
> @@ -702,7 +788,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>  		igt_assert_fd(vf_fd);
>  		set->data[n].opts = opts;
>  		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, k);
>  		subm_workload_init(&set->data[n].subm,
>  				   &(struct subm_work_desc){
>  					.duration_ms = duration_ms,
> @@ -710,6 +796,8 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>  					.repeats = MIN_NUM_REPEATS });
>  		igt_stats_init_with_size(&set->data[n].stats.samples,
>  					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));
>  		if (set->sync_method == SYNC_BARRIER)
>  			set->data[n].barrier = &set->barrier;
>  	}
> @@ -738,6 +826,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>  static struct subm_opts subm_opts = {
>  	.sync_method = SYNC_BARRIER,
>  	.outlier_treshold = 0.1,
> +	.inflight = 0,
>  };
>  
>  static bool extended_scope;
> @@ -764,6 +853,16 @@ static int subm_opts_handler(int opt, int opt_index, void *data)
>  		subm_opts.outlier_treshold = atoi(optarg) / 100.0;
>  		igt_info("Outlier threshold: %.2f\n", subm_opts.outlier_treshold);
>  		break;
> +	case 'i': {
> +		int val = atoi(optarg);
> +
> +		subm_opts.inflight = val > 0 ? val : 0;
> +		if (subm_opts.inflight)
> +			igt_info("In-flight submissions: %u\n", subm_opts.inflight);
> +		else
> +			igt_info("In-flight submissions: auto (0)\n");
> +		break;
> +	}
>  	default:
>  		return IGT_OPT_HANDLER_ERROR;
>  	}
> @@ -777,6 +876,7 @@ static const struct option long_opts[] = {
>  	{ .name = "threshold", .has_arg = true, .val = 't', },
>  	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
>  	{ .name = "pt_us", .has_arg = true, .val = 'p', },
> +	{ .name = "inflight", .has_arg = true, .val = 'i', },
>  	{}
>  };
>  
> @@ -785,7 +885,8 @@ static const char help_str[] =
>  	"  --sync\tThreads synchronization method: 0 - none 1 - barrier (Default 1)\n"
>  	"  --threshold\tSample outlier threshold (Default 0.1)\n"
>  	"  --eq_ms\texec_quantum_ms\n"
> -	"  --pt_us\tpreempt_timeout_us\n";
> +	"  --pt_us\tpreempt_timeout_us\n"
> +	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n";
>  
>  igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>  {
> -- 
> 2.31.1
> 
