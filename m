Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D93F6E7FE
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 10:45:04 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 31 Mar 2020 16:03:26 +0530
Message-Id: <20200331103330.31211-3-anshuman.gupta@intel.com>
In-Reply-To: <20200331103330.31211-1-anshuman.gupta@intel.com>
References: <20200331103330.31211-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/6] tests/i915_pm_lpsp: Nuke the
 panel-fitter test.
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
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

panel-fitter subtest is only applicable to HASWELL/BROADWELL.
It just test non-lpsp(lpsp disabled) when panel fitter is
enforced by std 1024x768 mode.
There is no ROI to test non-lpsp kind of thing,
If HSW_GLOBAL power well is not enabled we would see
other display issues in other display tests.

Gen9+ platform has display scaling feature in built per
pipe, as lpsp is all about low power single pipe (PIPE A)
usage, gen9+ platforms also don't require panel-fitter subtest.
This should save some CI cycles.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 5ef5fe71..744dd1d3 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -219,8 +219,6 @@ igt_main
 		screens_disabled_subtest(drm_fd, drm_res);
 	igt_subtest("edp-native")
 		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("edp-panel-fitter")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
 	igt_subtest("non-edp-lpsp")
 		non_edp_subtest(drm_fd, drm_res, drm_connectors);
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
