Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374C10E355
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 20:32:49 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Date: Wed,  3 May 2023 17:32:06 -0300
Message-Id: <20230503203205.117841-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Only set rotation
 if rotation != rotate-0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If you run the kms_plane_scaling tests on drivers that don't support the
rotation property, you end up getting the following error:

(kms_plane_scaling:29327) igt_kms-CRITICAL: Test assertion failure function
igt_atomic_prepare_plane_commit, file ../lib/igt_kms.c:3309:
(kms_plane_scaling:29327) igt_kms-CRITICAL: Failed assertion: plane->props[i]
(kms_plane_scaling:29327) igt_kms-CRITICAL: Last errno: 38, Function not implemented
Dynamic subtest pipe-A-Virtual-1 failed.

This error indicates that the rotation property is not implemented in
the driver, making the test fail instead of skip/pass. This happens
because, even if the test don't test rotation, it sets the rotation to
IGT_ROTATE_0.

Therefore, before setting the rotation property, verify if the
rotation parameter is IGT_ROTATE_0. Only set the rotation property if
the rotation is different than IGT_ROTATE_0. This way the
kms_plane_scaling tests will skip/pass gracefully even without the
rotation property implemented.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_plane_scaling.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index a37abd16..0e7cd4a2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -441,7 +441,8 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	else
 		igt_plane_set_size(plane, width, height);
 
-	igt_plane_set_rotation(plane, rot);
+	if (rot != IGT_ROTATION_0)
+		igt_plane_set_rotation(plane, rot);
 	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 
 	igt_plane_set_fb(plane, NULL);
-- 
2.40.1
