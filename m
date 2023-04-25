Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF4510E2D6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 15:29:29 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Tue, 25 Apr 2023 12:29:04 -0300
Message-Id: <20230425152904.238487-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_plane: allow pixel-format
 tests to run on drivers without legacy LUT
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

Currently, the tests pixel-format and pixel-format-source-clamping
fail for drivers that doesn't have support for legacy LUT, as they
are not able to complete drmModeCrtcSetGamma() successfully. Therefore,
if !crtc->gamma_size, don't set legacy LUT and allow the pixel-format
tests to run even if the driver doesn't support legacy LUT.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 62aee9ad..9b49f951 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -455,6 +455,9 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
 
+	if (!crtc->gamma_size)
+		return;
+
 	lut = malloc(sizeof(uint16_t) * lut_size);
 
 	for (i = 0; i < lut_size; i++)
-- 
2.40.0
