Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206710E333
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 09:45:29 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 11:45:01 +0200
Message-Id: <20230606094501.3145635-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: add functionality to several tests
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

Improve documentation by adding functionality to several tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_compute.c           |  1 +
 tests/xe/xe_create.c            |  1 +
 tests/xe/xe_debugfs.c           |  1 +
 tests/xe/xe_dma_buf_sync.c      |  1 +
 tests/xe/xe_exec_basic.c        |  1 +
 tests/xe/xe_gpgpu_fill.c        |  1 +
 tests/xe/xe_intel_bb.c          |  1 +
 tests/xe/xe_mmap.c              |  1 +
 tests/xe/xe_mmio.c              |  1 +
 tests/xe/xe_module_load.c       |  1 +
 tests/xe/xe_noexec_ping_pong.c  |  1 +
 tests/xe/xe_pm.c                |  5 +++++
 tests/xe/xe_prime_self_import.c |  1 +
 tests/xe/xe_query.c             |  1 +
 tests/xe/xe_vm.c                | 34 +++++++++++++++++++++++++++++++++
 tests/xe/xe_waitfence.c         |  1 +
 16 files changed, 53 insertions(+)

diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 7ac64dfe3199..28fd8bd118ef 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -23,6 +23,7 @@
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
+ * Functionality: compute openCL kernel
  * TODO: extend test to cover other platforms
  */
 static void
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index 5effabc839a8..ae21154646d1 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -7,6 +7,7 @@
  * TEST: Check bo create ioctl
  * Category: Software building block
  * Sub-category: uapi
+ * Functionality: device
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 6bdd3ef063f3..985bff6d2cc8 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -7,6 +7,7 @@
  * TEST: Check debugfs userspace API
  * Category: Software building block
  * Sub-category: debugfs
+ * Functionality: debugfs
  * Test category: functionality test
  * Run type: BAT
  * Description: Validate debugfs entries
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 8920b141bf24..1d7ffc60f945 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -7,6 +7,7 @@
  * TEST: Check dmabuf functionality
  * Category: Software building block
  * Sub-category: dmabuf
+ * Functionality: dma_buf
  * Test category: functionality test
  */
 
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 2a176a5b3b5e..059e6ae89f6c 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -7,6 +7,7 @@
  * TEST: Basic tests for execbuf functionality
  * Category: Hardware building block
  * Sub-category: execbuf
+ * Functionality: engines
  * Test category: functionality test
  */
 
diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c
index 5bca19c87eea..4e212a0a3efc 100644
--- a/tests/xe/xe_gpgpu_fill.c
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -7,6 +7,7 @@
  * TEST: Basic tests for gpgpu functionality
  * Category: Software building block
  * Sub-category: gpgpu
+ * Functionality: gpgpu
  * Test category: functionality test
  */
 
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 755cc530ea4f..ed3529a1b90d 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -26,6 +26,7 @@
  * TEST: Basic tests for intel-bb xe functionality
  * Category: Software building block
  * Sub-category: xe
+ * Functionality: intel-bb
  * Test category: functionality test
  */
 
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index be1f97914d8d..420c7f86c816 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -7,6 +7,7 @@
  * TEST: Test if the driver is capable of doing mmap on different memory regions
  * Category: Software building block
  * Sub-category: mmap
+ * Functionality: mmap
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index 42b6241b1a86..ca340893467a 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -7,6 +7,7 @@
  * TEST: Test if mmio feature
  * Category: Software building block
  * Sub-category: mmio
+ * Functionality: mmap
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index c2d43cc20532..58e422415fbc 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -7,6 +7,7 @@
  * TEST: Tests the xe module loading
  * Category: Sofware building block
  * Sub-category: driver
+ * Functionality: module load
  * Test category: functionality test
  */
 
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index 367671883a28..547f8fcc6ec4 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -19,6 +19,7 @@
  * TEST: Expose compute VM's unnecessary rebinds
  * Category: Software building block
  * Sub-category: compute
