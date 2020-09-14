Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D89B6E4AE
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 14:16:53 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 67so11640481pgd.12
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 07:16:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 14 Sep 2020 17:16:45 +0300
Message-Id: <20200914141645.17024-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: don't mix
 hdr and sdr planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Run test only on hdr planes as that's where crc to compare
against is gotten from. Also reset display in beginning of test.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_available_modes_crc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index 09785ed8..be9689e1 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -43,7 +43,6 @@ typedef struct {
 	bool separateprimaryplane;
 
 	uint32_t gem_handle;
-	uint32_t gem_handle_yuv;
 	unsigned int size;
 	unsigned char* buf;
 
@@ -355,6 +354,8 @@ test_available_modes(data_t* data)
 		uint16_t reserved;
 	} *lut = NULL;
 
+	igt_display_reset(&data->display);
+
 	for_each_pipe_with_valid_output(&data->display, pipe, output) {
 		igt_output_set_pipe(output, pipe);
 		igt_display_commit2(&data->display, data->commit);
@@ -397,7 +398,8 @@ test_available_modes(data_t* data)
 			modePlane = drmModeGetPlane(data->gfx_fd,
 						    plane->drm_plane->plane_id);
 
-			if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			if (plane->type == DRM_PLANE_TYPE_CURSOR
+			    || plane->index > 2)
 				continue;
 
 			for (modeindex = 0;
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
