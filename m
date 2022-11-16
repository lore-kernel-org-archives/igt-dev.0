Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514D310E4E5
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 17:07:57 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Nov 2022 09:07:51 -0800
Message-Id: <20221116170751.195223-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: Propagate return from
 unsupported_i915_perf_platform
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

NULL return from unsupported_i915_perf_platform must be propagated up the
call stack to inform callers of intel_perf_for_devinfo and
intel_perf_for_fd.

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7358
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 28f37948e52..4a946906a84 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -366,7 +366,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 			intel_perf_load_metrics_tglgt2(perf);
 			break;
 		default:
-			unsupported_i915_perf_platform(perf);
+			return unsupported_i915_perf_platform(perf);
 		}
 	} else if (devinfo->is_rocketlake) {
 		intel_perf_load_metrics_rkl(perf);
@@ -391,7 +391,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 		else if (is_acm_gt3(&perf->devinfo))
 			intel_perf_load_metrics_acmgt3(perf);
 		else
-			unsupported_i915_perf_platform(perf);
+			return unsupported_i915_perf_platform(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
 	}
-- 
2.38.0
