Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656FF6E0E4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2020 09:21:59 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Mon, 29 Jun 2020 11:21:06 +0200
Message-Id: <20200629092107.10664-5-dominik.grzegorzek@intel.com>
In-Reply-To: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
References: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] i915/gem_hang: Remove libdrm dependency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Libdrm removal from gem_hang using intel_bb.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_hang.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/tests/i915/gem_hang.c b/tests/i915/gem_hang.c
index 2c61cac0..7f461cb8 100644
--- a/tests/i915/gem_hang.c
+++ b/tests/i915/gem_hang.c
@@ -36,32 +36,29 @@
 #include <sys/stat.h>
 #include <sys/time.h>
 #include "drm.h"
-#include "intel_bufmgr.h"
 
-static drm_intel_bufmgr *bufmgr;
-struct intel_batchbuffer *batch;
 static int bad_pipe;
 
 static void
-gpu_hang(void)
+gpu_hang(struct intel_bb *ibb)
 {
 	int cmd;
 
 	cmd = bad_pipe ? MI_WAIT_FOR_PIPEB_SCAN_LINE_WINDOW :
 		MI_WAIT_FOR_PIPEA_SCAN_LINE_WINDOW;
 
-	BEGIN_BATCH(6, 0);
 	/* The documentation says that the LOAD_SCAN_LINES command
 	 * always comes in pairs. Don't ask me why. */
-	OUT_BATCH(MI_LOAD_SCAN_LINES_INCL | (bad_pipe << 20));
-	OUT_BATCH((0 << 16) | 2048);
-	OUT_BATCH(MI_LOAD_SCAN_LINES_INCL | (bad_pipe << 20));
-	OUT_BATCH((0 << 16) | 2048);
-	OUT_BATCH(MI_WAIT_FOR_EVENT | cmd);
-	OUT_BATCH(MI_NOOP);
-	ADVANCE_BATCH();
+	intel_bb_out(ibb, MI_LOAD_SCAN_LINES_INCL | (bad_pipe << 20));
+	intel_bb_out(ibb, (0 << 16) | 2048);
+	intel_bb_out(ibb, MI_LOAD_SCAN_LINES_INCL | (bad_pipe << 20));
+	intel_bb_out(ibb, (0 << 16) | 2048);
+	intel_bb_out(ibb, MI_WAIT_FOR_EVENT | cmd);
+	intel_bb_out(ibb, MI_NOOP);
 
-	intel_batchbuffer_flush(batch);
+	intel_bb_out_flush(ibb);
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      ibb->gen >= 6 ? I915_EXEC_BLT : 0, true);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -82,17 +79,13 @@ const char *help_str = "  -p\tDisabled pipe number\n";
 igt_simple_main_args("p:", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
+	struct intel_bb *ibb;
 
 	fd = drm_open_driver(DRIVER_INTEL);
+	ibb = intel_bb_create(fd, 4096);
 
-	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-	batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
-
-	gpu_hang();
-
-	intel_batchbuffer_free(batch);
-	drm_intel_bufmgr_destroy(bufmgr);
+	gpu_hang(ibb);
 
+	intel_bb_destroy(ibb);
 	close(fd);
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
