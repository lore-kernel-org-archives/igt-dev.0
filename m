Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC4410E762
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 20:58:13 +0000 (UTC)
Date: Thu, 25 May 2023 22:58:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525205809.avcaex6sqku37nba@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-8-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 07/11] i915/: better document the
 remaining i915 tests
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

On 2023-05-25 at 11:05:31 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> i915 test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/api_intel_allocator.c         |  40 +++++-
>  tests/i915/api_intel_bb.c                | 150 ++++++++++++++++++++++-
>  tests/i915/gem_barrier_race.c            |   1 +
>  tests/i915/gem_basic.c                   |  13 ++
>  tests/i915/gem_blits.c                   |   4 +
>  tests/i915/gem_busy.c                    |  24 ++--
>  tests/i915/gem_caching.c                 |   4 +
>  tests/i915/gem_close.c                   |   4 +
>  tests/i915/gem_close_race.c              |  10 ++
>  tests/i915/gem_create.c                  |  50 +++++++-
>  tests/i915/gem_cs_tlb.c                  |   4 +
>  tests/i915/gem_eio.c                     | 106 +++++++++++++++-
>  tests/i915/gem_exercise_blt.c            |   9 +-
>  tests/i915/gem_flink_basic.c             |  32 ++++-
>  tests/i915/gem_flink_race.c              |   4 +
>  tests/i915/gem_gpgpu_fill.c              |   6 +-
>  tests/i915/gem_linear_blits.c            |  16 ++-
>  tests/i915/gem_lmem_evict.c              |   1 +
>  tests/i915/gem_lmem_swapping.c           |  80 +++++++++++-
>  tests/i915/gem_madvise.c                 |   8 ++
>  tests/i915/gem_mmap_offset.c             |  54 +++++++-
>  tests/i915/gem_pipe_control_store_loop.c |   4 +
>  tests/i915/gem_ppgtt.c                   |   6 +
>  tests/i915/gem_request_retire.c          |   4 +
>  tests/i915/gem_ringfill.c                |  14 ++-
>  tests/i915/gem_shrink.c                  |   4 +
>  tests/i915/gem_softpin.c                 | 105 +++++++++++++++-
>  tests/i915/gem_spin_batch.c              |  37 ++++++
>  tests/i915/gem_sync.c                    |  24 +++-
>  tests/i915/gem_unref_active_buffers.c    |   4 +
>  tests/i915/gem_userptr_blits.c           |  76 ++++++++++++
>  tests/i915/gem_vm_create.c               |   4 +
>  tests/i915/gem_wait.c                    |  40 ++++--
>  tests/i915/gem_workarounds.c             |  30 +++++
>  tests/i915/i915_getparams_basic.c        |   4 +
>  tests/i915/i915_hangman.c                |  40 ++++--
>  tests/i915/i915_hwmon.c                  |   1 +
>  tests/i915/i915_module_load.c            |  12 ++
>  tests/i915/i915_pciid.c                  |   4 +
>  tests/i915/i915_pm_rpm.c                 |   3 +
>  tests/i915/i915_pm_rps.c                 |  10 +-
>  tests/i915/i915_power.c                  |   1 +
>  tests/i915/i915_query.c                  |  32 +++++
>  tests/i915/i915_suspend.c                |  13 +-
>  tests/i915/sysfs_defaults.c              |   4 +
>  tests/i915/sysfs_heartbeat_interval.c    |  10 ++
>  tests/i915/sysfs_preempt_timeout.c       |   6 +
>  tests/i915/sysfs_timeslice_duration.c    |   8 ++
>  48 files changed, 1068 insertions(+), 52 deletions(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 3962231ebcc7..cc6f8daa424b 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -11,44 +11,80 @@
>  #include "intel_allocator.h"
>  /**
>   * TEST: api intel allocator
> - * Feature: igt_core
> + * Category: Infrastructure
> + * Functionality: virtual address ranges
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: alloc-simple
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: default-alignment
>   * Description:
>   *   For simple allocator check does default alignment is properly handled in open and alloc
>   *   functions
> + *   checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: execbuf-with-allocator
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: fork-simple-once
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: fork-simple-stress
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: fork-simple-stress-signal
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: gem-pool
> - * Description: Verifies creating and executing bb from gem pool
> + * Description:
> + *   Verifies creating and executing bb from gem pool
> + *   checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: open-vm
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: reloc-allocator
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: reopen
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: reopen-fork
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: reserve-simple
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: simple-allocator
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: standalone
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: two-level-inception
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   *
>   * SUBTEST: two-level-inception-interruptible
> + * Description: checking the virtual address ranges
> + * Feature: igt_core
>   */
>  
>  #define OBJ_SIZE 1024
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 198a29eb4f26..38ffd763b6f6 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -44,65 +44,209 @@
>  /**
>   * TEST: api intel bb
>   * Description: intel_bb API check.
> - * Feature: igt_core
>   * Run type: FULL
>   *
>   * SUBTEST: add-remove-objects
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bb-with-allocator
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-noreloc-keep-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-noreloc-purge-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-reloc-keep-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-reloc-purge-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: crc32
>   * Description: Compare cpu and gpu crc32 sums on input object
> + * Feature: igt_core
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: delta-check
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: destroy-bb
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-batch
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: intel-bb-blit-none
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: intel-bb-blit-x
> + * Feature: igt_core
>   *
>   * SUBTEST: intel-bb-blit-y
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: lot-of-buffers
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: misplaced-blitter
> - * Description: Execute intel_bb with set of engines provided by userspace
> + * Category: Infrastructure
> + * Description:
> + *   Execute intel_bb with set of engines provided by userspace
> + *   checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-noreloc-keep-cache-simple
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-noreloc-purge-cache-simple
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-reloc-keep-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-reloc-purge-cache
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: offset-control
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: purge-bb
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: render
> + * Feature: igt_core
>   *
>   * SUBTEST: render-ccs
> + * Feature: igt_core
>   *
>   * SUBTEST: reset-bb
> - * Description: Ensure reset is possible on fresh bb
> + * Category: Infrastructure
> + * Description:
> + *   Ensure reset is possible on fresh bb
> + *   checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-flags
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: simple-bb
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: simple-bb-ctx
> + * Category: Infrastructure
> + * Description: checking dummy buffer creation & submission
> + * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   */
>  
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index ec8ebaa63611..be71d20e7f24 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -22,6 +22,7 @@
>   * Description: Exercise engine barriers and their interaction with other subsystems
>   * Feature: core
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: remote-request
>   * Description:
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 8605429799aa..6843bec16748 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -46,24 +46,37 @@
>   * Description: Tests basic gem_create and gem_close IOCTLs
>   *
>   * SUBTEST: bad-close
> + * Category: Infrastructure
>   * Description: Verify that gem_close fails with bad params.
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-close
> + * Category: Infrastructure
>   * Description: Verify basic functionality of gem_create and gem_close.
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-fd-close
> + * Category: Infrastructure
>   * Description: Verify that closing drm driver is possible with opened gem object.
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: multigpu-create-close
>   * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
>   * Feature: gem_core, multigpu
>   * Run type: FULL
> + * Test category: MultiGPU
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index acc1adc165f3..681fe046665b 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -30,8 +30,12 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: gem blits
> + * Category: Infrastructure
>   * Feature: blitter
> + * Functionality: command streamer
>   * Run type: FULL
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   */
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 38d66f8f292a..0f48dbbfe75c 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -34,40 +34,50 @@
>   * TEST: gem busy
>   * Description: Basic check of busy-ioctl ABI.
>   * Feature: cmd_submission
> + * Run type: FULL
>   *
>   * SUBTEST: busy
> + * Category: Desktop client
>   * Description: Basic test to check busyness of each engine.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: close-race
> + * Category: Desktop client
>   * Description: Test to check race condition by randomly closing the handle using gem_close.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: extended
> + * Category: Desktop client
>   * Description: Extended test to check busyness of dwstore-capable engines.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
>   * Description: Basic test to check hang state behaviour of engines with increased timeout.
> - * Run type: FULL
>   *
>   * SUBTEST: hang-extended
>   * Description:
>   *   Extended test to check hang state behaviour of dwstore-capable engines with increased
>   *   timeout.
> - * Run type: FULL
>   *
>   * SUBTEST: parallel
> + * Category: Desktop client
>   * Description:
>   *   Extended test to check busyness of dwstore-capable engines while doing parallel
>   *   execution.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore
>   * Description:
>   *   Test to check busyness of engine on submitting a new batch while engine is busy in executing
>   *   previous batch.
> - * Run type: FULL
>   */
>  
>  #define PAGE_ALIGN(x) ALIGN(x, 4096)
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index d24e6cce059b..7af427d7e48c 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -42,9 +42,13 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: gem caching
> + * Category: Desktop client
>   * Description: Test snoop consistency when touching partial cachelines.
>   * Feature: caching
> + * Functionality: data coherency
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
>   *
> diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
> index 212fd8e9062a..20aff600d595 100644
> --- a/tests/i915/gem_close.c
> +++ b/tests/i915/gem_close.c
> @@ -27,8 +27,12 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem close
> + * Category: Infrastructure
>   * Feature: mapping
> + * Functionality: driver handler
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   *
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 802fa3abbe6a..1a2efeab293f 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -53,16 +53,24 @@
>   * Description: Test try to race gem_close against workload submission.
>   *
>   * SUBTEST: basic-process
> + * Category: Infrastructure
>   * Description: Basic workload submission.
>   * Feature: synchronization
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-threads
> + * Category: Infrastructure
>   * Description:
>   *   Share buffer handle across different drm fd's and trying to race gem_close against
>   *   continuous workload with minimum timeout.
>   * Feature: synchronization
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
>   * Description:
> @@ -82,11 +90,13 @@
>   * Description: Basic workload submission on multi-GPU machine.
>   * Feature: multigpu, synchronization
>   * Run type: FULL
> + * Test category: MultiGPU
>   *
>   * SUBTEST: multigpu-basic-threads
>   * Description: Run basic-threads race on multi-GPU machine.
>   * Feature: multigpu, synchronization
>   * Run type: FULL
> + * Test category: MultiGPU
>   *
>   * SUBTEST: process-exit
>   * Description: Test try to race gem_close against submission of continuous workload.
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index fc99189499b8..3320717f25cf 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -67,50 +67,98 @@
>   * Description:
>   *   Ensure that basic gem_create and gem_create_ext works and that invalid input combinations
>   *   are rejected.
> - * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: busy-create
> + * Category: Infrastructure
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-clear
> + * Category: Infrastructure
>   * Description: Verify that all new objects are clear.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext-cpu-access-big
>   * Description:
>   *   Verify the extreme cases with very large objects and.
>   *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + * Feature: mapping
>   *
>   * SUBTEST: create-ext-cpu-access-sanity-check
>   * Description:
>   *   Verify the basic functionally and expected ABI contract around.
>   *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + * Feature: mapping
>   *
>   * SUBTEST: create-ext-placement-all
> + * Category: Infrastructure
>   * Description: Create objects in every memory region using create_ext.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext-placement-each
> + * Category: Infrastructure
>   * Description: Create one object with memory pieces in each memory region using create_ext.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext-placement-sanity-check
> + * Category: Infrastructure
>   * Description: Exercise create_ext placements extension.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-invalid-size
> + * Category: Infrastructure
>   * Description: Try to create a gem object of invalid size 0 and check if ioctl returns error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-massive
> + * Category: Infrastructure
>   * Description: Exercise creation of buffer object with impossible size and check for the expected error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-size-update
> + * Category: Infrastructure
>   * Description: Try to create a gem object with size 15 and check actual created size.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-valid-nonaligned
> + * Category: Infrastructure
>   * Description:
>   *   Try to create an object with non-aligned size, check we got one with size aligned up to page
>   *   size and test we can write into the padded extra memory.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hog-create
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
> index ab09efa251b3..3f285f42c1ac 100644
> --- a/tests/i915/gem_cs_tlb.c
> +++ b/tests/i915/gem_cs_tlb.c
> @@ -54,9 +54,13 @@
>  #include "igt.h"
>  /**
>   * TEST: gem cs tlb
> + * Category: Infrastructure
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   */
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 4aef96d18e8c..a5ebe6d2d187 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -58,92 +58,194 @@
>   * Run type: FULL
>   *
>   * SUBTEST: banned
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-create
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create
> + * Category: Infrastructure
>   * Description: Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext
> + * Category: Infrastructure
>   * Description:
>   *   Validate i915_gem_create_ext_ioctl and checks if returns clear backing store while gpu is
>   *   wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execbuf
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate
> - * Feature: hibernate, reset
> + * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
> + * Feature: hibernate, reset, suspend
> + * Test category: suspend
>   *
>   * SUBTEST: in-flight-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-external
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-suspend
> - * Feature: reset
> + * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
> + * Feature: reset, suspend
> + * Test category: suspend
>   *
>   * SUBTEST: kms
>   * Feature: kms_gem_interop, reset
>   *
>   * SUBTEST: reset-stress
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend
> + * Description: Test that specific ioctls report a wedged GPU (EIO) during suspend
>   * Feature: reset, suspend
> + * Test category: suspend
>   *
>   * SUBTEST: throttle
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unwedge-stress
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Test that specific ioctls report a wedged GPU (EIO).");
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index af86d5edc2ab..3287ced76a59 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -15,12 +15,17 @@
>   * Description: Exercise blitter commands
>   * Feature: blitter
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fast-copy
> - * Description: Check fast-copy blit
> + * Description:
> + *   Check fast-copy blit
> + *   blitter
>   *
>   * SUBTEST: fast-copy-emit
> - * Description: Check multiple fast-copy in one batch
> + * Description:
> + *   Check multiple fast-copy in one batch
> + *   blitter
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise blitter commands");
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 7feabf61a303..8a316cdae5fc 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -41,23 +41,51 @@
>  /**
>   * TEST: gem flink basic
>   * Description: Tests for flink - a way to export a gem object by name
> - * Feature: xorg_dri2
> - * Run type: BAT
>   *
>   * SUBTEST: bad-flink
> + * Category: Desktop client
>   * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
> + * Feature: xorg_dri2
> + * Functionality: buffer management
> + * Run type: BAT
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-open
> + * Category: Desktop client
>   * Description: Verify that GEM_OPEN ioctl with invalid flink name fails.
> + * Feature: xorg_dri2
> + * Functionality: buffer management
> + * Run type: BAT
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Category: Desktop client
>   * Description: Check if gem object can be exported to global namespace and then opened.
> + * Feature: xorg_dri2
> + * Functionality: buffer management
> + * Run type: BAT
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-flink
> + * Category: Desktop client
>   * Description: Tests that multiple flinks for the same gem object share the same name.
> + * Feature: xorg_dri2
> + * Functionality: buffer management
> + * Run type: BAT
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: flink-lifetime
> + * Category: Desktop client
>   * Description: Tests flink lifetime by referencing from multiple descriptors.
> + * Feature: xorg_dri2
> + * Functionality: buffer management
> + * Run type: BAT
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for flink - a way to export a gem object by name");
> diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
> index 5ebf1969b992..a9177ce1b775 100644
> --- a/tests/i915/gem_flink_race.c
> +++ b/tests/i915/gem_flink_race.c
> @@ -37,9 +37,13 @@
>  #include "igt_stats.h"
>  /**
>   * TEST: gem flink race
> + * Category: Desktop client
>   * Description: Check for flink/open vs. gem close races.
>   * Feature: xorg_dri2
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: flink_close
>   *
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index f350e9fbb6d0..25f2a96c1a80 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -50,10 +50,14 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: gem gpgpu fill
> - * Feature: compute
> + * Category: Server
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Feature: compute
>   */
>  
>  #define WIDTH 64
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 4c3576503ca3..bdbbf99efed4 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -52,19 +52,33 @@
>  /**
>   * TEST: gem linear blits
>   * Description: Test doing many blits with a working set larger than the aperture size.
> - * Feature: blitter
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Basic blitter functionality check with 2 buffers
> + * Feature: blitter
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: interruptible
> + * Category: Infrastructure
>   * Description: Test with interrupts in between the parent process
> + * Feature: blitter
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: normal
> + * Category: Infrastructure
>   * Description: The intent is to push beyond the working GTT size to force the driver to rebind the buffers
> + * Feature: blitter
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
> index e40eab2d2914..54277e11dac7 100644
> --- a/tests/i915/gem_lmem_evict.c
> +++ b/tests/i915/gem_lmem_evict.c
> @@ -12,6 +12,7 @@
>   * Description: Force tiny lmem size for easily testing eviction scenarios.
>   * Feature: local_memory
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-evict-race
>   * Description: Regression test to verify that madvise will sync against busy dma-resv object for lmem
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index f6a1c0082c78..6f1340ba0e41 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -27,90 +27,168 @@
>  /**
>   * TEST: gem lmem swapping
>   * Description: Exercise local memory swapping.
> - * Feature: local_memory
>   *
>   * SUBTEST: basic
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heavy-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heavy-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heavy-verify-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heavy-verify-multi-ccs
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-verify-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heavy-verify-random-ccs
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
>   *
>   * SUBTEST: massive
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: massive-random
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-random-engines
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-random-verify
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-random-verify-ccs
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
>   *
>   * SUBTEST: random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: random-engines
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: smem-oom
> + * Category: Server
>   * Description: Exercise local memory swapping during exhausting system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: verify
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: verify-ccs
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
>   *
>   * SUBTEST: verify-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: verify-random-ccs
>   * Description: Exercise local memory swapping to system memory
> + * Feature: local_memory
>   * Run type: FULL
>   */
>  
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 17653cc4ad53..4efa359ba7fa 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -44,20 +44,28 @@
>   * Run type: FULL
>   *
>   * SUBTEST: dontneed-after-mmap
> + * Category: Desktop client
>   * Description:
>   *   Check signal for Segmentation Fault and bus error after obtaining a purgeable object and
>   *   calling for sighandler.
>   * Feature: caching, mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-before-exec
>   * Description: Check if EXECBUFFER2 reports EFAULT when trying to submit purged bo for GPU.
>   * Feature: caching, gtt, mapping
>   *
>   * SUBTEST: dontneed-before-mmap
> + * Category: Desktop client
>   * Description:
>   *   Check signal for Segmentation Fault and bus error before obtaining a purgeable object and
>   *   calling for sighandler.
>   * Feature: caching, mapping
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-before-pwrite
>   * Description: Check if PWRITE reports EFAULT when trying to use purged bo for write operation.
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index afabe2426291..2537ecdc552b 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -40,38 +40,90 @@
>  /**
>   * TEST: gem mmap offset
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
> - * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-extensions
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: bad-flags
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: bad-object
> + * Category: Infrastructure
>   * Description: Verify mapping to invalid gem objects won't be created
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-uaf
> + * Category: Infrastructure
>   * Description: Check buffer object mapping persists after gem_close
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: blt-coherency
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: clear
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: close-race
> + * Category: Infrastructure
>   * Description: Check race between close and mmap offset between threads
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: isolation
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: oob-read
> + * Category: Infrastructure
>   * Description: Check for out-of-bound access in vm_access
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: open-flood
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: perf
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: pf-nonblock
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   *
>   * SUBTEST: ptrace
> + * Category: Infrastructure
> + * Feature: mapping
> + * Functionality: memory management
> + * Sub-category: i915
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 5e6ef049085b..986dbf673164 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -45,9 +45,13 @@
>  #include "igt.h"
>  /**
>   * TEST: gem pipe control store loop
> + * Category: Desktop client
>   * Description: Test (TLB-)Coherency of pipe_control QW writes.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fresh-buffer
>   * Description: Checks tlb consistency of the pipe_control with fresh buffer.
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index 368f8b17db75..6a0512ab6010 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -50,15 +50,21 @@
>   * Feature: mapping
>   *
>   * SUBTEST: flink-and-close-vma-leak
> + * Category: Desktop client
>   * Feature: mapping, xorg_dri2
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: shrink-vs-evict-any
>   * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
>   * Feature: mapping
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: shrink-vs-evict-pinned
>   * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
>   * Feature: mapping
> + * Test category: GEM_Legacy
>   */
>  
>  #define WIDTH 512
> diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
> index 9e074706d259..9814b435d937 100644
> --- a/tests/i915/gem_request_retire.c
> +++ b/tests/i915/gem_request_retire.c
> @@ -51,9 +51,13 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem request retire
> + * Category: Infrastructure
>   * Description: Collection of tests targeting request retirement code paths.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: retire-vma-not-inactive
>   */
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index 451876526e9a..52471948edef 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -48,9 +48,13 @@
>   *   properly near full.
>   *
>   * SUBTEST: basic-all
> + * Category: Infrastructure
>   * Description: Basic check to fill the ring upto maximum on all engines simultaneously.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-S3
>   * Description: Handle a full ring across suspend cycle.
> @@ -63,9 +67,12 @@
>   * Run type: FULL
>   *
>   * SUBTEST: engines-basic
> - * Description: Basic check how the driver handles a full ring.
> + * Description:
> + *   Basic check how the driver handles a full ring.
> + *   Test spamming ring with contexts
>   * Feature: cmd_submission, multitile
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: engines-bomb
>   * Description:
> @@ -112,9 +119,12 @@
>   * Run type: FULL
>   *
>   * SUBTEST: legacy-basic
> - * Description: Basic check how the driver handles a full ring - on legacy ring.
> + * Description:
> + *   Basic check how the driver handles a full ring - on legacy ring.
> + *   Test spamming ring with contexts - legacy path
>   * Feature: cmd_submission, multitile
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: legacy-bomb
>   * Description:
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index a65792c84137..79301754babc 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -139,6 +139,10 @@
>   * SUBTEST: pwrite-userptr-dirty
>   *
>   * SUBTEST: reclaim
> + * Category: Desktop client
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  #ifndef MADV_FREE
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 27e5781b9b73..62478f4a3169 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -36,113 +36,216 @@
>   * Description:
>   *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
>   *   tests which copy buffers between CPU and GPU.
> - * Feature: mapping
>   *
>   * SUBTEST: 32b-excludes-last-page
> + * Category: Infrastructure
>   * Description: Check the last 32b page is excluded.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic
> + * Category: Infrastructure
>   * Description: Check that we can place objects at start/end of the GTT using the allocator.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic-reserve
> + * Category: Infrastructure
>   * Description: Check that if we can reserve a space for an object starting from a given offset.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-evict
> + * Category: Infrastructure
>   * Description: Exercise eviction with softpinning.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-fork
> + * Category: Infrastructure
>   * Description: Check if multiple processes can use alloctor.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin
> + * Category: Infrastructure
>   * Description: Check that we can combine manual placement with automatic GTT placement.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin-reserve
> + * Category: Infrastructure
>   * Description:
>   *   Check that we can combine manual placement with automatic GTT placement and
>   *   reserves/unreserves space for objects.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active
> + * Category: Infrastructure
>   * Description: Check eviction with active bo.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active-interruptible
> + * Category: Infrastructure
>   * Description: Check eviction with active bo with interrupts.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-hang
>   * Description: Check eviction of softpinned bo with hung batch.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: evict-prime
>   * Description: Check eviction of vma on importing prime fd in reopened drm fds
> + * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-prime-sanity-check
>   * Description: Check eviction of vma on importing prime fd in reopened drm fd in single thread
> + * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-single-offset
> + * Category: Infrastructure
>   * Description: Use same offset for all engines and for different handles.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-snoop
>   * Description: Check eviction against snooping.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: evict-snoop-interruptible
>   * Description: Check eviction against snooping with interrupts.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: full
> + * Category: Infrastructure
>   * Description: Check the total occupancy by using pad-to-size to fill the entire GTT.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid
> + * Category: Infrastructure
>   * Description: Check that invalid inputs are handled correctly.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreloc
> + * Category: Infrastructure
>   * Description: Check that noreloc support works.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreloc-S3
>   * Description: Check noreloc survives after suspend to RAM/resume cycle.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: noreloc-S4
>   * Description: Check noreloc survives after suspend to disk/resume cycle.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: noreloc-interruptible
> + * Category: Infrastructure
>   * Description: Check noreloc support with interruptible.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: overlap
> + * Category: Infrastructure
>   * Description: Check all the possible pages aligned overlaps.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reverse
> + * Category: Infrastructure
>   * Description: Check that if the user demands the vma will be swapped.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: safe-alignment
> + * Category: Infrastructure
>   * Description: Check start offset and alignment detection.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: softpin
> + * Category: Infrastructure
>   * Description: Check softpinning of a gem buffer object.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: zero
> + * Category: Infrastructure
>   * Description: Check full placement control under full-ppGTT.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 0a6c088da630..cd828beb26c2 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -28,42 +28,79 @@
>  /**
>   * TEST: gem spin batch
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> + * Category: Infrastructure
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy
> + * Category: Infrastructure
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy-resubmit
> + * Category: Infrastructure
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy-resubmit-new
> + * Category: Infrastructure
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit
> + * Category: Infrastructure
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-all
> + * Category: Infrastructure
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-new
> + * Category: Infrastructure
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-new-all
> + * Category: Infrastructure
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-all
> + * Category: Infrastructure
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-all-new
> + * Category: Infrastructure
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-each
> + * Category: Infrastructure
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: user-each
> + * Category: Infrastructure
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   */
>  
>  #define MAX_ERROR 5 /* % */
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 1c7e51a92bfa..1ee5b3f3d165 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -57,29 +57,47 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-all
> + * Category: Infrastructure
>   * Description: Basic test to wait upon a batch on all rings.
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-each
> - * Description: Check synchronisation of ring.
> + * Description:
> + *   Check synchronisation of ring.
> + *   Exercise all physical engine selection and legacy rings
>   * Feature: multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-many-each
> - * Description: Create race condition and see if we can catch interrupts.
> + * Description:
> + *   Create race condition and see if we can catch interrupts.
> + *   Basic check of ring to ring write synchronisation
>   * Feature: multitile, synchronization
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-store-all
> + * Category: Infrastructure
>   * Description: Basic version of store synchronisation test.
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-store-each
> - * Description: Check that store synchronisation works.
> + * Description:
> + *   Check that store synchronisation works.
> + *   Basic check of ring to ring write, store synchronisation
>   * Feature: multitile, synchronization
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: default
>   * Description: Check synchronisation of rings on each engine.
> diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
> index 90a63e8f9acf..badded1f71a6 100644
> --- a/tests/i915/gem_unref_active_buffers.c
> +++ b/tests/i915/gem_unref_active_buffers.c
> @@ -43,9 +43,13 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem unref active buffers
> + * Category: Infrastructure
>   * Description: Test unreferencing of active buffers.
>   * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index 4df604d6dcd6..e9235a6898d5 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -81,7 +81,11 @@
>   * Feature: userptr
>   *
>   * SUBTEST: create-destroy-sync
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-destroy-unsync
>   * Feature: userptr
> @@ -195,17 +199,29 @@
>   * Feature: userptr
>   *
>   * SUBTEST: huge-split
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: input-checking
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-mmap-offset-unsync
>   * Description: Verify unsynchronized userptr on mmap-offset mappings fails
>   * Feature: userptr
>   *
>   * SUBTEST: invalid-null-pointer
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: major-normal-sync
>   * Feature: userptr
> @@ -260,14 +276,26 @@
>   * Feature: userptr
>   *
>   * SUBTEST: mmap-offset-banned
> + * Category: Server
>   * Description: Verify mmap_offset to userptr is banned
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nohangcheck
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: probe
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: process-exit
>   * Feature: userptr
> @@ -285,22 +313,46 @@
>   * Feature: userptr
>   *
>   * SUBTEST: sd-probe
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: set-cache-level
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm-invalidate-close
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm-invalidate-close-overlap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-purge
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: swapping-normal-sync
>   * Feature: userptr
> @@ -315,16 +367,32 @@
>   * Feature: userptr
>   *
>   * SUBTEST: sync-overlap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap-after-close
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap-cycles
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unsync-overlap
>   * Feature: userptr
> @@ -339,13 +407,21 @@
>   * Feature: userptr
>   *
>   * SUBTEST: usage-restrictions
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userfault
>   * Feature: userptr
>   *
>   * SUBTEST: vma-merge
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   */
>  
>  #ifndef PAGE_SIZE
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index 2b19ca973acc..f24aefdae729 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -29,7 +29,11 @@
>  #include "igt_dummyload.h"
>  /**
>   * TEST: gem vm create
> + * Category: Server
> + * Functionality: context management
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext
>   * Feature: mapping
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 874ccd87eee3..5549d8927e2c 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -35,50 +35,68 @@
>   * TEST: gem wait
>   * Description: Tests the GEM_WAIT ioctl
>   * Feature: synchronization
> + * Run type: FULL
>   *
>   * SUBTEST: await
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in await mode.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in busy mode.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang-busy
>   * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
> - * Run type: FULL
>   *
>   * SUBTEST: hang-busy-write
>   * Description: Verify GEM_WAIT functionality in busy-write mode, when hang is allowed.
> - * Run type: FULL
>   *
>   * SUBTEST: hang-wait
>   * Description: Verify GEM_WAIT functionality in wait mode, when hang is allowed.
> - * Run type: FULL
>   *
>   * SUBTEST: hang-wait-write
>   * Description: Verify GEM_WAIT functionality in wait-write mode, when hang is allowed.
> - * Run type: FULL
>   *
>   * SUBTEST: invalid-buf
> + * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid buffer object will fail.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-flags
> + * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid flag will fail.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in wait mode.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: write-busy
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-busy mode.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: write-wait
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-wait mode.
> - * Run type: FULL
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index b635fd342ac5..da8cfa0118e9 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -37,13 +37,25 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-read
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-context
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-fd
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate-resume
>   * Feature: hibernate, workarounds
> @@ -55,22 +67,40 @@
>   * Feature: hibernate, workarounds
>   *
>   * SUBTEST: reset
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-context
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-fd
> + * Category: Infrastructure
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend-resume
> + * Description: Test to verify gem WA registers during suspend-resume
>   * Feature: suspend, workarounds
> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-context
> + * Description: Test to verify gem WA registers during suspend-resume
>   * Feature: suspend, workarounds
> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-fd
> + * Description: Test to verify gem WA registers during suspend-resume
>   * Feature: suspend, workarounds
> + * Test category: suspend
>   */
>  
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
> index e026aad565ff..74ccaf4d35f0 100644
> --- a/tests/i915/i915_getparams_basic.c
> +++ b/tests/i915/i915_getparams_basic.c
> @@ -32,9 +32,13 @@
>  #include <i915_drm.h>
>  /**
>   * TEST: i915 getparams basic
> + * Category: Infrastructure
>   * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
>   * Feature: gem_core
> + * Functionality: device topology
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-eu-total
>   * Description: Examine the export of EU_TOTAL parameter
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index ef45b25adacd..fc46bd29764b 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -42,43 +42,65 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: i915 hangman
> + * Category: Server
>   * Description: Tests for hang detection and recovery
>   * Feature: reset
> + * Functionality: error handling
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: detector
> - * Description: Check that hang detector works
> + * Description:
> + *   Check that hang detector works
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: engine-engine-error
> - * Description: Per engine hang recovery (invalid CS, engine reset)
> + * Description:
> + *   Per engine hang recovery (invalid CS, engine reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: engine-engine-hang
> - * Description: Per engine hang recovery (spin, engine reset)
> + * Description:
> + *   Per engine hang recovery (spin, engine reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: engine-error-state-capture
> - * Description: Per engine error capture (engine reset)
> + * Description:
> + *   Per engine error capture (engine reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: error-state-basic
> - * Description: Basic error capture
> + * Description:
> + *   Basic error capture
> + *   error detection
>   * Run type: BAT
>   *
>   * SUBTEST: gt-engine-error
> - * Description: Per engine hang recovery (invalid CS, GT reset)
> + * Description:
> + *   Per engine hang recovery (invalid CS, GT reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: gt-engine-hang
> - * Description: Per engine hang recovery (spin, GT reset)
> + * Description:
> + *   Per engine hang recovery (spin, GT reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: gt-error-state-capture
> - * Description: Per engine error capture (GT reset)
> + * Description:
> + *   Per engine error capture (GT reset)
> + *   error detection
>   * Run type: FULL
>   *
>   * SUBTEST: hangcheck-unterminated
> - * Description: Check that executing unintialised memory causes a hang
> + * Description:
> + *   Check that executing unintialised memory causes a hang
> + *   error detection
>   * Run type: FULL
>   */
>  
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> index 6d1334172c40..279f6821b0da 100644
> --- a/tests/i915/i915_hwmon.c
> +++ b/tests/i915/i915_hwmon.c
> @@ -13,6 +13,7 @@
>   * Description: Tests for i915 hwmon
>   * Feature: hwmon
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hwmon-read
>   * Description: Verify we can read all hwmon attributes
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index ae4e01ef18bc..df24aee5e576 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -28,14 +28,22 @@
>   * Description: Tests the i915 module loading.
>   *
>   * SUBTEST: load
> + * Category: Infrastructure
>   * Description: Check if i915 and friends are not yet loaded, then load them.
>   * Feature: core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reload
> + * Category: Infrastructure
>   * Description: Verify the basic functionality of i915 driver after it's reloaded.
>   * Feature: core, sriov-core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reload-no-display
>   * Description: Verify that i915 driver can be successfully loaded with disabled display.
> @@ -43,9 +51,13 @@
>   * Run type: FULL
>   *
>   * SUBTEST: reload-with-fault-injection
> + * Category: Infrastructure
>   * Description: Verify that i915 driver can be successfully reloaded at least once with fault injection.
>   * Feature: core, sriov-core
> + * Functionality: driver handler
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: resize-bar
>   * Description: Check whether lmem bar size can be resized to only supported sizes.
> diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
> index ae3d2a09d208..c44be56dcbc1 100644
> --- a/tests/i915/i915_pciid.c
> +++ b/tests/i915/i915_pciid.c
> @@ -30,9 +30,13 @@
>  #include "intel_chipset.h"
>  /**
>   * TEST: i915 pciid
> + * Category: Infrastructure
>   * Description: Check that igt/i915 know about this PCI-ID
>   * Feature: core
> + * Functionality: device management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index d9b4cbbfe615..e866e7fc9802 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -44,8 +44,11 @@
>   * TEST: i915 pm rpm
>   *
>   * SUBTEST: basic-pci-d3-state
> + * Description: Validate PCI device D3 state enter-exit scenario using runtime PM
>   * Feature: pm_rpm
> + * Functionality: D3 state entry-exit
>   * Run type: BAT
> + * Test category: pm_rpm
>   *
>   * SUBTEST: basic-rte
>   * Feature: pm_rpm
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index 050d68a16559..eaacc7c90cbd 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -51,14 +51,20 @@
>   * Run type: BAT
>   *
>   * SUBTEST: engine-order
> - * Description: Check if context reuse does not affect waitboosting
> + * Description:
> + *   Check if context reuse does not affect waitboosting.
> + *   Render P-States tests - verify GPU frequency changes
>   * Feature: pm_rps
>   * Run type: FULL
> + * Test category: pm_rps
>   *
>   * SUBTEST: fence-order
> - * Description: Check if the order of fences does not affect waitboosting
> + * Description:
> + *   Check if the order of fences does not affect waitboosting.
> + *   Render P-States tests - verify GPU frequency changes
>   * Feature: pm_rps, synchronization
>   * Run type: FULL
> + * Test category: pm_rps
>   *
>   * SUBTEST: min-max-config-idle
>   * Feature: pm_rps
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index 383c212d2807..3675b9d6d75c 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -12,6 +12,7 @@
>   * Description: i915 power measurement tests
>   * Feature: hwmon
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sanity
>   * Description: Sanity check gpu power measurement
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index 10c6d43fa7fc..62f7de428ec8 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -33,28 +33,52 @@
>   * Run type: FULL
>   *
>   * SUBTEST: engine-info
> + * Category: Infrastructure
>   * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engine-info-invalid
> + * Category: Infrastructure
>   * Description: Negative tests for DRM_I915_QUERY_ENGINE_INFO
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hwconfig_table
> + * Category: Infrastructure
>   * Description: Test DRM_I915_QUERY_HWCONFIG_BLOB query
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-garbage
> + * Category: Infrastructure
>   * Description: Test response to an invalid query call
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-garbage-items
> + * Category: Infrastructure
>   * Description: Dodgy returned data tests for DRM_I915_QUERY_MEMORY_REGIONS
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-sanity-check
> + * Category: Infrastructure
>   * Description: Basic tests for DRM_I915_QUERY_MEMORY_REGIONS
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-unallocated
>   * Description: Sanity check the region unallocated tracking
> @@ -65,12 +89,20 @@
>   * Feature: gem_core
>   *
>   * SUBTEST: query-topology-garbage-items
> + * Category: Infrastructure
>   * Description: Test response to invalid DRM_I915_QUERY_TOPOLOGY_INFO query
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-topology-kernel-writes
> + * Category: Infrastructure
>   * Description: Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-topology-known-pci-ids
>   * Description:
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 448cadfb0804..9f0a4d2ac5e0 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -50,16 +50,23 @@
>   * SUBTEST: basic-s2idle-without-i915
>   * Description: Validate suspend-to-idle without i915 module
>   * Feature: suspend
> + * Functionality: s2idle w/o i915
>   * Run type: BAT
> + * Test category: suspend
>   *
>   * SUBTEST: basic-s3-without-i915
> - * Description: Validate S3 without i915 module
> + * Description:
> + *   Validate S3 without i915 module.
> + *   Validate S3 state without i915 module
>   * Feature: suspend
>   * Run type: BAT
> + * Test category: suspend
>   *
>   * SUBTEST: debugfs-reader
> + * Description: Test debugfs behavior during suspend to idle
>   * Feature: suspend
>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: debugfs-reader-hibernate
>   * Feature: suspend
> @@ -82,8 +89,10 @@
>   * Run type: FULL
>   *
>   * SUBTEST: forcewake
> + * Description: Test to prevent GT from suspend by opening forcewake handle
>   * Feature: suspend
>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: forcewake-hibernate
>   * Feature: suspend
> @@ -94,8 +103,10 @@
>   * Run type: FULL
>   *
>   * SUBTEST: sysfs-reader
> + * Description: Test sysfs behavior during suspend to idle
>   * Feature: suspend
>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: sysfs-reader-hibernate
>   * Feature: suspend
> diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
> index 73478559fcda..066532f0a5e2 100644
> --- a/tests/i915/sysfs_defaults.c
> +++ b/tests/i915/sysfs_defaults.c
> @@ -35,8 +35,12 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: sysfs defaults
> + * Category: Infrastructure
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: readonly
>   */
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index 2971acb32811..a3de43a37e72 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -47,18 +47,28 @@
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
> + * Description: Test to check whether the heartbeat parameter reports the values set.
> + * Test category: SysMan
>   *
>   * SUBTEST: invalid
> + * Description: Test to check if heartbeat parameter rejects any unrepresentable intervals.
> + * Test category: SysMan
>   *
>   * SUBTEST: long
>   *
>   * SUBTEST: mixed
> + * Description: Run a mixed workload with non-preemptable hogs that exceed the heartbeat, and quicker innocents. Inspect the fence status of each to verify that only the hogs are reset.
> + * Test category: SysMan
>   *
>   * SUBTEST: nopreempt
> + * Description: Test heartbeats with forced preemption disabled.
> + * Test category: SysMan
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: precise
> + * Description: Tests the heartbeats with preemption and heartbeat parameter enabled.
> + * Test category: SysMan
>   */
>  
>  #define ATTR "heartbeat_interval_ms"
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
> index e7c09949930c..3d24bf61ce6d 100644
> --- a/tests/i915/sysfs_preempt_timeout.c
> +++ b/tests/i915/sysfs_preempt_timeout.c
> @@ -46,12 +46,18 @@
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
> + * Description: Test to check whether the preempt_timeout parameter reports the values set.
> + * Test category: SysMan
>   *
>   * SUBTEST: invalid
> + * Description: Test to check if preempt_timeout parameter rejects any unrepresentable intervals.
> + * Test category: SysMan
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Description: Test to measure the delay from requestion the preemption to its completion. Send down some non-preemptable workloads and then request a switch to a higher priority context. The HW will not be able to respond, so the kernel will be forced to reset the hog.
> + * Test category: SysMan
>   */
>  
>  #define ATTR "preempt_timeout_ms"
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 0f4905d8b613..f1b51826481b 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -49,14 +49,22 @@
>   * Run type: FULL
>   *
>   * SUBTEST: duration
> + * Description: Test to measure the timeslice duration by watching the xCS_TIMESTAMP and recording its value every time we switch into the context, using a couple of semaphores to busyspin for the timeslice.
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Description: Test to check whether timeslice parameter reports the values set.
> + * Test category: SysMan
>   *
>   * SUBTEST: invalid
> + * Description: Test to check if timeslice parameter rejects any unrepresentable intervals.
> + * Test category: SysMan
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Description: Couple a unpreemptable hog with a fast forced reset and measure the timeslice by how long it takes for the hog to be reset and the high priority context to complete.
> + * Test category: SysMan
>   */
>  
>  #define ATTR "timeslice_duration_ms"
> -- 
> 2.40.1
> 

