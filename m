Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E2310EE47
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 22:42:29 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 18 Aug 2022 15:42:16 -0700
Message-Id: <20220818224216.3920822-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915/gem_huc_copy: cover reset and
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
v3: improve description, rework status check to match clearer spec

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Tony Ye <tony.ye@intel.com> #v1
---
 tests/i915/gem_huc_copy.c | 168 +++++++++++++++++++++++++++-----------
 1 file changed, 120 insertions(+), 48 deletions(-)

diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index ea32b705..f9cd4aa2 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -36,10 +36,17 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 
-IGT_TEST_DESCRIPTION("A very simple workload for the HuC.");
+IGT_TEST_DESCRIPTION("Check if HuC works by using it to copy a char array");
 
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
@@ -73,15 +80,85 @@ static void test_huc_load(int fd)
 {
 	int err;
 	int status = 0;
+	int attempts = 3;
+
+	/*
+	 * Status 0 indicates FW load is still not completed. Since HuC load can
+	 * complete after i915 load/resume is done, if we read status 0 we wait
+	 * a bit and try again to wait for the status change.
+	 */
+	while (attempts--) {
+		err = get_huc_status(fd, &status);
+		igt_skip_on_f(err == -ENODEV,
+			      "HuC is not present on this platform!\n");
+		igt_skip_on_f(err == -EOPNOTSUPP,
+			      "HuC firmware is disabled!\n");
+		igt_fail_on_f(err < 0, "HuC firmware loading error: %i, %s\n",
+			      -err, strerror(-err));
+
+		if (status)
+			break;
+
+		igt_debug("HuC load not done. Will check again in 1s (%d attempts left)\n",
+			  attempts);
+		sleep(1);
+	}
+	igt_fail_on_f(status == 0, "HuC firmware load has not completed!\n");
+}
+
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
 
-	err = get_huc_status(fd, &status);
-	igt_skip_on_f(err == -ENODEV,
-		      "HuC is not present on this platform!\n");
-	igt_skip_on_f(err == -EOPNOTSUPP,
-		      "HuC firmware is disabled!\n");
-	igt_fail_on_f(err < 0, "HuC firmware loading error: %i, %s\n",
-		      -err, strerror(-err));
-	igt_fail_on_f(status == 0, "HuC firmware is not running!\n");
+	huc_copy(drm_fd, ahnd, obj, objsize);
+	compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
+
+	gem_close(drm_fd, obj[0].handle);
+	gem_close(drm_fd, obj[1].handle);
+	gem_close(drm_fd, obj[2].handle);
 }
 
 igt_main
@@ -89,7 +166,17 @@ igt_main
 	int drm_fd = -1;
 	uint32_t devid;
 	igt_huc_copyfunc_t huc_copy;
-	uint64_t ahnd;
+	const struct {
+		const char *name;
+		enum operation op;
+		const char *describe;
+	} ops[] = {
+		{ "", SIMPLE_COPY, "" },
+		{ "-after-reset", GPU_RESET, " after GT reset" },
+		{ "-after-suspend-resume", SUSPEND_RESUME, " after suspend-to-mem" },
+		{ "-after-hibernate-resume", HIBERNATE_RESUME, " after suspend-to-disk" },
+		{ }
+	}, *op;
 
 	igt_fixture {
 		drm_fd = drm_open_driver(DRIVER_INTEL);
@@ -98,47 +185,32 @@ igt_main
 		huc_copy = igt_get_huc_copyfunc(devid);
 
 		igt_require_f(huc_copy, "no huc_copy function\n");
-
-		ahnd = get_reloc_ahnd(drm_fd, 0);
 	}
 
-	igt_describe("Make sure that Huc firmware works"
-		     "by copying a char array using Huc"
-		     "and verifying the copied result");
-
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
+		igt_hang_t hang = {};
+		uint64_t ahnd;
+
+		igt_fixture {
+			ahnd = get_reloc_ahnd(drm_fd, 0);
+
+			if (op->op == GPU_RESET)
+				hang = igt_allow_hang(drm_fd, 0, HANG_ALLOW_CAPTURE);
+		}
+
+		igt_describe_f("Submit a copy work to the HuC%s and verify the result.",
+			       op->describe);
+		igt_subtest_f("huc-copy%s", op->name)
+			huc_copy_test(drm_fd, ahnd, huc_copy, op->op);
+
+		igt_fixture {
+			if (op->op == GPU_RESET)
+				igt_disallow_hang(drm_fd, hang);
+
+			put_ahnd(ahnd);
+		}
 	}
 
-	igt_fixture {
-		put_ahnd(ahnd);
+	igt_fixture
 		close(drm_fd);
-	}
 }
-- 
2.37.2
