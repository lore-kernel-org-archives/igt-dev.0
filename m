Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ACE6E959
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:49:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DBC28017FF
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:49:39 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Fri, 17 Apr 2020 15:49:29 -0400
Message-Id: <20200417194931.39774-4-lyude@redhat.com>
In-Reply-To: <20200417194931.39774-1-lyude@redhat.com>
References: <20200417194931.39774-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/5] lib/igt_debugfs: Add
 igt_debugfs_pipe_dir()
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_debugfs_connector_dir(), but for pipes instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index bf6be552..3c3b11e1 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_pipe_dir:
+ * @device: fd of the device
+ * @pipe: index of pipe
+ * @mode: mode bits as used by open()
+ *
+ * This opens the debugfs directory corresponding to the pipe index on the
+ * device for use with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+{
+	char buf[128];
+	int dir, ret;
+
+	dir = igt_debugfs_dir(device);
+	if (dir < 0)
+		return dir;
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	ret = openat(dir, buf, mode);
+
+	close(dir);
+
+	return ret;
+}
+
 /**
  * igt_debugfs_open:
  * @filename: name of the debugfs node to open
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 7d1a6175..15741a40 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,6 +36,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
