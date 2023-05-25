Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ABA10E125
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 19:22:51 +0000 (UTC)
Date: Thu, 25 May 2023 21:22:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525192245.dfhsw4y4rukeeerf@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 04/11] i915/gem_exec_*: better
 document gem exec tests used for i915 validation
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

Hi Mauro,

On 2023-05-25 at 11:05:28 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> core test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/gem_exec_alignment.c |   4 +
>  tests/i915/gem_exec_async.c     |   4 +
>  tests/i915/gem_exec_await.c     |   4 +
>  tests/i915/gem_exec_balancer.c  | 100 ++++++++++++++++
>  tests/i915/gem_exec_basic.c     |   8 +-
>  tests/i915/gem_exec_big.c       |   4 +
>  tests/i915/gem_exec_capture.c   |  12 ++
>  tests/i915/gem_exec_create.c    |  21 +++-
>  tests/i915/gem_exec_endless.c   |   4 +
>  tests/i915/gem_exec_fence.c     | 122 ++++++++++++++++++-
>  tests/i915/gem_exec_gttfill.c   |  12 ++
>  tests/i915/gem_exec_nop.c       |  12 ++
>  tests/i915/gem_exec_parallel.c  |  26 +++-
>  tests/i915/gem_exec_params.c    |  76 ++++++++++++
>  tests/i915/gem_exec_schedule.c  | 204 ++++++++++++++++++++++++++++++++
>  tests/i915/gem_exec_store.c     |   4 +
>  tests/i915/gem_exec_suspend.c   |  20 +++-
>  tests/i915/gem_exec_whisper.c   |  90 ++++++++++++++
>  18 files changed, 718 insertions(+), 9 deletions(-)
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
> index 437ce0954557..623f1ee52fb6 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -28,13 +28,17 @@
>  /**
>   * TEST: gem exec basic
>   * Description: Basic sanity check of execbuf-ioctl rings.
> - * Feature: cmd_submission
> - * Run type: BAT
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description:
>   *   Check basic functionality of GEM_EXECBUFFER2 ioctl on every ring and iterating over memory
>   *   regions.
> + * Feature: cmd_submission
> + * Functionality: command submission
> + * Run type: BAT
> + * Sub-category: i915
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
> index aa72e9ee9ed3..453ae1af9101 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -38,6 +38,10 @@
>   * Run type: FULL
>   *
>   * SUBTEST: capture
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: capture-invisible
>   * Description:
> @@ -58,8 +62,16 @@
>   * SUBTEST: many-4K-zero
>   *
>   * SUBTEST: pi
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   */
>  
>  #define MAX_RESET_TIME	600
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 89e9a8ec8ad3..00c190115ae2 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -52,25 +52,44 @@
>   *   This test overloads the driver with transient active objects and checks if we don't kill the
>   *   system under the memory pressure some of the symptoms this test look for include mysterious
>   *   hangs.
> - * Feature: cmd_submission
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Check if we kill system by overloading it with active objects iterating over all engines.
> + * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
> + * Category: Infrastructure
>   * Description: Concurrently overloads system with active objects and checks if we kill system.
> + * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy
> + * Category: Infrastructure
>   * Description:
>   *   Check if we kill the system by overloading it with active objects iterating over legacy
>   *   engines.
> + * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: madvise
> + * Category: Infrastructure
>   * Description: This test does a forced reclaim, behaving like a bad application leaking its bo cache.
> + * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
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
> index 76a86e8f4197..1d09cfe07135 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -47,27 +47,37 @@
>   * SUBTEST: basic-await
>   * Description: Basic check for explicit fence with async wait on each engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy
>   * Description: Basic check for explicit fence on each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy-all
>   * Description: Basic check for composite fence on all busy engines.
>   * Feature: cmd_submission, multitile, synchronization
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait
> - * Description: Basic check for explicit fence with additinal wait time on each busy engine.
> + * Description: Basic check for explicit fence with additional wait time on each busy engine.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait-all
> - * Description: Basic check for composite fence with additional wait on all busy engines.
> + * Description:
> + *   Basic check for composite fence with additional wait on all busy engines.
> + *   Execute the same batch on each engine and check that the composite fence across all engines completes only after the batch is completed on every engine.
------- ^
Looks strange.

>   * Feature: cmd_submission, multitile, synchronization
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: busy-hang
>   * Description: Check for explicit fence on each busy engine with a pending gpu hang.
> @@ -85,36 +95,57 @@
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
> - * Description: Check for explicit fence with non-blocking wait on each engine.
> + * Description:
> + *   Check for explicit fence with non-blocking wait on each engine.
> + *   Check for explicit fence with non-blocking wait on each
------- ^
This one is out of place, repeated with last word cut off.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: nb-await-hang
>   * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
> @@ -122,9 +153,12 @@
>   * Run type: FULL
>   *
>   * SUBTEST: parallel
> - * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> + * Description:
> + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios
------- ^
Same here.

Rest looks ok, if you think that descriptions may be corrected
later add my r-b.

Regards,
Kamil

