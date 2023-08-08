Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031510E392
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:15 -0700
Message-ID: <20230808010017.37819-19-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 18/20] tests/i915/perf: Fix buf_map for xe
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

buf_map for xe should use xe_bo_map. Also change gen12_test_mi_rpc to use
buf_map instead of intel_buf_cpu_map.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 27408e7909f5..cd1087b2e954 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -901,15 +901,19 @@ oar_unit_default_format(void)
  * Temporary wrapper to distinguish mappings on !llc platforms,
  * where it seems cache over GEM_MMAP_OFFSET is not flushed before execution.
  */
-static void *buf_map(int i915, struct intel_buf *buf, bool write)
+static void *buf_map(int fd, struct intel_buf *buf, bool write)
 {
 	void *p;
 
-	if (gem_has_llc(i915))
-		p = intel_buf_cpu_map(buf, write);
-	else
-		p = intel_buf_device_map(buf, write);
-
+	if (is_xe_device(fd)) {
+		buf->ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+		p = buf->ptr;
+	} else {
+		if (gem_has_llc(fd))
+			p = intel_buf_cpu_map(buf, write);
+		else
+			p = intel_buf_device_map(buf, write);
+	}
 	return p;
 }
 
@@ -3620,7 +3624,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	intel_bb_flush_render(ibb);
 	intel_bb_sync(ibb);
 
-	intel_buf_cpu_map(buf, false);
+	buf_map(drm_fd, buf, false);
 	report32 = buf->ptr;
 	format_size_32 = format.size >> 2;
 	dump_report(report32, format_size_32, "mi-rpc");
-- 
2.41.0