+ * Functionality: compute VM rebind
  * Test category: functionality test
  *
  * SUBTEST:
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 44154143c3f5..355626e32f9e 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -153,14 +153,17 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 /**
  * SUBTEST: %s-basic
  * Description: set GPU state to %arg[1] and test suspend/autoresume
+ * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
  * SUBTEST: %s-basic-exec
  * Description: test exec on %arg[1] state once without RPM
+ * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
  * SUBTEST: %s-multiple-execs
  * Description: test exec on %arg[1] state multiple times without RPM
+ * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
  * arg[1]:
@@ -175,6 +178,7 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 /**
  * SUBTEST: %s-exec-after
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
+ * Functionality: pm - %arg[1]
  *
  * arg[1]:
  *
@@ -188,6 +192,7 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
  * Description:
  *	Setup GPU on %arg[2] state then test exec on %arg[1] state
  * 	without RPM
+ * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
  * arg[1]:
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 4e8fd5d4f683..c2b292c15dbb 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -29,6 +29,7 @@
  * TEST: Check whether prime import/export works on the same device
  * Category: Software building block
  * Sub-category: drm prime
+ * Functionality: prime import/export
  * Test category: functionality test
  *
  * Description:
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 87990370f39f..40bd19ae7ac6 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -7,6 +7,7 @@
  * TEST: Check device configuration query
  * Category: Software building block
  * Sub-category: ioctl
+ * Functionality: device
  * Test category: functionality test
  * Run type: BAT
  * Description: Acquire configuration data for xe device
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index d4cec104eb0c..861822b481e2 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -82,6 +82,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 /**
  * SUBTEST: scratch
  * Description: Test scratch page creation and write
+ * Functionality: scratch page
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -204,6 +205,7 @@ uint64_t addrs_57b[] = {
 /**
  * SUBTEST: bind-once
  * Description: bind once on one BO
+ * Functionality: bind BO
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -221,6 +223,7 @@ test_bind_once(int fd)
 /**
  * SUBTEST: bind-one-bo-many-times
  * Description: bind many times on one BO
+ * Functionality: bind BO
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -241,6 +244,7 @@ test_bind_one_bo_many_times(int fd)
 /**
  * SUBTEST: bind-one-bo-many-times-many-vm
  * Description: Test bind many times and many VM on one BO
+ * Functionality: bind BO
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -259,6 +263,7 @@ test_bind_one_bo_many_times_many_vm(int fd)
 /**
  * SUBTEST: unbind-all-%d-vmas
  * Description: Test unbind all with %arg[1] VMAs
+ * Functionality: unbind
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
@@ -299,6 +304,7 @@ static void unbind_all(int fd, int n_vmas)
  * Description:
  *	Verifies that mapping an invalid userptr returns -EFAULT,
  *	and that it is correctly handled.
+ * Functionality: userptr
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -335,11 +341,13 @@ struct vm_thread_data {
 /**
  * SUBTEST: vm-async-ops-err
  * Description: Test VM async ops error
+ * Functionality: VM
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: vm-async-ops-err-destroy
  * Description: Test VM async ops error destroy
+ * Functionality: VM
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -503,6 +511,7 @@ static void vm_async_ops_err(int fd, bool destroy)
  * Description: Test shared arg[1] page
  * Run type: BAT
  *
+ * Functionality: %arg[1] page
  * arg[1].values: pte, pde, pde2, pde3
  */
 
@@ -686,6 +695,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 /**
  * SUBTEST: bind-engines-independent
  * Description: Test independent bind engines
+ * Functionality: bind engines
  * Run type: BAT
  */
 
@@ -827,21 +837,25 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 /**
  * SUBTEST: bind-array-twice
  * Description: Test bind array twice
+ * Functionality: bind engines
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-many
  * Description: Test bind array many times
+ * Functionality: bind engines
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-engine-twice
  * Description: Test bind array engine twice
+ * Functionality: bind engines
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-engine-many
  * Description: Test bind array engine many times
+ * Functionality: bind engines
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  */
@@ -967,6 +981,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 /**
  * SUBTEST: %s-%ld
  * Description: Test %arg[1] with %arg[2] bind size
+ * Functionality: bind
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
@@ -976,6 +991,21 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * @large-split-binds: large-split-binds
  * @large-misaligned-binds: large-misaligned-binds
  * @large-split-misaligned-binds: large-split-misaligned-binds
+ *
+ * arg[2].values: 2097152, 4194304, 8388608, 16777216, 33554432
+ * arg[2].values: 67108864, 134217728, 268435456, 536870912, 1073741824
+ * arg[2].values: 2147483648
+ */
+
+/**
+ * SUBTEST: %s-%ld
+ * Description: Test %arg[1] with %arg[2] bind size
+ * Functionality: userptr bind
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
  * @large-userptr-binds: large-userptr-binds
  * @large-userptr-split-binds: large-userptr-split-binds
  * @large-userptr-misaligned-binds: large-userptr-misaligned-binds
@@ -990,6 +1020,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  *
  * SUBTEST: %s-%ld
  * Description: Test %arg[1] with %arg[2] bind size
+ * Functionality: mixed bind
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
@@ -1005,6 +1036,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  *
  * SUBTEST: %s-%ld
  * Description: Test %arg[1] with %arg[2] bind size
+ * Functionality: mixed bind
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
@@ -1241,6 +1273,7 @@ static void *hammer_thread(void *tdata)
 /**
  * SUBTEST: munmap-style-unbind-%s
  * Description: Test munmap style unbind with %arg[1]
+ * Functionality: unbind
  *
  * arg[1]:
  *
@@ -1258,6 +1291,7 @@ static void *hammer_thread(void *tdata)
 /**
  * SUBTEST: munmap-style-unbind-%s
  * Description: Test munmap style unbind with %arg[1]
+ * Functionality: unbind
  * Run type: FULL
  * TODO: change ``'Run type' == FULL`` to a better category
  *
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb47c9..3c203edc59f6 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -17,6 +17,7 @@
  * TEST: Check if waitfences work
  * Category: Software building block
  * Sub-category: waitfence
+ * Functionality: waitfence
  * Test category: functionality test
  * Run type: BAT
  * Description: Test waitfences functionality
-- 
2.40.1
