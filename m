Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517E66EA52
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 19:10:16 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id hi11so3062454pjb.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 May 2020 12:10:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  7 May 2020 22:09:42 +0300
Message-Id: <20200507190944.19520-6-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] igt/params: add generic saving module
 parameter set
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
Cc: Jani Nikula <jani.nikula@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Add functionality to save original value to be restored by exit
handler and setting new value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_params.c | 62 +++++++++++++++++++++++++++++++++++++++++-------
 lib/igt_params.h |  3 +++
 2 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index fe4b1df3..bc1f6af7 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -153,6 +153,29 @@ int igt_params_open(int device)
 	return __igt_params_open(device, NULL);
 }
 
+__attribute__((format(printf, 3, 0)))
+static bool __igt_params_set(int device, const char *parameter,
+			     const char *fmt, va_list ap, bool save)
+{
+	char *path = NULL;
+	int dir;
+	int ret;
+
+	dir = __igt_params_open(device, save ? &path : NULL);
+	if (dir < 0)
+		return false;
+
+	if (save)
+		igt_params_save(dir, path, parameter);
+
+	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
+
+	close(dir);
+	free(path);
+
+	return ret > 0;
+}
+
 /**
  * igt_params_set:
  * @device: fd of the device
@@ -164,20 +187,41 @@ int igt_params_open(int device)
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
 {
 	va_list ap;
-	int dir;
-	int ret;
-
-	dir = igt_params_open(device);
-	if (dir < 0)
-		return false;
+	bool ret;
 
 	va_start(ap, fmt);
-	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
+	ret = __igt_params_set(device, parameter, fmt, ap, false);
 	va_end(ap);
 
-	close(dir);
+	return ret;
+}
 
-	return ret > 0;
+/**
+ * igt_params_save_and_set:
+ * @device: fd of the device or -1 to default.
+ * @parameter: the name of the parameter to set
+ * @fmt: printf-esque format string
+ *
+ * Save original value to be restored by exit handler. Parameter is first
+ * searched at debugfs/dri/N/<device>_params and if not found will look for
+ * parameter at /sys/module/<device>/parameters.
+ *
+ * Giving -1 here for default device will search for matching device from
+ * debugfs/dri/N where N go from 0 to 63. First device found from debugfs
+ * which exist also at /sys/module/<device> will be 'default'.
+ *
+ * Returns true on success
+ */
+bool igt_params_save_and_set(int device, const char *parameter, const char *fmt, ...)
+{
+	va_list ap;
+	bool ret;
+
+	va_start(ap, fmt);
+	ret = __igt_params_set(device, parameter, fmt, ap, true);
+	va_end(ap);
+
+	return ret;
 }
 
 /**
diff --git a/lib/igt_params.h b/lib/igt_params.h
index 52eed77f..ed17f34a 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -31,6 +31,9 @@ int igt_params_open(int device);
 __attribute__((format(printf, 3, 4)))
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
 
+__attribute__((format(printf, 3, 4)))
+bool igt_params_save_and_set(int device, const char *parameter, const char *fmt, ...);
+
 void igt_set_module_param(const char *name, const char *val);
 void igt_set_module_param_int(const char *name, int val);
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
