Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372CD6E098
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 23:17:04 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 17 Aug 2021 16:21:52 -0700
Message-Id: <20210817232154.152035-2-jose.souza@intel.com>
In-Reply-To: <20210817232154.152035-1-jose.souza@intel.com>
References: <20210817232154.152035-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_psr2_su: Set the damaged clip
 in page flips
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
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Without this i915 will not know what was updated in the screen and
update the whole plane causing mismatch between the read SU blocks and
the expected value when PSR2 selective fetch is enabled.

Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/kms_psr2_su.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
index a232b3bb4..318deefdf 100644
--- a/tests/kms_psr2_su.c
+++ b/tests/kms_psr2_su.c
@@ -149,11 +149,17 @@ static bool update_screen_and_test(data_t *data)
 
 	switch (data->op) {
 	case PAGE_FLIP: {
+		struct drm_mode_rect clip;
 		igt_plane_t *primary;
 
+		clip.x1 = clip.y1 = 0;
+		clip.x2 = clip.y2 = SQUARE_SIZE;
+
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
 
+		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &clip, sizeof(clip));
 		igt_plane_set_fb(primary, &data->fb[data->screen_changes & 1]);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		break;
-- 
2.32.0
