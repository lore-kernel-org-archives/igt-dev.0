Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9427310E1DC
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 14:20:18 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 16:19:36 +0200
Message-ID: <20231023141951.32425-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231023141951.32425-1-kamil.konieczny@linux.intel.com>
References: <20231023141951.32425-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 4/5] drm-uapi/panfrost: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Alyssa Rosenzweig <alyssa@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Sync panfrost drm-uapi header with
drm-next commit ("52920704df878050123dfeb469aa6ab8022547c1")

v1: split panfrost header to separete patch (Kamil)

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@collabora.com>
---
 include/drm-uapi/panfrost_drm.h | 55 +++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/panfrost_drm.h b/include/drm-uapi/panfrost_drm.h
index 061e700dd..9f231d40a 100644
--- a/include/drm-uapi/panfrost_drm.h
+++ b/include/drm-uapi/panfrost_drm.h
@@ -84,14 +84,14 @@ struct drm_panfrost_wait_bo {
 	__s64 timeout_ns;	/* absolute */
 };
 
+/* Valid flags to pass to drm_panfrost_create_bo */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
  *
- * There are currently no values for the flags argument, but it may be
- * used in a future extension.
+ * The flags argument is a bit mask of PANFROST_BO_* flags.
  */
 struct drm_panfrost_create_bo {
 	__u32 size;
@@ -224,6 +224,57 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* Definitions for coredump decoding in user space */
+#define PANFROSTDUMP_MAJOR 1
+#define PANFROSTDUMP_MINOR 0
+
+#define PANFROSTDUMP_MAGIC 0x464E4150 /* PANF */
+
+#define PANFROSTDUMP_BUF_REG 0
+#define PANFROSTDUMP_BUF_BOMAP (PANFROSTDUMP_BUF_REG + 1)
+#define PANFROSTDUMP_BUF_BO (PANFROSTDUMP_BUF_BOMAP + 1)
+#define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
+
+/*
+ * This structure is the native endianness of the dumping machine, tools can
+ * detect the endianness by looking at the value in 'magic'.
+ */
+struct panfrost_dump_object_header {
+	__u32 magic;
+	__u32 type;
+	__u32 file_size;
+	__u32 file_offset;
+
+	union {
+		struct {
+			__u64 jc;
+			__u32 gpu_id;
+			__u32 major;
+			__u32 minor;
+			__u64 nbos;
+		} reghdr;
+
+		struct {
+			__u32 valid;
+			__u64 iova;
+			__u32 data[2];
+		} bomap;
+
+		/*
+		 * Force same size in case we want to expand the header
+		 * with new fields and also keep it 512-byte aligned
+		 */
+
+		__u32 sizer[496];
+	};
+};
+
+/* Registers object, an array of these */
+struct panfrost_dump_registers {
+	__u32 reg;
+	__u32 value;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.42.0
