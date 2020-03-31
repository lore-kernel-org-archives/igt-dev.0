Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5E16E7FA
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 10:45:02 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 31 Mar 2020 16:03:25 +0530
Message-Id: <20200331103330.31211-2-anshuman.gupta@intel.com>
In-Reply-To: <20200331103330.31211-1-anshuman.gupta@intel.com>
References: <20200331103330.31211-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 1/6] tests/i915_pm_lpsp: rename non-edp
 test to non-edp-lpsp
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

HASWELL/BROADWELL tests non-edp panel for non-lpsp
i.e. tests HSW_GLOBAL power well should be enabled.
There is ROI to check whethter power well enabled,
if power well is not enabled then we would see all other
types of display issue in other igt test.

It make sense to rename the non-edp test to non-edp-lpsp
as on gen9+ non-edp panel can also drive lpsp.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 42938e10..5ef5fe71 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -221,7 +221,7 @@ igt_main
 		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
 	igt_subtest("edp-panel-fitter")
 		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
-	igt_subtest("non-edp")
+	igt_subtest("non-edp-lpsp")
 		non_edp_subtest(drm_fd, drm_res, drm_connectors);
 
 	igt_fixture {
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
