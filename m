Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97816EE70
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 17:14:35 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 27 Nov 2020 17:14:26 +0000
Message-Id: <20201127171427.803479-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/kms: Open per-crtc debugfs around
 kmstests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Drivers may include useful snippets of information in per-crtc debugfs,
that we may check around pipe tests. For instance, rather than the
kernel warn everytime a CRTC update exceeds a certain threshold, we can
check ourselves and so only flag a test failure when looking for such
failures. And more importantly, present the information for debugging
them.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_kms.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 71 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9175e50fe..3f879033a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4890,3 +4890,71 @@ void igt_dump_crtcs_fd(int drmfd)
 
 	drmModeFreeResources(mode_resources);
 }
+
+static int open_crtc_debugfs(int drmfd, enum pipe pipe)
+{
+	char buf[80];
+	int dbg, dir;
+
+	dbg = igt_debugfs_dir(drmfd);
+	if (dbg < 0)
+		return -1;
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	dir = openat(dbg, buf, O_DIRECTORY);
+	close(dbg);
+
+	return dir;
+}
+
+void kmstest_pipe_begin(int drmfd, enum pipe pipe)
+{
+	int dir;
+
+	dir = open_crtc_debugfs(drmfd, pipe);
+	if (dir < 0)
+		return;
+
+	igt_sysfs_set(dir, "i915_update_info", "reset");
+	close(dir);
+}
+
+static void check_i915_updates(enum pipe pipe, const char *str)
+{
+	const char *s;
+	unsigned long over;
+
+	s = strstr(str, "Overrun");
+	if (!s)
+		return;
+
+	s = strchr(s, ':');
+	if (!s)
+		return;
+
+	over = 0;
+	sscanf(s + 1, "%lu", &over);
+	if (over) {
+		igt_warn("%s exceeded update threshold\n",
+			 kmstest_pipe_name(pipe));
+		igt_debug("%s\n", str);
+	}
+}
+
+void kmstest_pipe_end(int drmfd, enum pipe pipe)
+{
+	char *str;
+	int dir;
+
+	dir = open_crtc_debugfs(drmfd, pipe);
+	if (dir < 0)
+		return;
+
+	str = igt_sysfs_get(dir, "i915_update_info");
+	if (str) {
+		check_i915_updates(pipe, str);
+		free(str);
+	}
+
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1fcae2436..da26b4600 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -68,6 +68,9 @@ const char *kmstest_pipe_name(enum pipe pipe);
 int kmstest_pipe_to_index(char pipe);
 const char *kmstest_plane_type_name(int plane_type);
 
+void kmstest_pipe_begin(int drmfd, enum pipe pipe);
+void kmstest_pipe_end(int drmfd, enum pipe pipe);
+
 enum port {
         PORT_A = 0,
         PORT_B,
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
