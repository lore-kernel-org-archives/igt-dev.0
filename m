Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91B610E181
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 20:58:17 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <juhapekka.heikkila@gmail.com>,
 <kamil.konieczny@linux.intel.com>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>
Date: Mon, 16 Oct 2023 16:58:04 -0400
Message-ID: <20231016205805.86100-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] [i-g-t] tests/kms_cursor_crc: Fix cursor crop
 on AMD gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove extra line when create cursor fb for AMD gpu.

AMD gpu does not support cursor buffer crop. AMD driver
fails validation with fb size not equal to cursor size.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 76c01f557..ba29ff65d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -560,14 +560,18 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 {
 	cairo_t *cr;
 	uint32_t fb_id;
+	int cur_h_extra_line = 1;
 
+	/* Cropping is not supported for cursor plane by AMD */
+	if (is_amdgpu_device(data->drm_fd))
+		cur_h_extra_line = 0;
 	/*
 	 * Make the FB slightly taller and leave the extra
 	 * line opaque white, so that we can see that the
 	 * hardware won't scan beyond what it should (esp.
 	 * with non-square cursors).
 	 */
-	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
+	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + cur_h_extra_line,
 				    DRM_FORMAT_ARGB8888,
 				    DRM_FORMAT_MOD_LINEAR,
 				    1.0, 1.0, 1.0,
-- 
2.25.1
