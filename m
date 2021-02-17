Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C327E6E4B6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Feb 2021 07:24:00 +0000 (UTC)
Date: Wed, 17 Feb 2021 09:24:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YCzEmUwlgeQ1HPsE@platvala-desk.ger.corp.intel.com>
References: <20210216202557.878778-1-martin.peres@mupuf.org>
 <20210216202557.878778-2-martin.peres@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216202557.878778-2-martin.peres@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] amdgpu/info: add
 timestamp-related tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@mupuf.org>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 10:25:57PM +0200, Martin Peres wrote:
> This test makes sure:
> 
>  * the clock is running at the expected rate
>  * (potential) power gating has no effect on the clock
> 
> v2:
>  - use signed integer for the gpu timestamp diff (Bas)
> 
> v3:
>  - add test and subtest descriptions (Arek)
>  - split the fast and long tests in different subtests (Martin)
>  - use igt_stats to compute actual statistics (Chris)
> 
> v4:
>  - call igt_stats_fini() after finishing with the stats (Petri)
> 
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: Martin Peres <martin.peres@mupuf.org>

I have no way of assessing the coverage of the test etc so I'll just
provide drive-by cosmetic suggestions below.


> ---
>  tests/amdgpu/amd_info.c | 79 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index 6764e640..e3b1eac1 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -44,6 +44,75 @@ static void query_firmware_version_test(void)
>  	igt_assert_eq(r, 0);
>  }
>  
> +static void query_timestamp_test(uint32_t sleep_time, int sample_count)
> +{
> +	struct amdgpu_gpu_info gpu_info = {};
> +	double median, std_err, err_95_conf;
> +	igt_stats_t stats;
> +	float ns_per_tick;
> +	int i;
> +
> +	igt_stats_init_with_size(&stats, sample_count);
> +
> +	/* figure out how many nanoseconds each gpu timestamp tick represents */
> +	igt_assert_eq(amdgpu_query_gpu_info(dev, &gpu_info), 0);
> +	igt_assert_lt(0, gpu_info.gpu_counter_freq);

Consider whether you want to say "timestamp querying is broken" or
"cannot test timestamp querying" with these, aka igt_assert vs
igt_require.


> +	ns_per_tick = 1e9 / (gpu_info.gpu_counter_freq * 1000.0);
> +
> +	/* acquire the data needed for the analysis */
> +	for (i = 0; i < sample_count; i++) {
> +		uint64_t ts_start, ts_end, cpu_delta;
> +		int64_t gpu_delta;
> +		float corrected_gpu_delta;
> +		struct timespec ts_cpu;
> +		int r;
> +
> +		igt_assert_eq(igt_gettime(&ts_cpu), 0);
> +
> +		r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_start);
> +		igt_assert_eq(r, 0);
> +
> +		usleep(sleep_time);
> +
> +		r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_end);
> +		igt_assert_eq(r, 0);

Both of these query_info return value checks, when failing, will just
say "test failed, r is not 0". Consider igt_assert_f with a message
that states what is broken.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
