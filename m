Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE0A10E8DF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 19:53:04 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 19:52:44 +0000
Message-Id: <20221028195258.106453-15-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
References: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 14/28] lib/i915/perf: implement report
 accumulation for new format
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

Available on XEHPSDV+.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 4d7fe43c..cc7dceea 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -778,6 +778,39 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 	memset(acc, 0, sizeof(*acc));
 
 	switch (oa_format) {
+	case I915_OA_FORMAT_A24u40_A14u32_B8_C8:
+		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
+		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
+
+		/* 4x 32bit A0-3 counters... */
+		for (i = 0; i < 4; i++)
+			accumulate_uint32(start + 4 + i, end + 4 + i, deltas + idx++);
+
+		/* 20x 40bit A4-23 counters... */
+		for (i = 0; i < 20; i++)
+			accumulate_uint40(i + 4, start, end, deltas + idx++);
+
+		/* 4x 32bit A24-27 counters... */
+		for (i = 0; i < 4; i++)
+			accumulate_uint32(start + 28 + i, end + 28 + i, deltas + idx++);
+
+		/* 4x 40bit A28-31 counters... */
+		for (i = 0; i < 4; i++)
+			accumulate_uint40(i + 28, start, end, deltas + idx++);
+
+		/* 5x 32bit A32-36 counters... */
+		for (i = 0; i < 5; i++)
+			accumulate_uint32(start + 36 + i, end + 36 + i, deltas + idx++);
+
+		/* 1x 32bit A37 counter... */
+		accumulate_uint32(start + 46, end + 46, deltas + idx++);
+
+		/* 8x 32bit B counters + 8x 32bit C counters... */
+		for (i = 0; i < 16; i++)
+			accumulate_uint32(start + 48 + i, end + 48 + i, deltas + idx++);
+		break;
+
+	case I915_OAR_FORMAT_A32u40_A4u32_B8_C8:
 	case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
 		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
 		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
-- 
2.25.1
