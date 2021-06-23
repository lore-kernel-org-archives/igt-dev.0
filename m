Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AE06E98E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 23:40:50 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Wed, 23 Jun 2021 16:40:46 -0700
Message-Id: <20210623234046.5715-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf: Enable perf OA tests for ADLP
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
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

ADLP and ADLS use the same OA metrics. Add ADLP support for OA tests.

Resolves: https://gitlab.freedesktop.org/drm/intel/-/issues/3551
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 9d5ab7a5..9cfa3bca 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -277,7 +277,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 		intel_perf_load_metrics_rkl(perf);
 	} else if (devinfo->is_dg1) {
 		intel_perf_load_metrics_dg1(perf);
-	} else if (devinfo->is_alderlake_s) {
+	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p) {
 		intel_perf_load_metrics_adl(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
