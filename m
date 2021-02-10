Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 10 Feb 2021 09:37:56 +0000
Message-Id: <20210210093756.61424-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] intel_gpu_top: Interactive help screen
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

Show a list of supported interactive commands when pressing 'h'.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 man/intel_gpu_top.rst |  1 +
 tools/intel_gpu_top.c | 68 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 20658e291db0..f6d74852558b 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -54,6 +54,7 @@ RUNTIME CONTROL
 Supported keys:
 
     'q'    Exit from the tool.
+    'h'    Show interactive help.
     '1'    Toggle between aggregated engine class and physical engine mode.
     'n'    Toggle display of numeric client busyness overlay.
     's'    Toggle between sort modes (runtime, total runtime, pid, client id).
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 018e28a66c10..c0e45ddb24e1 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2255,19 +2255,31 @@ static void select_client_sort(void)
 	header_msg = cmp[client_sort].msg;
 }
 
-static void process_stdin(unsigned int timeout_us)
+static bool in_help;
+
+static void process_help_stdin(void)
 {
-	struct pollfd p = { .fd = 0, .events = POLLIN };
-	int ret;
+	for (;;) {
+		int ret;
+		char c;
 
-	ret = poll(&p, 1, timeout_us / 1000);
-	if (ret <= 0) {
-		if (ret < 0)
-			stop_top = true;
-		return;
+		ret = read(0, &c, 1);
+		if (ret <= 0)
+			break;
+
+		switch (c) {
+		case 'q':
+		case 'h':
+			in_help = false;
+			break;
+		};
 	}
+}
 
+static void process_normal_stdin(void)
+{
 	for (;;) {
+		int ret;
 		char c;
 
 		ret = read(0, &c, 1);
@@ -2298,6 +2310,9 @@ static void process_stdin(unsigned int timeout_us)
 		case 's':
 			select_client_sort();
 			break;
+		case 'h':
+			in_help = true;
+			break;
 		case 'H':
 			aggregate_pids ^= true;
 			if (aggregate_pids)
@@ -2309,6 +2324,38 @@ static void process_stdin(unsigned int timeout_us)
 	}
 }
 
+static void process_stdin(unsigned int timeout_us)
+{
+	struct pollfd p = { .fd = 0, .events = POLLIN };
+	int ret;
+
+	ret = poll(&p, 1, timeout_us / 1000);
+	if (ret <= 0) {
+		if (ret < 0)
+			stop_top = true;
+		return;
+	}
+
+	if (in_help)
+		process_help_stdin();
+	else
+		process_normal_stdin();
+}
+
+static void show_help_screen(void)
+{
+	printf(
+"Help for interactive commands:\n\n"
+"    '1'    Toggle between aggregated engine class and physical engine mode.\n"
+"    'n'    Toggle display of numeric client busyness overlay.\n"
+"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
+"    'i'    Toggle display of clients which used no GPU time.\n"
+"    'H'    Toggle between per PID aggregation and individual clients.\n"
+"\n"
+"    'h' or 'q'    Exit interactive help.\n"
+"\n");
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
@@ -2491,6 +2538,11 @@ int main(int argc, char **argv)
 					     t, lines, con_w, con_h,
 					     &consumed);
 
+			if (in_help) {
+				show_help_screen();
+				break;
+			}
+
 			lines = print_imc(engines, t, lines, con_w, con_h);
 
 			lines = print_engines(engines, t, lines, con_w, con_h);
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
