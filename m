Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E24910E146
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:28 -0700
Message-Id: <20230506005528.1890922-16-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/intel_gpu_top.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 0acc81e9e..7018499c7 100644
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
+						   "%s/%s MHz(gt%d)",
+						   freq_items_gt[i * 4 + 1].buf,
+						   freq_items_gt[i * 4 + 0].buf,
+						   i);
+
+			lines = print_header_token("; ", lines, con_w, con_h, &rem,
+						   "%s%% RC6(gt%d)",
+						   rc6_items_gt[i * 3].buf,
+						   i);
+		}
+	}
 
 	if (engines->r_gpu.present) {
 		lines = print_header_token("; ", lines, con_w, con_h,
-- 
2.34.1
