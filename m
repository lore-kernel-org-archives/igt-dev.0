Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D5110E424
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 07:34:20 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 26 Jan 2022 09:34:10 +0200
Message-Id: <20220126073410.11108-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Check plane capabilities
 properly in async flip tests
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

Currently IVB only supports 64bpp formats on the sprite planes
but not on the primary plane. This means
igt_display_has_format_mod(64bpp)->true and thus we will try to
run the 64bpp async flip tests. But since that test uses the
primary plane we will fail to actually enable the plane. Fix
this by making sure the plane actually supports the format (and
let's also check the rotation for good measure).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_big_fb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index c997cf171a05..9ebf615512bb 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -489,7 +489,12 @@ max_hw_stride_async_flip_test(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
-	igt_require(igt_plane_has_rotation(primary, data->rotation));
+	if (!igt_plane_has_format_mod(primary, data->format, data->modifier))
+		return false;
+
+	if (!igt_plane_has_rotation(primary, data->rotation))
+		return false;
+
 	igt_plane_set_rotation(primary, data->rotation);
 
 	igt_require_f(igt_display_try_commit2(&data->display, COMMIT_ATOMIC) == 0,
-- 
2.34.1
