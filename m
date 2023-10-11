Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Wed, 11 Oct 2023 09:38:45 +0100
Message-Id: <20231011083845.798413-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231011083845.798413-1-tvrtko.ursulin@linux.intel.com>
References: <20231011083845.798413-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tools/intel_gpu_top: Handle narrow
 terminals more gracefully
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

Instead of asserting just skip trying to print columns when terminal is
too narrow.

At the same time fix some type confusion to fix calculations going huge.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/143
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_top.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 006879c4ae67..00506c63db4e 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -972,7 +972,8 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
 	int bar_len, i, len = max_len - 2;
 	const int w = 8;
 
-	assert(max_len > 0);
+	if (len < 2) /* For edge lines '|' */
+		return;
 
 	bar_len = ceil(w * percent * len / max);
 	if (bar_len > w * len)
@@ -986,6 +987,8 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
 		printf("%s", bars[i]);
 
 	len -= (bar_len + (w - 1)) / w;
+	if (len < 1)
+		return;
 	n_spaces(len);
 
 	putchar('|');
@@ -2001,8 +2004,7 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
 				 4 : clients->max_name_len; /* At least "NAME" */
 
 	if (output_mode == INTERACTIVE) {
-		unsigned int num_active = 0;
-		int len;
+		int len, num_active = 0;
 
 		if (lines++ >= con_h)
 			return lines;
-- 
2.39.2
