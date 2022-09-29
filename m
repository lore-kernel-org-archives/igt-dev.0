Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131E310EA35
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 03:26:46 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 06:26:40 +0300
Message-Id: <20220929032642.16556-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] tests/kms_frontbuffer_tracking:
 Check compression state on all gens
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The compression status has been available on all platforms
since commit 3fd5d1ecae2d ("drm/i915: Implement fbc_status
"Compressing" info for all platforms") in the kernel. Make
use of it.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 9518c706d87d..bdf718cf073a 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1415,17 +1415,11 @@ static bool fbc_supported_on_chipset(void)
 
 static void setup_fbc(void)
 {
-	int devid = intel_get_drm_devid(drm.fd);
-
 	if (!fbc_supported_on_chipset()) {
 		igt_info("Can't test FBC: not supported on this chipset\n");
 		return;
 	}
 
-	/* Early Generations are not able to report compression status. */
-	if (!AT_LEAST_GEN(devid, 7))
-		opt.fbc_check_compression = false;
-
 	fbc.can_test = true;
 
 	fbc_setup_last_action();
-- 
2.35.1
