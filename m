Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Date: Fri, 10 Nov 2023 11:38:10 -0500
Message-ID: <20231110163811.24158-2-andrealmeid@igalia.com>
In-Reply-To: <20231110163811.24158-1-andrealmeid@igalia.com>
References: <20231110163811.24158-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_async_flips: add atomic test
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

From: Simon Ser <contact@emersion.fr>

This adds a simple test for DRM_MODE_PAGE_FLIP_ASYNC with the
atomic uAPI.

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 include/drm-uapi/drm.h  |  8 ++++++++
 tests/kms_async_flips.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248d..500019ce0 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -768,6 +768,14 @@ struct drm_gem_open {
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6c97558be..6bfcca474 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -297,6 +297,35 @@ static void test_async_flip(data_t *data)
 	}
 }
 
+static void test_async_flip_atomic(data_t *data)
+{
+	int frame;
+	long long int fps;
+	struct timeval start, end, diff;
+
+	test_init(data);
+
+	gettimeofday(&start, NULL);
+	frame = 1;
+	do {
+		uint32_t flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
+		igt_plane_set_fb(data->plane, &data->bufs[frame % 4]);
+		igt_display_commit_atomic(&data->display, flags, data);
+
+		wait_flip_event(data);
+
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+
+		frame++;
+	} while (diff.tv_sec < RUN_TIME);
+
+	fps = frame * 1000 / RUN_TIME;
+	igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		     "FPS should be significantly higher than the refresh rate\n");
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
@@ -720,6 +749,14 @@ igt_main
 		run_test(&data, test_crc);
 	}
 
+	igt_describe("Verify the async flip functionality and the fps during atomic async flips");
+	igt_subtest_with_dynamic("atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_async_flip_atomic);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.42.1
