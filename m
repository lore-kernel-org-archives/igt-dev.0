Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8666E526
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 12:18:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u9so4839489pfm.10
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 05:18:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 15:17:44 +0300
Message-Id: <20200420121747.23816-6-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
References: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] igt/params: add generic saving module
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
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_params.c | 56 ++++++++++++++++++++++++++++++++++++++++--------
 lib/igt_params.h |  3 +++
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index fe4b1df3..8de47b02 100644
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
@@ -164,20 +187,35 @@ int igt_params_open(int device)
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
+ * igt_params_set_save:
+ * @device: fd of the device (or -1 to default to Intel)
+ * @parameter: the name of the parameter to set
+ * @fmt: printf-esque format string
+ *
+ * Save the original value to be restored.
+ *
+ * Returns true on success
+ */
+bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...)
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
index 52eed77f..1b750d23 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -31,6 +31,9 @@ int igt_params_open(int device);
 __attribute__((format(printf, 3, 4)))
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
 
+__attribute__((format(printf, 3, 4)))
+bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...);
+
 void igt_set_module_param(const char *name, const char *val);
 void igt_set_module_param_int(const char *name, int val);
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
