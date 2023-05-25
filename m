Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90310E765
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 21:02:32 +0000 (UTC)
Date: Thu, 25 May 2023 23:02:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525210229.ro4r7w2kh6qzkx57@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 08/11] tests: add documentation for
 dynamic subtests
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

On 2023-05-25 at 11:05:32 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Dynamic subtests are a special case, as those can't be listed
> by passing --list-subtests:
> 
> 	$ ./build/tests/dmabuf --list-subtests
> 	all-tests
> 
> So, the import script requires a special logic to import
> those.
> 
> Add documentation for such tests.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/dmabuf.c             |  12 +
>  tests/drm_mm.c             | 120 +++++++++
>  tests/i915/gem_busy.c      |   6 +
>  tests/i915/gem_wait.c      |  12 +
>  tests/i915/i915_selftest.c | 485 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 635 insertions(+)
> 
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 4bc9b35b619d..2ac10542312c 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -30,6 +30,18 @@
>   * Run type: BAT
>   *
>   * SUBTEST: all-tests
> + *
> + * SUBTEST: all-tests@dma_fence
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@sanitycheck
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 4cc2891ee129..0bce7139d4c8 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -30,6 +30,126 @@
>   * Run type: FULL
>   *
>   * SUBTEST: all-tests
> + *
> + * SUBTEST: all-tests@align
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@align32
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@align64
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@bottomup
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@color
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@color_evict
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@color_evict_range
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@debug
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@evict
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@evict_range
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@frag
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@highest
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@init
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@insert
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@insert_range
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@lowest
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@replace
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@reserve
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@sanitycheck
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: all-tests@topdown
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM memory mangemnt
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 0f48dbbfe75c..b796ebb2bb5c 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -43,6 +43,12 @@
>   * Sub-category: i915
>   * Test category: GEM_Legacy
>   *
> + * SUBTEST: busy@all
> + * Functionality: Semaphore
> + *
> + * SUBTEST: busy@all-engines
> + * Run type: BAT
> + *
>   * SUBTEST: close-race
>   * Category: Desktop client
>   * Description: Test to check race condition by randomly closing the handle using gem_close.
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 5549d8927e2c..c1cd37e63c24 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -51,6 +51,12 @@
>   * Sub-category: i915
>   * Test category: GEM_Legacy
>   *
> + * SUBTEST: busy@all
> + * Functionality: semaphore
> + *
> + * SUBTEST: busy@all-engines
> + * Run type: BAT
> + *
>   * SUBTEST: hang-busy
>   * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
>   *
> @@ -84,6 +90,12 @@
>   * Sub-category: i915
>   * Test category: GEM_Legacy
>   *
> + * SUBTEST: wait@all
> + * Functionality: semaphore
> + *
> + * SUBTEST: wait@all-engines
> + * Run type: BAT
> + *
>   * SUBTEST: write-busy
>   * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-busy mode.
> diff --git a/tests/i915/i915_selftest.c b/tests/i915/i915_selftest.c
> index 8863274405ba..bb0e844e9ed9 100644
> --- a/tests/i915/i915_selftest.c
> +++ b/tests/i915/i915_selftest.c
> @@ -31,13 +31,498 @@
>   * Feature: gem_core
>   * Run type: BAT
>   *
> + * SUBTEST: live@active
> + * Category: Selftest
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@blt
> + * Category: Selftest
> + * Description: Blitter validation
> + * Functionality: command streamer
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@client
> + * Category: Selftest
> + * Description: Internal API over blitter
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@coherency
> + * Category: Selftest
> + * Description: Cache management
> + * Functionality: memory management
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@debugger
> + * Category: Selftest
> + * Functionality: device management
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@display
> + * Category: Selftest
> + * Functionality: display sanity
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@dmabuf
> + * Category: Selftest
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@evict
> + * Category: Selftest
> + * Functionality: GTT eviction
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@execlists
> + * Category: Selftest
> + * Description: command submission backend
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gem
> + * Category: Selftest
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gem_contexts
> + * Category: Selftest
> + * Description: User isolation and execution at the context level
> + * Functionality: context management
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gem_execbuf
> + * Category: Selftest
> + * Description: command submission support
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_ccs_mode
> + * Category: Selftest
> + * Description: Multi-ccs internal validation
> + * Functionality: multii-ccs
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_contexts
> + * Category: Selftest
> + * Description: HW isolation and HW context validation
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_engines
> + * Category: Selftest
> + * Description: command submission topology validation
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_gtt
> + * Category: Selftest
> + * Description: Validation of virtual address management and execution
> + * Functionality: memory management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_heartbeat
> + * Category: Selftest
> + * Description: Stall detection interface validation
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_lrc
> + * Category: Selftest
> + * Description: HW isolation and HW context validation
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_mocs
> + * Category: Selftest
> + * Description: Verification of mocs registers
> + * Functionality: mocs
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_pm
> + * Category: Selftest
> + * Description: Basic i915 driver module selftests
> + * Feature: rps, rc6
> + * Test category: rps, rc6
> + *
> + * SUBTEST: live@gt_timelines
> + * Category: Selftest
> + * Description: semaphore tracking
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gt_tlb
> + * Category: Selftest
> + * Test category: Memory Management
> + *
> + * SUBTEST: live@gtt
> + * Category: Selftest
> + * Description: Virtual address management interface validation
> + * Functionality: memory management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@gtt_l4wa
> + * Category: Selftest
> + * Description: Check the L4WA is enabled when it was required
> + * Functionality: workarounds
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@guc
> + * Category: Selftest
> + * Feature: GuC
> + * Functionality: Guc specific selftests
> + * Test category: GuC
> + *
> + * SUBTEST: live@guc_doorbells
> + * Category: Selftest
> + * Feature: GuC
> + * Functionality: Guc specific selftests
> + * Test category: GuC
> + *
> + * SUBTEST: live@guc_hang
> + * Category: Selftest
> + * Feature: GuC
> + * Functionality: Guc specific selftests
> + * Test category: GuC
> + *
> + * SUBTEST: live@guc_multi_lrc
> + * Category: Selftest
> + * Feature: GuC
> + * Functionality: Guc specific selftests
> + * Test category: GuC
> + *
> + * SUBTEST: live@hangcheck
> + * Category: Selftest
> + * Description: reset handling after stall detection
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@hugepages
> + * Category: Selftest
> + * Description: Large page support validation
> + * Functionality: memory management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@late_gt_pm
> + * Category: Selftest
> + * Feature: rc6
> + * Functionality: Basic i915 driver module selftests
> + * Test category: rc6
> + *
> + * SUBTEST: live@lmem
> + * Category: Selftest
> + *
> + * SUBTEST: live@memory_region
> + * Category: Selftest
> + * Description: memory topology validation and migration checks
> + * Functionality: memory management
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@memory_region_cross_tile
> + * Category: Selftest
> + * Functionality: Multi-tile memory topology validation
> + * Test category: MultiTile
> + *
> + * SUBTEST: live@mman
> + * Category: Selftest
> + * Description: memory management validation
> + * Functionality: memory management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@obj_lock
> + * Category: Selftest
> + * Description: Validation of per-object locking patterns
> + * Functionality: per-object lockling
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@objects
> + * Category: Selftest
> + * Description: User object allocation and isolation checks
> + * Functionality: buffer management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@perf
> + * Category: Selftest
> + * Feature: i915 perf selftests
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
> + *
> + * SUBTEST: live@remote_tiles
> + * Category: Selftest
> + * Functionality: Tile meta data validation
> + * Test category: MultiTile
> + *
> + * SUBTEST: live@requests
> + * Category: Selftest
> + * Description: Validation of internal i915 command submission interface
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@reset
> + * Category: Selftest
> + * Description: engine/GT resets
> + * Functionality: reset
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@sanitycheck
> + * Category: Selftest
> + * Description: Checks the selftest infrastructure itself
> + * Functionality: selftests
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@scheduler
> + * Category: Selftest
> + * Test category: Cmd Submission
> + *
> + * SUBTEST: live@semaphores
> + * Category: Selftest
> + * Description: GuC semaphore management
> + * Functionality: semaphore
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@slpc
> + * Category: Selftest
> + * Feature: slpc / pm_rps
> + * Functionality: Basic i915 driver module selftests
> + * Test category: slpc / pm_rps
> + *
> + * SUBTEST: live@uncore
> + * Category: Selftest
> + * Description: Basic i915 driver module selftests
> + * Feature: forcewake
> + * Test category: forcewake
> + *
> + * SUBTEST: live@vma
> + * Category: Selftest
> + * Description: Per-object virtual address management
> + * Functionality: memory management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@win_blt_copy
> + * Category: Selftest
> + * Description: Validation of migration interface
> + * Functionality: migration interface
> + * Sub-category: i915 / HW
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: live@workarounds
> + * Category: Selftest
> + * Description: Check workarounds persist or are reapplied after resets and other power management events
> + * Functionality: workarounds
> + * Sub-category: HW
> + * Test category: GEM_Legacy
> + *
>   * SUBTEST: mock
>   * Feature: gem_core
>   * Run type: FULL
>   *
> + * SUBTEST: mock@buddy
> + * Category: Selftest
> + * Description: Buddy allocation
> + * Functionality: memory management
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@contexts
> + * Category: Selftest
> + * Description: GEM context internal API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@dmabuf
> + * Category: Selftest
> + * Description: dma-buf (buffer management) API checks
> + * Functionality: API checks
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@engine
> + * Category: Selftest
> + * Description: Engine topology API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@evict
> + * Category: Selftest
> + * Description: GTT eviction API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@fence
> + * Category: Selftest
> + * Description: semaphore API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@gtt
> + * Category: Selftest
> + * Description: Virtual address management API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@hugepages
> + * Category: Selftest
> + * Description: Hugepage API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@memory_region
> + * Category: Selftest
> + * Description: Memory region API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@objects
> + * Category: Selftest
> + * Description: Buffer object API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@phys
> + * Category: Selftest
> + * Description: legacy physical object API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@requests
> + * Category: Selftest
> + * Description: Internal command submission API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@ring
> + * Category: Selftest
> + * Description: Ringbuffer management API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@sanitycheck
> + * Category: Selftest
> + * Description: Selftest for the selftest
> + * Functionality: selftests
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@scatterlist
> + * Category: Selftest
> + * Description: Scatterlist API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@shmem
> + * Category: Selftest
> + * Description: SHM utils API checks
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@syncmap
> + * Category: Selftest
> + * Description: API checks for the contracted radixtree
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@timelines
> + * Category: Selftest
> + * Description: API checks for semaphore tracking
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: mock@tlb
> + * Category: Selftest
> + * Test category: Memory Management
> + *
> + * SUBTEST: mock@uncore
> + * Category: Selftest
> + * Description: Basic i915 driver module selftests
> + * Feature: forcewake
> + * Test category: forcewake
> + *
> + * SUBTEST: mock@vma
> + * Category: Selftest
> + * Description: API checks for virtual address management
> + * Functionality: API checks
> + * Sub-category: i915
> + * Test category: GEM_Legacy
> + *
>   * SUBTEST: perf
>   * Feature: oa
>   * Run type: FULL
> + *
> + * SUBTEST: perf@blt
> + * Category: Selftest
> + * Feature: i915 perf selftests
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
> + *
> + * SUBTEST: perf@engine_cs
> + * Category: Selftest
> + * Feature: i915 perf selftests
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
> + *
> + * SUBTEST: perf@region
> + * Category: Selftest
> + * Feature: i915 perf selftests
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
> + *
> + * SUBTEST: perf@request
> + * Category: Selftest
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
> + *
> + * SUBTEST: perf@scheduler
> + * Category: Selftest
> + * Functionality: Basic i915 module perf unit selftests
> + * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
> -- 
> 2.40.1
> 

