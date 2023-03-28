Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Tue, 28 Mar 2023 13:54:29 +0100
Message-Id: <20230328125429.1970202-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230328125429.1970202-1-tvrtko.ursulin@linux.intel.com>
References: <20230328125429.1970202-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] intel_gpu_top: Show non-normalized
 client usage in numeric mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

When numeric display is selected in the interactive mode it is more
descriptive to show client's non-normalized (by number of engines per
class) usage. Rendering of the visual representation (bar) is kept the
same.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 36da016c3df0..b6827b3de9bd 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1275,14 +1275,14 @@ static void n_spaces(const unsigned int n)
 }
 
 static void
-print_percentage_bar(double percent, int max_len, bool numeric)
+print_percentage_bar(double percent, double max, int max_len, bool numeric)
 {
 	int bar_len, i, len = max_len - 2;
 	const int w = 8;
 
 	assert(max_len > 0);
 
-	bar_len = ceil(w * percent * len / 100.0);
+	bar_len = ceil(w * percent * len / max);
 	if (bar_len > w * len)
 		bar_len = w * len;
 
@@ -2010,7 +2010,8 @@ print_engine(struct engines *engines, unsigned int i, double t,
 			      engine->display_name, engine_items[0].buf);
 
 		val = pmu_calc(&engine->busy.val, 1e9, t, 100);
-		print_percentage_bar(val, con_w > len ? con_w - len : 0, false);
+		print_percentage_bar(val, 100.0, con_w > len ? con_w - len : 0,
+				     false);
 
 		printf("%s\n", buf);
 
@@ -2292,23 +2293,24 @@ print_client(struct client *c, struct engines *engines, double t, int lines,
 		       clients->max_name_len, c->print_name);
 
 		for (i = 0; c->samples > 1 && i < clients->num_classes; i++) {
-			double pct;
+			double pct, max;
 
 			if (!clients->class[i].num_engines)
 				continue; /* Assert in the ideal world. */
 
-			pct = (double)c->val[i] / period_us / 1e3 * 100 /
-			      clients->class[i].num_engines;
+			pct = (double)c->val[i] / period_us / 1e3 * 100;
 
 			/*
 			 * Guard against possible time-drift between sampling
 			 * client data and time we obtained our time-delta from
 			 * PMU.
 			 */
-			if (pct > 100.0)
-				pct = 100.0;
+			max = 100.0 * clients->class[i].num_engines;
+			if (pct > max)
+				pct = max;
 
-			print_percentage_bar(pct, *class_w, numeric_clients);
+			print_percentage_bar(pct, max, *class_w,
+					     numeric_clients);
 		}
 
 		putchar('\n');
-- 
2.37.2
