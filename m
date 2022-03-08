Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31DB10E4FE
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:21:52 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 16:21:37 +0100
Message-Id: <20220308152141.2457841-5-maxime@cerno.tech>
In-Reply-To: <20220308152141.2457841-1-maxime@cerno.tech>
References: <20220308152141.2457841-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] lib/igt_frame: Add function to dump
 frames in RGB and raw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The igt_write_frame_to_png() already allows to dump the content of a
cairo surface into a PNG image. However, it can be useful to have the
raw content of the buffer as well, so let's create a function that will
dump both a PNG image and its raw buffer.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_frame.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_frame.h |  4 +++
 2 files changed, 86 insertions(+)

diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index ba29ac028e1b..f53ba3a381ef 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -112,6 +112,40 @@ static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 	free(path);
 }
 
+static void igt_write_frame_to_raw(cairo_surface_t *surface, int summary_fd,
+				   const char *qualifier, const char *suffix)
+{
+	int height, stride, size;
+	char *path;
+	void *ptr;
+	int out_fd = -1;
+
+	path = igt_get_frame_path(qualifier, suffix, "raw");
+	igt_assert(path);
+
+	igt_debug("Dumping %s frame to %s...\n", qualifier, path);
+
+	out_fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
+	igt_assert(out_fd >= 0);
+
+	ptr = cairo_image_surface_get_data(surface);
+	igt_assert(ptr);
+
+	stride = cairo_image_surface_get_stride(surface);
+	igt_assert(stride > 0);
+
+	height = cairo_image_surface_get_height(surface);
+	igt_assert(height > 0);
+
+	size = stride * height;
+	write(out_fd, ptr, size);
+
+	close(out_fd);
+
+	igt_log_frame_path(summary_fd, path);
+	free(path);
+}
+
 /**
  * igt_write_compared_frames_to_png:
  * @reference: The reference cairo surface
@@ -158,6 +192,54 @@ void igt_write_compared_frames_to_png(cairo_surface_t *reference,
 	close(fd);
 }
 
+/**
+ * igt_write_compared_frames:
+ * @reference: The reference cairo surface
+ * @capture: The captured cairo surface
+ * @reference_suffix: The suffix to give to the reference png file
+ * @capture_suffix: The suffix to give to the capture png file
+ *
+ * Dump previously compared frames to png and raw files.
+ */
+void igt_write_compared_frames(cairo_surface_t *reference,
+			       cairo_surface_t *capture,
+			       const char *reference_suffix,
+			       const char *capture_suffix)
+{
+	char *id;
+	const char *test_name;
+	const char *subtest_name;
+	char path[PATH_MAX];
+	int fd = -1;
+
+	if (!igt_frame_dump_is_enabled())
+		return;
+
+	id = getenv("IGT_FRAME_DUMP_ID");
+
+	test_name = igt_test_name();
+	subtest_name = igt_subtest_name();
+
+	if (id)
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.txt",
+			 igt_frame_dump_path, test_name, subtest_name, id);
+	else
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s.txt",
+			 igt_frame_dump_path, test_name, subtest_name);
+
+	fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
+	igt_assert(fd >= 0);
+
+	igt_debug("Writing dump report to %s...\n", path);
+
+	igt_write_frame_to_raw(reference, fd, "reference", reference_suffix);
+	igt_write_frame_to_png(reference, fd, "reference", reference_suffix);
+	igt_write_frame_to_raw(capture, fd, "capture", capture_suffix);
+	igt_write_frame_to_png(capture, fd, "capture", capture_suffix);
+
+	close(fd);
+}
+
 /**
  * igt_check_analog_frame_match:
  * @reference: The reference cairo surface
diff --git a/lib/igt_frame.h b/lib/igt_frame.h
index f44f57d7ce73..51cbc2bd68b4 100644
--- a/lib/igt_frame.h
+++ b/lib/igt_frame.h
@@ -36,6 +36,10 @@ void igt_write_compared_frames_to_png(cairo_surface_t *reference,
 				      cairo_surface_t *capture,
 				      const char *reference_suffix,
 				      const char *capture_suffix);
+void igt_write_compared_frames(cairo_surface_t *reference,
+			       cairo_surface_t *capture,
+			       const char *reference_suffix,
+			       const char *capture_suffix);
 bool igt_check_analog_frame_match(cairo_surface_t *reference,
 				  cairo_surface_t *capture);
 bool igt_check_checkerboard_frame_match(cairo_surface_t *reference,
-- 
2.35.1
