Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue,  9 Nov 2021 10:09:03 -0800
Message-Id: <20211109180905.590773-2-robdclark@gmail.com>
In-Reply-To: <20211109180905.590773-1-robdclark@gmail.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 1/3] lib/igt_debugfs: Add helper for writing
 debugfs files
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 16 ++++++++++++++++
 lib/igt_debugfs.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..39431068 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,22 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
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
index d43ba6c6..249eb56a 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,17 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_read. See its
+ * documentation.
+ */
+#define igt_debugfs_write(fd, filename, buf) \
+		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
+
 /*
  * Pipe CRC
  */
-- 
2.31.1
