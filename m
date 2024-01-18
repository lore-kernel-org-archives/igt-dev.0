Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FAAC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 12:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B710E07F;
	Thu, 18 Jan 2024 12:28:32 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3487F10E07F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 12:28:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxOPBpGallHaMBAA--.8072S3;
 Thu, 18 Jan 2024 20:28:25 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxXs1eGalleoMIAA--.40490S2; 
 Thu, 18 Jan 2024 20:28:24 +0800 (CST)
From: Min Zhou <zhoumin@loongson.cn>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_compute: Support testing multiple compute
 kernels
Date: Thu, 18 Jan 2024 20:12:18 +0800
Message-Id: <20240118121218.1674694-1-zhoumin@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxXs1eGalleoMIAA--.40490S2
X-CM-SenderInfo: 52kr3ztlq6z05rqj20fqof0/1tbiAQAAAWWo4WAEZwAgsP
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: zhoumin@loongson.cn, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

It seems that we will add more and more compute kernels for testing.
The function name of `run_intel_compute_kernel` seems to be able to
test multiple compute kernels. However it's hard to test other
compute kernel in testcases because the compute kernel is hardcoded
in the lib/intel_compute.c. So if we want to test multiple compute
kernels in testcases in the future, it's better to support it in
lib/intel_compute.

Signed-off-by: Min Zhou <zhoumin@loongson.cn>
---
 lib/intel_compute.c              | 66 +++++++++++++++++++++++++++-----
 lib/intel_compute.h              | 13 +++++--
 opencl/README                    |  6 +--
 tests/intel/gem_compute.c        |  3 +-
 tests/intel/xe_compute.c         |  9 +++--
 tests/intel/xe_compute_preempt.c |  3 +-
 6 files changed, 78 insertions(+), 22 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index eab407a0d..9c21c10c5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -64,6 +64,30 @@ struct bo_execenv {
 	struct drm_i915_gem_exec_object2 *obj;
 };
 
+/*
+ * Supported compute kernels
+ */
+struct {
+	const char *name;
+	const struct intel_compute_kernels *kernels;
+} intel_compute_kernels_set[] = {
+	{ .name = COMPUTE_SQUARE,
+	  .kernels = intel_compute_square_kernels },
+	{}
+};
+
+static const struct intel_compute_kernels *find_intel_compute_kernels(const char *name)
+{
+	int i = 0;
+
+	for (; intel_compute_kernels_set[i].name; ++i) {
+		if (strcmp(intel_compute_kernels_set[i].name, name) == 0)
+			return intel_compute_kernels_set[i].kernels;
+	}
+
+	return NULL;
+}
+
 static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 			      struct drm_xe_engine_class_instance *eci)
 {
@@ -1435,11 +1459,11 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel(int fd,
-				       struct drm_xe_engine_class_instance *eci)
+				       struct drm_xe_engine_class_instance *eci,
+				       const struct intel_compute_kernels *kernels)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
 
 	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
@@ -1472,9 +1496,16 @@ static bool __run_intel_compute_kernel(int fd,
 	return true;
 }
 
-bool run_intel_compute_kernel(int fd)
+bool run_intel_compute_kernel(int fd, const char *kernel_name)
 {
-	return __run_intel_compute_kernel(fd, NULL);
+	const struct intel_compute_kernels *kernels;
+
+	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
+		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
+		return false;
+	}
+
+	return __run_intel_compute_kernel(fd, NULL, kernels);
 }
 
 /**
@@ -1487,8 +1518,11 @@ bool run_intel_compute_kernel(int fd)
  * Returns true on success, false otherwise.
  */
 bool xe_run_intel_compute_kernel_on_engine(int fd,
-					   struct drm_xe_engine_class_instance *eci)
+					   struct drm_xe_engine_class_instance *eci,
+					   const char *kernel_name)
 {
+	const struct intel_compute_kernels *kernels;
+
 	if (!is_xe_device(fd)) {
 		igt_debug("Xe device expected\n");
 		return false;
@@ -1506,7 +1540,12 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
 		return false;
 	}
 
-	return __run_intel_compute_kernel(fd, eci);
+	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
+		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
+		return false;
+	}
+
+	return __run_intel_compute_kernel(fd, eci, kernels);
 }
 
 /**
@@ -1683,11 +1722,11 @@ static const struct {
 	},
 };
 
-static bool __run_intel_compute_kernel_preempt(int fd)
+static bool __run_intel_compute_kernel_preempt(int fd,
+				const struct intel_compute_kernels *kernels)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
 
 	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
@@ -1732,7 +1771,14 @@ static bool __run_intel_compute_kernel_preempt(int fd)
  *
  * Returns true on success, false otherwise.
  */
