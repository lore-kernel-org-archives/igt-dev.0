Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20200224215650.39624-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <6ad2e8c7-f3e3-a43e-ea4c-92ab57d69b06@linux.intel.com>
Date: Tue, 25 Feb 2020 18:08:14 +0000
MIME-Version: 1.0
In-Reply-To: <20200224215650.39624-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_persistence: Check
 precision of hostile cancellation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 24/02/2020 21:56, Chris Wilson wrote:
> Check that if we have to remove a hostile request from a non-persistent
> context, we do so without harming any other concurrent users.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/gem_ctx_persistence.c | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 20007f5c4..cd174d263 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -613,6 +613,62 @@ static void test_process_mixed(int pfd, unsigned int engine)
>   	gem_quiescent_gpu(pfd);
>   }
>   
> +static void
> +test_saturated_hostile(int i915, const struct intel_execution_engine2 *engine)
> +{
> +	const struct intel_execution_engine2 *other;
> +	igt_spin_t *spin;
> +	uint32_t ctx;
> +	int fence = -1;
> +
> +	/*
> +	 * Check that if we have to remove a hostile request from a
> +	 * non-persistent context, we do so without harming any other
> +	 * concurrent users.
> +	 */
> +
> +	__for_each_physical_engine(i915, other) {
> +		if (other->flags == engine->flags)
> +			continue;
> +
> +		spin = igt_spin_new(i915,
> +				   .engine = other->flags,
> +				   .flags = (IGT_SPIN_NO_PREEMPTION |
> +					     IGT_SPIN_FENCE_OUT));
> +
> +		if (fence < 0) {
> +			fence = spin->out_fence;
> +		} else {
> +			int tmp;
> +
> +			tmp = sync_fence_merge(fence, spin->out_fence);
> +			close(fence);
> +			close(spin->out_fence);
> +
> +			fence = tmp;
> +		}
> +		spin->out_fence = -1;
> +	}
> +
> +	ctx = gem_context_clone_with_engines(i915, 0);
> +	gem_context_set_persistence(i915, ctx, false);
> +	spin = igt_spin_new(i915, ctx,
> +			    .engine = engine->flags,
> +			    .flags = (IGT_SPIN_NO_PREEMPTION |
> +				      IGT_SPIN_POLL_RUN |
> +				      IGT_SPIN_FENCE_OUT));
> +	igt_spin_busywait_until_started(spin);
> +	gem_context_destroy(i915, ctx);
> +
> +	igt_assert_eq(sync_fence_wait(spin->out_fence, reset_timeout_ms), 0);
> +	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
> +
> +	/* All other spinners should be left unharmed */
> +	gem_quiescent_gpu(i915);
> +	igt_assert_eq(sync_fence_wait(fence, reset_timeout_ms), 0);
> +	igt_assert_eq(sync_fence_status(fence), 1);

I don't quite get this test. Why would other spinners be unharmed? They 
are non-preemptible as well. And non-persistent spinner is alone on the 
engine. So what aspect you wanted to test?

Regards,

Tvrtko

> +}
> +
>   static void test_processes(int i915)
>   {
>   	struct {
> @@ -1041,6 +1097,13 @@ igt_main
>   			}
>   		}
>   
> +		igt_subtest_with_dynamic_f("saturated-hostile") {
> +			__for_each_physical_engine(i915, e) {
> +				igt_dynamic_f("%s", e->name)
> +					test_saturated_hostile(i915, e);
> +			}
> +		}
> +
>   		igt_subtest("smoketest")
>   			smoketest(i915);
>   	}
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
