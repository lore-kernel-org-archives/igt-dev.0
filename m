Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3DB6E67
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Aug 2022 14:58:55 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:58:44 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20220824145832.426397-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [RFC PATCH] tests/kms_async_flips: add atomic test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This adds a simple test for DRM_MODE_PAGE_FLIP_ASYNC with the
atomic uAPI.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---

This is sent as an RFC because the kernel patch is not yet merged.

 include/drm-uapi/drm.h  |  7 +++++++
 tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4c3a..77c258e4cbe7 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -761,6 +761,13 @@ struct drm_gem_open {
  * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE=090x14
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP=090x15
=20
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 695aea74d4f3..7173ca65a0b0 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -51,6 +51,7 @@ typedef struct {
 =09struct igt_fb bufs[4];
 =09igt_display_t display;
 =09igt_output_t *output;
+=09igt_plane_t *plane;
 =09unsigned long flip_timestamp_us;
 =09double flip_interval;
 =09igt_pipe_crc_t *pipe_crc;
@@ -146,7 +147,6 @@ static void test_init(data_t *data)
 {
 =09int i;
 =09uint32_t width, height;
-=09igt_plane_t *plane;
 =09static uint32_t prev_output_id;
 =09drmModeModeInfo *mode;
=20
@@ -161,7 +161,7 @@ static void test_init(data_t *data)
 =09data->refresh_rate =3D mode->vrefresh;
=20
 =09igt_output_set_pipe(data->output, data->pipe);
-=09plane =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMAR=
Y);
+=09data->plane =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_=
PRIMARY);
=20
 =09if (prev_output_id !=3D data->output->id) {
 =09=09prev_output_id =3D data->output->id;
@@ -175,8 +175,8 @@ static void test_init(data_t *data)
 =09=09=09make_fb(data, &data->bufs[i], width, height, i);
 =09}
=20
-=09igt_plane_set_fb(plane, &data->bufs[0]);
-=09igt_plane_set_size(plane, width, height);
+=09igt_plane_set_fb(data->plane, &data->bufs[0]);
+=09igt_plane_set_size(data->plane, width, height);
=20
 =09igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_LEGACY);
 }
@@ -258,6 +258,35 @@ static void test_async_flip(data_t *data)
 =09}
 }
=20
+static void test_async_flip_atomic(data_t *data)
+{
+=09int frame;
+=09long long int fps;
+=09struct timeval start, end, diff;
+
+=09test_init(data);
+
+=09gettimeofday(&start, NULL);
+=09frame =3D 1;
+=09do {
+=09=09uint32_t flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVE=
NT;
+
+=09=09igt_plane_set_fb(data->plane, &data->bufs[frame % 4]);
+=09=09igt_display_commit_atomic(&data->display, flags, data);
+
+=09=09wait_flip_event(data);
+
+=09=09gettimeofday(&end, NULL);
+=09=09timersub(&end, &start, &diff);
+
+=09=09frame++;
+=09} while (diff.tv_sec < RUN_TIME);
+
+=09fps =3D frame * 1000 / RUN_TIME;
+=09igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+=09=09     "FPS should be significantly higher than the refresh rate\n");
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigne=
d int *seq)
 {
 =09drmVBlank wait_vbl;
@@ -643,6 +672,14 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 =09=09run_test(&data, test_crc);
 =09}
=20
+=09igt_describe("Verify the async flip functionality and the fps during at=
omic async flips");
+=09igt_subtest_with_dynamic("atomic-async-flip") {
+=09=09require_monotonic_timestamp(data.drm_fd);
+=09=09igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE=
_FLIP),
+=09=09=09      "Atomic async page-flips are not supported\n");
+=09=09run_test(&data, test_async_flip_atomic);
+=09}
+
 =09igt_fixture {
 =09=09for (i =3D 0; i < ARRAY_SIZE(data.bufs); i++)
 =09=09=09igt_remove_fb(data.drm_fd, &data.bufs[i]);
--=20
2.37.2

