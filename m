Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1620F6E89B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 10:44:34 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 12 May 2020 16:04:10 +0530
Message-Id: <20200512103415.28968-2-anshuman.gupta@intel.com>
In-Reply-To: <20200512103415.28968-1-anshuman.gupta@intel.com>
References: <20200512103415.28968-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 1/6] tests/i915_pm_lpsp: Nuke the
 panel-fitter test
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

panel-fitter subtest is only applicable to HASWELL/BROADWELL.
It just tests non-lpsp(lpsp disabled) when panel fitter is
enforced by std 1024x768 mode.
There is no ROI to test non-lpsp kind of thing,
If HSW_GLOBAL power well is not enabled we would see
other display issues in other display tests.

Gen9+ platform has display scaling feature in built per
pipe, as lpsp is all about low power single pipe (PIPE A)
usage, gen9+ platforms also don't require panel-fitter subtest.
This should save some CI cycles.

Reviewed-by: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 42938e10..08f82e7c 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -219,8 +219,6 @@ igt_main
 		screens_disabled_subtest(drm_fd, drm_res);
 	igt_subtest("edp-native")
 		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("edp-panel-fitter")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
 	igt_subtest("non-edp")
 		non_edp_subtest(drm_fd, drm_res, drm_connectors);
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
