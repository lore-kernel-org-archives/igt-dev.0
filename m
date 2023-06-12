Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4794910E09E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 09:00:20 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Date: Mon, 12 Jun 2023 14:29:48 +0530
Message-Id: <20230612085948.12130-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20230612085948.12130-1-sai.gowtham.ch@intel.com>
References: <20230612085948.12130-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new test to
 exercise igt_spin_new for xe
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

xe_spin_batch test exercises igt_spin_new submissions with different
combination.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/meson.build        |   1 +
 tests/xe/xe_spin_batch.c | 180 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 tests/xe/xe_spin_batch.c

diff --git a/tests/meson.build b/tests/meson.build
index f908ae88..454b0060 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -268,6 +268,7 @@ xe_progs = [
 	'xe_query',
 	'xe_vm',
 	'xe_waitfence',
+	'xe_spin_batch',
 ]
 
 msm_progs = [
diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
new file mode 100644
index 00000000..6ce7e741
--- /dev/null
+++ b/tests/xe/xe_spin_batch.c
@@ -0,0 +1,180 @@
+#include "igt.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define MAX_INSTANCE 9
+
+/**
+ * TEST: Basic test for spin batch submissons.
+ *
+ * SUBTEST: spin-basic
+ * Description: Basic test to submit spin batch submissons on copy engine.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+
+static void spin_basic(int fd)
+{
+	uint64_t ahnd;
+	igt_spin_t *spin;
+
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = __igt_spin_new(fd, .ahnd = ahnd);
+	igt_assert(spin);
+
+	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
+}
+
+/**
+ * TEST:Test for spin batch submissons.
+ *
+ * SUBTEST: spin-batch
+ * Description: Create vm and engine of hwe class and run the spinner on it.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+
+static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint64_t ahnd;
+	unsigned int engine;
+	uint32_t vm;
+	igt_spin_t *spin;
+
+	vm = xe_vm_create(fd, 0, 0);
+	engine = xe_engine_create(fd, vm, hwe, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm);
+	igt_assert(spin);
+
+	igt_spin_free(fd, spin);
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+
+	put_ahnd(ahnd);
+}
+
+/**
+ * TEST: Basic test for spin batch submission on all hwe.
+ *
+ * SUBTEST: spin-basic-all
+ * Description: Basic test which validates the functionality of spinner on all hwe.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+static void spin_basic_all(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	uint64_t ahnd;
+	uint32_t vm;
+	igt_spin_t **spin;
+	int i = 0;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
+	spin = malloc(sizeof(*spin) * xe_number_hw_engines(fd));
+	xe_for_each_hw_engine(fd, hwe) {
+		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = hwe);
+		igt_assert(spin[i]);
+		i++;
+	}
+
+	while (--i>=0)
+		igt_spin_free(fd, spin[i]);
+
+	put_ahnd(ahnd);
+	xe_vm_destroy(fd, vm);
+	free(spin);
+}
+
+/**
+ * TEST: Test for spin batch submissions.
+ * SUBTEST: spin-all
+ * Description: Spinner test to run on all the engines!
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+
+static void spin_all(int fd, int gt, int class)
+{
+	uint64_t ahnd;
+	uint32_t engines[MAX_INSTANCE], vm;
+	int i, num_placements = 0;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	igt_spin_t *spin[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *hwe;
+
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_hw_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+	vm = xe_vm_create(fd, 0, 0);
+
+	for (i = 0; i < num_placements; i++) {
+		struct drm_xe_engine_create create;
+
+		create.vm_id = vm;
+		create.width = 1;
+		create.num_placements = num_placements;
+		create.instances = to_user_pointer(eci);
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .engine = engines[i], .vm = vm);
+	}
+
+	for (i = 0; i < num_placements; i++) {
+		igt_assert(spin[i]);
+		igt_spin_free(fd, spin[i]);
+	}
+
+	put_ahnd(ahnd);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	int gt, class;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("spin-basic")
+		spin_basic(fd);
+
+	igt_subtest("spin-batch")
+		xe_for_each_hw_engine(fd, hwe)
+			spin(fd, hwe);
+
+	igt_subtest("spin-basic-all")
+		spin_basic_all(fd);
+
+	igt_subtest("spin-all") {
+		xe_for_each_gt(fd, gt)
+			xe_for_each_hw_engine_class(class)
+				spin_all(fd, gt, class);
+	}
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.39.1
