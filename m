Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C96010E71E
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:44 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:34 -0700
Message-Id: <20230513022234.2832233-16-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 15/15] intel_gpu_top: Add gt specific values
 to header in interactive mode
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

If -p options is specified in INTERACTIVE mode, show the gt specific
values.

v2: Reformat GT info for INTERACTIVE mode (Tvrtko)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 0acc81e9e..ddaf128c0 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1988,14 +1988,31 @@ print_header(const struct igt_device_card *card,
 	lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
 				   "%s", card->card);
 
-	lines = print_header_token(" - ", lines, con_w, con_h, &rem,
-				   "%s/%s MHz",
-				   freq_items[1].buf,
-				   freq_items[0].buf);
-
-	lines = print_header_token("; ", lines, con_w, con_h, &rem,
-				   "%s%% RC6",
-				   rc6_items[0].buf);
+	if (class_view || engines->num_gts == 1) {
+		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
+					   "%s/%s MHz",
+					   freq_items[1].buf,
+					   freq_items[0].buf);
+
+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
+					   "%s%% RC6",
+					   rc6_items[0].buf);
+	} else {
+		for (i = 0; i < engines->num_gts; i++) {
+			const char *cont = !i ? " - ": "; ";
+
+			lines = print_header_token(cont, lines, con_w, con_h, &rem,
+						   "%s/%s MHz GT%d",
+						   freq_items_gt[i * 4 + 1].buf,
+						   freq_items_gt[i * 4 + 0].buf,
+						   i);
+
+			lines = print_header_token("; ", lines, con_w, con_h, &rem,
+						   "%s%% RC6 GT%d",
+						   rc6_items_gt[i * 3].buf,
+						   i);
+		}
+	}
 
 	if (engines->r_gpu.present) {
 		lines = print_header_token("; ", lines, con_w, con_h,
-- 
2.36.1
