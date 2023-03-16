Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Thu, 16 Mar 2023 10:06:49 +0000
Message-Id: <20230316100649.1261221-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230316100649.1261221-1-tvrtko.ursulin@linux.intel.com>
References: <20230316100649.1261221-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] intel_gpu_top: Use full console width
 for global metrics
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

It appears we had an off by one of a kind where we were not using the full
width of the terminal window for the global metrics section.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 39be916297e4..36da016c3df0 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1960,8 +1960,7 @@ print_engines_header(struct engines *engines, double t,
 				a = "          ENGINE     BUSY  ";
 
 			printf("\033[7m%s%*s%s\033[0m\n",
-			       a, (int)(con_w - 1 - strlen(a) - strlen(b)),
-			       " ", b);
+			       a, (int)(con_w - strlen(a) - strlen(b)), " ", b);
 
 			lines++;
 		}
@@ -2000,7 +1999,6 @@ print_engine(struct engines *engines, unsigned int i, double t,
 	print_groups(groups);
 
 	if (output_mode == INTERACTIVE) {
-		unsigned int max_w = con_w - 1;
 		unsigned int len;
 		char buf[128];
 		double val;
@@ -2012,7 +2010,7 @@ print_engine(struct engines *engines, unsigned int i, double t,
 			      engine->display_name, engine_items[0].buf);
 
 		val = pmu_calc(&engine->busy.val, 1e9, t, 100);
-		print_percentage_bar(val, max_w > len ? max_w - len : 0, false);
+		print_percentage_bar(val, con_w > len ? con_w - len : 0, false);
 
 		printf("%s\n", buf);
 
-- 
2.37.2
