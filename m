Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786C710E99D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 13:00:03 -0800
Message-Id: <20230214210007.2026033-27-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 26/30] lib/perf: Update MTL OA timestamp and EU
 thread config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

MTL has configuration similar to DG2 for OA timestamp and threads per
EU. Update the same for MTL.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d8624dc0..24ef3819 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -432,6 +432,14 @@ intel_perf_for_devinfo(uint32_t device_id,
 		else
 			return unsupported_i915_perf_platform(perf);
 	} else if (devinfo->is_meteorlake) {
+		perf->devinfo.eu_threads_count = 8;
+		/* OA reports have the timestamp value shifted to the
+		 * right by 1 bits, it also means we cannot use the
+		 * top bit for comparison.
+		 */
+		perf->devinfo.oa_timestamp_shift = -1;
+		perf->devinfo.oa_timestamp_mask = 0x7fffffff;
+
 		if (is_mtl_gt2(&perf->devinfo))
 			intel_perf_load_metrics_mtlgt2(perf);
 		else if (is_mtl_gt3(&perf->devinfo))
-- 
2.36.1
