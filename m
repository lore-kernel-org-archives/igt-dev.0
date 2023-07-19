Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2E610E455
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 11:56:25 +0000 (UTC)
Message-ID: <909bce66-092d-30f4-466f-442586684e80@intel.com>
Date: Wed, 19 Jul 2023 13:56:08 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230719105137.823563-1-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230719105137.823563-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_*: Migrate allocator
 start/stop to fixtures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 19.07.2023 12:51, Zbigniew Kempczyński wrote:
> Although starting and stopping allocator in tests is nothing wrong
> it may produce annoying warning on next start if test just fails
> and doesn't call allocator stop. On multiprocess mode allocator
> creates dedicated thread which should be properly stopped on the
> test completion. Unfortunately premature test exit (failure)
> leaves it waiting. Next allocator start solves this situation
> (drops message queue what unblocks thread allowing it to exit)
> but it logs warning informing about this situation.
> 
> To avoid producing warning move allocator start/stop to fixtures
> in tests. I intentionally didn't touch api_intel_allocator (there
> I want to check this functionality) and in single benchmark
> (it is not executed on CI so there warning might be handy).

Really good commit message, gives enough context to understand the "why" 
of this change

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   tests/i915/gem_linear_blits.c      | 42 +++++++++++++++++-------------
>   tests/i915/gem_lmem_swapping.c     |  4 +--
>   tests/i915/gem_ringfill.c          | 13 ++++-----
>   tests/i915/gem_softpin.c           | 28 +++++++++++---------
>   tests/i915/gem_tiled_blits.c       | 40 ++++++++++++++++------------
>   tests/i915/gem_tiled_fence_blits.c | 22 +++++++++++-----
>   6 files changed, 84 insertions(+), 65 deletions(-)
> 
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 32b9052507..cc28e43fef 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -312,24 +312,30 @@ igt_main
>   	igt_subtest("basic")
>   		run_test(fd, 2, do_relocs);
>   
> -	igt_describe("The intent is to push beyond the working GTT size to force"
> -			" the driver to rebind the buffers");
> -	igt_subtest("normal") {
> -		intel_allocator_multiprocess_start();
> -		igt_fork(child, ncpus)
> -			run_test(fd, count, do_relocs);
> -		igt_waitchildren();
> -		intel_allocator_multiprocess_stop();
> -	}
> +	igt_subtest_group {
> +		igt_fixture {
> +			intel_allocator_multiprocess_start();
> +		}
>   
> -	igt_describe("Test with interrupts in between the parent process");
> -	igt_subtest("interruptible") {
> -		intel_allocator_multiprocess_start();
> -		igt_fork_signal_helper();
> -		igt_fork(child, ncpus)
> -			run_test(fd, count, do_relocs);
> -		igt_waitchildren();
> -		igt_stop_signal_helper();
> -		intel_allocator_multiprocess_stop();
> +		igt_describe("The intent is to push beyond the working GTT size to force"
> +				" the driver to rebind the buffers");
> +		igt_subtest("normal") {
> +			igt_fork(child, ncpus)
> +				run_test(fd, count, do_relocs);
> +			igt_waitchildren();
> +		}
> +
> +		igt_describe("Test with interrupts in between the parent process");
> +		igt_subtest("interruptible") {
> +			igt_fork_signal_helper();
> +			igt_fork(child, ncpus)
> +				run_test(fd, count, do_relocs);
> +			igt_waitchildren();
> +			igt_stop_signal_helper();
> +		}
> +
> +		igt_fixture {
> +			intel_allocator_multiprocess_stop();
> +		}
>   	}
>   }
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 2921de8f9f..0776239a95 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -708,7 +708,6 @@ static void test_evict(int i915,
>   	if (flags & TEST_PARALLEL) {
>   		int fd = drm_reopen_driver(i915);
>   
> -		intel_allocator_multiprocess_start();
>   		ctx = intel_ctx_create_all_physical(fd);
>   		__gem_context_set_persistence(fd, ctx->id, false);
>   
> @@ -719,7 +718,6 @@ static void test_evict(int i915,
>   		igt_waitchildren();
>   		intel_ctx_destroy(fd, ctx);
>   		drm_close_driver(fd);
> -		intel_allocator_multiprocess_stop();
>   	} else {
>   		__do_evict(i915, ctx, &region->region, &params, params.seed);
>   	}
> @@ -904,6 +902,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			igt_require_gem(i915);
>   			igt_require(gem_has_lmem(i915));
>   			drm_close_driver(i915);
> +			intel_allocator_multiprocess_start();

Will this and end fixture be executed for each 
igt_dynamic_f/dynamic_lmem_subtest()? (The comment applies to other 
tests, such as gem_ringfill.c)

>   		}
>   
>   		igt_i915_driver_unload();
> @@ -946,6 +945,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		test_smem_oom(i915, ctx, region);
>   
>   	igt_fixture {
> +		intel_allocator_multiprocess_stop();
>   		intel_ctx_destroy(i915, ctx);
>   		free(regions);
>   		drm_close_driver(i915);
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index c718d6fe73..66fbd27fa5 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -456,6 +456,8 @@ igt_main
>   		igt_require(ring_size);
>   
>   		ctx = intel_ctx_create_all_physical(fd);
> +
> +		intel_allocator_multiprocess_start();
>   	}
>   
>   	/* Legacy path for selecting "rings". */
> @@ -467,13 +469,11 @@ igt_main
>   			for_each_ring(e, fd) {
>   				igt_dynamic_f("%s", e->name) {
>   					igt_require(gem_can_store_dword(fd, eb_ring(e)));
> -					intel_allocator_multiprocess_start();
>   					run_test(fd, intel_ctx_0(fd),
>   						 eb_ring(e),
>   						 m->flags,
>   						 m->timeout);
>   					gem_quiescent_gpu(fd);
> -					intel_allocator_multiprocess_stop();
>   				}
>   			}
>   		}
> @@ -491,13 +491,11 @@ igt_main
>   					continue;
>   
>   				igt_dynamic_f("%s", e->name) {
> -					intel_allocator_multiprocess_start();
>   					run_test(fd, ctx,
>   						 e->flags,
>   						 m->flags,
>   						 m->timeout);
>   					gem_quiescent_gpu(fd);
> -					intel_allocator_multiprocess_stop();
>   				}
>   			}
>   		}
> @@ -506,7 +504,6 @@ igt_main
>   	igt_describe("Basic check to fill the ring upto maximum on all engines simultaneously.");
>   	igt_subtest("basic-all") {
>   		const struct intel_execution_engine2 *e;
> -		intel_allocator_multiprocess_start();
>   
>   		for_each_ctx_engine(fd, ctx, e) {
>   			if (!gem_class_can_store_dword(fd, e->class))
> @@ -517,10 +514,10 @@ igt_main
>   		}
>   
>   		igt_waitchildren();
> +	}
> +
> +	igt_fixture {
>   		intel_allocator_multiprocess_stop();
> -	}
> -
> -	igt_fixture {
>   		intel_ctx_destroy(fd, ctx);
>   		drm_close_driver(fd);
>   	}
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c

