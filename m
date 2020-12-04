Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
 <20201203095914.1427672-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <50454fb2-2f43-3fc6-50ba-587b787bca3f@linux.intel.com>
Date: Fri, 4 Dec 2020 10:52:23 +0000
MIME-Version: 1.0
In-Reply-To: <20201203095914.1427672-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Exercise execution
 along context while closing it
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 03/12/2020 09:59, Chris Wilson wrote:
> Race the execution and interrupt handlers along a context, while
> closing it at a random time.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tests/i915/gem_ctx_exec.c | 60 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 194191def..18d5d1217 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -336,6 +336,63 @@ static void nohangcheck_hostile(int i915)
>   	close(i915);
>   }
>   
> +static void close_race(int i915)
> +{
> +	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	uint32_t *contexts;
> +
> +	contexts = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(contexts != MAP_FAILED);
> +
> +	for (int child = 0; child < ncpus; child++)
> +		contexts[child] = gem_context_clone_with_engines(i915, 0);
> +
> +	igt_fork(child, ncpus) {
> +		igt_spin_t *spin;
> +
> +		spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN);
> +		igt_spin_end(spin);
> +		gem_sync(i915, spin->handle);
> +
> +		while (!READ_ONCE(contexts[ncpus])) {
> +			int64_t timeout = 1;
> +
> +			igt_spin_reset(spin);
> +			igt_assert(!igt_spin_has_started(spin));
> +
> +			spin->execbuf.rsvd1 = READ_ONCE(contexts[child]);
> +			if (__gem_execbuf(i915, &spin->execbuf))
> +				continue;
> +
> +			igt_assert(gem_bo_busy(i915, spin->handle));

I've seen this line fail in CI results - any idea how that can happen?

> +			gem_wait(i915, spin->handle, &timeout); /* prime irq */

Is this depending on implementation specific behaviour, that we will 
leave the irq on after the waiter had exited?

> +			igt_spin_busywait_until_started(spin);
> +
> +			igt_spin_end(spin);
> +			gem_sync(i915, spin->handle);
> +		}
> +
> +		igt_spin_free(i915, spin);
> +	}
> +
> +	igt_until_timeout(5) {
> +		for (int child = 0; child < ncpus; child++) {
> +			gem_context_destroy(i915, contexts[child]);
> +			contexts[child] =
> +				gem_context_clone_with_engines(i915, 0);

Right so deliberate attempt to occasionally make the child use closed 
context. Presumably, well according to the CI results, it does manage to 
consistently hit it, which surprises me a bit. A comment here would be good.

> +		}
> +		usleep(1000);

Maybe add some randomness here? Or even a random busy loop within the 
child loop? I haven't looked at the i915 patch yet to know where the 
race actually is..

> +	}
> +
> +	contexts[ncpus] = 1;
> +	igt_waitchildren();
> +
> +	for (int child = 0; child < ncpus; child++)
> +		gem_context_destroy(i915, contexts[child]);
> +
> +	munmap(contexts, 4096);
> +}
> +
>   igt_main
>   {
>   	const uint32_t batch[2] = { 0, MI_BATCH_BUFFER_END };
> @@ -380,6 +437,9 @@ igt_main
>   	igt_subtest("basic-nohangcheck")
>   		nohangcheck_hostile(fd);
>   
> +	igt_subtest("basic-close-race")
> +		close_race(fd);
> +
>   	igt_subtest("reset-pin-leak") {
>   		int i;
>   
> 

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
