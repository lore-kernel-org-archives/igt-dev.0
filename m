Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100F810E073
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:31 +0530
Message-Id: <20230626051031.2363120-25-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 24/24] Revert "lib/igt_kms: Cache xe_device
 info for kms tests"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As this logic is moved to driver open/close level, this is
redundant, hence revert this logic.

This reverts commit 3e049d7c5048c8e4d0b0cfc22afca18e9e897e9a.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kms.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5341c6373..f2b0eed57 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -59,7 +59,6 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
-#include "xe/xe_query.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
@@ -2657,9 +2656,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	}
 #endif
 
-	if (is_xe_device(drm_fd))
-		xe_device_get(drm_fd);
-
 	display->n_pipes = IGT_MAX_PIPES;
 	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
@@ -2996,10 +2992,6 @@ static void igt_output_fini(igt_output_t *output)
 void igt_display_fini(igt_display_t *display)
 {
 	int i;
-	int drm_fd = display->drm_fd;
-
-	if (is_xe_device(drm_fd))
-		xe_device_put(drm_fd);
 
 	for (i = 0; i < display->n_planes; ++i) {
 		igt_plane_t *plane = &display->planes[i];
-- 
2.40.0
