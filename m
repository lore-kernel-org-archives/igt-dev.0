Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEDB10E110
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:27 -0700
Message-Id: <20230506005528.1890922-15-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 14/15] intel_gpu_top: Reduce one level of
 indent
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

Prepare to display gt specific items in INTERACTIVE mode with the -p
option. An additional for loop will push code more towards right, so
reduce one level of indent.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/intel_gpu_top.c | 74 ++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 8bcca67a6..0acc81e9e 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1944,7 +1944,7 @@ print_header(const struct igt_device_card *card,
 		&power_group,
 		NULL
 	};
-	int i;
+	int rem, i;
 
 	/*
 	 * If we have multi-gt and the user has specified -p options, show gt
@@ -1971,51 +1971,53 @@ print_header(const struct igt_device_card *card,
 
 	*consumed = print_groups(groups);
 
-	if (output_mode == INTERACTIVE) {
-		int rem = con_w;
+	if (output_mode != INTERACTIVE)
+		return lines;
 
-		printf("\033[H\033[J");
+	/* INTERACTIVE MODE */
+	rem = con_w;
 
-		lines = print_header_token(NULL, lines, con_w, con_h, &rem,
-					   "intel-gpu-top:");
+	printf("\033[H\033[J");
 
-		lines = print_header_token(" ", lines, con_w, con_h, &rem,
-					   "%s", codename);
+	lines = print_header_token(NULL, lines, con_w, con_h, &rem,
+				   "intel-gpu-top:");
 
-		lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
-					   "%s", card->card);
+	lines = print_header_token(" ", lines, con_w, con_h, &rem,
+				   "%s", codename);
 
-		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
-					   "%s/%s MHz",
-					   freq_items[1].buf,
-					   freq_items[0].buf);
+	lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
+				   "%s", card->card);
 
-		lines = print_header_token("; ", lines, con_w, con_h, &rem,
-					   "%s%% RC6",
-					   rc6_items[0].buf);
+	lines = print_header_token(" - ", lines, con_w, con_h, &rem,
+				   "%s/%s MHz",
+				   freq_items[1].buf,
+				   freq_items[0].buf);
 
-		if (engines->r_gpu.present) {
-			lines = print_header_token("; ", lines, con_w, con_h,
-						   &rem,
-						   "%s/%s W",
-						   power_items[0].buf,
-						   power_items[1].buf);
-		}
+	lines = print_header_token("; ", lines, con_w, con_h, &rem,
+				   "%s%% RC6",
+				   rc6_items[0].buf);
 
-		lines = print_header_token("; ", lines, con_w, con_h, &rem,
-					   "%s irqs/s",
-					   irq_items[0].buf);
+	if (engines->r_gpu.present) {
+		lines = print_header_token("; ", lines, con_w, con_h,
+					   &rem,
+					   "%s/%s W",
+					   power_items[0].buf,
+					   power_items[1].buf);
+	}
 
-		if (lines++ < con_h)
-			printf("\n");
+	lines = print_header_token("; ", lines, con_w, con_h, &rem,
+				   "%s irqs/s",
+				   irq_items[0].buf);
 
-		if (lines++ < con_h) {
-			if (header_msg) {
-				printf(" >>> %s\n", header_msg);
-				header_msg = NULL;
-			} else {
-				printf("\n");
-			}
+	if (lines++ < con_h)
+		printf("\n");
+
+	if (lines++ < con_h) {
+		if (header_msg) {
+			printf(" >>> %s\n", header_msg);
+			header_msg = NULL;
+		} else {
+			printf("\n");
 		}
 	}
 
-- 
2.34.1
