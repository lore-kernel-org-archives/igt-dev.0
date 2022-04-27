Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115A410EB3C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 12:04:20 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Apr 2022 15:04:06 +0300
Message-Id: <20220427120406.1485871-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] kms_psr2_su: Use FB_DAMAGE_CLIPS only when
 supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently we are seeing failures in ICL platforms due to
missing support for IGT_PLANE_FB_DAMAGE_CLIPS. Use
IGT_PLANE_FB_DAMAGE_CLIPS only if it is supported

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4148

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 tests/i915/kms_psr2_su.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 474b1dfd..caccf713 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -168,17 +168,21 @@ static bool update_screen_and_test(data_t *data)
 
 	switch (data->op) {
 	case PAGE_FLIP: {
-		struct drm_mode_rect clip;
 		igt_plane_t *primary;
 
-		clip.x1 = clip.y1 = SQUARE_OFFSET;
-		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
-
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
 
-		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
-					    &clip, sizeof(clip));
+		if (igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS)) {
+			struct drm_mode_rect clip;
+
+			clip.x1 = clip.y1 = SQUARE_OFFSET;
+			clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
+
+			igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+						    &clip, sizeof(clip));
+		}
+
 		igt_plane_set_fb(primary, &data->fb[data->screen_changes & 1]);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		break;
-- 
2.25.1
