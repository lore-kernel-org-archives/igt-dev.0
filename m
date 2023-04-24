Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94BE8928D
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 17:24:41 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 24 Apr 2023 14:24:07 -0300
Message-Id: <20230424172407.451109-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: require GAMMA_LUT property
 for legacy_lut tests
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
fail for drivers that doesn't have the IGT_CRTC_GAMMA_LUT property,
as they are not able to complete drmModeCrtcSetGamma() successfully.
Therefore, require the IGT_CRTC_GAMMA_LUT property before running the
tests. This way the tests can skip gracefully for drivers without
this property.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 62aee9ad..a0e4e80f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -451,6 +451,8 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	uint16_t *lut;
 	int i, lut_size;
 
+	igt_require(igt_pipe_obj_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT));
+
 	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
@@ -474,6 +476,8 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 	uint16_t *r, *g, *b;
 	int i, lut_size;
 
+	igt_require(igt_pipe_obj_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT));
+
 	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
-- 
2.40.0
