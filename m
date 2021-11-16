Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Nov 2021 16:30:39 -0800
Message-Id: <20211116003042.439107-2-robdclark@gmail.com>
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt v3 1/4] lib/igt_debugfs: Add helper for
 writing debugfs files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_debugfs.c | 17 +++++++++++++++++
 lib/igt_debugfs.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..dd6f2995 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,23 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
+ * @fd: the drm device file fd
+ * @filename: file name
+ * @buf: buffer to be written to the debugfs file
+ * @size: size of the buffer
+ *
+ * This function opens the debugfs file, writes it, then closes the file.
+ */
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
+{
+	int dir = igt_debugfs_dir(fd);
+
+	igt_sysfs_write(dir, filename, buf, size);
+	close(dir);
+}
+
 /**
  * igt_debugfs_search:
  * @filename: file name
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6..b4867681 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,18 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @fd: the drm device file fd
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_write. See its
+ * documentation.
+ */
+#define igt_debugfs_write(fd, filename, buf) \
+		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
+
 /*
  * Pipe CRC
  */
-- 
2.33.1
