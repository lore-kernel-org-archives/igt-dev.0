Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C14710E48D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 21:25:47 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 14:25:37 -0700
Message-Id: <20230517212542.3681862-11-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/15] intel_gpu_top: Add definitions for
 gt-specific items and groups
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

Prepare to pass a modified groups array to print_groups by defining
separate items and groups for each gt.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 88c876dfe..c8b6b92dd 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1436,6 +1436,30 @@ print_header(const struct igt_device_card *card,
 		.display_name = "Freq MHz",
 		.items = freq_items,
 	};
+	struct cnt_item freq_items_gt[] = {
+		{ &engines->freq_req_gt[0], 6, 0, 1.0, t, 1, "requested", "req" },
+		{ &engines->freq_act_gt[0], 6, 0, 1.0, t, 1, "actual", "act" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
+		{ },
+		{ &engines->freq_req_gt[1], 6, 0, 1.0, t, 1, "requested", "req" },
+		{ &engines->freq_act_gt[1], 6, 0, 1.0, t, 1, "actual", "act" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
+		{ },
+		{ &engines->freq_req_gt[2], 6, 0, 1.0, t, 1, "requested", "req" },
+		{ &engines->freq_act_gt[2], 6, 0, 1.0, t, 1, "actual", "act" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
+		{ },
+		{ &engines->freq_req_gt[3], 6, 0, 1.0, t, 1, "requested", "req" },
+		{ &engines->freq_act_gt[3], 6, 0, 1.0, t, 1, "actual", "act" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
+		{ },
+	};
+	struct cnt_group freq_group_gt[MAX_GTS] = {
+		{ .name = "frequency-gt0", .display_name = "Freq GT0 MHz", .items = &freq_items_gt[0] },
+		{ .name = "frequency-gt1", .display_name = "Freq GT1 MHz", .items = &freq_items_gt[4] },
+		{ .name = "frequency-gt2", .display_name = "Freq GT2 MHz", .items = &freq_items_gt[8] },
+		{ .name = "frequency-gt3", .display_name = "Freq GT3 MHz", .items = &freq_items_gt[12] },
+	};
 	struct cnt_item irq_items[] = {
 		{ &engines->irq, 8, 0, 1.0, t, 1, "count", "/s" },
 		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "irq/s" },
@@ -1456,6 +1480,26 @@ print_header(const struct igt_device_card *card,
 		.display_name = "RC6",
 		.items = rc6_items,
 	};
+	struct cnt_item rc6_items_gt[] = {
+		{ &engines->rc6_gt[0], 8, 0, 1e9, t, 100, "value", "%" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
+		{ },
+		{ &engines->rc6_gt[1], 8, 0, 1e9, t, 100, "value", "%" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
+		{ },
+		{ &engines->rc6_gt[2], 8, 0, 1e9, t, 100, "value", "%" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
+		{ },
+		{ &engines->rc6_gt[3], 8, 0, 1e9, t, 100, "value", "%" },
+		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
+		{ },
+	};
+	struct cnt_group rc6_group_gt[MAX_GTS] = {
+		{ .name = "rc6-gt0", .display_name = "RC6 GT0", .items = &rc6_items_gt[0] },
+		{ .name = "rc6-gt1", .display_name = "RC6 GT1", .items = &rc6_items_gt[3] },
+		{ .name = "rc6-gt2", .display_name = "RC6 GT2", .items = &rc6_items_gt[6] },
+		{ .name = "rc6-gt3", .display_name = "RC6 GT3", .items = &rc6_items_gt[9] },
+	};
 	struct cnt_item power_items[] = {
 		{ &engines->r_gpu, 4, 2, 1.0, t, engines->r_gpu.scale, "GPU", "gpu" },
 		{ &engines->r_pkg, 4, 2, 1.0, t, engines->r_pkg.scale, "Package", "pkg" },
-- 
2.36.1
