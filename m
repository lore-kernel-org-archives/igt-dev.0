Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876946EB8D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Nov 2021 16:27:56 +0000 (UTC)
Date: Thu, 04 Nov 2021 16:27:46 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <20211104162742.174363-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH] tests/kms_plane_alpha_blend: skip coverage tests
 on missing enum
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Some KMS drivers support the KMS "pixel blend mode" plane property,
but don't support the "Coverage" mode. This enum entry is missing
to indicate lack of support as seen in this drm_info exerpt:

    "pixel blend mode": enum {None, Pre-multiplied} =3D Pre-multiplied

Skip the coverage tests in this case.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 tests/kms_plane_alpha_blend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 9e4ee22b43af..d061262da196 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -419,7 +419,7 @@ static void coverage_7efc(data_t *data, enum pipe pipe,=
 igt_plane_t *plane)
 =09igt_crc_t ref_crc =3D {}, crc =3D {};
 =09int i;
=20
-=09igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
+=09igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, =
"Coverage"));
 =09igt_display_commit2(display, COMMIT_ATOMIC);
 =09igt_pipe_crc_start(data->pipe_crc);
=20
@@ -451,7 +451,7 @@ static void coverage_premult_constant(data_t *data, enu=
m pipe pipe, igt_plane_t
 =09if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
 =09=09igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_=
PLANE_TYPE_PRIMARY), &data->gray_fb);
=20
-=09igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
+=09igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, =
"Coverage"));
 =09igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
 =09igt_display_commit2(display, COMMIT_ATOMIC);
 =09igt_pipe_crc_start(data->pipe_crc);
--=20
2.33.1

