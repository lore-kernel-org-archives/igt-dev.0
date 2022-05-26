Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C4A10E42B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 16:14:49 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id h13so2065798pfq.5
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 09:14:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 May 2022 09:14:44 -0700
Message-Id: <20220526161445.1819128-2-robdclark@gmail.com>
In-Reply-To: <20220526161445.1819128-1-robdclark@gmail.com>
References: <20220526161445.1819128-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 1/2] lib/igt_debugfs: Drop-caches support for
 msm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 7211c410..7e7ccf22 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -1139,8 +1139,20 @@ void igt_drop_caches_set(int drm_fd, uint64_t val)
 	int dir;
 
 	dir = igt_debugfs_dir(drm_fd);
-	igt_assert(igt_sysfs_printf(dir, "i915_gem_drop_caches",
-				    "0x%" PRIx64, val) > 0);
+	if (is_i915_device(drm_fd)) {
+		igt_assert(igt_sysfs_printf(dir, "i915_gem_drop_caches",
+					    "0x%" PRIx64, val) > 0);
+	} else if (is_msm_device(drm_fd)) {
+		/*
+		 * msm doesn't currently have debugs that supports fine grained
+		 * control of *what* to drop, just # of objects to scan (equiv
+		 * to shrink_control::nr_to_scan).  To meet that limit it will
+		 * first try shrinking, and then dropping idle.  So just tell
+		 * it to try and drop as many objects as possible:
+		 */
+		igt_assert(igt_sysfs_printf(dir, "shrink", "0x%" PRIx64,
+					    ~(uint64_t)0) > 0);
+	}
 	close(dir);
 }
 
-- 
2.35.3
