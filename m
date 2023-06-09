Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA0C10E6AA
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 13:21:16 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 18:50:18 +0530
Message-Id: <20230609132019.508947-4-swati2.sharma@intel.com>
In-Reply-To: <20230609132019.508947-1-swati2.sharma@intel.com>
References: <20230609132019.508947-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib: Clear displays on finish before
 process exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

As we want to check for resource leaks at process exit, we want to
release all resources allocated during the test. This includes the
kernel objects being used for scanout by igt_display, so reset the
display on exit.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5341c637..089a4f0b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3001,6 +3001,9 @@ void igt_display_fini(igt_display_t *display)
 	if (is_xe_device(drm_fd))
 		xe_device_put(drm_fd);
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for (i = 0; i < display->n_planes; ++i) {
 		igt_plane_t *plane = &display->planes[i];
 
-- 
2.25.1
