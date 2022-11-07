Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E110E2BE
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 10:27:19 +0000 (UTC)
Message-ID: <ebfddcea-8427-5d87-83e9-93a1fef024e6@linux.intel.com>
Date: Mon, 7 Nov 2022 10:27:16 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
References: <20221107062329.1927534-1-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221107062329.1927534-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Compare against
 requested freq in frequency subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 07/11/2022 06:23, Ashutosh Dixit wrote:
> In igt@perf_pmu@frequency subtest, compare the requested freq reported by
> PMU not against the set freq but against the requested freq reported in
> sysfs. If requested freq differs from the set freq (even when min == max
> freq) for whatever reason, the sysfs requested freq should be closer to the
> PMU measured requested freq which should minimize sporadic failures.
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806

So this bug describes the failure looks like this:

Starting subtest: frequency
(perf_pmu:1798) CRITICAL: Test assertion failure function test_frequency, file ../tests/i915/perf_pmu.c:1636:
(perf_pmu:1798) CRITICAL: Failed assertion: (double)(min[0]) <= (1.0 + (tolerance)) * (double)(min_freq) && (double)(min[0]) >= (1.0 - (tolerance)) * (double)(min_freq)
(perf_pmu:1798) CRITICAL: 'min[0]' != 'min_freq' (347.914580 not within +5.0%/-5.0% tolerance of 300.000000)
Subtest frequency failed.

Which is this in code:


	min_freq = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
...
	/*
	 * Set GPU to min frequency and read PMU counters.
	 */
	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq));
	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", min_freq));
	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", min_freq));
	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
...
	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);

	slept = pmu_read_multi(fd[0], 2, start);
	measured_usleep(batch_duration_ns / 1000);
	slept = pmu_read_multi(fd[0], 2, val) - slept;

	min[0] = 1e9*(val[0] - start[0]) / slept;
	min[1] = 1e9*(val[1] - start[1]) / slept;
...
	/*
	 * Restore min/max.
	 */
	igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq);
	if (igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") != min_freq)
		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
			 min_freq, igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
	close(fd[0]);
	close(fd[1]);
	put_ahnd(ahnd);

	igt_info("Min frequency: requested %.1f, actual %.1f\n",
		 min[0], min[1]);
	igt_info("Max frequency: requested %.1f, actual %.1f\n",
		 max[0], max[1]);

	assert_within_epsilon(min[0], min_freq, tolerance);

Which means sysfs told the test which is the minimum frequency. But it really isn't - it turns out 350 MHz is the real minimum? Or setting of gt_max_freq_mhz/gt_boost_freq_mhz is not actually respected by SLPC? It sounds trivial to respect the minimum frequency so I don't see what is the excuse.

Regards,

Tvrtko

> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/i915/perf_pmu.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index f363db2ba13..42b5b7bd6f2 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -1546,7 +1546,7 @@ test_interrupts_sync(int gem_fd)
>   static void
>   test_frequency(int gem_fd)
>   {
> -	uint32_t min_freq, max_freq, boost_freq;
> +	uint32_t min_freq, max_freq, boost_freq, min_req, max_req;
>   	uint64_t val[2], start[2], slept;
>   	double min[2], max[2];
>   	igt_spin_t *spin;
> @@ -1587,6 +1587,7 @@ test_frequency(int gem_fd)
>   
>   	min[0] = 1e9*(val[0] - start[0]) / slept;
>   	min[1] = 1e9*(val[1] - start[1]) / slept;
> +	min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
>   
>   	igt_spin_free(gem_fd, spin);
>   	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
> @@ -1613,6 +1614,7 @@ test_frequency(int gem_fd)
>   
>   	max[0] = 1e9*(val[0] - start[0]) / slept;
>   	max[1] = 1e9*(val[1] - start[1]) / slept;
> +	max_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
>   
>   	igt_spin_free(gem_fd, spin);
>   	gem_quiescent_gpu(gem_fd);
> @@ -1633,12 +1635,12 @@ test_frequency(int gem_fd)
>   	igt_info("Max frequency: requested %.1f, actual %.1f\n",
>   		 max[0], max[1]);
>   
> -	assert_within_epsilon(min[0], min_freq, tolerance);
> +	assert_within_epsilon(min[0], min_req, tolerance);
>   	/*
>   	 * On thermally throttled devices we cannot be sure maximum frequency
>   	 * can be reached so use larger tolerance downards.
>   	 */
> -	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f);
> +	__assert_within_epsilon(max[0], max_req, tolerance, 0.15f);
>   }
>   
>   static void
