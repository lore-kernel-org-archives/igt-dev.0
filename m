Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C210EA1C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:07:18 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 09:06:58 +0300
Message-Id: <20220530060701.406219-2-jouni.hogander@intel.com>
In-Reply-To: <20220530060701.406219-1-jouni.hogander@intel.com>
References: <20220530060701.406219-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/i915/kms_psr2_sf.c: Fix for
 setting wrong size for cursor fb
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

Current code is setting wrong size for cursor framebuffer. Fix thi
by handling all plane types separately.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6064
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 1ccbd11a..f9f514ab 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -710,8 +710,7 @@ static void plane_move_continuous(data_t *data)
 static void damaged_plane_update(data_t *data)
 {
 	igt_plane_t *test_plane = data->test_plane;
-	uint32_t h = data->mode->hdisplay;
-	uint32_t v = data->mode->vdisplay;
+	uint32_t h, v;
 	int x, y;
 
 	if (data->big_fb_test) {
@@ -721,9 +720,20 @@ static void damaged_plane_update(data_t *data)
 		x = y = 0;
 	}
 
-	if (data->test_plane_id == DRM_PLANE_TYPE_OVERLAY) {
-		h = h/2;
-		v = v/2;
+	switch (data->test_plane_id) {
+	case DRM_PLANE_TYPE_OVERLAY:
+		h = data->mode->hdisplay / 2;
+		v = data->mode->vdisplay / 2;
+		break;
+	case DRM_PLANE_TYPE_PRIMARY:
+		h = data->mode->hdisplay;
+		v = data->mode->vdisplay;
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		h = v = CUR_SIZE;
+		break;
+	default:
+		igt_assert(false);
 	}
 
 	if (data->screen_changes & 1) {
-- 
2.25.1
