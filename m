Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670A710E1CB
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:14:35 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:14:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230906111430.2cf57b4f@maurocar-mobl2>
In-Reply-To: <20230906085628.59915-3-katarzyna.dec@intel.com>
References: <20230906085628.59915-1-katarzyna.dec@intel.com>
 <20230906085628.59915-3-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] test/xe: Clean up of test
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed,  6 Sep 2023 08:56:28 +0000
Katarzyna Dec <katarzyna.dec@intel.com> wrote:

> Change documentation fields:
>    xe_ccs.c - HW blitter test
>    xe_dma_buf_sync.c - functionality 'export'
>    xe_exercise_blt.c - HW blitter test
>    xe_intel_bb.c - IGT Lib test
>    xe_query.c - uapi ioctl test
> Shortenning description for xe_noexec_ping_pong.c.
> Add/Change 'Test category' and 'Run Type':
>    ../core_hotunplug.c
>    xe_ccs.c
>    xe_create.c
>    xe_debugfs.c
>    xe_dma_buf_sync.c
>    xe_evict.c
>    xe_exec_balancer.c
>    xe_exec_basic.c
>    xe_exec_compute_mode.c
>    xe_exec_fault_mode.c
>    xe_exercise_blt.c
>    xe_intel_bb.c
>    xe_media_fill.c
>    xe_mmap.c
>    xe_mmio.c
>    xe_noexec_ping_pong.c
>    xe_query.c
>    xe_spin_batch.c
>    xe_sysfs_scheduler.c
>    xe_sysfs_tile.c
>    xe_uevent.c
>    xe_vm.c
> 
> v2: s/Blitter/bliter/in xe_ccs & put xe_mmap to VMA subcategory
> 
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM. Yet, if/when we apply:
	https://patchwork.freedesktop.org/series/123290/

the changes needed due to different run types here won't be needed
anymore.

So, maybe we can drop updating Run Type here.

