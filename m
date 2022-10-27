Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAE210E717
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:34 +0000
Message-Id: <20221027205535.12824-28-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 27/28] lib/i915: add new ACM/DG2 format
 in codegen
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

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf-configs/perf-metricset-codegen.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 00528c31..80b01be5 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -126,6 +126,19 @@ def generate_metric_sets(args, gen):
                 metric_set->c_offset = metric_set->b_offset + 8;
                 metric_set->perfcnt_offset = metric_set->c_offset + 8;
 
+            """))
+        elif gen.chipset.startswith("acm"):
+            c(textwrap.dedent("""\
+                metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+
+                metric_set->perf_raw_size = 256;
+                metric_set->gpu_time_offset = 0;
+                metric_set->gpu_clock_offset = 1;
+                metric_set->a_offset = 2;
+                metric_set->b_offset = metric_set->a_offset + 38;
+                metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->c_offset + 8;
+
             """))
         else:
             c(textwrap.dedent("""\
-- 
2.25.1
