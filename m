Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38810E8D6
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 19:53:05 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 19:52:58 +0000
Message-Id: <20221028195258.106453-29-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
References: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 28/28] lib/i915/perf: configure OA
 timestamp shift and mask for ACM
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

OA reports have the timestamp value shifted to the right by 1 bits, it
also means we cannot use the top bit for comparison. Configure OA
timestamp shift and mask for ACM.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index fa291998..28f37948 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -377,6 +377,12 @@ intel_perf_for_devinfo(uint32_t device_id,
 		intel_perf_load_metrics_adl(perf);
 	} else if (devinfo->is_dg2) {
 		perf->devinfo.eu_threads_count = 8;
+		/* OA reports have the timestamp value shifted to the
+		 * right by 1 bits, it also means we cannot use the
+		 * top bit for comparison.
+		 */
+		perf->devinfo.oa_timestamp_shift = -1;
+		perf->devinfo.oa_timestamp_mask = 0x7fffffff;
 
 		if (is_acm_gt1(&perf->devinfo))
 			intel_perf_load_metrics_acmgt1(perf);
-- 
2.25.1
