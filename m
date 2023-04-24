Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B249010E5D1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 18:38:14 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Date: Mon, 24 Apr 2023 15:33:58 -0300
Message-Id: <20230424183400.465464-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_plane_scaling: negative tests
 can return -EINVAL or -ERANGE
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

Similar to the subtest invalid-parameters, when the display commit fails
due to invalid parameters, the commit can return -EINVAL ou -ERANGE, not
only -EINVAL.

Fixes: 2372a4beb ("tests/kms_plane_scaling: Add negative test to check num of scalers")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_plane_scaling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 5008cd93..302fffcd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -838,7 +838,7 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 	 * */
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_skip_on_f(ret == 0, "Cannot test handling of too many scaling ops, the device supports a large amount.\n");
-	igt_assert_eq(ret, -EINVAL);
+	igt_assert(ret == -EINVAL || ret == -ERANGE);
 
 	/* cleanup */
 	igt_plane_set_fb(plane[0], NULL);
-- 
2.40.0
