Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D5910E981
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:24:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:23 +0100
Message-Id: <20230310082326.12088-16-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 15/18] xe/xe_*: add TEST/SUBTEST
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Document this IGT test, by looking on IGT BAT testlist and on
on its internal logic. Only some tests here are part of the
Basic Acceptance Test (BAT) group.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/xe/xe_debugfs.c           |  53 ++++---
 tests/xe/xe_evict.c             |  82 +++++++++++
 tests/xe/xe_exec_balancer.c     |   7 +-
 tests/xe/xe_exec_compute_mode.c |   2 +
 tests/xe/xe_exec_reset.c        | 134 ++++++++++++++++++
 tests/xe/xe_exec_threads.c      | 242 ++++++++++++++++++++++++++++++++
 tests/xe/xe_guc_pc.c            |  74 ++++++++++
 tests/xe/xe_mmap.c              |  10 +-
 tests/xe/xe_pm.c                |  61 ++++++++
 tests/xe/xe_prime_self_import.c |  65 ++++++++-
 tests/xe/xe_query.c             |   2 +-
 tests/xe/xe_vm.c                | 199 ++++++++++++++++++++++++++
 12 files changed, 903 insertions(+), 28 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 60a02cc170..38c8beccc5 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -23,6 +23,10 @@
 #include <sys/types.h>
 #include <dirent.h>
 
+struct {
+	bool warn_on_not_hit;
+} opt = { 0 };
+
 static int validate_entries(int fd, const char *add_path, const char * const str_val[], int str_cnt)
 {
 	int i;
@@ -53,7 +57,7 @@ static int validate_entries(int fd, const char *add_path, const char * const str
 		}
 		if (hit) {
 			found++;
-		} else {
+		} else if (opt.warn_on_not_hit) {
 			not_found++;
 			igt_warn("no test for: %s/%s\n", path, de->d_name);
 		}
@@ -146,14 +150,9 @@ test_base(int fd)
 }
 
 /**
- * SUBTEST: %s
- * Description: Check %arg[1] debugfs devnodes
+ * SUBTEST: gt
+ * Description: Check all gt debugfs devnodes
  * TODO: add support for ``force_reset`` entries
- *
- * arg[1]:
- *
- * @gt0: gt0
- * @gt1: gt1
  */
 static void
 test_gt(int fd, int gt_id)
@@ -222,9 +221,32 @@ test_forcewake(int fd)
 	close(handle);
 }
 
