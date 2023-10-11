Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Wed, 11 Oct 2023 09:38:42 +0100
Message-Id: <20231011083845.798413-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tools/intel_gpu_top: Fix clients header
 width when no clients
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

Recent refactoring broke the clients header in cases when there are no
clients displayed. To fix it we need to account the width of the "NAME"
label.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_top.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 10601e66b18e..60fe06917531 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1967,6 +1967,8 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
 		     int con_w, int con_h, int *class_w)
 {
 	struct intel_clients *iclients = clients->private_data;
+	const int max_name_len = clients->max_name_len < 4 ?
+				 4 : clients->max_name_len; /* At least "NAME" */
 
 	if (output_mode == INTERACTIVE) {
 		unsigned int num_active = 0;
@@ -1990,9 +1992,8 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
 					num_active++;
 			}
 
-			*class_w = width =
-				(con_w - len - clients->max_name_len - 1) /
-				num_active;
+			*class_w = width = (con_w - len - max_name_len - 1) /
+					   num_active;
 
 			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
 				const char *name = iclients->classes.names[i];
-- 
2.39.2
