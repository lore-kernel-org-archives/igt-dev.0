Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Mon,  1 Feb 2021 10:45:23 +0000
Message-Id: <20210201104524.875560-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210201104524.875560-1-tvrtko.ursulin@linux.intel.com>
References: <20210201104524.875560-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top: Add option to hide
 inactive clients
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

Allow hiding inactive clients (used no GPU time ever) in interactive mode
by pressing 'i'.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 man/intel_gpu_top.rst | 1 +
 tools/intel_gpu_top.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index b18fd9675bb7..118d8b953a70 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -57,6 +57,7 @@ Supported keys:
     '1'    Toggle between aggregated engine class and physical engine mode.
     'n'    Toggle display of numeric client busyness overlay.
     's'    Toggle between sort modes (runtime, total runtime, client id).
+    'i'    Toggle display of clients which used no GPU time.
 
 DEVICE SELECTION
 ================
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 60ff62d28e5d..dffc6ebecc57 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1933,6 +1933,7 @@ print_clients_header(struct clients *clients, int lines,
 }
 
 static bool numeric_clients;
+static bool filter_idle;
 
 static int
 print_client(struct client *c, struct engines *engines, double t, int lines,
@@ -1942,6 +1943,9 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
 	unsigned int i;
 
 	if (output_mode == INTERACTIVE) {
+		if (filter_idle && !c->total_runtime)
+			return lines;
+
 		lines++;
 
 		printf("%6u %17s ", c->pid, c->print_name);
@@ -2118,6 +2122,9 @@ static void process_stdin(unsigned int timeout_us)
 		case '1':
 			class_view ^= true;
 			break;
+		case 'i':
+			filter_idle ^= true;
+			break;
 		case 'n':
 			numeric_clients ^= true;
 			break;
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
