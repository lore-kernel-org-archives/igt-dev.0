Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB310E5B5
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:47:13 +0000 (UTC)
Date: Fri, 19 May 2023 17:46:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230519154646.5esfhmb3ovghmz6d@kamilkon-desk1>
References: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
 <20230517151110.1710407-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517151110.1710407-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] i915/gem_exec_*: better document
 gem exec tests used for i915 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-17 at 17:11:07 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> core test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_exec_alignment.c |   4 ++
>  tests/i915/gem_exec_async.c     |   4 ++
>  tests/i915/gem_exec_await.c     |   4 ++
>  tests/i915/gem_exec_balancer.c  | 100 ++++++++++++++++++++++++++++
>  tests/i915/gem_exec_basic.c     |   6 +-
>  tests/i915/gem_exec_big.c       |   4 ++
>  tests/i915/gem_exec_capture.c   |   4 ++
>  tests/i915/gem_exec_create.c    |   7 ++
>  tests/i915/gem_exec_endless.c   |   4 ++
>  tests/i915/gem_exec_fence.c     | 112 ++++++++++++++++++++++++++++++++
>  tests/i915/gem_exec_gttfill.c   |   7 ++
>  tests/i915/gem_exec_nop.c       |   8 +++
>  tests/i915/gem_exec_parallel.c  |   8 +++
>  tests/i915/gem_exec_params.c    |  76 ++++++++++++++++++++++
>  tests/i915/gem_exec_schedule.c  |   4 ++
>  tests/i915/gem_exec_store.c     |   4 ++
>  tests/i915/gem_exec_whisper.c   |   4 ++
>  17 files changed, 359 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> index 6f7b9ac9b909..9d965270fa9f 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -47,9 +47,13 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem exec alignment
> + * Category: Desktop client
>   * Description: Exercises the basic execbuffer using object alignments
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
>   *
> diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> index 1153c0bf2e30..f3c2f671f6ec 100644
> --- a/tests/i915/gem_exec_async.c
> +++ b/tests/i915/gem_exec_async.c
> @@ -26,9 +26,13 @@
>  #include "igt.h"
>  /**
>   * TEST: gem exec async
> + * Category: Infrastructure
>   * Description: Check that we can issue concurrent writes across the engines.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: concurrent-writes
>   *
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index c7f949c9cd2b..c78403466480 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -33,8 +33,12 @@
>  #include "igt_vgem.h"
>  /**
>   * TEST: gem exec await
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wide-all
>   *
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index d1d92e6ba689..3ab0903ac89e 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -65,95 +65,195 @@
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: busy
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fairslice
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: full
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late-pulse
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-pulse
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hog
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: indices
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: individual
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-balancer
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bonds
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: nohangcheck
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noheartbeat
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nop
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-balancer
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-bb-first
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-contexts
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-dmabuf-import-out-fence
>   * Description: Regression test to check that dmabuf imported sync file can handle fence array
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: parallel-keep-in-fence
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-keep-submit-fence
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-ordering
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-out-fence
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: persistence
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sequential
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sliced
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: smoke
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: waits
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 437ce0954557..3c47a98ef461 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -27,14 +27,18 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem exec basic
> + * Category: Infrastructure
>   * Description: Basic sanity check of execbuf-ioctl rings.
>   * Feature: cmd_submission
> - * Run type: BAT
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description:
>   *   Check basic functionality of GEM_EXECBUFFER2 ioctl on every ring and iterating over memory
>   *   regions.
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
> diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
> index 7f07cf6c69db..3acdb3741f65 100644
> --- a/tests/i915/gem_exec_big.c
> +++ b/tests/i915/gem_exec_big.c
> @@ -57,6 +57,10 @@
>   * SUBTEST: exhaustive
>   *
>   * SUBTEST: single
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index aa72e9ee9ed3..3ab659c039fc 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -33,9 +33,13 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: gem exec capture
> + * Category: Server
>   * Description: Check that we capture the user specified objects on a hang
>   * Feature: cmd_submission
> + * Functionality: offline debugging
>   * Run type: FULL
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: capture
>   *
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 89e9a8ec8ad3..830e7581b893 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -48,29 +48,36 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: gem exec create
> + * Category: Infrastructure
>   * Description:
>   *   This test overloads the driver with transient active objects and checks if we don't kill the
>   *   system under the memory pressure some of the symptoms this test look for include mysterious
>   *   hangs.
>   * Feature: cmd_submission
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description: Check if we kill system by overloading it with active objects iterating over all engines.
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
>   * Description: Concurrently overloads system with active objects and checks if we kill system.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy
>   * Description:
>   *   Check if we kill the system by overloading it with active objects iterating over legacy
>   *   engines.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: madvise
>   * Description: This test does a forced reclaim, behaving like a bad application leaking its bo cache.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("This test overloads the driver with transient active objects"
> diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> index 25ad16898761..42991c018bff 100644
> --- a/tests/i915/gem_exec_endless.c
> +++ b/tests/i915/gem_exec_endless.c
> @@ -32,8 +32,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem exec endless
> + * Category: Server
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dispatch
>   */
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 5a67a93e8eed..9b3f91b70bea 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -47,27 +47,37 @@
>   * SUBTEST: basic-await
>   * Description: Basic check for explicit fence with async wait on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Basic check for explicit fence with async wait on each engine.
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy
>   * Description: Basic check for explicit fence on each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Basic check for explicit fence on each busy engine.
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy-all
>   * Description: Basic check for composite fence on all busy engines.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Basic check for composite fence on all busy engines.
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait
>   * Description: Basic check for explicit fence with additinal wait time on each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Basic check for explicit fence with additional wait time on each busy engine.
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait-all
>   * Description: Basic check for composite fence with additional wait on all busy engines.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Execute the same batch on each engine and check that the composite fence across all engines completes only after the batch is completed on every engine.
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: busy-hang
>   * Description: Check for explicit fence on each busy engine with a pending gpu hang.
> @@ -85,36 +95,56 @@
>   * Run type: FULL
>   *
>   * SUBTEST: expired-history
> + * Category: Infrastructure
>   * Description: Verifies long history of fences are expired.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-fence-array
> + * Category: Infrastructure
>   * Description: Verifies invalid fence-array pointers are rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-timeline-fence-array
> + * Category: Infrastructure
>   * Description:
>   *   Verifies invalid execbuf parameters in drm_i915_gem_execbuffer_ext_timeline_fences
>   *   are rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: keep-in-fence
>   * Description: Check in-fence is not overwritten with out-fence on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Check in-fence is not overwritten with out-fence on each engine
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: long-history
> + * Category: Infrastructure
>   * Description: Verifies accumulation of long history of fences.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nb-await
>   * Description: Check for explicit fence with non-blocking wait on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Check for explicit fence with non-blocking wait on each
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: nb-await-hang
>   * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
> @@ -124,7 +154,9 @@
>   * SUBTEST: parallel
>   * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: submit
>   * Description: Check timeslicing on submit-fence.
> @@ -149,117 +181,197 @@
>   * Run type: FULL
>   *
>   * SUBTEST: syncobj-backward-timeline-chain-engines
> + * Category: Infrastructure
>   * Description:
>   *   Engine chaining tests to verify ordering of timeline syncobjs with backward timeline
>   *   points.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-channel
> + * Category: Infrastructure
>   * Description: Verifies two clients racing for syncobj using channel.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-export
> + * Category: Infrastructure
>   * Description: Verify exporting of fence-array syncobj signaled by i915.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-import
> + * Category: Infrastructure
>   * Description: Verifies creating of a syncobj from explicit fence.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-invalid-flags
> + * Category: Infrastructure
>   * Description: Verifies that invalid fence flags in fence-array are rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-invalid-wait
> + * Category: Infrastructure
>   * Description: Verifies that submitting an execbuf with a wait on a syncobj that doesn't exists is rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-repeat
> + * Category: Infrastructure
>   * Description: Verifies that waiting & signaling a same fence-array syncobj within the same execbuf works.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-signal
> + * Category: Infrastructure
>   * Description: Verifies proper signaling of a fence-array syncobj through execbuf.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-stationary-timeline-chain-engines
> + * Category: Infrastructure
>   * Description:
>   *   Engine chaining tests to verify ordering of timeline syncobj with stationary timeline
>   *   points.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-chain-engines
> + * Category: Infrastructure
>   * Description: Engine chaining tests to verify ordering of timeline syncobjs through execbuf.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-export
> + * Category: Infrastructure
>   * Description: Verify exporting of timeline syncobj signaled by i915
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-invalid-flags
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that invalid fence flags in drm_i915_gem_execbuffer_ext_timeline_fences are
>   *   rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-invalid-wait
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that submitting an execbuf with a wait on a timeline syncobj point that does not
>   *   exists is rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-multiple-ext-nodes
> + * Category: Infrastructure
>   * Description: Verify that passing multiple execbuffer_ext nodes works
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-repeat
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that waiting & signaling a same timeline syncobj point within the same execbuf
>   *   fworks
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-signal
> + * Category: Infrastructure
>   * Description: Verifies proper signaling of a timeline syncobj through execbuf
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-unused-fence
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that a timeline syncobj passed into
>   *   drm_i915_gem_execbuffer_ext_timeline_fences but with no signal/wait flag is left
>   *   untouched
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-wait
> + * Category: Infrastructure
>   * Description: Verifies that waiting on a timeline syncobj point between engines works
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-unused-fence
> + * Category: Infrastructure
>   * Description: Verifies that a syncobj passed into execbuf but with no signal/wait flag is left untouched.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-wait
> + * Category: Infrastructure
>   * Description: Verifies that waiting on a timeline syncobj point between engines works.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-hang
>   * Description:
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index 496ad6e8bb16..a31a8b82a9e4 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -28,26 +28,33 @@
>  #include "igt_rand.h"
>  /**
>   * TEST: gem exec gttfill
> + * Category: Infrastructure
>   * Description: Fill the GTT with batches.
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: all-engines
>   * Description: Stress test check behaviour/correctness of handling batches to fill gtt
>   * Feature: cmd_submission, gtt
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   * Description: Checks if it can handle enough batches to fill gtt
>   * Feature: cmd_submission, gtt
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   * Description: Checks the correctness of handling enough batches to fill gtt for each engine
>   * Feature: cmd_submission, gtt
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: multigpu-basic
>   * Feature: cmd_submission, gtt, multigpu
>   * Run type: FULL
> + * Test category: MultiGPU
>   */
>  
>  IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index b06c3ac8a696..101843acd651 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -50,16 +50,24 @@
>  
>  /**
>   * TEST: gem exec nop
> + * Category: Infrastructure
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-parallel
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-sequential
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-series
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-sequential
>   * Feature: cmd_submission
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 7e6500d60257..55b51bfe3f31 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -35,28 +35,36 @@
>  #include "igt_gt.h"
>  /**
>   * TEST: gem exec parallel
> + * Category: Infrastructure
>   * Description: Exercise filling buffers by many clients working in parallel.
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality per engine.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
>   * Description: Check with many contexts.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   * Description: Check with engines working in parallel.
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fds
>   * Description: Check with many fds.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
>   * Description: Check basic userptr thrashing.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise filling buffers by many clients working in parallel.");
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index bd7ec2cd1f39..16ae7a5a6bb5 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -55,22 +55,46 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: batch-first
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: cliprects-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: cliprects_ptr-dirt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-batch-start-offset
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd-ring
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd1-flag-on-blt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd1-flag-on-render
>   * Feature: cmd_submission
> @@ -79,7 +103,11 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: invalid-bsd2-flag-on-blt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd2-flag-on-render
>   * Feature: cmd_submission
> @@ -88,25 +116,53 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: invalid-fence-in
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-fence-in-submit
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-flag
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ring
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ring2
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: larger-than-life-batch
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: mmapped
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: no-blt
>   * Feature: cmd_submission
> @@ -118,19 +174,35 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: readonly
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid-rel-gen5
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid-ring
>   * Feature: cmd_submission
>   *
>   * SUBTEST: rs-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rsvd2-dirt
>   * Feature: cmd_submission
> @@ -145,7 +217,11 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: sol-reset-not-gen7
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  #define ALIGNMENT (1 << 22)
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index d17d07893f07..2156c043811c 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -46,8 +46,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem exec schedule
> + * Category: Desktop \ Server
>   * Description: Check that we can control the order of execution
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: deep
>   * Feature: cmd_submission
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index 19c1a060e3b0..d61072dfa6c0 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -36,8 +36,12 @@
>  #include "igt_gt.h"
>  /**
>   * TEST: gem exec store
> + * Category: Infrastructure
>   * Description: Exercise store dword functionality using execbuf-ioctl
>   * Feature: cmd_submission
> + * Functionality: coherency
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   * Description: Verify that all capable engines can store dwords to a common buffer object
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 978b1b4a8455..bab9700640d8 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -39,8 +39,12 @@
>  #include "intel_ctx.h"
>  /**
>   * TEST: gem exec whisper
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts
>   *
> -- 
> 2.40.1
> 

