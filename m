Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7136E7D7
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 16:45:24 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  2 Sep 2021 19:45:01 +0300
Message-Id: <20210902164508.20104-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
References: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/11] tests/kms_big_fb: Use
 igt_plane_has_rotation()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use igt_plane_has_rotation() instead of the manual
"if there's no rotation prop -> only 0 dgree is supported"
conclusion.

And let's also get rid of the atomic vs. 0/270 degree rotation
check. I think I added this to avoid the test failing since
we can't do the TEST_ONLY probe withoiut atomic. With the
unsupported rotations filtered out ahead of time we should
never get into that situation.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_big_fb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index b988a092771a..092cbc6846fe 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -323,14 +323,7 @@ static bool test_plane(data_t *data)
 	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
 		return false;
 
-	if (data->rotation != IGT_ROTATION_0 &&
-	    !igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
-		return false;
-
-	/* FIXME need atomic on i965/g4x */
-	if (data->rotation != IGT_ROTATION_0 &&
-	    data->rotation != IGT_ROTATION_180 &&
-	    !data->display.is_atomic)
+	if (!igt_plane_has_rotation(plane, data->rotation))
 		return false;
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
-- 
2.31.1
