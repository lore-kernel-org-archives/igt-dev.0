Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D4CC5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 16:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FA910E762;
	Wed,  4 Jun 2025 16:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xf4WiXfD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71F610E762
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749053926; x=1780589926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MAKq2PK5BQAG1fXvHfMY/AxPZtjXg290p0Fnhc+G69c=;
 b=Xf4WiXfDjXdLeSbUEValb/u1f76eIfMgLxwxZWJzVkMKwgmwjOHypGAn
 IpJv1a7rsAXVGsqp/E3vhGmCzxN1t6gIJha8mVCnv/OwP5QmnQ8yTT/xc
 EVIJ3UI3lczQCTTlx7VIY4kd9GR/05dNUnJPLkU1t4udERPKmEQuBSJ1y
 sR3Es3GB2Rl6ZV8y5GNDzmmhTIZUfFiayi0r8i+CNE2xZCl3mR58Yzi92
 xEPUuP+YsFstLSugfaVbmWEdHCjpUqyrJUE8UjTi5uPbUaBxJTWnhcojh
 GOS43kJsJH3FnG3b3zTZUxvam3biSKqN7F9KlZm1P+aa212rVMAu99AC2 w==;
X-CSE-ConnectionGUID: fnBAgOV/TQiU2DYnSLSN+w==
X-CSE-MsgGUID: ii5GfBqxQFWJinzbN5Mhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68700646"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68700646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:18:45 -0700
X-CSE-ConnectionGUID: 66pbKVaBTL+QzAOKX1NwCg==
X-CSE-MsgGUID: 45reKvK7TQOUqXsC7gys7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150117174"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 09:18:44 -0700
Date: Wed, 4 Jun 2025 18:18:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 riana.tauro@intel.com
Subject: Re: [i-g-t, v8, 1/2] tests/i915/pm_rc6_residency: Use sysfs to
 achieve peak frequency
Message-ID: <20250604161829.2jh2ivuycxq4a5fg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, riana.tauro@intel.com
References: <20250602120347.62189-4-sk.anirban@intel.com>
 <20250602120347.62189-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602120347.62189-5-sk.anirban@intel.com>
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

Hi Sk,
On 2025-06-02 at 17:33:49 +0530, Sk Anirban wrote:

please improve subject, there is no 'i915' folder, so instead of:

