Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697B10ED5E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 09:00:42 +0000 (UTC)
Message-ID: <01b44a2f-6488-739a-5eaf-87a416364611@linux.intel.com>
Date: Thu, 30 Mar 2023 10:00:28 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
 <20230330003656.1294873-6-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230330003656.1294873-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] tests/i915/perf_pmu: Quiesce GPU if
 measuring idle busyness without spinner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: arjun.melkaveri@intel.com, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/03/2023 01:36, Umesh Nerlige Ramappa wrote:
> The assumption in some tests is that the engines are not busy if no
> spinners are being run. This is not true in some cases where we see
> that the render is busy at the start of the test. Quiesce GPU to wait
> for such work to complete before checking for idle busyness.

Interesting.. hit in CI?

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/i915/perf_pmu.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 1bea3e57..5185cd9a 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -281,10 +281,12 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   
>   	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
>   
> -	if (flags & TEST_BUSY)
> +	if (flags & TEST_BUSY) {
>   		spin = spin_sync(gem_fd, ahnd, ctx, e);
> -	else
> +	} else {
>   		spin = NULL;
> +		gem_quiescent_gpu(gem_fd);
> +	}

But I'd probably just do it unconditionally at the start of tests, given 
that if we are testing 100% busy we want it to be from our own spinner, 
and not some potential leftover, which will then context switch to our 
spinner at a random point.

Regards,

Tvrtko

>   
>   	val = pmu_read_single(fd);
>   	slept = measured_usleep(batch_duration_ns / 1000);
> @@ -644,10 +646,12 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
>   	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_WAIT(e->class, e->instance),
>   			   fd[0]);
>   
> -	if (flags & TEST_BUSY)
> +	if (flags & TEST_BUSY) {
>   		spin = spin_sync(gem_fd, ahnd, ctx, e);
> -	else
> +	} else {
>   		spin = NULL;
> +		gem_quiescent_gpu(gem_fd);
> +	}
>   
>   	pmu_read_multi(fd[0], 2, val[0]);
>   	measured_usleep(batch_duration_ns / 1000);
