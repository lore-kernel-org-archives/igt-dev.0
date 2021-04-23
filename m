Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5A56EB4E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:54 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:40 +0300
Message-Id: <20210423074444.175199-5-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/8] lib/i915/perf-config: document devinfo
 fields
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

Some of those fields name might not be obvious.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 99de12e5d..6a39be921 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -56,11 +56,17 @@ struct intel_perf_devinfo {
 	uint64_t gt_min_freq;
 	uint64_t gt_max_freq;
 
+	/* Total number of EUs */
 	uint64_t n_eus;
+	/* Total number of EUs in a slice */
 	uint64_t n_eu_slices;
+	/* Total number of subslices/dualsubslices */
 	uint64_t n_eu_sub_slices;
+	/* Mask of available subslices/dualsubslices */
 	uint64_t subslice_mask;
+	/* Mask of available slices */
 	uint64_t slice_mask;
+	/* Number of threads in one EU */
 	uint64_t eu_threads_count;
 };
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
