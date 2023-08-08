Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B56510E155
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:25 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:16 -0700
Message-ID: <20230808010017.37819-20-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 19/20] tests/i915/perf: Use engine_id in
 gen12_test_mi_rpc for xe
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

xe uapi needs an engine_id, not a gem context id.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index cd1087b2e954..193b903799ce 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -45,6 +45,7 @@
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "drm.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
 /**
@@ -3593,6 +3594,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	struct intel_buf *buf;
 #define INVALID_CTX_ID 0xffffffff
 	uint32_t ctx_id = INVALID_CTX_ID;
+	uint32_t vm = 0;
 	uint32_t *report32;
 	size_t format_size_32;
 	struct oa_format format = get_oa_format(fmt);
@@ -3601,11 +3603,16 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	bops = buf_ops_create(drm_fd);
-	ctx_id = gem_context_create(drm_fd);
+	if (is_xe_device(drm_fd)) {
+		vm = xe_vm_create(drm_fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		ctx_id = xe_exec_queue_create(drm_fd, vm, xe_hw_engine(drm_fd, 0), 0);
+	} else {
+		ctx_id = gem_context_create(drm_fd);
+	}
 	igt_assert_neq(ctx_id, INVALID_CTX_ID);
 	properties[1] = ctx_id;
 
-	ibb = intel_bb_create_with_context(drm_fd, ctx_id, 0, NULL, BATCH_SZ);
+	ibb = intel_bb_create_with_context(drm_fd, ctx_id, vm, NULL, BATCH_SZ);
 	buf = intel_buf_create(bops, 4096, 1, 8, 64,
 			       I915_TILING_NONE, I915_COMPRESSION_NONE);
 
@@ -3650,7 +3657,12 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	intel_buf_unmap(buf);
 	intel_buf_destroy(buf);
 	intel_bb_destroy(ibb);
-	gem_context_destroy(drm_fd, ctx_id);
+	if (is_xe_device(drm_fd)) {
+		xe_exec_queue_destroy(drm_fd, ctx_id);
+		xe_vm_destroy(drm_fd, vm);
+	} else {
+		gem_context_destroy(drm_fd, ctx_id);
+	}
 	buf_ops_destroy(bops);
 	__perf_close(stream_fd);
 }
-- 
2.41.0
