Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FBF10E63C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 18:57:59 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 20:57:31 +0200
Message-ID: <20231013185732.98000-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
References: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/i915/gem_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced gem_multigpu_count_class function that returns an actual
number of GPUs present in system, which allows for writing multi-GPU
test scenarios that does not require
--device pci:vendor=intel,device=discrete,card=all
to run as intended. Based on patch by Chris Wilson.

Introduced igt_multi_fork_foreach_gpu macro that helps with
writing multi-GPU test scenarios in idiomatic form:

igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
	test_function(i915);
igt_waitchildren();

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/gem_multigpu.c | 11 +++++++++++
 lib/i915/gem_multigpu.h | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/lib/i915/gem_multigpu.c b/lib/i915/gem_multigpu.c
index d4d2d3d6a..e4b739a9b 100644
--- a/lib/i915/gem_multigpu.c
+++ b/lib/i915/gem_multigpu.c
@@ -3,10 +3,21 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "drmtest.h"
 #include "i915/gem_multigpu.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 
+int gem_multigpu_count_class(int class)
+{
+	int count = 0;
+
+	igt_foreach_gpu(fd, class)
+		count++;
+
+	return count;
+}
+
 void gem_require_multigpu(int count)
 {
 	struct igt_devices_print_format fmt = {
diff --git a/lib/i915/gem_multigpu.h b/lib/i915/gem_multigpu.h
index 4bde96c15..feb4176fa 100644
--- a/lib/i915/gem_multigpu.h
+++ b/lib/i915/gem_multigpu.h
@@ -6,6 +6,22 @@
 #ifndef GEM_MULTIGPU_H
 #define GEM_MULTIGPU_H
 
+#include "igt_core.h"
+#include "igt_device_scan.h"
+
+int gem_multigpu_count_class(int class);
+
+#define igt_foreach_gpu(fd__, id__) \
+	for (int igt_unique(i) = 0, fd__; \
+		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >= 0; \
+		close(fd__))
+
+#define igt_multi_fork_foreach_gpu(__fd, id) \
+	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(id)) \
+		for (int __fd = drm_open_driver_another(igt_unique(__i), id); \
+			__fd >= 0; \
+			close(__fd), __fd = -1) \
+
 void gem_require_multigpu(int count);
 
 #endif /* GEM_MULTIGPU_H */
-- 
2.42.0
