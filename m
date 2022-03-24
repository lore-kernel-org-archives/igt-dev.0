Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EC410E87F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:19:54 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 15:48:50 +0530
Message-Id: <20220324101852.73089-3-riana.tauro@intel.com>
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 2/4] lib/drmtest : add function to call
 exit handler to unload i915 module
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Unload of i915 module needs closing of  at_exit_drm_fd.
Add a function that calls the exit handler of at_exit_drm_fd
to unload module successfully

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 lib/drmtest.c | 17 +++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 09a9a229..2dafb4f7 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -588,6 +588,23 @@ int drm_open_driver(int chipset)
 	return fd;
 }
 
+/**
+ * drm_cancel_work_at_exit:
+ *
+ * calls __cancel_work_at_exit and closes
+ * at_exit_drm_fd to allow unloading of the module.
+ */
+void drm_cancel_work_at_exit(void)
+{
+	if (at_exit_drm_fd < 0)
+		return;
+	__cancel_work_at_exit(at_exit_drm_fd);
+
+	close(at_exit_drm_fd);
+	at_exit_drm_fd = -1;
+}
+
+
 /**
  * drm_open_driver_master:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index b5debd44..95248f56 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -89,6 +89,7 @@ void __set_forced_driver(const char *name);
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
 void drm_load_module(unsigned int chipset);
+void drm_cancel_work_at_exit(void);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
-- 
2.25.1