-igt_main
+const char *help_str =
+	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
+
+struct option long_options[] = {
+	{ "--warn-not-hit", no_argument, NULL, 'w'},
+	{ 0, 0, 0, 0 }
+};
+
+static int opt_handler(int option, int option_index, void *input)
 {
+	switch (option) {
+	case 'w':
+		opt.warn_on_not_hit = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+igt_main_args("", long_options, help_str, opt_handler, NULL)
+{
+	char devnode[PATH_MAX];
 	int fd;
+	int gt;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -236,14 +258,13 @@ igt_main
 		test_base(fd);
 	}
 
-	igt_subtest("gt0") {
-		igt_require(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-		test_gt(fd, 0);
-	}
 
-	igt_subtest("gt1") {
-		igt_require(igt_debugfs_exists(fd, "gt1", O_RDONLY));
-		test_gt(fd, 1);
+	igt_subtest("gt") {
+		for_each_gt(fd, gt) {
+			snprintf(devnode, sizeof(devnode), "gt%d", gt);
+			igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
+			test_gt(fd, gt);
+		}
 	}
 
 	igt_subtest("forcewake") {
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 6741b07365..edd4b6d2e6 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -3,6 +3,14 @@
  * Copyright © 2021 Intel Corporation
  */
 
+/**
+ * TEST: Check VMA eviction
+ * Category: Software building block
+ * Sub-category: VMA
+ * Functionality: evict
+ * GPU requirements: GPU needs to have dedicated VRAM
+ */
+
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -450,6 +458,80 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 	return (ALIGN(vram_size, 0x40000000)  * mul) / div;
 }
 
+/**
+ * SUBTEST: evict-%s
+ * Description:  %arg[1] evict test.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @small:			small
+ * @small-external:		small external
+ * @small-multi-vm:		small multi VM
+ * @large:			large
+ * @large-external:		large external
+ * @large-multi-vm:		large multi VM
+ * @beng-small:			small bind engine
+ * @beng-small-external:	small external bind engine
+ * @beng-small-multi-vm:	small multi VM bind ending
+ * @beng-large:			large bind engine
+ * @beng-large-external:	large external bind engine
+ * @beng-large-multi-vm:	large multi VM bind engine
+ *
+ * @small-cm:			small compute machine
+ * @small-external-cm:		small external compute machine
+ * @small-multi-vm-cm:		small multi VM compute machine
+ * @large-cm:			large compute machine
+ * @large-external-cm:		large external compute machine
+ * @large-multi-vm-cm:		large multi VM compute machine
+ * @beng-small-cm:		small bind engine compute machine
+ * @beng-small-external-cm:	small external bind engine compute machine
+ * @beng-small-multi-vm-cm:	small multi VM bind ending compute machine
+ * @beng-large-cm:		large bind engine compute machine
+ * @beng-large-external-cm:	large external bind engine compute machine
+ * @beng-large-multi-vm-cm:	large multi VM bind engine compute machine
+ *
+ * @threads-small:		threads small
+ * @cm-threads-small:		compute mode threads small
+ * @mixed-threads-small:	mixed threads small
+ * @mixed-many-threads-small:	mixed many threads small
+ * @threads-large:		threads large
+ * @cm-threads-large:		compute mode threads large
+ * @mixed-threads-large:	mixed threads large
+ * @mixed-many-threads-large:	mixed many threads large
+ * @threads-small-multi-vm:	threads small multi vm
+ * @cm-threads-small-multi-vm:	compute mode threads small multi vm
+ * @mixed-threads-small-multi-vm:
+ * 				mixed threads small multi vm
+ * @threads-large-multi-vm:	threads large multi vm
+ * @cm-threads-large-multi-vm:	compute mode threads large multi vm
+ * @mixed-threads-large-multi-vm:
+ *				mixed threads large multi vm
+ * @beng-threads-small:		bind engine threads small
+ * @beng-cm-threads-small:	bind engine compute mode threads small
+ * @beng-mixed-threads-small:	bind engine mixed threads small
+ * @beng-mixed-many-threads-small:
+ *				bind engine mixed many threads small
+ * @beng-threads-large:		bind engine threads large
+ * @beng-cm-threads-large:	bind engine compute mode threads large
+ * @beng-mixed-threads-large:	bind engine mixed threads large
+ * @beng-mixed-many-threads-large:
+ *				bind engine mixed many threads large
+ * @beng-threads-small-multi-vm:
+ *				bind engine threads small multi vm
+ * @beng-cm-threads-small-multi-vm:
+ *				bind engine compute mode threads small multi vm
+ * @beng-mixed-threads-small-multi-vm:
+ *				bind engine mixed threads small multi vm
+ * @beng-threads-large-multi-vm:
+ *				bind engine threads large multi vm
+ * @beng-cm-threads-large-multi-vm:
+ *				bind engine compute mode threads large multi vm
+ * @beng-mixed-threads-large-multi-vm:
+ *				bind engine mixed threads large multi vm
+ */
+
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
  * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 809dcebb1d..a247b1d268 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -366,8 +366,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
  *
  * SUBTEST: twice-cm-%s
  * Description: Run compute mode virtual engine arg[1] test twice
- * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
+ * Run type: BAT
  *
  * SUBTEST: many-cm-%s
  * Description: Run compute mode virtual engine arg[1] test many times
@@ -379,10 +378,10 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
+ *
  * SUBTEST: no-exec-cm-%s
  * Description: Run compute mode virtual engine arg[1] no-exec test
- * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
+ * Run type: BAT
  *
  * arg[1]:
  *
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index d0cd0e57f8..e65767ae4f 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -67,6 +67,8 @@
  *
  * SUBTEST: many-engines-%s
  * Description: Run %arg[1] compute machine test on many engines
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category*
  *
  * arg[1]:
  *
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index a5bde252e8..106fe941c1 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -3,6 +3,14 @@
  * Copyright © 2021 Intel Corporation
  */
 
+/**
+ * TEST: Basic tests for execbuf functionality for virtual and parallel engines
+ * Category: Hardware building block
+ * Sub-category: execbuf
+ * Functionality: reset
+ * Test category: functionality test
+ */
+
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -13,6 +21,12 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
+/**
+ * SUBTEST: spin
+ * Description: test spin
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
 static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	uint32_t vm;
@@ -88,6 +102,52 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 #define PARALLEL	(0x1 << 6)
 #define CAT_ERROR	(0x1 << 7)
 
+/**
+ * SUBTEST: %s-cancel
+ * Description: Test %arg[1] cancel
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: %s-engine-reset
+ * Description: Test %arg[1] engine reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: %s-cat-error
+ * Description: Test %arg[1] cat error
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: %s-gt-reset
+ * Description: Test %arg[1] GT reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: virtual-close-fd-no-exec
+ * Description: Test virtual close fd no-exec
+ * Run type: BAT
+ *
+ * SUBTEST: parallel-close-fd-no-exec
+ * Description: Test parallel close fd no-exec
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: %s-close-fd
+ * Description: Test %arg[1] close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: %s-close-engines-close-fd
+ * Description: Test %arg[1] close engines close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @virtual:	virtual
+ * @parallel:	parallel
+ */
+
 static void
 test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	      unsigned int flags)
@@ -263,6 +323,42 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: cancel
+ * Description: Test cancel
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: engine-reset
+ * Description: Test engine reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: cat-error
+ * Description: Test cat error
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: gt-reset
+ * Description: Test GT reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: close-fd-no-exec
+ * Description: Test close fd no-exec
+ * Run type: BAT
+ *
+ * SUBTEST: close-fd
+ * Description: Test close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: close-engines-close-fd
+ * Description: Test close engines close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void
 test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		 int n_engines, int n_execs, unsigned int flags)
@@ -408,6 +504,37 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: cm-engine-reset
+ * Description: Test compute mode engine reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: cm-cat-error
+ * Description: Test compute mode cat-error
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: cm-gt-reset
+ * Description: Test compute mode GT reset
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: cm-close-fd-no-exec
+ * Description: Test compute mode close fd no-exec
+ * Run type: BAT
+ *
+ * SUBTEST: cm-close-fd
+ * Description: Test compute mode close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: cm-close-engines-close-fd
+ * Description: Test compute mode close engines close fd
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void
 test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		  int n_engines, int n_execs, unsigned int flags)
@@ -638,6 +765,13 @@ static void *gt_reset_thread(void *data)
 	return NULL;
 }
 
