Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Wed, 11 Oct 2023 09:28:57 +0100
Message-Id: <20231011082857.797045-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231010163518.hgcqkap3dx655hrk@kamilkon-desk.igk.intel.com>
References: <20231010163518.hgcqkap3dx655hrk@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tools/intel_gpu_top: Optimise
 interactive display a bit
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

Padding the percentage bars and table columns with spaces happens quite a
lot so lets do better than putchar at a time. Have a table of visually
empty strings and build the required length out of those chunks.

While at it, also move the percentage bar table into its function scope.

v2:
 * Fix checkpatch and use ARRAY_SIZE. (Kamil)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_top.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index c5abd0c92155..6bd03ab8d7fa 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -926,14 +926,39 @@ static void free_display_clients(struct igt_drm_clients *clients)
 	free(clients);
 }
 
-static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
-
 static unsigned int n_spaces(const unsigned int n)
 {
-	unsigned int i;
+	static const char *spaces[] = {
+		" ",
+		"  ",
+		"   ",
+		"    ",
+		"     ",
+		"      ",
+		"       ",
+		"        ",
+		"         ",
+		"          ",
+		"           ",
+		"            ",
+		"             ",
+		"              ",
+		"               ",
+		"                ",
+		"                 ",
+		"                  ",
+		"                   ",
+	};
+	unsigned int i, r = n;
 
-	for (i = 0; i < n; i++)
-		putchar(' ');
+	while (r) {
+		if (r > ARRAY_SIZE(spaces))
+			i = ARRAY_SIZE(spaces) - 1;
+		else
+			i = r - 1;
+		fputs(spaces[i], stdout);
+		r -= i + 1;
+	}
 
 	return n;
 }
@@ -941,6 +966,9 @@ static unsigned int n_spaces(const unsigned int n)
 static void
 print_percentage_bar(double percent, double max, int max_len, bool numeric)
 {
+	static const char *bars[] = {
+		" ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█"
+	};
 	int bar_len, i, len = max_len - 2;
 	const int w = 8;
 
-- 
2.39.2
