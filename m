Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Thu, 27 Jul 2023 10:20:25 +0100
Message-Id: <20230727092025.1895728-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230727092025.1895728-1-tvrtko.ursulin@linux.intel.com>
References: <20230727092025.1895728-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] gputop: Add memory information
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Show total and resident memory usage for clients which support it.

For simplicity all memory regions are summed up and shown under a single
heading.

v2:
 * Use unsigned int and not just unsigned in print_size. (Kamil)

Co-developed-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/gputop.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 681f0a6bb748..ac106abea2ee 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -28,6 +28,7 @@
 
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
+#include "drmtest.h"
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
@@ -80,7 +81,11 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 		return lines;
 
 	putchar('\n');
-	len = printf("%*s ", c->clients->max_pid_len, "PID");
+	if (c->regions->num_regions)
+		len = printf("%*s      MEM      RSS ",
+			     c->clients->max_pid_len, "PID");
+	else
+		len = printf("%*s ", c->clients->max_pid_len, "PID");
 
 	if (c->engines->num_engines) {
 		unsigned int i;
@@ -121,12 +126,28 @@ newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
 	return !pc || c->drm_minor != pc->drm_minor;
 }
 
+static int
+print_size(uint64_t sz)
+{
+	char units[] = {'B', 'K', 'M', 'G'};
+	unsigned int u;
+
+	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
+		if (sz < 1024)
+			break;
+		sz /= 1024;
+	}
+
+	return printf("%7"PRIu64"%c ", sz, units[u]);
+}
+
 static int
 print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 	     double t, int lines, int con_w, int con_h,
 	     unsigned int period_us, int *engine_w)
 {
 	unsigned int i;
+	uint64_t sz;
 	int len;
 
 	/* Filter out idle clients. */
@@ -143,6 +164,17 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 	*prevc = c;
 
 	len = printf("%*s ", c->clients->max_pid_len, c->pid_str);
+
+	if (c->regions->num_regions) {
+		for (sz = 0, i = 0; i < c->regions->max_region_id; i++)
+			sz += c->memory[i].total;
+		len += print_size(sz);
+
+		for (sz = 0, i = 0; i < c->regions->max_region_id; i++)
+			sz += c->memory[i].resident;
+		len += print_size(sz);
+	}
+
 	lines++;
 
 	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
-- 
2.39.2