+/**
+ * SUBTEST: gt-reset-stress
+ * Description: Stress GT reset
+ * Test category: stress test
+ * Run type: stress
+ *
+ */
 static void
 gt_reset(int fd, int n_threads, int n_sec)
 {
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 9601e1a2dc..69055a829b 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -3,6 +3,14 @@
  * Copyright © 2021 Intel Corporation
  */
 
+/**
+ * TEST: Basic tests for execbuf functionality
+ * Category: Hardware building block
+ * Sub-category: execbuf
+ * Functionality: multi-threads
+ * Test category: functionality test
+ */
+
 #include <fcntl.h>
 
 #include "igt.h"
@@ -779,6 +787,240 @@ static void *vm_async_ops_err_thread(void *data)
 	return NULL;
 }
 
+/**
+ * SUBTEST: threads-%s
+ * Description: Run threads %arg[1] test with multi threads
+ * Run type: BAT
+ *
+ * arg[1]:
+ *
+ * @shared-vm-basic:		shared vm basic
+ * @fd-basic:			fd basic
+ * @bal-basic:			bal basic
+ * @cm-basic:			cm basic
+ * @cm-fd-basic:		cm fd basic
+ * @mixed-basic:		mixed basic
+ * @mixed-shared-vm-basic:	mixed shared vm basic
+ * @mixed-fd-basic:		mixed fd basic
+ * @bal-mixed-basic:		bal mixed basic
+ * @bal-mixed-shared-vm-basic:	bal mixed shared vm basic
+ * @bal-mixed-fd-basic:		bal mixed fd basic
+ */
+
+/**
+ * SUBTEST: threads-%s
+ * Description: Run threads %arg[1] test with multi threads
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ * arg[1]:
+ * @basic:
+ *	basic
+ * @userptr:
+ *	userptr
+ * @rebind:
+ *	rebind
+ * @rebind-bindengine:
+ *	rebind bindengine
+ * @userptr-rebind:
+ *	userptr rebind
+ * @userptr-invalidate:
+ *	userptr invalidate
+ * @userptr-invalidate-race:
+ *	userptr invalidate race
+ * @shared-vm-userptr:
+ *	shared vm userptr
+ * @shared-vm-rebind:
+ *	shared vm rebind
+ * @shared-vm-rebind-bindengine:
+ *	shared vm rebind bindengine
+ * @shared-vm-userptr-rebind:
+ *	shared vm userptr rebind
+ * @shared-vm-rebind-err:
+ *	shared vm rebind err
+ * @shared-vm-userptr-rebind-err:
+ *	shared vm userptr rebind err
+ * @shared-vm-userptr-invalidate:
+ *	shared vm userptr invalidate
+ * @shared-vm-userptr-invalidate-race:
+ *	shared vm userptr invalidate race
+ * @fd-userptr:
+ *	fd userptr
+ * @fd-rebind:
+ *	fd rebind
+ * @fd-userptr-rebind:
+ *	fd userptr rebind
+ * @fd-userptr-invalidate:
+ *	fd userptr invalidate
+ * @fd-userptr-invalidate-race:
+ *	fd userptr invalidate race
+ * @hang-basic:
+ *	hang basic
+  * @hang-userptr:
+ *	hang userptr
+ * @hang-rebind:
+ *	hang rebind
+ * @hang-userptr-rebind:
+ *	hang userptr rebind
+ * @hang-userptr-invalidate:
+ *	hang userptr invalidate
+ * @hang-userptr-invalidate-race:
+ *	hang userptr invalidate race
+ * @hang-shared-vm-basic:
+ *	hang shared vm basic
+ * @hang-shared-vm-userptr:
+ *	hang shared vm userptr
+ * @hang-shared-vm-rebind:
+ *	hang shared vm rebind
+ * @hang-shared-vm-userptr-rebind:
+ *	hang shared vm userptr rebind
+ * @hang-shared-vm-rebind-err:
+ *	hang shared vm rebind err
+ * @hang-shared-vm-userptr-rebind-err:
+ *	hang shared vm userptr rebind err
+ * @hang-shared-vm-userptr-invalidate:
+ *	hang shared vm userptr invalidate
+ * @hang-shared-vm-userptr-invalidate-race:
+ *	hang shared vm userptr invalidate race
+ * @hang-fd-basic:
+ *	hang fd basic
+ * @hang-fd-userptr:
+ *	hang fd userptr
+ * @hang-fd-rebind:
+ *	hang fd rebind
+ * @hang-fd-userptr-rebind:
+ *	hang fd userptr rebind
+ * @hang-fd-userptr-invalidate:
+ *	hang fd userptr invalidate
+ * @hang-fd-userptr-invalidate-race:
+ *	hang fd userptr invalidate race
+ * @bal-userptr:
+ *	balancer userptr
+ * @bal-rebind:
+ *	balancer rebind
+ * @bal-userptr-rebind:
+ *	balancer userptr rebind
+ * @bal-userptr-invalidate:
+ *	balancer userptr invalidate
+ * @bal-userptr-invalidate-race:
+ *	balancer userptr invalidate race
+ * @bal-shared-vm-basic:
+ *	balancer shared vm basic
+ * @bal-shared-vm-userptr:
+ *	balancer shared vm userptr
+ * @bal-shared-vm-rebind:
+ *	balancer shared vm rebind
+ * @bal-shared-vm-userptr-rebind:
+ *	balancer shared vm userptr rebind
+ * @bal-shared-vm-userptr-invalidate:
+ *	balancer shared vm userptr invalidate
+ * @bal-shared-vm-userptr-invalidate-race:
+ *	balancer shared vm userptr invalidate race
+ * @bal-fd-basic:
+ *	balancer fd basic
+ * @bal-fd-userptr:
+ *	balancer fd userptr
+ * @bal-fd-rebind:
+ *	balancer fd rebind
+ * @bal-fd-userptr-rebind:
+ *	balancer fd userptr rebind
+ * @bal-fd-userptr-invalidate:
+ *	balancer fd userptr invalidate
+ * @bal-fd-userptr-invalidate-race:
+ *	balancer fd userptr invalidate race
+ * @cm-userptr:
+ *	compute mode userptr
+ * @cm-rebind:
+ *	compute mode rebind
+ * @cm-userptr-rebind:
+ *	compute mode userptr rebind
+ * @cm-userptr-invalidate:
+ *	compute mode userptr invalidate
+ * @cm-userptr-invalidate-race:
+ *	compute mode userptr invalidate race
+ * @cm-shared-vm-basic:
+ *	compute mode shared vm basic
+ * @cm-shared-vm-userptr:
+ *	compute mode shared vm userptr
+ * @cm-shared-vm-rebind:
+ *	compute mode shared vm rebind
+ * @cm-shared-vm-userptr-rebind:
+ *	compute mode shared vm userptr rebind
+ * @cm-shared-vm-userptr-invalidate:
+ *	compute mode shared vm userptr invalidate
+ * @cm-shared-vm-userptr-invalidate-race:
+ *	compute mode shared vm userptr invalidate race
+ * @cm-fd-userptr:
+ *	compute mode fd userptr
+ * @cm-fd-rebind:
+ *	compute mode fd rebind
+ * @cm-fd-userptr-rebind:
+ *	compute mode fd userptr rebind
+ * @cm-fd-userptr-invalidate:
+ *	compute mode fd userptr invalidate
+ * @cm-fd-userptr-invalidate-race:
+ *	compute mode fd userptr invalidate race
+ * @mixed-userptr:
+ *	mixed userptr
+ * @mixed-rebind:
+ *	mixed rebind
+ * @mixed-userptr-rebind:
+ *	mixed userptr rebind
+ * @mixed-userptr-invalidate:
+ *	mixed userptr invalidate
+ * @mixed-userptr-invalidate-race:
+ *	mixed userptr invalidate race
+ * @mixed-shared-vm-userptr:
+ *	mixed shared vm userptr
+ * @mixed-shared-vm-rebind:
+ *	mixed shared vm rebind
+ * @mixed-shared-vm-userptr-rebind:
+ *	mixed shared vm userptr rebind
+ * @mixed-shared-vm-userptr-invalidate:
+ *	mixed shared vm userptr invalidate
+ * @mixed-shared-vm-userptr-invalidate-race:
+ *	mixed shared vm userptr invalidate race
+ * @mixed-fd-userptr:
+ *	mixed fd userptr
+ * @mixed-fd-rebind:
+ *	mixed fd rebind
+ * @mixed-fd-userptr-rebind:
+ *	mixed fd userptr rebind
+ * @mixed-fd-userptr-invalidate:
+ *	mixed fd userptr invalidate
+ * @mixed-fd-userptr-invalidate-race:
+ *	mixed fd userptr invalidate race
+ * @bal-mixed-userptr:
+ *	balancer mixed userptr
+ * @bal-mixed-rebind:
+ *	balancer mixed rebind
+ * @bal-mixed-userptr-rebind:
+ *	balancer mixed userptr rebind
+ * @bal-mixed-userptr-invalidate:
+ *	balancer mixed userptr invalidate
+ * @bal-mixed-userptr-invalidate-race:
+ *	balancer mixed userptr invalidate race
+ * @bal-mixed-shared-vm-userptr:
+ *	balancer mixed shared vm userptr
+ * @bal-mixed-shared-vm-rebind:
+ *	balancer mixed shared vm rebind
+ * @bal-mixed-shared-vm-userptr-rebind:
+ *	balancer mixed shared vm userptr rebind
+ * @bal-mixed-shared-vm-userptr-invalidate:
+ *	balancer mixed shared vm userptr invalidate
+ * @bal-mixed-shared-vm-userptr-invalidate-race:
+ *	balancer mixed shared vm userptr invalidate race
+ * @bal-mixed-fd-userptr:
+ *	balancer mixed fd userptr
+ * @bal-mixed-fd-rebind:
+ *	balancer mixed fd rebind
+ * @bal-mixed-fd-userptr-rebind:
+ *	balancer mixed fd userptr rebind
+ * @bal-mixed-fd-userptr-invalidate:
+ *	balancer mixed fd userptr invalidate
+ * @bal-mixed-fd-userptr-invalidate-race:
+ *	balancer mixed fd userptr invalidate race
+ */
+
 static void threads(int fd, int flags)
 {
 	struct thread_data *threads_data;
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 3ed6d36ff0..3f520d7bf4 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -3,6 +3,14 @@
  * Copyright © 2022 Intel Corporation
  */
 
+/**
+ * TEST: Test GuC frequency request functionality
+ * Category: Firmware building block
+ * Sub-category: GuC
+ * Functionality: frequency request
+ * Test category: functionality test
+ */
+
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "igt_sysfs.h"
@@ -147,6 +155,13 @@ static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
 	return freq;
 }
 
