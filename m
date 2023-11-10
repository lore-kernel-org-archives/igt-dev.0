Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Date: Fri, 10 Nov 2023 11:38:11 -0500
Message-ID: <20231110163811.24158-3-andrealmeid@igalia.com>
In-Reply-To: <20231110163811.24158-1-andrealmeid@igalia.com>
References: <20231110163811.24158-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_async_flips: Add test for
 atomic prop changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DRM atomic API should reject modesetting during an async flip, so
test if the kernel properly rejects to flip with prop changes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 tests/kms_async_flips.c | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6bfcca474..edc19b5ef 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -305,6 +305,9 @@ static void test_async_flip_atomic(data_t *data)
 
 	test_init(data);
 
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
 	gettimeofday(&start, NULL);
 	frame = 1;
 	do {
@@ -326,6 +329,55 @@ static void test_async_flip_atomic(data_t *data)
 		     "FPS should be significantly higher than the refresh rate\n");
 }
 
+static void test_invalid_atomic(data_t *data)
+{
+	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+	int ret;
+
+	test_init(data);
+
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
+	/* Trying to change plane position  */
+	igt_plane_set_position(data->plane, 15, 15);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_position(data->plane, 0, 0);
+
+	/* Trying to change plane rotation  */
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_180);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_0);
+}
+
+static void test_atomic_modeset(data_t *data)
+{
+	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+	igt_output_t *output = data->output;
+	int ret;
+
+	test_init(data);
+
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
+	/*
+	 * Modesetting is forbidden during atomic async flips. Mode changes that
+	 * require modeset are rejected.
+	 */
+	for_each_connector_mode(output) {
+		drmModeModeInfo *m = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, m);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+		igt_assert(ret == -EINVAL);
+	}
+	igt_output_override_mode(output, NULL);
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
@@ -757,6 +809,22 @@ igt_main
 		run_test(&data, test_async_flip_atomic);
 	}
 
+	igt_describe("Negative case to verify if any atomic changes are rejected from kernel as expected");
+	igt_subtest_with_dynamic("invalid-atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_invalid_atomic);
+	}
+
+	igt_describe("Verify mode changes during atomic async flips");
+	igt_subtest_with_dynamic("modeset-atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_atomic_modeset);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.42.1
