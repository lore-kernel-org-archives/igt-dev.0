Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685910E41C
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:08 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:46 +0200
Message-Id: <20230817094652.40243-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] lib/intel_compute: Migrate xe_compute
 library to intel_compute
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

During my work on adding xe-compute support to DG2 I hit some issues
on Xe driver so instead of limiting workload to Xe only I decided to
handle i915 as well. Such attitude might be handy on driver feature
status comparison.

Patch does preparation step to share the code between i915 and Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/{xe/xe_compute.c => intel_compute.c}       | 18 +++++++++---------
 lib/{xe/xe_compute.h => intel_compute.h}       | 12 ++++++------
 ...ernels.c => intel_compute_square_kernels.c} |  4 ++--
 lib/meson.build                                |  4 ++--
 tests/xe/xe_compute.c                          |  4 ++--
 5 files changed, 21 insertions(+), 21 deletions(-)
 rename lib/{xe/xe_compute.c => intel_compute.c} (97%)
 rename lib/{xe/xe_compute.h => intel_compute.h} (74%)
 rename lib/{xe/xe_compute_square_kernels.c => intel_compute_square_kernels.c} (97%)

diff --git a/lib/xe/xe_compute.c b/lib/intel_compute.c
similarity index 97%
rename from lib/xe/xe_compute.c
rename to lib/intel_compute.c
index 3e8112a048..647bce0e43 100644
--- a/lib/xe/xe_compute.c
+++ b/lib/intel_compute.c
@@ -13,7 +13,7 @@
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 
-#include "xe_compute.h"
+#include "intel_compute.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -453,24 +453,24 @@ static const struct {
 	unsigned int ip_ver;
 	void (*compute_exec)(int fd, const unsigned char *kernel,
 			     unsigned int size);
-} xe_compute_batches[] = {
+} compute_batches[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
 		.compute_exec = tgl_compute_exec,
 	},
 };
 
-bool run_xe_compute_kernel(int fd)
+bool run_compute_kernel(int fd)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
-	const struct xe_compute_kernels *kernels = xe_compute_square_kernels;
+	const struct compute_kernels *kernels = compute_square_kernels;
 
-	for (batch = 0; batch < ARRAY_SIZE(xe_compute_batches); batch++) {
-		if (ip_ver == xe_compute_batches[batch].ip_ver)
+	for (batch = 0; batch < ARRAY_SIZE(compute_batches); batch++) {
+		if (ip_ver == compute_batches[batch].ip_ver)
 			break;
 	}
-	if (batch == ARRAY_SIZE(xe_compute_batches))
+	if (batch == ARRAY_SIZE(compute_batches))
 		return false;
 
 	while (kernels->kernel) {
@@ -481,8 +481,8 @@ bool run_xe_compute_kernel(int fd)
 	if (!kernels->kernel)
 		return 1;
 
-	xe_compute_batches[batch].compute_exec(fd, kernels->kernel,
-					       kernels->size);
+	compute_batches[batch].compute_exec(fd, kernels->kernel,
+					    kernels->size);
 
 	return true;
 }
diff --git a/lib/xe/xe_compute.h b/lib/intel_compute.h
similarity index 74%
rename from lib/xe/xe_compute.h
rename to lib/intel_compute.h
index b2e7e98278..e271bb5254 100644
--- a/lib/xe/xe_compute.h
+++ b/lib/intel_compute.h
@@ -6,8 +6,8 @@
  *    Francois Dugast <francois.dugast@intel.com>
  */
 
-#ifndef XE_COMPUTE_H
-#define XE_COMPUTE_H
+#ifndef INTEL_COMPUTE_H
+#define INTEL_COMPUTE_H
 
 /*
  * OpenCL Kernels are generated using:
@@ -19,14 +19,14 @@
  * For each GPU model desired. A list of supported models can be obtained with: ocloc compile --help
  */
 
-struct xe_compute_kernels {
+struct compute_kernels {
 	int ip_ver;
 	unsigned int size;
 	const unsigned char *kernel;
 };
 
-extern const struct xe_compute_kernels xe_compute_square_kernels[];
+extern const struct compute_kernels compute_square_kernels[];
 
-bool run_xe_compute_kernel(int fd);
+bool run_compute_kernel(int fd);
 
-#endif	/* XE_COMPUTE_H */
+#endif	/* INTEL_COMPUTE_H */
diff --git a/lib/xe/xe_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
similarity index 97%
rename from lib/xe/xe_compute_square_kernels.c
rename to lib/intel_compute_square_kernels.c
index f9c07dc778..b30d8a23dd 100644
--- a/lib/xe/xe_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -8,7 +8,7 @@
  */
 
 #include "intel_chipset.h"
-#include "lib/xe/xe_compute.h"
+#include "lib/intel_compute.h"
 
 static const unsigned char tgllp_kernel_square_bin[] = {
 	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
@@ -61,7 +61,7 @@ static const unsigned char tgllp_kernel_square_bin[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-const struct xe_compute_kernels xe_compute_square_kernels[] = {
+const struct compute_kernels compute_square_kernels[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
 		.size = sizeof(tgllp_kernel_square_bin),
diff --git a/lib/meson.build b/lib/meson.build
index ce11c0715f..b82714cd6a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -56,6 +56,8 @@ lib_sources = [
 	'intel_bufops.c',
 	'intel_chipset.c',
 	'intel_cmds_info.c',
+	'intel_compute.c',
+	'intel_compute_square_kernels.c',
 	'intel_ctx.c',
 	'intel_device_info.c',
 	'intel_mmio.c',
@@ -101,8 +103,6 @@ lib_sources = [
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-	'xe/xe_compute.c',
-	'xe/xe_compute_square_kernels.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 2cf536701a..0c54fbec42 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -14,8 +14,8 @@
 #include <string.h>
 
 #include "igt.h"
+#include "intel_compute.h"
 #include "xe/xe_query.h"
-#include "xe/xe_compute.h"
 
 /**
  * SUBTEST: compute-square
@@ -29,7 +29,7 @@
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_xe_compute_kernel(fd), "GPU not supported\n");
+	igt_require_f(run_compute_kernel(fd), "GPU not supported\n");
 }
 
 igt_main
-- 
2.34.1