>   * Feature: cmd_submission, multitile, synchronization
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: submit
>   * Description: Check timeslicing on submit-fence.
> @@ -149,117 +183,197 @@
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
> index 496ad6e8bb16..4c32a04c0b0a 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -31,23 +31,35 @@
>   * Description: Fill the GTT with batches.
>   *
>   * SUBTEST: all-engines
> + * Category: Infrastructure
>   * Description: Stress test check behaviour/correctness of handling batches to fill gtt
>   * Feature: cmd_submission, gtt
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Checks if it can handle enough batches to fill gtt
>   * Feature: cmd_submission, gtt
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> + * Category: Infrastructure
>   * Description: Checks the correctness of handling enough batches to fill gtt for each engine
>   * Feature: cmd_submission, gtt
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
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
> index b06c3ac8a696..067c92b47365 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -53,13 +53,25 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-parallel
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-sequential
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-series
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-sequential
>   * Feature: cmd_submission
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 7e6500d60257..bba861185631 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -36,27 +36,51 @@
>  /**
>   * TEST: gem exec parallel
>   * Description: Exercise filling buffers by many clients working in parallel.
> - * Feature: cmd_submission
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Check basic functionality per engine.
> + * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
> + * Category: Infrastructure
>   * Description: Check with many contexts.
> + * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> + * Category: Infrastructure
>   * Description: Check with engines working in parallel.
> + * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fds
> + * Category: Infrastructure
>   * Description: Check with many fds.
> + * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
> + * Category: Infrastructure
>   * Description: Check basic userptr thrashing.
> + * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
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
> index d17d07893f07..c9be726abdd7 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -50,82 +50,178 @@
>   * Run type: FULL
>   *
>   * SUBTEST: deep
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fairslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fairslice-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fifo
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: implicit-boths
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: implicit-read-write
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: implicit-write-read
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-order
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: independent
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: lateslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: manyslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreorder
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreorder-corked
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreorder-priority
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: out-order
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: pi-common
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: pi-distinct-iova
>   * Feature: cmd_submission
>   *
>   * SUBTEST: pi-ringfull
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: pi-shared-iova
>   * Feature: cmd_submission
>   *
>   * SUBTEST: pi-userfault
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-contexts
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-engines
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-other
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-other-chain
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-queue
>   * Feature: cmd_submission, multictx
> @@ -140,91 +236,199 @@
>   * Feature: cmd_submission, multictx
>   *
>   * SUBTEST: preempt-self
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preempt-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preemptive-hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: promotion
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reorder-wide
>   * Feature: cmd_submission
>   *
>   * SUBTEST: semaphore-codependency
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore-noskip
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore-power
>   * Feature: cmd_submission
>   *
>   * SUBTEST: semaphore-resolve
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: smoketest
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: smoketest-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: submit-early-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: submit-golden-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: submit-late-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: thriceslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: timeslicing
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-fairslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-fairslice-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-independent
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-lateslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-semaphore-codependency
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-semaphore-noskip
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-semaphore-resolve
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-semaphore-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-submit-early-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-submit-golden-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: u-submit-late-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wide
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  #define LO 0
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
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index de1864224438..73fbf8cf653f 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -39,82 +39,100 @@
>  /**
>   * TEST: gem exec suspend
>   * Description: Exercise simple execbufs runs across various suspend/resume cycles.
> - * Feature: cmd_submission, suspend
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality without any suspend/resume cycle.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic-S0
>   * Description: Check with suspend-to-idle target state.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic-S3
>   * Description: Check full cycle of suspend-to-mem.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic-S3-devices
>   * Description: Check with suspend-to-mem with devices only.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic-S4
>   * Description: Check full cycle of suspend-to-disk.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic-S4-devices
>   * Description: Check with suspend-to-disk with devices only.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: cached
>   * Description: Check without suspend/resume cycle state with cached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: cached-S3
>   * Description: Check suspend-to-mem state with cached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: cached-S4
>   * Description: Check suspend-to-disk state with cached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: fixed
>   * Description: Check without suspend/resume cycle state with fixed object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: fixed-S3
>   * Description: Check suspend-to-mem state with fixed object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: fixed-S4
>   * Description: Check suspend-to-disk state with fixed object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: hang-S3
>   * Description: Check full cycle of suspend-to-mem with a pending GPU hang.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: hang-S4
>   * Description: Check full cycle of suspend-to-disk with a pending GPU hang.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: power-S0
>   * Description: Check power consumption during idle state.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: power-S3
>   * Description: Check power consumption during suspend-to-mem state.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: uncached
>   * Description: Check without suspend/resume cycle state with uncached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: uncached-S3
>   * Description: Check suspend-to-mem state with uncached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   *
>   * SUBTEST: uncached-S4
>   * Description: Check suspend-to-disk state with uncached object.
> + * Feature: cmd_submission, suspend
>   * Run type: FULL
>   */
>  
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 978b1b4a8455..1379f10dce1f 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -43,52 +43,142 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-contexts
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts-priority
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds-priority
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fds-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-normal
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-normal-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues-priority
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-queues-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-sync
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-sync-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: chain
>   *
> -- 
> 2.40.1
> 

