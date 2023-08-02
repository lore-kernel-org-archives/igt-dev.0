Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49A10E066
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 11:12:48 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 13:12:29 +0200
Message-Id: <20230802111229.105472-3-aesteve@redhat.com>
In-Reply-To: <20230802111229.105472-1-aesteve@redhat.com>
References: <20230802111229.105472-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test for modesetting an atomic cursor plane
hotspot property. Test added to verify the kernel
patch at [1]. The test first checks if the
plane is atomic and has the hotspot property.
and if it does, it sets different random hot_x
and hot_y values and checks that it is updated
correctly after an atomic commit.

v2: - Remove uapi drm header changes
    - Add local drm capability definition
    - Set CURSOR_PLANE_HOTSPOT capability conditionally
    - Minor typo fix
v3: - Remove trailing tabs/spaces
    - Remove redundant check before commit
    - Reset cursor hotspot after test
v4: - Track revision history

[1] https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html

Signed-off-by: Albert Esteve <aesteve@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1ebac9d31..87cfb9e64 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -218,6 +218,12 @@ static	igt_plane_t
 	return cursor;
 }
 
+static void set_cursor_hotspot(igt_plane_t *cursor, int  hot_x, int hot_y)
+{
+	igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X, hot_x);
+	igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
+}
+
 static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
 				 struct drm_mode_cursor *arg, struct igt_fb *fb)
 {
@@ -1607,6 +1613,68 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	put_ahnd(ahnd);
 }
 
+static void modeset_atomic_cursor_hotspot(igt_display_t *display)
+{
+	struct igt_fb cursor_fb;
+	igt_output_t *output;
+	enum pipe pipe;
+	igt_plane_t *cursor = NULL;
+	bool has_hotspot_prop;
+	uint64_t cursor_width, cursor_height;
+	uint32_t hot_x, hot_y, init_hot_x, init_hot_y;
+
+	igt_require(display->is_atomic);
+	igt_require(display->has_virt_cursor_plane);
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	cursor_width = cursor_height = 64;
+	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height, DRM_FORMAT_ARGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
+
+	has_hotspot_prop = cursor->props[IGT_PLANE_HOTSPOT_X] ||
+		cursor->props[IGT_PLANE_HOTSPOT_Y];
+	igt_require_f(has_hotspot_prop, "Cursor plane lacks the hotspot property");
+
+	init_hot_x = igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X);
+	init_hot_y = igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y);
+
+	/*
+	 * Change the hotspot coordinates randomly and check that the property
+	 * is updated accordingly.
+	 */
+	srand(time(NULL));
+	for (int i = 0; i < 20; i++) {
+		hot_x = rand() % cursor_width;
+		hot_y = rand() % cursor_height;
+		igt_debug("Update cursor hotspot: (%d, %d)\n", hot_x, hot_y);
+
+		/* Set cursor hotspot property values */
+		set_cursor_hotspot(cursor, hot_x, hot_y);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		/* After the commit, the cursor hotspot property values are updated */
+		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_X), hot_x);
+		igt_assert_eq(igt_plane_get_prop(cursor, IGT_PLANE_HOTSPOT_Y), hot_y);
+	}
+
+	/* Clean-up */
+	set_cursor_hotspot(cursor, init_hot_x, init_hot_y);
+	igt_plane_set_fb(cursor, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_remove_fb(display->drm_fd, &cursor_fb);
+}
+
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
@@ -1681,6 +1749,17 @@ igt_main
 			nonblocking_modeset_vs_cursor(&display, 16);
 	}
 
+	igt_describe("Test changes the cursor hotspot and checks that the "
+		      "property is updated accordignly");
+	igt_subtest_group {
+		igt_fixture
+			igt_display_require_output(&display);
+
+		igt_subtest("modeset-atomic-cursor-hotspot") {
+			modeset_atomic_cursor_hotspot(&display);
+		}
+	}
+
 	igt_describe("This test executes flips on both CRTCs "
 		     "while running cursor updates in parallel");
 	igt_subtest_group {
-- 
2.40.0
