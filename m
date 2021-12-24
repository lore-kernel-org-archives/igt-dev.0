Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CBC10E3ED
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Dec 2021 10:36:53 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 24 Dec 2021 16:01:39 +0530
Message-Id: <20211224103139.61493-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] i915/perf: Enable perf OA tests for RPLS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RPLS and ADLS use the same OA metrics. Add RPLS support for OA tests.

Resolves: https://gitlab.freedesktop.org/drm/intel/-/issues/4808
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915/perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 9cfa3bca..98b2f29d 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -277,7 +277,8 @@ intel_perf_for_devinfo(uint32_t device_id,
 		intel_perf_load_metrics_rkl(perf);
 	} else if (devinfo->is_dg1) {
 		intel_perf_load_metrics_dg1(perf);
-	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p) {
+	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p ||
+		   devinfo->is_raptorlake_s) {
 		intel_perf_load_metrics_adl(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
-- 
2.31.1