We also start and stop the intel allocator inside test_allocator_evict() 
-- is that intentional?

> index e6cbf624e1..e7d8b0cd04 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -1060,13 +1060,6 @@ static void test_allocator_fork(int fd)
>   	struct drm_i915_gem_exec_object2 objects[num_reserved];
>   	uint64_t ahnd, ressize = 4096;
>   
> -	/*
> -	 * Must be called before opening allocator in multiprocess environment
> -	 * due to freeing previous allocator infrastructure and proper setup
> -	 * of data structures and allocation thread.
> -	 */
> -	intel_allocator_multiprocess_start();
> -
>   	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
>   	__reserve(ahnd, fd, true, objects, num_reserved, ressize);
>   
> @@ -1084,8 +1077,6 @@ static void test_allocator_fork(int fd)
>   
>   	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
>   	igt_assert(intel_allocator_close(ahnd) == true);
> -
> -	intel_allocator_multiprocess_stop();
>   }
>   
>   #define BATCH_SIZE (4096<<10)
> @@ -1666,10 +1657,6 @@ igt_main
>   			test_allocator_nopin(fd, true);
>   		}
>   
> -		igt_describe("Check if multiple processes can use alloctor.");
> -		igt_subtest("allocator-fork")
> -			test_allocator_fork(fd);
> -
>   		igt_describe("Exercise eviction with softpinning.");
>   		test_each_engine("allocator-evict", fd, ctx, e)
>   			test_allocator_evict(fd, ctx, e->flags, 20);
> @@ -1699,6 +1686,21 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(gem_uses_full_ppgtt(fd));
> +			intel_allocator_multiprocess_start();
> +		}
> +
> +		igt_describe("Check if multiple processes can use alloctor.");

