Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed,  3 Feb 2021 11:44:55 +0000
Message-Id: <20210203114456.895974-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] intel_gpu_top: Show banner messages
 when cycling sort modes
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is useful to let the user know what is the currently active sort mode.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 584aa21b198a..b409106f3718 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1479,6 +1479,8 @@ print_header_token(const char *cont, int lines, int con_w, int con_h, int *rem,
 	return lines;
 }
 
+static const char *header_msg;
+
 static int
 print_header(const struct igt_device_card *card,
 	     const char *codename,
@@ -1593,8 +1595,14 @@ print_header(const struct igt_device_card *card,
 		if (lines++ < con_h)
 			printf("\n");
 
-		if (lines++ < con_h)
-			printf("\n");
+		if (lines++ < con_h) {
+			if (header_msg) {
+				printf(" >>> %s\n", header_msg);
+				header_msg = NULL;
+			} else {
+				printf("\n");
+			}
+		}
 	}
 
 	return lines;
@@ -2146,12 +2154,15 @@ static void select_client_sort(void)
 	switch (++client_sort % 3) {
 	case 0:
 		client_cmp = client_last_cmp;
+		header_msg = "Sorting clients by current GPU usage.";
 		break;
 	case 1:
 		client_cmp = client_total_cmp;
+		header_msg = "Sorting clients by accummulated GPU usage.";
 		break;
 	case 2:
 		client_cmp = client_id_cmp;
+		header_msg = "Sorting clients by sysfs id.";
 	}
 }
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
