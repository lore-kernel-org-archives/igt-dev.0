Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AD610E4C0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:21:48 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 16:21:34 +0100
Message-Id: <20220308152141.2457841-2-maxime@cerno.tech>
In-Reply-To: <20220308152141.2457841-1-maxime@cerno.tech>
References: <20220308152141.2457841-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] lib/igt_frame: Rename summary fd
 variable
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

The igt_write_frame_to_png() function takes a file descriptor to a
summary text file to write the path to the PNG it will dump the frame
to.

Since we have multiple files involved, rename the generic fd variable to
summary_fd.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_frame.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index 45523a79f601..03aeb24d6edb 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -57,7 +57,7 @@ bool igt_frame_dump_is_enabled(void)
 	return igt_frame_dump_path != NULL;
 }
 
-static void igt_write_frame_to_png(cairo_surface_t *surface, int fd,
+static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 				   const char *qualifier, const char *suffix)
 {
 	char path[PATH_MAX];
@@ -85,11 +85,11 @@ static void igt_write_frame_to_png(cairo_surface_t *surface, int fd,
 
 	index = strlen(path);
 
-	if (fd >= 0 && index < (PATH_MAX - 1)) {
+	if (summary_fd >= 0 && index < (PATH_MAX - 1)) {
 		path[index++] = '\n';
 		path[index] = '\0';
 
-		write(fd, path, strlen(path));
+		write(summary_fd, path, strlen(path));
 	}
 }
 
-- 
2.35.1
