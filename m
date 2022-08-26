Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0371010E373
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 03:38:19 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 Aug 2022 09:03:46 +0530
Message-Id: <20220826033346.29780-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_busy: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the display state before starting
the new subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_busy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2a..3c3221e9 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -345,6 +345,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_require(gem_has_ring(fd, I915_EXEC_DEFAULT));
 
 		kmstest_set_vt_graphics_mode();
+		igt_display_reset(&data.master.display);
+		igt_display_commit(&data.master.display);
 		igt_display_require(&display, fd);
 		igt_display_require_output(&display);
 
-- 
2.36.0
