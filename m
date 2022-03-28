Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC0F10EB00
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 14:55:20 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 28 Mar 2022 16:55:03 +0200
Message-Id: <20220328145509.2331195-3-maxime@cerno.tech>
In-Reply-To: <20220328145509.2331195-1-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/8] lib/igt_frame: Move frame dump
 logging to function
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

The igt_write_frame_to_png() has some logic to log into a text file the
path to the PNG file it will generate. Since we'll need it in a future
version, let's move it to a separate function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_frame.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index 03aeb24d6edb..530ccbc32df2 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -57,6 +57,18 @@ bool igt_frame_dump_is_enabled(void)
 	return igt_frame_dump_path != NULL;
 }
 
+static void igt_log_frame_path(int summary_fd, char *path)
+{
+	int index = strlen(path);
+
+	if (summary_fd >= 0 && index < (PATH_MAX - 1)) {
+		path[index++] = '\n';
+		path[index] = '\0';
+
+		write(summary_fd, path, strlen(path));
+	}
+}
+
 static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 				   const char *qualifier, const char *suffix)
 {
@@ -83,14 +95,7 @@ static void igt_write_frame_to_png(cairo_surface_t *surface, int summary_fd,
 
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 
-	index = strlen(path);
-
-	if (summary_fd >= 0 && index < (PATH_MAX - 1)) {
-		path[index++] = '\n';
-		path[index] = '\0';
-
-		write(summary_fd, path, strlen(path));
-	}
+	igt_log_frame_path(summary_fd, path);
 }
 
 /**
-- 
2.35.1
