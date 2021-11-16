Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AFD8986D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 18:23:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 1so428533ljv.2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 10:23:47 -0800 (PST)
Received: from localhost.localdomain (87-94-108-27.bb.dnainternet.fi.
 [87.94.108.27])
 by smtp.gmail.com with ESMTPSA id h17sm1840717lfv.62.2021.11.16.10.23.44
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 10:23:45 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 16 Nov 2021 20:23:42 +0200
Message-Id: <20211116182342.6801-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Use same modifier
 for reference crc as for test crc
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

Create reference crc with same modifier as is used for testing. This
will reduce non test related anomalies.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_multiple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 95e0d72ab..ebadc14be 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -109,9 +109,12 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	mode = igt_output_get_mode(output);
 
+	igt_skip_on(!igt_plane_has_format_mod(data->plane[primary->index],
+		    DRM_FORMAT_XRGB8888, modifier));
+
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
+			    modifier,
 			    color->red, color->green, color->blue,
 			    &data->fb[primary->index]);
 
-- 
2.28.0
