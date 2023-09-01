Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ECC10E190
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:28:26 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:28:16 +0300
Message-Id: <20230901092819.16924-2-marius.vlad@collabora.com>
In-Reply-To: <20230901092819.16924-1-marius.vlad@collabora.com>
References: <20230901092819.16924-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/drmtest: Add VKMS as a known driver
 type
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, yixie@chromium.org, seanpaul@chromium.org,
 daniel@ffwll.ch, brpol@chromium.org, igormtorrente@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 lib/drmtest.c | 26 ++++++++++++++++++++++++++
 lib/drmtest.h |  9 +++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..8cb22ce39 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -161,6 +161,16 @@ enum intel_driver get_intel_driver(int fd)
 	igt_assert_f(0, "Device is not handled by Intel driver\n");
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
@@ -806,3 +816,19 @@ void igt_require_xe(int fd)
 {
 	igt_require(is_xe_device(fd));
 }
+
+void igt_require_vkms(void)
+{
+	/* Since VKMS can create and destroy virtual drivers at will, instead
+	 * look to make sure the driver is installed.  */
+	struct stat s = {};
+	int ret;
+	const char *vkms_module_dir = "/sys/module/vkms";
+
+	ret = stat(vkms_module_dir, &s);
+
+	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
+		      vkms_module_dir, ret, strerror(ret));
+	igt_require_f(S_ISDIR(s.st_mode),
+		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
+}
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..2d8f74771 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -52,15 +52,18 @@
 #define DRIVER_PANFROST	(1 << 5)
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
-#define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_VMWGFX	(1 << 8)
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
@@ -115,6 +118,7 @@ void igt_require_i915(int fd);
 void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
+void igt_require_vkms(void);
 
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
@@ -125,6 +129,7 @@ bool is_vc4_device(int fd);
 bool is_xe_device(int fd);
 bool is_intel_device(int fd);
 enum intel_driver get_intel_driver(int fd);
+bool is_vkms_device(int fd);
 
 /**
  * do_or_die:
-- 
2.40.1