Nit: s/alloctor/allocator/

All the best,
Karolina

> +		igt_subtest("allocator-fork")
> +			test_allocator_fork(fd);
> +
> +		igt_fixture {
> +			intel_allocator_multiprocess_stop();
> +		}
> +	}
> +
>   	igt_describe("Check start offset and alignment detection.");
>   	igt_subtest("safe-alignment")
>   		safe_alignment(fd);
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
> index 22ac3280d9..072fef3c32 100644
> --- a/tests/i915/gem_tiled_blits.c
> +++ b/tests/i915/gem_tiled_blits.c
> @@ -211,24 +211,30 @@ igt_main
>   	igt_subtest("basic")
>   		run_test(fd, 2);
>   
> -	igt_describe("Check with parallel execution.");
> -	igt_subtest("normal") {
> -		intel_allocator_multiprocess_start();
> -		igt_fork(child, ncpus)
> -			run_test(fd, count);
> -		igt_waitchildren();
> -		intel_allocator_multiprocess_stop();
> -	}
> +	igt_subtest_group {
> +		igt_fixture {
> +			intel_allocator_multiprocess_start();
> +		}
>   
> -	igt_describe("Check with interrupts in parallel execution.");
> -	igt_subtest("interruptible") {
> -		intel_allocator_multiprocess_start();
> -		igt_fork_signal_helper();
> -		igt_fork(child, ncpus)
> -			run_test(fd, count);
> -		igt_waitchildren();
> -		igt_stop_signal_helper();
> -		intel_allocator_multiprocess_stop();
> +		igt_describe("Check with parallel execution.");
> +		igt_subtest("normal") {
> +			igt_fork(child, ncpus)
> +				run_test(fd, count);
> +			igt_waitchildren();
> +		}
> +
> +		igt_describe("Check with interrupts in parallel execution.");
> +		igt_subtest("interruptible") {
> +			igt_fork_signal_helper();
> +			igt_fork(child, ncpus)
> +				run_test(fd, count);
> +			igt_waitchildren();
> +			igt_stop_signal_helper();
> +		}
> +
> +		igt_fixture {
> +			intel_allocator_multiprocess_stop();
> +		}
>   	}
>   
>   	igt_fixture {
> diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
> index 5444dcfb85..c536c3699e 100644
> --- a/tests/i915/gem_tiled_fence_blits.c
> +++ b/tests/i915/gem_tiled_fence_blits.c
> @@ -325,13 +325,21 @@ igt_main
>   	igt_subtest("basic")
>   		run_test(fd, 2, end);
>   
> -	igt_describe("Check with parallel execution.");
> -	igt_subtest("normal") {
> -		intel_allocator_multiprocess_start();
> -		igt_fork(child, ncpus)
> -			run_test(fd, count, end);
> -		igt_waitchildren();
> -		intel_allocator_multiprocess_stop();
> +	igt_subtest_group {
> +		igt_fixture {
> +			intel_allocator_multiprocess_start();
> +		}
> +
> +		igt_describe("Check with parallel execution.");
> +		igt_subtest("normal") {
> +			igt_fork(child, ncpus)
> +					run_test(fd, count, end);
> +			igt_waitchildren();
> +		}
> +
> +		igt_fixture {
> +			intel_allocator_multiprocess_stop();
> +		}
>   	}
>   
>   	igt_fixture
