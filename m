Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 10 Feb 2021 09:37:54 +0000
Message-Id: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] intel_gpu_top: Wrap interactive header
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

Slight improvement with regards to wrapping header components to fit
console width. If a single element is wider than max it can still
overflow but it should now work better for practical console widths.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 81 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 13 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 21084185d896..63ef77056341 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1461,6 +1461,41 @@ static bool print_groups(struct cnt_group **groups)
 	return print_data;
 }
 
+static int __attribute__ ((format(__printf__, 6, 7)))
+print_header_token(const char *cont, int lines, int con_w, int con_h, int *rem,
+		   const char *fmt, ...)
+{
+	const char *indent = "\n   ";
+	char buf[256];
+	va_list args;
+	int ret;
+
+	if (lines >= con_h)
+		return lines;
+
+	va_start(args, fmt);
+	ret = vsnprintf(buf, sizeof(buf), fmt, args);
+	assert(ret < sizeof(buf));
+	va_end(args);
+
+	ret = (cont ? strlen(cont) : 0) + strlen(buf);
+	*rem -= ret;
+	if (*rem < 0) {
+		if (++lines >= con_h)
+			return lines;
+
+		*rem = con_w - ret - strlen(indent);
+		cont = indent;
+	}
+
+	if (cont)
+		ret = printf("%s%s", cont, buf);
+	else
+		ret = printf("%s", buf);
+
+	return lines;
+}
+
 static const char *header_msg;
 
 static int
@@ -1540,23 +1575,43 @@ print_header(const struct igt_device_card *card,
 	*consumed = print_groups(groups);
 
 	if (output_mode == INTERACTIVE) {
+		int rem = con_w;
+
 		printf("\033[H\033[J");
 
-		if (lines++ < con_h)
-			printf("intel-gpu-top: %s @ %s\n",
-			       codename, card->card);
-		if (lines++ < con_h) {
-			printf("%s/%s MHz; %s%% RC6; ",
-			       freq_items[1].buf, freq_items[0].buf,
-			       rc6_items[0].buf);
-			if (engines->r_gpu.present) {
-				printf("%s/%s W; ",
-				       power_items[0].buf,
-				       power_items[1].buf);
-			}
-			printf("%s irqs/s\n", irq_items[0].buf);
+		lines = print_header_token(NULL, lines, con_w, con_h, &rem,
+					   "intel-gpu-top:");
+
+		lines = print_header_token(" ", lines, con_w, con_h, &rem,
+					   "%s", codename);
+
+		lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
+					   "%s", card->card);
+
+		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
+					   "%s/%s MHz",
+					   freq_items[1].buf,
+					   freq_items[0].buf);
+
+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
+					   "%s%% RC6",
+					   rc6_items[0].buf);
+
+		if (engines->r_gpu.present) {
+			lines = print_header_token("; ", lines, con_w, con_h,
+						   &rem,
+						   "%s/%s W",
+						   power_items[0].buf,
+						   power_items[1].buf);
 		}
 
+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
+					   "%s irqs/s",
+					   irq_items[0].buf);
+
+		if (lines++ < con_h)
+			printf("\n");
+
 		if (lines++ < con_h) {
 			if (header_msg) {
 				printf(" >>> %s\n", header_msg);
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
