Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Tue, 10 Oct 2023 12:07:12 +0100
Message-Id: <20231010110714.749239-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
References: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tools/intel_gpu_top: Fix client layout
 on first sample period
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

When I moved the client name to be last, I did not account for the fact
current code skips showing engine utilisation until at least two sampling
periods have passed. Consequence of this is that client name gets printed
as the second field and not under the "NAME" column header.

Fix it by emitting spaces instead of engine utilisation until two samples
have been collected.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 60fe06917531..c5abd0c92155 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -928,12 +928,14 @@ static void free_display_clients(struct igt_drm_clients *clients)
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
-static void n_spaces(const unsigned int n)
+static unsigned int n_spaces(const unsigned int n)
 {
 	unsigned int i;
 
 	for (i = 0; i < n; i++)
 		putchar(' ');
+
+	return n;
 }
 
 static void
@@ -2043,14 +2045,17 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 
 		len = printf("%*s ", clients->max_pid_len, c->pid_str);
 
-		for (i = 0;
-		     c->samples > 1 && i <= iclients->classes.max_engine_id;
-		     i++) {
+		for (i = 0; i <= iclients->classes.max_engine_id; i++) {
 			double pct, max;
 
 			if (!iclients->classes.capacity[i])
 				continue;
 
+			if (c->samples < 2) {
+				len += n_spaces(*class_w);
+				continue;
+			}
+
 			pct = (double)c->val[i] / period_us / 1e3 * 100;
 
 			/*
-- 
2.39.2