-bool run_intel_compute_kernel_preempt(int fd)
+bool run_intel_compute_kernel_preempt(int fd, const char *kernel_name)
 {
-	return __run_intel_compute_kernel_preempt(fd);
+	const struct intel_compute_kernels *kernels;
+
+	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
+		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
+		return false;
+	}
+
+	return __run_intel_compute_kernel_preempt(fd, kernels);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index bba8bed94..9faf070b3 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -11,6 +11,11 @@
 
 #include "xe_drm.h"
 
+/*
+ * Supported compute kernels name
+ */
+#define COMPUTE_SQUARE	"compute-square"
+
 /*
  * OpenCL Kernels are generated using:
  *
@@ -33,7 +38,9 @@ struct intel_compute_kernels {
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
-bool run_intel_compute_kernel(int fd);
-bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd);
+bool run_intel_compute_kernel(int fd, const char *kernel_name);
+bool xe_run_intel_compute_kernel_on_engine(int fd,
+					   struct drm_xe_engine_class_instance *eci,
+					   const char *kernel_name);
+bool run_intel_compute_kernel_preempt(int fd, const char *kernel_name);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/opencl/README b/opencl/README
index 2fd0687a2..4dfbe2865 100644
--- a/opencl/README
+++ b/opencl/README
@@ -5,10 +5,10 @@ multiple platforms.
 For instance, to generate compute square Kernel binaries for TGL and ADL
 variants, use this:
 
-    opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl \
-	   xe_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
+    opencl/gen_opencl_kernel intel_compute_square opencl/compute_square_kernel.cl \
+	   intel_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
 
-    cp build/opencl/xe_compute_square_kernels.c lib/xe/
+    cp build/opencl/intel_compute_square_kernels.c lib/
 
 The opencl/gen_opencl_kernel requires the Intel compute runtime[1].
 
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8d0214c4d..ce368d2c3 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -27,7 +27,8 @@
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, COMPUTE_SQUARE),
+		      "GPU not supported\n");
 }
 
 igt_main
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 42f42ca0c..bc81dc04f 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -114,7 +114,7 @@ test_ccs_mode(int num_gt)
  * Functionality: CCS mode funtionality
  */
 static void
-test_compute_kernel_with_ccs_mode(int num_gt)
+test_compute_kernel_with_ccs_mode(int num_gt, const char *kernel_name)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, num_slices;
@@ -139,7 +139,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
 					 gt, m, hwe->engine_instance);
-				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
+				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, kernel_name),
 					     "Unable to run compute kernel successfully\n");
 			}
 			drm_close_driver(fd);
@@ -163,7 +163,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, COMPUTE_SQUARE),
+		      "GPU not supported\n");
 }
 
 igt_main
@@ -186,5 +187,5 @@ igt_main
 		test_ccs_mode(num_gt);
 
 	igt_subtest("ccs-mode-compute-kernel")
-		test_compute_kernel_with_ccs_mode(num_gt);
+		test_compute_kernel_with_ccs_mode(num_gt, COMPUTE_SQUARE);
 }
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 31703638e..e4adefd2a 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -26,7 +26,8 @@
 static void
 test_compute_preempt(int fd)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, COMPUTE_SQUARE),
+		      "GPU not supported\n");
 }
 
 igt_main
-- 
2.39.3

