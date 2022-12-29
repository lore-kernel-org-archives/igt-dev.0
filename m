Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4210E3F2
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Dec 2022 15:58:55 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Dec 2022 16:58:42 +0100
Message-Id: <20221229155842.2448977-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: remove fb after
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_create_color_fb should be accompanied with igt_remove_fb.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7331
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/kms_plane_scaling.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4c621cce842..1a8f1581f3e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -367,6 +367,8 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
 
+	igt_remove_fb(d->drm_fd, &d->fb[0]);
+
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
 		      "Unsupported scaling factor with fb size %dx%d\n",
 		      w, h);
-- 
2.34.1