+
+/**
+ * SUBTEST: freq_basic_api
+ * Description: Test basic get and set frequency API
+ * Run type: BAT
+ */
+
 static void test_freq_basic_api(int sysfs, int gt_id)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -180,6 +195,17 @@ static void test_freq_basic_api(int sysfs, int gt_id)
 	igt_assert(get_freq(sysfs, gt_id, "max") == rp0);
 }
 
+/**
+ * SUBTEST: freq_fixed_idle
+ * Description: Test fixed frequency request with engine in idle state
+ * Run type: BAT
+ *
+ * SUBTEST: freq_fixed_exec
+ * Description: Test fixed frequency request when engine is doing some work
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_freq_fixed(int sysfs, int gt_id)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -218,6 +244,17 @@ static void test_freq_fixed(int sysfs, int gt_id)
 	igt_debug("Finished testing fixed request\n");
 }
 
+/**
+ * SUBTEST: freq_range_idle
+ * Description: Test range frequency request with engine in idle state
+ * Run type: BAT
+ *
+ * SUBTEST: freq_range_exec
+ * Description: Test range frequency request when engine is doing some work
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_freq_range(int sysfs, int gt_id)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -237,6 +274,13 @@ static void test_freq_range(int sysfs, int gt_id)
 	igt_debug("Finished testing range request\n");
 }
 
+/**
+ * SUBTEST: freq_low_max
+ * Description: Test frequency request to minimal and maximum values
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_freq_low_max(int sysfs, int gt_id)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -253,6 +297,13 @@ static void test_freq_low_max(int sysfs, int gt_id)
 	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
 }
 
+/**
+ * SUBTEST: freq_suspend
+ * Description: Check frequency after returning from suspend
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_suspend(int sysfs, int gt_id)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -269,6 +320,18 @@ static void test_suspend(int sysfs, int gt_id)
 	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
 }
 
+/**
+ * SUBTEST: freq_reset
+ * Description: test frequency reset only once
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: freq_reset_multiple
+ * Description: test frequency reset multiple times
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_reset(int fd, int sysfs, int gt_id, int cycles)
 {
 	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
@@ -291,6 +354,17 @@ static void test_reset(int fd, int sysfs, int gt_id, int cycles)
 	}
 }
 
+
+/**
+ * SUBTEST: rc6_on_idle
+ * Description: check if GPU is in RC6 on idle
+ * Run type: BAT
+ *
+ * SUBTEST: rc0_on_exec
+ * Description: check if GPU is in RC0 on when doing some work
+ * Run type: BAT
+ */
+
 static bool in_rc6(int sysfs, int gt_id)
 {
 	char path[32];
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index f2d73fd1ac..9dce6adbe2 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -20,17 +20,21 @@
 #include <string.h>
 
 
+/**
+ * SUBTEST: system
+ * Description: Test mmap on system memory
+ */
+
 /**
  * SUBTEST: %s
- * Description: Test mmap on %s memory
+ * Description: Test mmap on %arg[1] memory
+ * GPU requirements: GPU needs to have dedicated VRAM
  *
  * arg[1]:
  *
- * @system:		system
  * @vram:		vram
  * @vram-system:	system vram
  */
-
 static void
 test_mmap(int fd, uint32_t flags)
 {
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index cf4fb8fad2..eb752b0208 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -3,6 +3,15 @@
  * Copyright © 2022 Intel Corporation
  */
 
+/**
+ * TEST: Check Power Management functionality
+ * Category: Software building block
+ * Sub-category: power management
+ * Test category: functionality test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 #include <limits.h>
 #include <fcntl.h>
 #include <string.h>
@@ -141,6 +150,58 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
+/**
+ * SUBTEST: %s-basic
+ * Description: set GPU state to %arg[1] and test suspend/autoresume
+ * GPU requirements: D3 feature should be supported
+ *
+ * SUBTEST: %s-basic-exec
+ * Description: test exec on %arg[1] state once without RPM
+ * GPU requirements: D3 feature should be supported
+ *
+ * SUBTEST: %s-multiple-execs
+ * Description: test exec on %arg[1] state multiple times without RPM
+ * GPU requirements: D3 feature should be supported
+ *
+ * arg[1]:
+ *
+ * @s2idle:	s2idle
+ * @s3:		s3
+ * @s4:		s4
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ */
+
+/**
+ * SUBTEST: %s-exec-after
+ * Description: suspend/autoresume on %arg[1] state and exec after RPM
+ *
+ * arg[1]:
+ *
+ * @s2idle:	s2idle
+ * @s3:		s3
+ * @s4:		s4
+ */
+
+/**
+ * SUBTEST: %s-%s-basic-exec
+ * Description:
+ *	Setup GPU on %arg[2] state then test exec on %arg[1] state
+ * 	without RPM
+ * GPU requirements: D3 feature should be supported
+ *
+ * arg[1]:
+ *
+ * @s2idle:	s2idle
+ * @s3:		s3
+ * @s4:		s4
+ *
+ * arg[2]:
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ */
+
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_engines, int n_execs, enum igt_suspend_state s_state,
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 2a8bb91205..5710cff92c 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -25,10 +25,15 @@
  *    Matthew Brost <matthew.brost@intel.com>
  */
 
-/*
- * Testcase: Check whether prime import/export works on the same device
+/**
+ * TEST: Check whether prime import/export works on the same device
+ * Category: Software building block
+ * Sub-category: drm prime
+ * Test category: functionality test
  *
- * ... but with different fds, i.e. the wayland usecase.
+ * Description:
+ *	Check whether prime import/export works on the same device
+ *	but with different fds, i.e. the wayland usecase.
  */
 
 #include "igt.h"
@@ -83,6 +88,12 @@ check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
 	munmap(ptr2, BO_SIZE);
 }
 
+/**
+ * SUBTEST: basic-with_fd_dup
+ * Description: basic prime import/export with fd_dup
+ * Run type: BAT
+ */
+
 static void test_with_fd_dup(void)
 {
 	int fd1, fd2;
@@ -115,6 +126,13 @@ static void test_with_fd_dup(void)
 	close(fd2);
 }
 
+/**
+ * SUBTEST: basic-with_two_bos
+ * Description: basic prime import/export with two BOs
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_with_two_bos(void)
 {
 	int fd1, fd2;
@@ -152,6 +170,13 @@ static void test_with_two_bos(void)
 	close(fd2);
 }
 
+/**
+ * SUBTEST: basic-with_one_bo_two_files
+ * Description: basic prime import/export with one BO and two files
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_with_one_bo_two_files(void)
 {
 	int fd1, fd2;
@@ -183,6 +208,12 @@ static void test_with_one_bo_two_files(void)
 	close(dma_buf_fd2);
 }
 
+/**
+ * SUBTEST: basic-with_one_bo
+ * Description: basic prime import/export with one BO
+ * Run type: BAT
+ */
+
 static void test_with_one_bo(void)
 {
 	int fd1, fd2;
@@ -251,7 +282,13 @@ static void *thread_fn_reimport_vs_close(void *p)
 	return (void *)0;
 }
 
-static void test_reimport_close_race(void)
+/**
+ * SUBTEST: reimport-vs-gem_close-race
+ * Description: Reimport versus gem_close race
+ * Run type: BAT
+ */
+
+ static void test_reimport_close_race(void)
 {
 	pthread_t *threads;
 	int r, i, num_threads;
@@ -342,6 +379,12 @@ static void *thread_fn_export_vs_close(void *p)
 	return (void *)0;
 }
 
+/**
+ * SUBTEST: export-vs-gem_close-race
+ * Description: Export versus gem_close race test
+ * Run type: BAT
+ */
+
 static void test_export_close_race(void)
 {
 	pthread_t *threads;
@@ -396,6 +439,13 @@ static void test_export_close_race(void)
 	igt_assert_eq(obj_count, 0);
 }
 
+/**
+ * SUBTEST: basic-llseek-size
+ * Description: basic BO llseek size test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_llseek_size(void)
 {
 	int fd, i;
@@ -424,6 +474,13 @@ static void test_llseek_size(void)
 	close(fd);
 }
 
+/**
+ * SUBTEST: basic-llseek-bad
+ * Description: basid bad BO llseek size test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void test_llseek_bad(void)
 {
 	int fd;
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index c107f9936a..b5b78517ce 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -193,7 +193,7 @@ test_query_engines(int fd)
 /**
  * SUBTEST: query-mem-usage
  * Description: Display memory information like memory class, size
- * and alignment.
+ *	and alignment.
  */
 static void
 test_query_mem_usage(int fd)
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index f3dd926b24..c8c3a804e9 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -3,6 +3,13 @@
  * Copyright © 2021 Intel Corporation
  */
 
+/**
+ * TEST: Check if VMA functionality is working
+ * Category: Software building block
+ * Sub-category: VMA
+ * Test category: functionality test
+ */
+
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -72,6 +79,12 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	xe_engine_destroy(fd, engine);
 }
 
