Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9BD10E2BA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 16:15:36 +0000 (UTC)
Date: Fri, 19 May 2023 18:15:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230519161531.ij6kay5bn7f37cpz@kamilkon-desk1>
References: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
 <20230517151110.1710407-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517151110.1710407-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] i915/: better document the
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

Hi Mauro,

there are some problems, see below.

On 2023-05-17 at 17:11:10 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> i915 test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/api_intel_allocator.c         | 23 ++++++-
>  tests/i915/api_intel_bb.c                | 33 +++++++++-
>  tests/i915/gem_barrier_race.c            |  1 +
>  tests/i915/gem_basic.c                   |  7 +++
>  tests/i915/gem_blits.c                   |  4 ++
>  tests/i915/gem_busy.c                    |  7 +++
>  tests/i915/gem_caching.c                 |  4 ++
>  tests/i915/gem_close.c                   |  4 ++
>  tests/i915/gem_close_race.c              |  7 +++
>  tests/i915/gem_create.c                  | 41 ++++++++++++-
>  tests/i915/gem_cs_tlb.c                  |  4 ++
>  tests/i915/gem_eio.c                     | 68 ++++++++++++++++++++-
>  tests/i915/gem_exercise_blt.c            |  9 ++-
>  tests/i915/gem_flink_basic.c             | 14 ++++-
>  tests/i915/gem_flink_race.c              |  4 ++
>  tests/i915/gem_gpgpu_fill.c              |  4 ++
>  tests/i915/gem_linear_blits.c            |  6 ++
>  tests/i915/gem_lmem_evict.c              |  1 +
>  tests/i915/gem_lmem_swapping.c           |  4 ++
>  tests/i915/gem_madvise.c                 |  4 ++
>  tests/i915/gem_mmap_offset.c             |  4 ++
>  tests/i915/gem_pipe_control_store_loop.c |  4 ++
>  tests/i915/gem_ppgtt.c                   |  6 ++
>  tests/i915/gem_request_retire.c          |  4 ++
>  tests/i915/gem_ringfill.c                |  8 +++
>  tests/i915/gem_shrink.c                  |  4 ++
>  tests/i915/gem_softpin.c                 | 69 ++++++++++++++++++++-
>  tests/i915/gem_spin_batch.c              | 37 ++++++++++++
>  tests/i915/gem_sync.c                    | 14 +++++
>  tests/i915/gem_unref_active_buffers.c    |  4 ++
>  tests/i915/gem_userptr_blits.c           | 76 ++++++++++++++++++++++++
>  tests/i915/gem_vm_create.c               |  4 ++
>  tests/i915/gem_wait.c                    |  4 ++
>  tests/i915/gem_workarounds.c             | 32 +++++++++-
>  tests/i915/i915_getparams_basic.c        |  4 ++
>  tests/i915/i915_hangman.c                | 40 ++++++++++---
>  tests/i915/i915_hwmon.c                  |  1 +
>  tests/i915/i915_module_load.c            |  4 ++
>  tests/i915/i915_pciid.c                  |  4 ++
>  tests/i915/i915_pm_rpm.c                 |  6 +-
>  tests/i915/i915_pm_rps.c                 | 12 +++-
>  tests/i915/i915_power.c                  |  1 +
>  tests/i915/i915_query.c                  |  4 ++
>  tests/i915/i915_suspend.c                | 26 ++++++--
>  tests/i915/sysfs_defaults.c              |  4 ++
>  tests/i915/sysfs_heartbeat_interval.c    |  6 ++
>  tests/i915/sysfs_preempt_timeout.c       |  4 ++
>  tests/i915/sysfs_timeslice_duration.c    |  5 ++
>  48 files changed, 609 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 3962231ebcc7..7759032b75db 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -11,44 +11,65 @@
>  #include "intel_allocator.h"
>  /**
>   * TEST: api intel allocator
> + * Category: Infrastructure
>   * Feature: igt_core
> + * Functionality: virtual address ranges
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: alloc-simple
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: default-alignment
>   * Description:
>   *   For simple allocator check does default alignment is properly handled in open and alloc
>   *   functions
> + *   checking the virtual address ranges
>   *
>   * SUBTEST: execbuf-with-allocator
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: fork-simple-once
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: fork-simple-stress
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: fork-simple-stress-signal
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: gem-pool
> - * Description: Verifies creating and executing bb from gem pool
> + * Description:
> + *   Verifies creating and executing bb from gem pool
> + *   checking the virtual address ranges
>   *
>   * SUBTEST: open-vm
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: reloc-allocator
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: reopen
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: reopen-fork
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: reserve-simple
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: simple-allocator
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: standalone
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: two-level-inception
> + * Description: checking the virtual address ranges
>   *
>   * SUBTEST: two-level-inception-interruptible
> + * Description: checking the virtual address ranges
>   */
>  
>  #define OBJ_SIZE 1024
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 198a29eb4f26..09d90199ef4a 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -43,66 +43,95 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: api intel bb
> + * Category: Infrastructure
>   * Description: intel_bb API check.
>   * Feature: igt_core
> + * Functionality: dummy buffer creation & submission
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: add-remove-objects
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: bb-with-allocator
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: blit-noreloc-keep-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: blit-noreloc-purge-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: blit-reloc-keep-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: blit-reloc-purge-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: crc32
>   * Description: Compare cpu and gpu crc32 sums on input object
>   *
>   * SUBTEST: delta-check
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: destroy-bb
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: full-batch
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: intel-bb-blit-none
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: intel-bb-blit-x
>   *
>   * SUBTEST: intel-bb-blit-y
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: lot-of-buffers
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: misplaced-blitter
> - * Description: Execute intel_bb with set of engines provided by userspace
> + * Description:
> + *   Execute intel_bb with set of engines provided by userspace
> + *   checking dummy buffer creation & submission
>   *
>   * SUBTEST: object-noreloc-keep-cache-simple
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: object-noreloc-purge-cache-simple
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: object-reloc-keep-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: object-reloc-purge-cache
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: offset-control
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: purge-bb
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: render
>   *
>   * SUBTEST: render-ccs
>   *
>   * SUBTEST: reset-bb
> - * Description: Ensure reset is possible on fresh bb
> + * Description:
> + *   Ensure reset is possible on fresh bb
> + *   checking dummy buffer creation & submission
>   *
>   * SUBTEST: reset-flags
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: simple-bb
> + * Description: checking dummy buffer creation & submission
>   *
>   * SUBTEST: simple-bb-ctx
> + * Description: checking dummy buffer creation & submission
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
> index 8605429799aa..8df581bb3e48 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -43,27 +43,34 @@
>  #include "lib/igt_device_scan.h"
>  /**
>   * TEST: gem basic
> + * Category: Infrastructure
>   * Description: Tests basic gem_create and gem_close IOCTLs
> + * Functionality: driver handler
> + * Sub-category: i915
>   *
>   * SUBTEST: bad-close
>   * Description: Verify that gem_close fails with bad params.
>   * Feature: gem_core
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-close
>   * Description: Verify basic functionality of gem_create and gem_close.
>   * Feature: gem_core
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-fd-close
>   * Description: Verify that closing drm driver is possible with opened gem object.
>   * Feature: gem_core
>   * Run type: BAT
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
> index 38d66f8f292a..34f6c5984b0b 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -32,19 +32,25 @@
>  #include "igt_vgem.h"
>  /**
>   * TEST: gem busy
> + * Category: Desktop client
>   * Description: Basic check of busy-ioctl ABI.
>   * Feature: cmd_submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy
>   * Description: Basic test to check busyness of each engine.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: close-race
>   * Description: Test to check race condition by randomly closing the handle using gem_close.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: extended
>   * Description: Extended test to check busyness of dwstore-capable engines.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: hang
> @@ -61,6 +67,7 @@
>   * Description:
>   *   Extended test to check busyness of dwstore-capable engines while doing parallel
>   *   execution.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: semaphore
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
> index 802fa3abbe6a..e02cea17ccad 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -50,12 +50,16 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: gem close race
> + * Category: Infrastructure
>   * Description: Test try to race gem_close against workload submission.
> + * Functionality: driver handler
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-process
>   * Description: Basic workload submission.
>   * Feature: synchronization
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-threads
>   * Description:
> @@ -63,6 +67,7 @@
>   *   continuous workload with minimum timeout.
>   * Feature: synchronization
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
>   * Description:
> @@ -82,11 +87,13 @@
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
> index fc99189499b8..ed79031f59de 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -67,50 +67,89 @@
>   * Description:
>   *   Ensure that basic gem_create and gem_create_ext works and that invalid input combinations
>   *   are rejected.
> - * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy-create
> + * Category: Infrastructure
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-clear
> + * Category: Infrastructure
>   * Description: Verify that all new objects are clear.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
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
>   *
>   * SUBTEST: create-ext-placement-each
> + * Category: Infrastructure
>   * Description: Create one object with memory pieces in each memory region using create_ext.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-ext-placement-sanity-check
> + * Category: Infrastructure
>   * Description: Exercise create_ext placements extension.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-invalid-size
> + * Category: Infrastructure
>   * Description: Try to create a gem object of invalid size 0 and check if ioctl returns error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-massive
> + * Category: Infrastructure
>   * Description: Exercise creation of buffer object with impossible size and check for the expected error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-size-update
> + * Category: Infrastructure
>   * Description: Try to create a gem object with size 15 and check actual created size.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-valid-nonaligned
> + * Category: Infrastructure
>   * Description:
>   *   Try to create an object with non-aligned size, check we got one with size aligned up to page
>   *   size and test we can write into the padded extra memory.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: hog-create
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
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
> index 4aef96d18e8c..3b7d02f74294 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -54,96 +54,158 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem eio
> + * Category: Infrastructure
>   * Description: Test that specific ioctls report a wedged GPU (EIO).
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: banned
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-create
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create
>   * Description: Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext
>   * Description:
>   *   Validate i915_gem_create_ext_ioctl and checks if returns clear backing store while gpu is
>   *   wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execbuf
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate
> - * Feature: hibernate, reset
> + * Feature:
> + *   hibernate, reset
> + *   suspend
> + * Functionality: Test that specific ioctls report a wedged GPU (EIO) during suspend
-------------------- ^
This is description ?

> + * Test category: suspend
>   *
>   * SUBTEST: in-flight-10ms
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-1us
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-10ms
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-1us
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-immediate
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-external
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-immediate
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-10ms
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-1us
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-immediate
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-suspend
> - * Feature: reset
> + * Feature:
> + *   reset
> + *   suspend
> + * Functionality: Test that specific ioctls report a wedged GPU (EIO) during suspend
-------------------- ^
Same here.

> + * Test category: suspend
>   *
>   * SUBTEST: kms
>   * Feature: kms_gem_interop, reset
>   *
>   * SUBTEST: reset-stress
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend
> - * Feature: reset, suspend
> + * Feature:
> + *   reset, suspend
> + *   suspend
> + * Functionality: Test that specific ioctls report a wedged GPU (EIO) during suspend
-------------------- ^
Same here.

> + * Test category: suspend
>   *
>   * SUBTEST: throttle
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unwedge-stress
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-10ms
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-1us
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-immediate
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-10ms
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-1us
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-immediate
>   * Feature: reset
> + * Functionality: reset
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
> index 7feabf61a303..fd99ee5538e4 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -40,24 +40,36 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem flink basic
> + * Category: Desktop client
>   * Description: Tests for flink - a way to export a gem object by name
>   * Feature: xorg_dri2
> - * Run type: BAT
> + * Functionality: buffer management
> + * Sub-category: DRM
>   *
>   * SUBTEST: bad-flink
>   * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-open
>   * Description: Verify that GEM_OPEN ioctl with invalid flink name fails.
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   * Description: Check if gem object can be exported to global namespace and then opened.
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-flink
>   * Description: Tests that multiple flinks for the same gem object share the same name.
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: flink-lifetime
>   * Description: Tests flink lifetime by referencing from multiple descriptors.
> + * Run type: BAT
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
> index f350e9fbb6d0..e79df7409c01 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -50,8 +50,12 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: gem gpgpu fill
> + * Category: Server
>   * Feature: compute
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   */
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 4c3576503ca3..40ab4fab3df4 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -51,20 +51,26 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: gem linear blits
> + * Category: Infrastructure
>   * Description: Test doing many blits with a working set larger than the aperture size.
>   * Feature: blitter
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description: Basic blitter functionality check with 2 buffers
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: interruptible
>   * Description: Test with interrupts in between the parent process
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: normal
>   * Description: The intent is to push beyond the working GTT size to force the driver to rebind the buffers
>   * Run type: FULL
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
> index f6a1c0082c78..014068da79f3 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -26,8 +26,12 @@
>  #include "i915/intel_mocs.h"
>  /**
>   * TEST: gem lmem swapping
> + * Category: Server
>   * Description: Exercise local memory swapping.
>   * Feature: local_memory
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   * Description: Exercise local memory swapping to system memory
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 17653cc4ad53..139376d1b3e3 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -40,8 +40,12 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem madvise
> + * Category: Desktop client
>   * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-after-mmap
>   * Description:
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index afabe2426291..f6d3374dd6e8 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -39,9 +39,13 @@
>  #include "igt_x86.h"
>  /**
>   * TEST: gem mmap offset
> + * Category: Infrastructure
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
>   * Feature: mapping
> + * Functionality: memory management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-extensions
>   *
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
> index 451876526e9a..d350cd7fea57 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -43,14 +43,18 @@
>  #include <sys/ioctl.h>
>  /**
>   * TEST: gem ringfill
> + * Category: Infrastructure
>   * Description:
>   *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
>   *   properly near full.
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-all
>   * Description: Basic check to fill the ring upto maximum on all engines simultaneously.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-S3
>   * Description: Handle a full ring across suspend cycle.
> @@ -65,7 +69,9 @@
>   * SUBTEST: engines-basic
>   * Description: Basic check how the driver handles a full ring.
>   * Feature: cmd_submission, multitile
> + * Functionality: Test spamming ring with contexts
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: engines-bomb
>   * Description:
> @@ -114,7 +120,9 @@
>   * SUBTEST: legacy-basic
>   * Description: Basic check how the driver handles a full ring - on legacy ring.
>   * Feature: cmd_submission, multitile
> + * Functionality: Test spamming ring with contexts - legacy path
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
> index 27e5781b9b73..6bea75d1fe37 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -33,116 +33,183 @@
>  #include "intel_allocator.h"
>  /**
>   * TEST: gem softpin
> + * Category: Infrastructure
>   * Description:
>   *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
>   *   tests which copy buffers between CPU and GPU.
> - * Feature: mapping
> + * Sub-category: i915
>   *
>   * SUBTEST: 32b-excludes-last-page
>   * Description: Check the last 32b page is excluded.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic
>   * Description: Check that we can place objects at start/end of the GTT using the allocator.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic-reserve
>   * Description: Check that if we can reserve a space for an object starting from a given offset.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-evict
>   * Description: Exercise eviction with softpinning.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-fork
>   * Description: Check if multiple processes can use alloctor.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin
>   * Description: Check that we can combine manual placement with automatic GTT placement.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin-reserve
>   * Description:
>   *   Check that we can combine manual placement with automatic GTT placement and
>   *   reserves/unreserves space for objects.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active
>   * Description: Check eviction with active bo.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active-interruptible
>   * Description: Check eviction with active bo with interrupts.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
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
>   * Description: Use same offset for all engines and for different handles.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
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
>   * Description: Check the total occupancy by using pad-to-size to fill the entire GTT.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid
>   * Description: Check that invalid inputs are handled correctly.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreloc
>   * Description: Check that noreloc support works.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
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
>   * Description: Check noreloc support with interruptible.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: overlap
>   * Description: Check all the possible pages aligned overlaps.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reverse
>   * Description: Check that if the user demands the vma will be swapped.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: safe-alignment
>   * Description: Check start offset and alignment detection.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: softpin
>   * Description: Check softpinning of a gem buffer object.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: zero
>   * Description: Check full placement control under full-ppGTT.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
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
> index 1c7e51a92bfa..9a855a221654 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -57,29 +57,43 @@
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
>   * Description: Check synchronisation of ring.
>   * Feature: multitile, synchronization
> + * Functionality: Exercise all physical engine selection and legacy rings
-------------------- ^
imho semaphore, engine selection
but I am not sure, it looks more like description, here and below.

>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-many-each
>   * Description: Create race condition and see if we can catch interrupts.
>   * Feature: multitile, synchronization
> + * Functionality: Basic check of ring to ring write synchronisation
-------------------- ^

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
>   * Description: Check that store synchronisation works.
>   * Feature: multitile, synchronization
> + * Functionality: Basic check of ring to ring write, store synchronisation
-------------------- ^

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
> index 874ccd87eee3..40e548579226 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -33,8 +33,12 @@
>  #include "igt_vgem.h"
>  /**
>   * TEST: gem wait
> + * Category: Infrastructure
>   * Description: Tests the GEM_WAIT ioctl
>   * Feature: synchronization
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: await
>   * Description: Verify GEM_WAIT functionality in await mode.
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index b635fd342ac5..02c8977d5cb6 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -34,16 +34,24 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem workarounds
> + * Category: Infrastructure
>   * Run type: FULL
> + * Sub-category: HW
>   *
>   * SUBTEST: basic-read
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-context
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-fd
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate-resume
>   * Feature: hibernate, workarounds
> @@ -56,21 +64,39 @@
>   *
>   * SUBTEST: reset
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-context
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-fd
>   * Feature: workarounds
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend-resume
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
> + * Functionality: Test to verify gem WA registers during suspend-resume
-------------------- ^

> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-context
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
> + * Functionality: Test to verify gem WA registers during suspend-resume
-------------------- ^

> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-fd
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
> + * Functionality: Test to verify gem WA registers during suspend-resume
-------------------- ^

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
> index ae4e01ef18bc..386be7d602dc 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -25,7 +25,11 @@
>  #include <sys/utsname.h>
>  /**
>   * TEST: i915 module load
> + * Category: Infrastructure
>   * Description: Tests the i915 module loading.
> + * Functionality: driver handler
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: load
>   * Description: Check if i915 and friends are not yet loaded, then load them.
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
> index d9b4cbbfe615..4c0888ecc4c5 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -42,9 +42,13 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: i915 pm rpm
> + * Functionality: Validate PCI device D3 state enter-exit scenario using runtime PM
-------------------- ^

> + * Test category: pm_rpm
>   *
>   * SUBTEST: basic-pci-d3-state
> - * Feature: pm_rpm
> + * Feature:
> + *   pm_rpm
> + *   pm_rpm
>   * Run type: BAT
>   *
>   * SUBTEST: basic-rte
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index 050d68a16559..0c803eed5fdb 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -52,13 +52,21 @@
>   *
>   * SUBTEST: engine-order
>   * Description: Check if context reuse does not affect waitboosting
> - * Feature: pm_rps
> + * Feature:
> + *   pm_rps
> + *   pm_rps
------- ^
Same string repeated.

> + * Functionality: Render P-States tests - verify GPU frequency changes
-------------------- ^

>   * Run type: FULL
> + * Test category: pm_rps
>   *
>   * SUBTEST: fence-order
>   * Description: Check if the order of fences does not affect waitboosting
> - * Feature: pm_rps, synchronization
> + * Feature:
> + *   pm_rps, synchronization
> + *   pm_rps
> + * Functionality: Render P-States tests - verify GPU frequency changes
-------------------- ^

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
> index 10c6d43fa7fc..de3aa5c24f2d 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -29,8 +29,12 @@
>  #include <limits.h>
>  /**
>   * TEST: i915 query
> + * Category: Infrastructure
>   * Description: Testing the i915 query uAPI.
> + * Functionality: device topology
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engine-info
>   * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 448cadfb0804..31456a45d9c8 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -46,19 +46,29 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: i915 suspend
> + * Test category: suspend
>   *
>   * SUBTEST: basic-s2idle-without-i915
>   * Description: Validate suspend-to-idle without i915 module
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend
------- ^
Same string repeated.

> + * Functionality: Validate suspend-to-idle without i915 module
-------------------- ^

>   * Run type: BAT
>   *
>   * SUBTEST: basic-s3-without-i915
>   * Description: Validate S3 without i915 module
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend
> + * Functionality: Validate S3 state without i915 module
-------------------- ^
Taken from description.

>   * Run type: BAT
>   *
>   * SUBTEST: debugfs-reader
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend
------- ^
repeated

> + * Functionality: Test debugfs behavior during suspend to idle
-------------------- ^

>   * Run type: FULL
>   *
>   * SUBTEST: debugfs-reader-hibernate
> @@ -82,7 +92,10 @@
>   * Run type: FULL
>   *
>   * SUBTEST: forcewake
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend
------- ^
> + * Functionality: Test to prevent GT from suspend by opening forcewake handle
-------------------- ^

>   * Run type: FULL
>   *
>   * SUBTEST: forcewake-hibernate
> @@ -94,7 +107,10 @@
>   * Run type: FULL
>   *
>   * SUBTEST: sysfs-reader
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend
------- ^
> + * Functionality: Test sysfs behavior during suspend to idle
-------------------- ^

>   * Run type: FULL
>   *
>   * SUBTEST: sysfs-reader-hibernate
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
> index 2971acb32811..9161ea5bbf59 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -45,20 +45,26 @@
>   * TEST: sysfs heartbeat interval
>   * Feature: SMI, cmd_submission
>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check whether the heartbeat parameter reports the values set.
-------------------- ^

>   *
>   * SUBTEST: invalid
> + * Functionality: Test to check if heartbeat parameter rejects any unrepresentable intervals.
-------------------- ^

>   *
>   * SUBTEST: long
>   *
>   * SUBTEST: mixed
> + * Functionality: Run a mixed workload with non-preemptable hogs that exceed the heartbeat, and quicker innocents. Inspect the fence status of each to verify that only the hogs are reset.
-------------------- ^

>   *
>   * SUBTEST: nopreempt
> + * Functionality: Test heartbeats with forced preemption disabled.
-------------------- ^

>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: precise
> + * Functionality: Tests the heartbeats with preemption and heartbeat parameter enabled.
-------------------- ^

>   */
>  
>  #define ATTR "heartbeat_interval_ms"
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
> index e7c09949930c..b7ec5ec3e4b7 100644
> --- a/tests/i915/sysfs_preempt_timeout.c
> +++ b/tests/i915/sysfs_preempt_timeout.c
> @@ -44,14 +44,18 @@
>   * TEST: sysfs preempt timeout
>   * Feature: SMI, context
>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check whether the preempt_timeout parameter reports the values set.
-------------------- ^

