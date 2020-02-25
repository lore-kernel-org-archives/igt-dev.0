Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6D6EA9A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 11:22:22 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 25 Feb 2020 13:22:18 +0200
Message-Id: <20200225112218.1532204-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: return NULL when platform is
 not supported
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
List-ID: <igt-dev@lists.freedesktop.org>

Instead of asserting.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 5b5b7f90..a5dd3eab 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -116,6 +116,13 @@ eu_available(const struct drm_i915_query_topology_info *topo,
 			   eu / 8] >> (eu % 8)) & 1;
 }
 
+static struct intel_perf *
+unsupported_i915_perf_platform(struct intel_perf *perf)
+{
+	intel_perf_free(perf);
+	return NULL;
+}
+
 struct intel_perf *
 intel_perf_for_devinfo(uint32_t device_id,
 		       uint32_t revision,
@@ -193,7 +200,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 			intel_perf_load_metrics_sklgt4(perf);
 			break;
 		default:
-			assert(0); /* unreachable */
+			return unsupported_i915_perf_platform(perf);
 		}
 	} else if (devinfo->is_broxton) {
 		perf->devinfo.eu_threads_count = 6;
@@ -207,7 +214,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 			intel_perf_load_metrics_kblgt3(perf);
 			break;
 		default:
-			assert(0); /* unreachable */
+			return unsupported_i915_perf_platform(perf);
 		}
 	} else if (devinfo->is_geminilake) {
 		perf->devinfo.eu_threads_count = 6;
@@ -221,7 +228,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 			intel_perf_load_metrics_cflgt3(perf);
 			break;
 		default:
-			assert(0); /* unreachable */
+			return unsupported_i915_perf_platform(perf);
 		}
 	} else if (devinfo->is_cannonlake) {
 		intel_perf_load_metrics_cnl(perf);
@@ -232,7 +239,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 	} else if (devinfo->is_tigerlake) {
 		intel_perf_load_metrics_tgl(perf);
 	} else {
-		assert(0); /* unreachable */
+		return unsupported_i915_perf_platform(perf);
 	}
 
 	return perf;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
