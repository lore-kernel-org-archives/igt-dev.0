Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFD810E6D1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 23:10:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-312824aa384so1195568f8f.1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 16:10:24 -0700 (PDT)
From: James Shargo <jshargo@chromium.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Jun 2023 19:09:52 -0400
Message-ID: <20230623230954.115437-2-jshargo@chromium.org>
In-Reply-To: <20230623230954.115437-1-jshargo@chromium.org>
References: <20230623230954.115437-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/drmtest: Add VKMS as a known driver
 type
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 lib/drmtest.c | 26 ++++++++++++++++++++++++++
 lib/drmtest.h |  7 ++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 220cfb64d..ad8cbe302 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -150,6 +150,16 @@ bool is_intel_device(int fd)
 	return is_i915_device(fd) || is_xe_device(fd);
 }
 
+bool is_vkms_device(int fd)
+{
+	char name[64] = "";
+
+	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
+		return false;
+
+	return strncmp("vkms", name, strlen("vkms")) == 0;
+}
+
 static char _forced_driver[16] = "";
 
 /**
@@ -734,3 +744,19 @@ void igt_require_xe(int fd)
 {
 	igt_require(is_xe_device(fd));
 }
+
+void igt_require_vkms(void)
+{
+	// Since VKMS can create and destroy virtual drivers at will,
+	// instead look to make sure the driver is installed.
+	struct stat s = {};
+	int ret;
+	char *vkms_module_dir = "/sys/module/vkms";
+
+	ret = stat(vkms_module_dir, &s);
+
+	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
+		      vkms_module_dir, ret, strerror(ret));
+	igt_require_f(S_ISDIR(s.st_mode),
+		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
+}
diff --git a/lib/drmtest.h b/lib/drmtest.h
index ae86ee19a..1d418e1f6 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -53,14 +53,17 @@
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_VKMS	(1 << 9)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
  * with vgem as well as a supported driver, you can end up with a
  * near-100% skip rate if you don't explicitly specify the device,
  * depending on device-load ordering.
+ *
+ * Exclude VKMS to prefer hardware drivers.
  */
-#define DRIVER_ANY 	~(DRIVER_VGEM)
+#define DRIVER_ANY ~(DRIVER_VGEM | DRIVER_VKMS)
 
 /*
  * Compile friendly enum for i915/xe.
@@ -114,6 +117,7 @@ void igt_require_i915(int fd);
 void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
+void igt_require_vkms(void);
 
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
@@ -123,6 +127,7 @@ bool is_nouveau_device(int fd);
 bool is_vc4_device(int fd);
 bool is_xe_device(int fd);
 bool is_intel_device(int fd);
+bool is_vkms_device(int fd);
 
 /**
  * do_or_die:
-- 
2.41.0.162.gfafddb0af9-goog