> ---
>  tests/core_hotunplug.c             |   1 +
>  tests/intel/xe_ccs.c               |   7 +-
>  tests/intel/xe_create.c            |   8 +-
>  tests/intel/xe_debugfs.c           |   2 +-
>  tests/intel/xe_dma_buf_sync.c      |   5 +-
>  tests/intel/xe_evict.c             | 154 +++++++++++++++++++++++------
>  tests/intel/xe_exec_balancer.c     |  11 +++
>  tests/intel/xe_exec_basic.c        |   7 +-
>  tests/intel/xe_exec_compute_mode.c |   5 +-
>  tests/intel/xe_exec_fault_mode.c   |   9 +-
>  tests/intel/xe_exercise_blt.c      |   6 +-
>  tests/intel/xe_intel_bb.c          |   2 +-
>  tests/intel/xe_media_fill.c        |   1 +
>  tests/intel/xe_mmap.c              |  10 +-
>  tests/intel/xe_mmio.c              |   3 +-
>  tests/intel/xe_noexec_ping_pong.c  |  25 +++--
>  tests/intel/xe_query.c             |  14 ++-
>  tests/intel/xe_spin_batch.c        |   2 +-
>  tests/intel/xe_sysfs_scheduler.c   |   4 +-
>  tests/intel/xe_vm.c                |  24 ++++-
>  20 files changed, 237 insertions(+), 63 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index b254447c7..be80d479f 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -43,6 +43,7 @@
>   * TEST: core hotunplug
>   * Description: Examine behavior of a driver on device hot unplug
>   * Feature: SMI, core
> + * Test category: functionality test
>   *
>   * SUBTEST: hotrebind
>   * Category: Software building block
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a3c6c46d1..e9e13ab5c 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -18,10 +18,11 @@
>  #include "xe/xe_util.h"
>  /**
>   * TEST: xe ccs
> - * Category: Software building block
> - * Sub-category: IGT Lib
> - * Functionality: blitter
> + * Category: Hardware building block
> + * Sub-category: blitter
> + * Functionality: flat_ccs
>   * Description: Exercise gen12 blitter with and without flatccs compression on Xe
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: block-copy-compressed
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 20e7a7da8..3e4bc1e3a 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -7,8 +7,6 @@
>   * TEST: Check bo create ioctl
>   * Category: Software building block
>   * Sub-category: uapi
> - * Functionality: device
> - * Test category: functionality test
>   * Run type: BAT
>   */
>  
> @@ -44,6 +42,8 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
>  
>  /**
>   * SUBTEST: create-invalid-size
> + * Functionality: ioctl
> + * Test category: negative test
>   * Description: Verifies xe bo create returns expected error code on invalid
>   *              buffer sizes.
>   */
> @@ -124,7 +124,9 @@ static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
>  
>  /**
>   * SUBTEST: create-execqueues-%s
> + * Functionality: exequeues creation time
>   * Description: Check process ability of multiple exec_queues creation
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -187,6 +189,8 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
>  
>  /**
>   * SUBTEST: create-massive-size
> + * Functionality: ioctl
> + * Test category: functionality test
>   * Description: Verifies xe bo create returns expected error code on massive
>   *              buffer sizes.
>   */
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 72c069bfc..1b8016450 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Check debugfs userspace API
>   * Category: Software building block
> - * Sub-category: debugfs
> + * Sub-category: uapi
>   * Functionality: debugfs
>   * Test category: functionality test
>   * Run type: BAT
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index 29d675154..8c400c8fd 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -7,7 +7,6 @@
>   * TEST: Check dmabuf functionality
>   * Category: Software building block
>   * Sub-category: dmabuf
> - * Functionality: dma_buf
>   * Test category: functionality test
>   */
>  
> @@ -72,18 +71,22 @@ static bool sync_file_busy(int sync_file)
>  /**
>   * SUBTEST: export-dma-buf-once
>   * Description: Test exporting a sync file from a dma-buf
> + * Functionality: export
>   * Run type: BAT
>   *
>   * SUBTEST: export-dma-buf-once-read-sync
>   * Description: Test export prime BO as sync file and verify business
> + * Functionality: export
>   * Run type: BAT
>   *
>   * SUBTEST: export-dma-buf-many
>   * Description: Test exporting many sync files from a dma-buf
> + * Functionality: export
>   * Run type: FULL
>   *
>   * SUBTEST: export-dma-buf-many-read-sync
>   * Description: Test export many prime BO as sync file and verify business
> + * Functionality: export
>   * Run type: FULL
>   */
>  
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index b8f186809..7a508fdd2 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -467,6 +467,7 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
>  /**
>   * SUBTEST: evict-%s
>   * Description:  %arg[1] evict test.
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -474,67 +475,160 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
>   * @small:			small
>   * @small-external:		small external
>   * @small-multi-vm:		small multi VM
> - * @large:			large
> - * @large-external:		large external
> - * @large-multi-vm:		large multi VM
>   * @beng-small:			small bind exec_queue
>   * @beng-small-external:	small external bind exec_queue
>   * @beng-small-multi-vm:	small multi VM bind ending
> + */
> +/**
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Test category: stress test
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @large:			large
> + * @large-external:		large external
> + * @large-multi-vm:		large multi VM
>   * @beng-large:			large bind exec_queue
>   * @beng-large-external:	large external bind exec_queue
>   * @beng-large-multi-vm:	large multi VM bind exec_queue
> + */
> +/**
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: compute machine
> + * Test category: functionality test
> + * Run type: FULL
> + *
> + * arg[1]:
>   *
>   * @small-cm:			small compute machine
>   * @small-external-cm:		small external compute machine
>   * @small-multi-vm-cm:		small multi VM compute machine
> - * @large-cm:			large compute machine
> - * @large-external-cm:		large external compute machine
> - * @large-multi-vm-cm:		large multi VM compute machine
>   * @beng-small-cm:		small bind exec_queue compute machine
>   * @beng-small-external-cm:	small external bind exec_queue compute machine
>   * @beng-small-multi-vm-cm:	small multi VM bind ending compute machine
> + */
> +/**
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: compute machine
> + * Test category: stress test
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @large-cm:			large compute machine
> + * @large-external-cm:		large external compute machine
> + * @large-multi-vm-cm:		large multi VM compute machine
>   * @beng-large-cm:		large bind exec_queue compute machine
>   * @beng-large-external-cm:	large external bind exec_queue compute machine
>   * @beng-large-multi-vm-cm:	large multi VM bind exec_queue compute machine
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: mixted threads
> + * Test category: functionality test
> + * Run type: FULL
> + *
> + * arg[1]:
>   *
> - * @threads-small:		threads small
> - * @cm-threads-small:		compute mode threads small
>   * @mixed-threads-small:	mixed threads small
>   * @mixed-many-threads-small:	mixed many threads small
> - * @threads-large:		threads large
> - * @cm-threads-large:		compute mode threads large
> - * @mixed-threads-large:	mixed threads large
> - * @mixed-many-threads-large:	mixed many threads large
> - * @threads-small-multi-vm:	threads small multi vm
> - * @cm-threads-small-multi-vm:	compute mode threads small multi vm
>   * @mixed-threads-small-multi-vm:
>   * 				mixed threads small multi vm
> - * @threads-large-multi-vm:	threads large multi vm
> - * @cm-threads-large-multi-vm:	compute mode threads large multi vm
> - * @mixed-threads-large-multi-vm:
> - *				mixed threads large multi vm
> - * @beng-threads-small:		bind exec_queue threads small
> - * @beng-cm-threads-small:	bind exec_queue compute mode threads small
>   * @beng-mixed-threads-small:	bind exec_queue mixed threads small
>   * @beng-mixed-many-threads-small:
>   *				bind exec_queue mixed many threads small
> - * @beng-threads-large:		bind exec_queue threads large
> - * @beng-cm-threads-large:	bind exec_queue compute mode threads large
> + * @beng-mixed-threads-small-multi-vm:
> + *				bind exec_queue mixed threads small multi vm
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: mixted threads
> + * Test category: stress test
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @beng-mixed-threads-large-multi-vm:
> + *				bind exec_queue mixed threads large multi vm
> + * @mixed-threads-large:	mixed threads large
> + * @mixed-many-threads-large:	mixed many threads large
> + * @mixed-threads-large-multi-vm:
> + *				mixed threads large multi vm
>   * @beng-mixed-threads-large:	bind exec_queue mixed threads large
>   * @beng-mixed-many-threads-large:
>   *				bind exec_queue mixed many threads large
> - * @beng-threads-small-multi-vm:
> - *				bind exec_queue threads small multi vm
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: compute mode threads
> + * Test category: functionality test
> + * Run type: FULL
> + *
> + * arg[1]:
> + * @cm-threads-small:		compute mode threads small
> + * @cm-threads-small-multi-vm:	compute mode threads small multi vm
> + * @beng-cm-threads-small:	bind exec_queue compute mode threads small
>   * @beng-cm-threads-small-multi-vm:
>   *				bind exec_queue compute mode threads small multi vm
> - * @beng-mixed-threads-small-multi-vm:
> - *				bind exec_queue mixed threads small multi vm
> - * @beng-threads-large-multi-vm:
> - *				bind exec_queue threads large multi vm
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: compute mode threads
> + * Test category: stress test
> + * Run type: FULL
> + *
> + * arg[1]:
> + * @cm-threads-large:		compute mode threads large
> + * @cm-threads-large-multi-vm:	compute mode threads large multi vm
> + * @beng-cm-threads-large:	bind exec_queue compute mode threads large
>   * @beng-cm-threads-large-multi-vm:
>   *				bind exec_queue compute mode threads large multi vm
> - * @beng-mixed-threads-large-multi-vm:
> - *				bind exec_queue mixed threads large multi vm
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: threads
> + * Test category: functionality test
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @threads-small:		threads small
> + * @beng-threads-small:		bind exec_queue threads small
> + * @threads-small-multi-vm:	threads small multi vm
> + * @beng-threads-small-multi-vm:
> + *				bind exec_queue threads small multi vm
> + *
> + */
> +/**
> + *
> + * SUBTEST: evict-%s
> + * Description:  %arg[1] evict test.
> + * Feature: threads
> + * Test category: stress test
> + * Run type: FULL
> + *
> + * arg[1]:
> + *
> + * @threads-large:		threads large
> + * @threads-large-multi-vm:	threads large multi vm
> + * @beng-threads-large-multi-vm:
> + *				bind exec_queue threads large multi vm
> + * @beng-threads-large:		bind exec_queue threads large
> + *
>   */
>  
>  /*
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index f364a4b7a..f571f13d9 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -30,6 +30,7 @@
>   * Description:
>   * 	Run a test to check if virtual exec_queues can be running on all instances
>   *	of a class simultaneously
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  static void test_all_active(int fd, int gt, int class)
> @@ -137,22 +138,27 @@ static void test_all_active(int fd, int gt, int class)
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] test only once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: many-%s
>   * Description: Run %arg[1] test many times
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: many-execqueues-%s
>   * Description: Run %arg[1] test on many exec_queues
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] test twice
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * SUBTEST: no-exec-%s
>   * Description: Run no-exec %arg[1] test
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * arg[1]:
> @@ -356,24 +362,29 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  /**
>   * SUBTEST: once-cm-%s
>   * Description: Run compute mode virtual exec_queue arg[1] test only once
> + * Test category: functionality test
>   *
>   * Run type: FULL
>   *
>   * SUBTEST: twice-cm-%s
>   * Description: Run compute mode virtual exec_queue arg[1] test twice
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * SUBTEST: many-cm-%s
>   * Description: Run compute mode virtual exec_queue arg[1] test many times
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: many-execqueues-cm-%s
>   * Description: Run compute mode virtual exec_queue arg[1] test on many exec_queues
> + * Test category: stress test
>   * Run type: FULL
>   *
>   *
>   * SUBTEST: no-exec-cm-%s
>   * Description: Run compute mode virtual exec_queue arg[1] no-exec test
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * arg[1]:
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 46b8709a7..d1d36e086 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -8,7 +8,6 @@
>   * Category: Hardware building block
>   * Sub-category: execbuf
>   * Functionality: exec_queues
> - * Test category: functionality test
>   */
>  
>  #include "igt.h"
> @@ -33,26 +32,32 @@
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] test only once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: many-%s
>   * Description: Run %arg[1] test many times
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: many-execqueues-%s
>   * Description: Run %arg[1] test on many exec_queues
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: many-execqueues-many-vm-%s
>   * Description: Run %arg[1] test on many exec_queues and many VMs
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] test twice
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * SUBTEST: no-exec-%s
>   * Description: Run no-exec %arg[1] test
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * arg[1]:
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 679b84fa1..38c904ddd 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -8,7 +8,6 @@
>   * Category: Hardware building block
>   * Sub-category: execbuf
>   * Functionality: compute machine
> - * Test category: functionality test
>   */
>  
>  #include <fcntl.h>
> @@ -34,14 +33,17 @@
>  /**
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] compute machine test twice
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] compute machine test only once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: many-%s
>   * Description: Run %arg[1] compute machine test many times
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -65,6 +67,7 @@
>   *
>   * SUBTEST: many-execqueues-%s
>   * Description: Run %arg[1] compute machine test on many exec_queues
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 85c010039..efd7ca2c2 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -8,7 +8,6 @@
>   * Category: Hardware building block
>   * Sub-category: execbuf
>   * Functionality: fault mode
> - * Test category: functionality test
>   * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FAULT_MODE
>   */
>  
> @@ -37,18 +36,22 @@
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] fault mode test twice
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: many-%s
>   * Description: Run %arg[1] fault mode test many times
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: many-execqueues-%s
>   * Description: Run %arg[1] fault mode test on many exec_queues
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -324,19 +327,23 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  /**
>   * SUBTEST: atomic-once
>   * Description: Run atomic fault mode test only once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: atomic-once-wait
>   * Description: Run atomic wait fault mode test once
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: atomic-many
>   * Description: Run atomic fault mode test many times
>   * Description: atomic many
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: atomic-many-wait
>   * Description: Run atomic wait fault mode test many times
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   */
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index 34522c0f8..2e2ec34dc 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -14,9 +14,9 @@
>  
>  /**
>   * TEST: xe exercise blt
> - * Category: Software building block
> - * Sub-category: IGT Lib
> - * Functionality: blitter
> + * Category: Hardware building block
> + * Sub-category: Blitter
> + * Functionality: flat_ccs
>   * Description: Exercise blitter commands on Xe
>   * Run type: FULL
>   * Test category: functionality test
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index a5531cf80..daab3496d 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -25,7 +25,7 @@
>  /**
>   * TEST: Basic tests for intel-bb xe functionality
>   * Category: Software building block
> - * Sub-category: xe
> + * Sub-category: IGT Lib
>   * Functionality: intel-bb
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
> index 4b2c235fa..84c721ba7 100644
> --- a/tests/intel/xe_media_fill.c
> +++ b/tests/intel/xe_media_fill.c
> @@ -33,6 +33,7 @@
>   * Description: Basic test for the media_fill() function,
>   *              a very simple workload for the Media pipeline.
>   * Feature: media
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: media-fill
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 8a70a5c35..1b759207b 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -6,9 +6,8 @@
>  /**
>   * TEST: Test if the driver is capable of doing mmap on different memory regions
>   * Category: Software building block
> - * Sub-category: mmap
> + * Sub-category: VMA
>   * Functionality: mmap
> - * Test category: functionality test
>   * Run type: BAT
>   */
>  
> @@ -24,6 +23,7 @@
>  
>  /**
>   * SUBTEST: system
> + * Test category: functionality test
>   * Description: Test mmap on system memory
>   */
>  
> @@ -31,12 +31,14 @@
>   * SUBTEST: small-bar
>   * Description: Sanity check mmap behaviour on small-bar systems
>   * GPU requirements: GPU needs to have dedicated VRAM and using small-bar
> + * Test category: functionality test
>   */
>  
>  /**
>   * SUBTEST: %s
>   * Description: Test mmap on %arg[1] memory
>   * GPU requirements: GPU needs to have dedicated VRAM
> + * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -64,6 +66,7 @@ test_mmap(int fd, uint32_t flags)
>  /**
>   * SUBTEST: bad-flags
>   * Description: Test mmap offset with bad flags.
> + * Test category: negative test
>   *
>   */
>  static void test_bad_flags(int fd)
> @@ -82,6 +85,7 @@ static void test_bad_flags(int fd)
>  /**
>   * SUBTEST: bad-extensions
>   * Description: Test mmap offset with bad extensions.
> + * Test category: negative test
>   *
>   */
>  static void test_bad_extensions(int fd)
> @@ -103,6 +107,7 @@ static void test_bad_extensions(int fd)
>  /**
>   * SUBTEST: bad-object
>   * Description: Test mmap offset with bad object.
> + * Test category: negative test
>   *
>   */
>  static void test_bad_object(int fd)
> @@ -144,6 +149,7 @@ static void trap_sigbus(uint32_t *ptr)
>  /**
>   * SUBTEST: small-bar
>   * Description: Test mmap behaviour on small-bar systems.
> + * Test category: functionality test
>   *
>   */
>  static void test_small_bar(int fd)
> diff --git a/tests/intel/xe_mmio.c b/tests/intel/xe_mmio.c
> index 02e79d7e4..4053faa56 100644
> --- a/tests/intel/xe_mmio.c
> +++ b/tests/intel/xe_mmio.c
> @@ -8,7 +8,6 @@
>   * Category: Software building block
>   * Sub-category: mmio
>   * Functionality: mmap
> - * Test category: functionality test
>   * Run type: BAT
>   */
>  
> @@ -24,6 +23,7 @@
>  
>  /**
>   * SUBTEST: mmio-timestamp
> + * Test category: functionality test
>   * Description:
>   *	Try to run mmio ioctl with 32 and 64 bits and check it a timestamp
>   *	matches
> @@ -51,6 +51,7 @@ static void test_xe_mmio_timestamp(int fd)
>  
>  /**
>   * SUBTEST: mmio-invalid
> + * Test category: negative test
>   * Description: Try to run mmio ioctl with 8, 16 and 32 and 64 bits mmio
>   */
>  
> diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
> index cc61a77c1..a238f9d34 100644
> --- a/tests/intel/xe_noexec_ping_pong.c
> +++ b/tests/intel/xe_noexec_ping_pong.c
> @@ -25,18 +25,25 @@
>   * SUBTEST:
>   * Description:
>   *	This test creates compute vms, binds a couple of bos and an exec_queue each,
> - *	thus redying it for execution. However, VRAM memory is over-
> - *	committed and while there is still nothing to execute, an eviction
> - *	will trigger the VM's rebind worker to rebind the evicted bo, which
> - *	will in turn trigger another eviction and so on.
> + *	thus redying it for execution.
>   *
> - *	Since we don't have eviction stats yet we need to watch "top" for
> - *	the rebind kworkers using a lot of CPU while the test idles.
> - *
> - *	The correct driver behaviour should be not to rebind anything unless
> - *	there is worked queued on one of the VM's compute exec_queues.
>   * Run type: FULL
>   */
> + /*
> +  * More dailed test description:
> +  *	This test creates compute vms, binds a couple of bos and an exec_queue each,
> +  *	thus redying it for execution. However, VRAM memory is over-
> +  *	committed and while there is still nothing to execute, an eviction
> +  *	will trigger the VM's rebind worker to rebind the evicted bo, which
> +  *	will in turn trigger another eviction and so on.
> +  *
> +  *	Since we don't have eviction stats yet we need to watch "top" for
> +  *	the rebind kworkers using a lot of CPU while the test idles.
> +  *
> +  *	The correct driver behaviour should be not to rebind anything unless
> +  *	there is worked queued on one of the VM's compute exec_queues.
> + */
> +
>  static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
>  {
>  	size_t vram_size = xe_vram_size(fd, 0);
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index a4e40afdd..8ec849130 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -6,9 +6,8 @@
>  /**
>   * TEST: Check device configuration query
>   * Category: Software building block
> - * Sub-category: ioctl
> - * Functionality: device
> - * Test category: functionality test
> + * Sub-category: uapi
> + * Functionality: ioctl
>   * Run type: BAT
>   * Description: Acquire configuration data for xe device
>   */
> @@ -175,6 +174,7 @@ const char *get_topo_name(int value)
>  /**
>   * SUBTEST: query-engines
>   * Description: Display engine classes available for xe device
> + * Test category: functionality test
>   */
>  static void
>  test_query_engines(int fd)
> @@ -194,6 +194,7 @@ test_query_engines(int fd)
>  
>  /**
>   * SUBTEST: query-mem-usage
> + * Test category: functionality test
>   * Description: Display memory information like memory class, size
>   *	and alignment.
>   */
> @@ -254,6 +255,7 @@ test_query_mem_usage(int fd)
>  
>  /**
>   * SUBTEST: query-gts
> + * Test category: functionality test
>   * Description: Display information about available GTs for xe device.
>   */
>  static void
> @@ -293,6 +295,7 @@ test_query_gts(int fd)
>  
>  /**
>   * SUBTEST: query-topology
> + * Test category: functionality test
>   * Description: Display topology information of GTs.
>   */
>  static void
> @@ -336,6 +339,7 @@ test_query_gt_topology(int fd)
>  
>  /**
>   * SUBTEST: query-config
> + * Test category: functionality test
>   * Description: Display xe device id, revision and configuration.
>   */
>  static void
> @@ -386,6 +390,7 @@ test_query_config(int fd)
>  
>  /**
>   * SUBTEST: query-hwconfig
> + * Test category: functionality test
>   * Description: Display hardware configuration of xe device.
>   */
>  static void
> @@ -419,6 +424,7 @@ test_query_hwconfig(int fd)
>  
>  /**
>   * SUBTEST: query-invalid-query
> + * Test category: negative test
>   * Description: Check query with invalid arguments returns expected error code.
>   */
>  static void
> @@ -436,6 +442,7 @@ test_query_invalid_query(int fd)
>  
>  /**
>   * SUBTEST: query-invalid-size
> + * Test category: negative test
>   * Description: Check query with invalid size returns expected error code.
>   */
>  static void
> @@ -453,6 +460,7 @@ test_query_invalid_size(int fd)
>  
>  /**
>   * SUBTEST: query-invalid-extension
> + * Test category: negative test
>   * Description: Check query with invalid extension returns expected error code.
>   */
>  static void
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 26f9daf36..9bd3dc349 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -8,7 +8,7 @@
>   * TEST: Tests for spin batch submissons.
>   * Category: Software building block
>   * Sub-category: spin
> - * Functionality: intel-bb
> + * Functionality: parallel execution
>   * Test category: functionality test
>   */
>  
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index ec2190113..866b9d50a 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -8,17 +8,19 @@
>   * Category: Software building block
>   * Sub-category: sysman
>   * Functionality: scheduler control interface
> - * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: %s-invalid
>   * Description: Test to check if %s arg[1] schedule parameter rejects any unrepresentable intervals.
> + * Test category: negative test
>   *
>   * SUBTEST: %s-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
> + * Test category: functionality test
>   *
>   * SUBTEST: %s-nonprivileged-user
>   * Description: Test %s arg[1] schedule parameter for nonprivileged user.
> + * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index e48715aed..5453f10c4 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -7,7 +7,6 @@
>   * TEST: Check if VMA functionality is working
>   * Category: Software building block
>   * Sub-category: VMA
> - * Test category: functionality test
>   */
>  
>  #include "igt.h"
> @@ -84,6 +83,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
>   * SUBTEST: scratch
>   * Description: Test scratch page creation and write
>   * Functionality: scratch page
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  
> @@ -206,6 +206,7 @@ uint64_t addrs_57b[] = {
>   * SUBTEST: bind-once
>   * Description: bind once on one BO
>   * Functionality: bind BO
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  
> @@ -223,6 +224,7 @@ test_bind_once(int fd)
>   * SUBTEST: bind-one-bo-many-times
>   * Description: bind many times on one BO
>   * Functionality: bind BO
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  
> @@ -243,6 +245,7 @@ test_bind_one_bo_many_times(int fd)
>   * SUBTEST: bind-one-bo-many-times-many-vm
>   * Description: Test bind many times and many VM on one BO
>   * Functionality: bind BO
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  
> @@ -261,6 +264,7 @@ test_bind_one_bo_many_times_many_vm(int fd)
>   * SUBTEST: unbind-all-%d-vmas
>   * Description: Test unbind all with %arg[1] VMAs
>   * Functionality: unbind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1].values: 2, 8
> @@ -301,6 +305,7 @@ static void unbind_all(int fd, int n_vmas)
>   *	Verifies that mapping an invalid userptr returns -EFAULT,
>   *	and that it is correctly handled.
>   * Functionality: userptr
> + * Test category: negative test
>   * Run type: FULL
>   */
>  static void userptr_invalid(int fd)
> @@ -337,11 +342,13 @@ struct vm_thread_data {
>   * SUBTEST: vm-async-ops-err
>   * Description: Test VM async ops error
>   * Functionality: VM
> + * Test category: negative test
>   * Run type: FULL
>   *
>   * SUBTEST: vm-async-ops-err-destroy
>   * Description: Test VM async ops error destroy
>   * Functionality: VM
> + * Test category: negative test
>   * Run type: FULL
>   */
>  
> @@ -502,6 +509,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  /**
>   * SUBTEST: shared-%s-page
>   * Description: Test shared arg[1] page
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * Functionality: %arg[1] page
> @@ -690,11 +698,13 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   * SUBTEST: bind-execqueues-independent
>   * Description: Test independent bind exec_queues
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: BAT
>   *
>   * SUBTEST: bind-execqueues-conflict
>   * Description: Test conflict bind exec_queues
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: BAT
>   */
>  
> @@ -864,21 +874,25 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>   * SUBTEST: bind-array-twice
>   * Description: Test bind array twice
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: bind-array-many
>   * Description: Test bind array many times
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: bind-array-exec_queue-twice
>   * Description: Test bind array exec_queue twice
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: bind-array-exec_queue-many
>   * Description: Test bind array exec_queue many times
>   * Functionality: bind exec_queues
> + * Test category: functionality test
>   * Run type: FULL
>   */
>  static void
> @@ -1005,6 +1019,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   * SUBTEST: %s-%ld
>   * Description: Test %arg[1] with %arg[2] bind size
>   * Functionality: bind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -1023,6 +1038,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   * SUBTEST: %s-%ld
>   * Description: Test %arg[1] with %arg[2] bind size
>   * Functionality: userptr bind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -1042,6 +1058,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   * SUBTEST: %s-%ld
>   * Description: Test %arg[1] with %arg[2] bind size
>   * Functionality: mixed bind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -1057,6 +1074,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   * SUBTEST: %s-%ld
>   * Description: Test %arg[1] with %arg[2] bind size
>   * Functionality: mixed bind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -1298,6 +1316,7 @@ static void *hammer_thread(void *tdata)
>   * SUBTEST: munmap-style-unbind-%s
>   * Description: Test munmap style unbind with %arg[1]
>   * Functionality: unbind
> + * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -1316,6 +1335,7 @@ static void *hammer_thread(void *tdata)
>   * SUBTEST: munmap-style-unbind-%s
>   * Description: Test munmap style unbind with %arg[1]
>   * Functionality: unbind
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * arg[1]:
> @@ -1629,8 +1649,8 @@ try_again_after_invalidate:
>   * SUBTEST: mmap-style-bind-%s
>   * Description: Test mmap style unbind with %arg[1]
>   * Functionality: bind
> + * Test category: functionality test
>   * Run type: FULL
> - * TODO: change ``'Run type' == FULL`` to a better category
>   *
>   * arg[1]:
>   *
