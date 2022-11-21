Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C3A10E17D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 09:09:58 +0000 (UTC)
Message-ID: <4b9229ee-baa0-c146-adff-425f36d95eaf@linux.intel.com>
Date: Mon, 21 Nov 2022 09:09:55 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
References: <20221119020023.3376-1-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221119020023.3376-1-ashutosh.dixit@intel.com>
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


On 19/11/2022 02:00, Ashutosh Dixit wrote:
> With SLPC, even when we set the same min and max freq's, the requested and
> actual freq's can differ from the min/max freq set. For example "efficient
> freq" (when in effect) can override set min/max freq. In general FW is the
> final arbiter in determining freq and can override set values.
> 
> Therefore in igt@perf_pmu@frequency subtest, compare the requested freq
> reported by PMU not against the set freq's but against the requested freq
> reported in sysfs. Also add a delay after setting freq's to account for
> messaging delays in setting freq's in GuC.
> 
> v2: Introduce a 100 ms delay after setting freq
> v3: Update commit message, code identical to v2
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/i915/perf_pmu.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index f363db2ba13..02f6ae989b1 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -1543,10 +1543,13 @@ test_interrupts_sync(int gem_fd)
>   	igt_assert_lte(target, busy);
>   }
>   
> +/* Wait for GuC SLPC freq changes to take effect */
> +#define wait_freq_set()		usleep(100000)

A future task of maybe adding a drop_caches flag to wait for this?

Alternatively, if we have a sysfs or debugfs file which reflects the 
value once GuC has processed it, keep reading it until it is updated? 
Even if to something other than it was before the write, to handle the 
inability to set the exact requested frequency sometimes?

> +
>   static void
>   test_frequency(int gem_fd)
>   {
> -	uint32_t min_freq, max_freq, boost_freq;
> +	uint32_t min_freq, max_freq, boost_freq, min_req, max_req;
>   	uint64_t val[2], start[2], slept;
>   	double min[2], max[2];
>   	igt_spin_t *spin;
> @@ -1572,10 +1575,11 @@ test_frequency(int gem_fd)
>   	 * Set GPU to min frequency and read PMU counters.
>   	 */
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq));
> -	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", min_freq));
> -	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", min_freq));
> +	wait_freq_set();
> +	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
> +	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
>   	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
>   
>   	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
> @@ -1587,6 +1591,7 @@ test_frequency(int gem_fd)
>   
>   	min[0] = 1e9*(val[0] - start[0]) / slept;
>   	min[1] = 1e9*(val[1] - start[1]) / slept;
> +	min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");

This really leaves a bad taste for me still, sorry. First of all, it may 
make it more palatable if readback was immediately after 
wait_freq_set(), or as part of it. Otherwise it seems like even more 
confused test and sysfs ABI.

Did we close on my question of whether we can make readback of 
gt_max_freq_mhz actually represent the real max? Correct me please if I 
got confused - with min freq checking here we write max=300 and get 350? 
If so can we make gt_max_freq_mhz return 350 after the write of 300? Or 
return an error?

>   	igt_spin_free(gem_fd, spin);
>   	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
> @@ -1597,11 +1602,11 @@ test_frequency(int gem_fd)
>   	 * Set GPU to max frequency and read PMU counters.
>   	 */
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", max_freq));
> -	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == max_freq);
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", boost_freq));
> -	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == boost_freq);
> -
>   	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", max_freq));
> +	wait_freq_set();
> +	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == max_freq);
> +	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == boost_freq);
>   	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == max_freq);
>   
>   	gem_quiescent_gpu(gem_fd);
> @@ -1613,6 +1618,7 @@ test_frequency(int gem_fd)
>   
>   	max[0] = 1e9*(val[0] - start[0]) / slept;
>   	max[1] = 1e9*(val[1] - start[1]) / slept;
> +	max_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");

For the max freq use case we had 15% downward tolerance to account for 
thermally challenged.

a) Is that not enough with SLPC? Like there is a new "failure" mode?

b) Is the extra 10% needed with the sysfs readback added? Aka do we need 
both?

>   
>   	igt_spin_free(gem_fd, spin);
>   	gem_quiescent_gpu(gem_fd);
> @@ -1621,6 +1627,7 @@ test_frequency(int gem_fd)
>   	 * Restore min/max.
>   	 */
>   	igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq);
> +	wait_freq_set();
>   	if (igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") != min_freq)
>   		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
>   			 min_freq, igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
> @@ -1633,12 +1640,12 @@ test_frequency(int gem_fd)
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


This 0.15f is what I was talking about above.

Regards,

Tvrtko

>   }
>   
>   static void
