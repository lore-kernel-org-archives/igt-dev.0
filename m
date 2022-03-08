Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF0C10E492
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:21:51 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 16:21:36 +0100
Message-Id: <20220308152141.2457841-4-maxime@cerno.tech>
In-Reply-To: <20220308152141.2457841-1-maxime@cerno.tech>
References: <20220308152141.2457841-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/igt_frame: Move frame path creation
 to function
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

The igt_write_frame_to_png() has some logic to create the PNG filename
Since we'll need the same logic in a future function, let's move it to a
separate function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_frame.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index 530ccbc32df2..ba29ac028e1b 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -57,6 +57,30 @@ bool igt_frame_dump_is_enabled(void)
 	return igt_frame_dump_path != NULL;
 }
 
+static char *igt_get_frame_path(const char *qualifier, const char *suffix,
+				const char *extension)
+{
+	char *path;
+	const char *test_name;
+	const char *subtest_name;
+	test_name = igt_test_name();
+	subtest_name = igt_subtest_name();
+
+	path = malloc(PATH_MAX);
+	igt_assert(path);
+
+	if (suffix)
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s.%s",
+			 igt_frame_dump_path, test_name, subtest_name, qualifier,
+			 suffix, extension);
+	else
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.%s",
+			 igt_frame_dump_path, test_name, subtest_name, qualifier,
+			 extension);
+
+	return path;
+}
+
 static void igt_log_frame_path(int summary_fd, char *path)
 {
 	int index = strlen(path);
@@ -72,22 +96,11 @@ static void igt_log_frame_path(int summary_fd, char *path)
 static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 				   const char *qualifier, const char *suffix)
 {
-	char path[PATH_MAX];
-	const char *test_name;
-	const char *subtest_name;
+	char *path;
 	cairo_status_t status;
-	int index;
 
-	test_name = igt_test_name();
-	subtest_name = igt_subtest_name();
-
-	if (suffix)
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s.png",
-			 igt_frame_dump_path, test_name, subtest_name, qualifier,
-			 suffix);
-	else
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.png",
-			 igt_frame_dump_path, test_name, subtest_name, qualifier);
+	path = igt_get_frame_path(qualifier, suffix, "png");
+	igt_assert(path);
 
 	igt_debug("Dumping %s frame to %s...\n", qualifier, path);
 
@@ -96,6 +109,7 @@ static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 
 	igt_log_frame_path(summary_fd, path);
+	free(path);
 }
 
 /**
-- 
2.35.1
