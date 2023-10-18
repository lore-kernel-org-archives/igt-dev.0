Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AD710E360
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 08:05:31 +0000 (UTC)
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:59:04 +0800
Message-Id: <20231018075904.1834634-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [[PATCH i-g-t]] tests/kms_setmode: disable DRRS if eDP
 support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Below is a failed case while testing kms_setmode.

CRTC[80] [Pipe A] Mode: 1920x1200@60Hz Connectors: eDP-1[236]
Expected frametime: 16659us; measured 20824.4us +- 4.799us accuracy 0.01% [0.10 scanlines]

The expected frame time is 16659us (60Hz refresh rate).
But kms_setmode report measured time was 20824.4us (48Hz) then
it failed. We found legacy DRRS mode was active at that time
then refresh rate fall into lower RR automatically to cause this problem.
Disable DRRS after crtc setmode can avoid driver switch to lower RR mode
and get pass for this test as well.

Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_setmode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 5fc4421c0080..b6fe3f9c159a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -31,6 +31,7 @@
 #include <sys/time.h>
 #include <math.h>
 #include "xe/xe_query.h"
+#include "i915/intel_drrs.h"
 /**
  * TEST: kms setmode
  * Category: Display
@@ -651,6 +652,9 @@ retry:
 					     crtc->fb_info.fb_id, 0, 0, ids,
 					     crtc->connector_count, &crtc->mode);
 
+		if (is_intel_device(drm_fd))
+			intel_drrs_disable(drm_fd, crtc->pipe_id);
+
 		free(ids);
 
 		if (ret < 0) {
-- 
2.34.1
