Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72910E83A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 22:43:41 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 15:43:33 -0700
Message-Id: <20220520224333.3055658-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] tests/i915/gem_huc_copy: cover reset and
 suspend/resume scenarios
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Additional subtests have been added to make sure the HuC keeps working
after GT reset and suspend/resume.

v2: get a new ahnd per subtest.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Tony Ye <tony.ye@intel.com> #v1
---
 tests/i915/gem_huc_copy.c | 130 ++++++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 35 deletions(-)

diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index ea32b705..57ed9248 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -40,6 +40,13 @@ IGT_TEST_DESCRIPTION("A very simple workload for the HuC.");
 
 #define HUC_COPY_DATA_BUF_SIZE	4096
 
+enum operation {
+	GPU_RESET,
+	SUSPEND_RESUME,
+	HIBERNATE_RESUME,
+	SIMPLE_COPY,
+};
+
 static void
 compare_huc_copy_result(int drm_fd, uint32_t src_handle, uint32_t dst_handle)
 {
@@ -84,12 +91,76 @@ static void test_huc_load(int fd)
 	igt_fail_on_f(status == 0, "HuC firmware is not running!\n");
 }
 
+static void huc_copy_test(int drm_fd, uint64_t ahnd,
+			  igt_huc_copyfunc_t huc_copy, enum operation op)
+{
+	char inputs[HUC_COPY_DATA_BUF_SIZE];
+	struct drm_i915_gem_exec_object2 obj[3];
+	uint64_t objsize[3] = { HUC_COPY_DATA_BUF_SIZE,
+				HUC_COPY_DATA_BUF_SIZE,
+				4096 };
+
+	switch (op) {
+	case GPU_RESET:
+		igt_force_gpu_reset(drm_fd);
+		break;
+
+	case SUSPEND_RESUME:
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+		break;
+
+	case HIBERNATE_RESUME:
+		igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
+					      SUSPEND_TEST_NONE);
+		break;
+
+	case SIMPLE_COPY:
+		break;
+
+	default:
+		igt_assert(0);
+	}
+
+	test_huc_load(drm_fd);
+	/* Initialize src buffer randomly */
+	srand(time(NULL));
+	for (int i = 0; i < HUC_COPY_DATA_BUF_SIZE; i++)
+		inputs[i] = (char) (rand() % 256);
+
+	memset(obj, 0, sizeof(obj));
+	/* source buffer object for storing input */
+	obj[0].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
+	/* destination buffer object to receive input */
+	obj[1].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
+	/* execution buffer object */
+	obj[2].handle = gem_create(drm_fd, 4096);
+
+	gem_write(drm_fd, obj[0].handle, 0, inputs, HUC_COPY_DATA_BUF_SIZE);
+
+	huc_copy(drm_fd, ahnd, obj, objsize);
+	compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
+
+	gem_close(drm_fd, obj[0].handle);
+	gem_close(drm_fd, obj[1].handle);
+	gem_close(drm_fd, obj[2].handle);
+}
+
 igt_main
 {
 	int drm_fd = -1;
 	uint32_t devid;
 	igt_huc_copyfunc_t huc_copy;
-	uint64_t ahnd;
+	const struct {
+		const char *name;
+		enum operation op;
+	} ops[] =   {
+		{ "", SIMPLE_COPY },
+		{ "-after-reset", GPU_RESET },
+		{ "-after-suspend-resume", SUSPEND_RESUME },
+		{ "-after-hibernate-resume", HIBERNATE_RESUME },
+		{ }
+	}, *op;
 
 	igt_fixture {
 		drm_fd = drm_open_driver(DRIVER_INTEL);
@@ -98,47 +169,36 @@ igt_main
 		huc_copy = igt_get_huc_copyfunc(devid);
 
 		igt_require_f(huc_copy, "no huc_copy function\n");
-
-		ahnd = get_reloc_ahnd(drm_fd, 0);
 	}
 
 	igt_describe("Make sure that Huc firmware works"
 		     "by copying a char array using Huc"
 		     "and verifying the copied result");
 
-	igt_subtest("huc-copy") {
-		char inputs[HUC_COPY_DATA_BUF_SIZE];
-		struct drm_i915_gem_exec_object2 obj[3];
-		uint64_t objsize[3] = { HUC_COPY_DATA_BUF_SIZE,
-					HUC_COPY_DATA_BUF_SIZE,
-					4096 };
-
-		test_huc_load(drm_fd);
-		/* Initialize src buffer randomly */
-		srand(time(NULL));
-		for (int i = 0; i < HUC_COPY_DATA_BUF_SIZE; i++)
-			inputs[i] = (char) (rand() % 256);
-
-		memset(obj, 0, sizeof(obj));
-		/* source buffer object for storing input */
-		obj[0].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
-		/* destination buffer object to receive input */
-		obj[1].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
-		/* execution buffer object */
-		obj[2].handle = gem_create(drm_fd, 4096);
-
-		gem_write(drm_fd, obj[0].handle, 0, inputs, HUC_COPY_DATA_BUF_SIZE);
-
-		huc_copy(drm_fd, ahnd, obj, objsize);
-		compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
-
-		gem_close(drm_fd, obj[0].handle);
-		gem_close(drm_fd, obj[1].handle);
-		gem_close(drm_fd, obj[2].handle);
+	for (op = ops; op->name; op++) {
+		igt_subtest_group {
+			igt_hang_t hang = {};
+			uint64_t ahnd;
+
+			igt_fixture {
+				ahnd = get_reloc_ahnd(drm_fd, 0);
+
+				if (op->op == GPU_RESET)
+					hang = igt_allow_hang(drm_fd, 0, HANG_ALLOW_CAPTURE);
+			}
+
+			igt_subtest_f("huc-copy%s", op->name)
+				huc_copy_test(drm_fd, ahnd, huc_copy, op->op);
+
+			igt_fixture {
+				if (op->op == GPU_RESET)
+					igt_disallow_hang(drm_fd, hang);
+
+				put_ahnd(ahnd);
+			}
+		}
 	}
 
-	igt_fixture {
-		put_ahnd(ahnd);
+	igt_fixture
 		close(drm_fd);
-	}
 }
-- 
2.25.1
