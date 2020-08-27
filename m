Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD15F6E0CD
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 15:22:43 +0000 (UTC)
References: <20200827150920.12940-1-sowmyax.kaparthi@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <7a020f08-db91-81a8-29ab-940046fe46ba@intel.com>
Date: Thu, 27 Aug 2020 18:22:40 +0300
MIME-Version: 1.0
In-Reply-To: <20200827150920.12940-1-sowmyax.kaparthi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] Fixing the latency of hrtimer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>, igt-dev@lists.freedesktop.org, umesh.nerlige.ramappa@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 27/08/2020 18:09, Sowmya Kaparthi wrote:
> This test undergoes sanity check that we are not spending more than
> 1/100th of the time awake in the kernel. The right thing would be to
> adjust that value by the number of expected wakeups. We expect the
> kernel time not to exceed 1/100th of the total test duration at the
> default hrtimer of 200Hz/every5ms. Scale that by the provided hrtimer if
> applicable.
>
> Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
> Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
> ---
>   tests/i915/perf.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index a894fd38..0caa9fe0 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -1993,6 +1993,7 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
>   
>   	int64_t start, end;
>   	int n = 0;
> +	uint64_t max_expected_kernel_ns;
>   
>   	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>   
> @@ -2098,7 +2099,12 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
>   	 */
>   	igt_assert(n > (min_iterations + n_extra_iterations));
>   
> -	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> +	if (set_kernel_hrtimer)
> +		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
> +					 /(5 * 1000 * 1000);
> +	else
> +		max_expected_kernel_ns = test_duration_ns / 100;
> +	igt_assert(kernel_ns <= max_expected_kernel_ns);


Thanks, looks good. Just a small coding style issue.

Multiline blocks in if/for/while() needs to be surrounded by {}.


With that fixed:


Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Cheers,


-Lionel


>   
>   	__perf_close(stream_fd);
>   }
> @@ -2152,6 +2158,7 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>   	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
>   	int64_t start, end;
>   	int n = 0;
> +	uint64_t max_expected_kernel_ns;
>   
>   	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>   
> @@ -2286,7 +2293,12 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>   	 */
>   	igt_assert(n > (min_iterations + n_extra_iterations));
>   
> -	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> +	if (set_kernel_hrtimer)
> +		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
> +					 / (5 * 1000 * 1000);
> +	else
> +		max_expected_kernel_ns = test_duration_ns / 100;
> +	igt_assert(kernel_ns <= max_expected_kernel_ns);
>   
>   	__perf_close(stream_fd);
>   }


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