[i-g-t, v8, 1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency

better is:

[i-g-t, v8, 1/2] tests/intel/pm_rc6_residency: Use sysfs to achieve peak frequency

Also, change in exit handler looks ok to me.

> Leverage IGT spinner to trigger frequency scaling and
> set RPS minimum frequency to RP0 for achieving peak frequency.
> This method replaces the existing waitboost mechanism used
> to reach maximum frequency.
> Restrict the power consumption test to GT0 alone, since we're
> evaluating the power usage for the entire GPU at once.
> 
> v4:
>  - Cosmetic changes (Riana)
> 
> v6:
>  - Fix frequency restoration (Riana)
> 
> v7:
>  - Fix variable scope (Riana)
> 
> v8:
>  - Fix signal handler (Kamil)

One more nit, could you 'compress' a little revisions?
Like:

v4: Cosmetic changes (Riana)
v6: Fix frequency restoration (Riana)
v7: Fix variable scope (Riana)
v8: Fix signal handler (Kamil)

Regards,
Kamil


> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/i915_pm_rc6_residency.c | 117 ++++++++++++++++++----------
>  1 file changed, 78 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index c9128481d..d3fa95423 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>  	return false;
>  }
>  
> -static uint32_t batch_create(int fd)
> -{
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t handle;
> -
> -	handle = gem_create(fd, 4096);
> -	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> -
> -	return handle;
> -}
> -
>  static int open_pmu(int i915, uint64_t config)
>  {
>  	int fd;
> @@ -286,45 +275,82 @@ static int open_pmu(int i915, uint64_t config)
>  	return fd;
>  }
>  
> -#define WAITBOOST 0x1
> +#define FREQUENT_BOOST 0x1
>  #define ONCE 0x2
>  
>  static void sighandler(int sig)
>  {
>  }
>  
> -static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
> +static uint32_t get_freq(int dirfd, uint8_t id)
> +{
> +	uint32_t val;
> +
> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
> +
> +	return val;
> +}
> +
> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
> +{
> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
> +}
> +
> +static uint32_t stash_min;
> +static int s_dirfd = -1;
> +
> +static void restore_freq(int sig)
> +{
> +	if (s_dirfd == -1)
> +		return;
> +
> +	set_freq(s_dirfd, RPS_MIN_FREQ_MHZ, stash_min);
> +	close(s_dirfd);
> +}
> +
> +static void bg_load(int i915, const intel_ctx_t *ctx, uint64_t engine_flags,
> +		    unsigned int flags, unsigned long *ctl, unsigned int gt)
>  {
>  	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
> -	struct drm_i915_gem_exec_object2 obj = {
> -		.handle = batch_create(i915),
> -	};
> -	struct drm_i915_gem_execbuffer2 execbuf = {
> -		.buffers_ptr = to_user_pointer(&obj),
> -		.buffer_count = 1,
> -		.flags = engine_flags,
> -		.rsvd1 = ctx_id,
> -	};
>  	struct sigaction act = {
>  		.sa_handler = sighandler
>  	};
> +	int64_t timeout = 1;
> +	uint64_t ahnd;
> +	int rp0;
>  
> +	ahnd = get_reloc_ahnd(i915, ctx->id);
> +	rp0 = get_freq(s_dirfd, RPS_RP0_FREQ_MHZ);
>  	sigaction(SIGINT, &act, NULL);
>  	do {
>  		uint64_t submit, wait, elapsed;
>  		struct timespec tv = {};
> +		igt_spin_t *spin;
>  
>  		igt_nsec_elapsed(&tv);
> -
> -		gem_execbuf(i915, &execbuf);
> +		spin = igt_spin_new(i915,
> +				    .ahnd = ahnd,
> +				    .ctx = ctx,
> +				    .engine = engine_flags);
>  		submit = igt_nsec_elapsed(&tv);
> -		if (flags & WAITBOOST) {
> -			gem_sync(i915, obj.handle);
> +		if (flags & FREQUENT_BOOST) {
> +			/* Set MIN freq to RP0 to achieve the peak freq */
> +			igt_assert_lt(0, set_freq(s_dirfd, RPS_MIN_FREQ_MHZ, rp0));
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			gem_wait(i915, spin->handle, &timeout);
> +
> +			/* Restore the MIN freq back to default */
> +			igt_assert_lt(0, set_freq(s_dirfd, RPS_MIN_FREQ_MHZ, stash_min));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>  			if (flags & ONCE)
> -				flags &= ~WAITBOOST;
> +				flags &= ~FREQUENT_BOOST;
>  		} else  {
> -			while (gem_bo_busy(i915, obj.handle))
> -				usleep(0);
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>  		}
>  		wait = igt_nsec_elapsed(&tv);
>  
> @@ -350,6 +376,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
>  		/* aim for ~1% busy */
>  		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>  	} while (!READ_ONCE(*ctl));
> +	put_ahnd(ahnd);
>  }
>  
>  static void kill_children(int sig)
> @@ -361,9 +388,9 @@ static void kill_children(int sig)
>  	signal(sig, old);
>  }
>  
> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
> +static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
>  {
> -	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
> +	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>  	const int tolerance = 20; /* Some RC6 is better than none! */
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>  	struct {
> @@ -371,9 +398,9 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>  		unsigned int flags;
>  		double power;
>  	} phases[] = {
> +		{ "once", FREQUENT_BOOST | ONCE },
>  		{ "normal", 0 },
> -		{ "boost", WAITBOOST },
> -		{ "once", WAITBOOST | ONCE },
> +		{ "boost", FREQUENT_BOOST }
>  	};
>  	struct power_sample sample[2];
>  	unsigned long slept, cycles;
> @@ -407,12 +434,18 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>  
>  	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>  
> +	if (gt) {
> +		close(fd);
> +		igt_power_close(&gpu);
> +		return;
> +	}
> +
>  	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  
>  	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>  		memset(done, 0, 2 * sizeof(*done));
>  		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, ctx_id, flags, phases[p].flags, done);
> +			bg_load(i915, ctx, flags, phases[p].flags, done, gt);
>  
>  		igt_power_get_energy(&gpu, &sample[0]);
>  		cycles = -READ_ONCE(done[1]);
> @@ -454,12 +487,12 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>  
>  	igt_power_close(&gpu);
>  
> -	if (phases[1].power - phases[0].power > 10) {
> -		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
> +	if (phases[2].power - phases[1].power > 20 && !gem_has_lmem(i915)) {
> +		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
>  			     "Exceeded energy expectations for single busy wait load\n"
>  			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
> -			     phases[2].power, phases[0].power, phases[1].power,
> -			     phases[0].power + (phases[1].power - phases[0].power) / 2);
> +			     phases[0].power, phases[1].power, phases[2].power,
> +			     phases[1].power + (phases[2].power - phases[1].power) / 2);
>  	}
>  }
>  
> @@ -585,16 +618,22 @@ igt_main
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>  
> +		s_dirfd = igt_sysfs_gt_open(i915, 0);
> +		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);
> +		igt_install_exit_handler(restore_freq);
> +		intel_allocator_multiprocess_start();
> +
>  		i915_for_each_gt(i915, dirfd, gt) {
>  			ctx = intel_ctx_create_for_gt(i915, gt);
>  			for_each_ctx_engine(i915, ctx, e) {
>  				if (e->instance == 0) {
>  					igt_dynamic_f("gt%u-%s", gt, e->name)
> -						rc6_idle(i915, ctx->id, e->flags, gt);
> +						rc6_idle(i915, ctx, e->flags, gt);
>  				}
>  			}
>  			intel_ctx_destroy(i915, ctx);
>  		}
> +		intel_allocator_multiprocess_stop();
>  	}
>  
>  	igt_subtest_with_dynamic("rc6-fence") {
> -- 
> 2.43.0
> 