+/**
+ * SUBTEST: scratch
+ * Description: Test scratch page creation and write
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
 
 static void
 test_scratch(int fd)
@@ -188,6 +201,13 @@ uint64_t addrs_57b[] = {
 	0x1fffffffffffff4ull,
 };
 
+/**
+ * SUBTEST: bind-once
+ * Description: bind once on one BO
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void
 test_bind_once(int fd)
 {
@@ -198,6 +218,13 @@ test_bind_once(int fd)
 			   1, &addr);
 }
 
+/**
+ * SUBTEST: bind-one-bo-many-times
+ * Description: bind many times on one BO
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void
 test_bind_one_bo_many_times(int fd)
 {
@@ -211,6 +238,13 @@ test_bind_one_bo_many_times(int fd)
 			   addrs_size, addrs);
 }
 
+/**
+ * SUBTEST: bind-one-bo-many-times-many-vm
+ * Description: Test bind many times and many VM on one BO
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void
 test_bind_one_bo_many_times_many_vm(int fd)
 {
@@ -222,6 +256,15 @@ test_bind_one_bo_many_times_many_vm(int fd)
 	__test_bind_one_bo(fd, 0, addrs_size, addrs);
 }
 
+/**
+ * SUBTEST: unbind-all-%d-vmas
+ * Description: Test unbind all with %arg[1] VMAs
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1].values: 2, 8
+ */
+
 static void unbind_all(int fd, int n_vmas)
 {
 	uint32_t bo, bo_size = xe_get_default_alignment(fd);
@@ -259,6 +302,18 @@ struct vm_thread_data {
 	bool destroy;
 };
 
+/**
+ * SUBTEST: vm-async-ops-err
+ * Description: Test VM async ops error
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: vm-async-ops-err-destroy
+ * Description: Test VM async ops error destroy
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
 static void *vm_async_ops_err_thread(void *data)
 {
 	struct vm_thread_data *args = data;
@@ -413,6 +468,15 @@ static void vm_async_ops_err(int fd, bool destroy)
 	pthread_join(thread.thread, NULL);
 }
 
+/**
+ * SUBTEST: shared-%s-page
+ * Description: Test shared arg[1] page
+ * Run type: BAT
+ *
+ * arg[1].values: pte, pde, pde2, pde3
+ */
+
+
 struct shared_pte_page_data {
 	uint32_t batch[16];
 	uint64_t pad;
@@ -588,6 +652,13 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	xe_vm_destroy(fd, vm);
 }
 
+
+/**
+ * SUBTEST: bind-engines-independent
+ * Description: Test independent bind engines
+ * Run type: BAT
+ */
+
 static void
 test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 {
@@ -722,6 +793,28 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 
 #define BIND_ARRAY_BIND_ENGINE_FLAG	(0x1 << 0)
 
+
+/**
+ * SUBTEST: bind-array-twice
+ * Description: Test bind array twice
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: bind-array-many
+ * Description: Test bind array many times
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: bind-array-engine-twice
+ * Description: Test bind array engine twice
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: bind-array-engine-many
+ * Description: Test bind array engine many times
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
 static void
 test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		unsigned int flags)
@@ -841,6 +934,59 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 #define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
 #define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
 
+/**
+ * SUBTEST: %s-%ld
+ * Description: Test %arg[1] with %arg[2] bind size
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @large-binds: large-binds
+ * @large-split-binds: large-split-binds
+ * @large-misaligned-binds: large-misaligned-binds
+ * @large-split-misaligned-binds: large-split-misaligned-binds
+ * @large-userptr-binds: large-userptr-binds
+ * @large-userptr-split-binds: large-userptr-split-binds
+ * @large-userptr-misaligned-binds: large-userptr-misaligned-binds
+ * @large-userptr-split-misaligned-binds: large-userptr-split-misaligned-binds
+ *
+ * arg[2].values: 2097152, 4194304, 8388608, 16777216, 33554432
+ * arg[2].values: 67108864, 134217728, 268435456, 536870912, 1073741824
+ * arg[2].values: 2147483648
+ */
+
+/**
+ *
+ * SUBTEST: %s-%ld
+ * Description: Test %arg[1] with %arg[2] bind size
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @mixed-binds: mixed-binds
+ * @mixed-misaligned-binds: mixed-misaligned-binds
+ *
+ * arg[2].values: 3145728, 1611661312
+ */
+
+/**
+ *
+ * SUBTEST: %s-%ld
+ * Description: Test %arg[1] with %arg[2] bind size
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @mixed-userptr-binds: mixed-userptr-binds
+ * @mixed-userptr-misaligned-binds: mixed-userptr-misaligned-binds
+ * @mixed-userptr-binds: mixed-userptr-binds
+ *
+ * arg[2].values: 3145728, 1611661312
+ */
+
 static void
 test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		 int n_engines, int n_execs, size_t bo_size,
@@ -1061,6 +1207,59 @@ static void *hammer_thread(void *tdata)
 #define MUNMAP_FLAG_INVALIDATE		(0x1 << 1)
 #define MUNMAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
 
+
+/**
+ * SUBTEST: munmap-style-unbind-%s
+ * Description: Test munmap style unbind with %arg[1]
+ *
+ * arg[1]:
+ *
+ * @one-partial:			one partial
+ * @end:				end
+ * @front:				front
+ * @userptr-one-partial:		userptr one partial
+ * @userptr-end:			userptr end
+ * @userptr-front:			userptr front
+ * @userptr-inval-end:			userptr inval end
+ * @userptr-inval-front:		userptr inval front
+ * Run type: BAT
+ */
+
+/**
+ * SUBTEST: munmap-style-unbind-%s
+ * Description: Test munmap style unbind with %arg[1]
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @all:				all
+ * @either-side-partial:		either side partial
+ * @either-side-partial-hammer:		either side partial hammer
+ * @either-side-full:			either side full
+ * @many-all:				many all
+ * @many-either-side-partial:		many either side partial
+ * @many-either-side-partial-hammer:	many either side partial hammer
+ * @many-either-side-full:		many either side full
+ * @many-end:				many end
+ * @many-front:				many front
+ * @userptr-all:			userptr all
+ * @userptr-either-side-partial:	userptr either side partial
+ * @userptr-either-side-full:		userptr either side full
+ * @userptr-many-all:			userptr many all
+ * @userptr-many-either-side-full:	userptr many either side full
+ * @userptr-many-end:			userptr many end
+ * @userptr-many-front:			userptr many front
+ * @userptr-inval-either-side-full:	userptr inval either side full
+ * @userptr-inval-many-all:		userptr inval many all
+ * @userptr-inval-many-either-side-partial:
+ *					userptr inval many either side partial
+ * @userptr-inval-many-either-side-full:
+ *					userptr inval many either side full
+ * @userptr-inval-many-end:		userptr inval many end
+ * @userptr-inval-many-front:		userptr inval many front
+ */
+
 static void
 test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 int bo_n_pages, int n_binds,
-- 
2.34.1