>   *
>   * SUBTEST: invalid
> + * Functionality: Test to check if preempt_timeout parameter rejects any unrepresentable intervals.
-------------------- ^

>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Functionality: Test to measure the delay from requestion the preemption to its completion. Send down some non-preemptable workloads and then request a switch to a higher priority context. The HW will not be able to respond, so the kernel will be forced to reset the hog.
-------------------- ^
This definitly fits into description.

>   */
>  
>  #define ATTR "preempt_timeout_ms"
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 0f4905d8b613..58b0ed3f02d2 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -47,16 +47,21 @@
>   * TEST: sysfs timeslice duration
>   * Feature: SMI, cmd_submission
>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: duration
> + * Functionality: Test to measure the timeslice duration by watching the xCS_TIMESTAMP and recording its value every time we switch into the context, using a couple of semaphores to busyspin for the timeslice.
-------------------- ^
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check whether timeslice parameter reports the values set.
-------------------- ^
>   *
>   * SUBTEST: invalid
> + * Functionality: Test to check if timeslice parameter rejects any unrepresentable intervals.
-------------------- ^
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Functionality: Couple a unpreemptable hog with a fast forced reset and measure the timeslice by how long it takes for the hog to be reset and the high priority context to complete.
-------------------- ^

Regards,
Kamil

>   */
>  
>  #define ATTR "timeslice_duration_ms"
> -- 
> 2.40.1
> 

