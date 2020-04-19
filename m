Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9426E0A1
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2020 15:18:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u6so7138364ljl.6
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2020 08:18:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sun, 19 Apr 2020 18:17:46 +0300
Message-Id: <20200419151750.3863-5-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
References: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 4/8] params open with path return
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

---
 lib/igt_params.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index b5ac1266..fe4b1df3 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -107,17 +107,7 @@ static void igt_params_save(int dir, const char *path, const char *name)
 	module_params = data;
 }
 
-/**
- * igt_params_open:
- * @device: fd of the device
- *
- * This opens the module parameters directory (under sysfs) corresponding
- * to the device for use with igt_sysfs_set() and igt_sysfs_get().
- *
- * Returns:
- * The directory fd, or -1 on failure.
- */
-int igt_params_open(int device)
+static int __igt_params_open(int device, char **outpath)
 {
 	int dir, params = -1;
 
@@ -141,11 +131,28 @@ int igt_params_open(int device)
 
 		sprintf(path, "/sys/module/%s/parameters", name);
 		params = open(path, O_RDONLY);
+		if (params >= 0 && outpath)
+			*outpath = strdup(path);
 	}
 
 	return params;
 }
 
+/**
+ * igt_params_open:
+ * @device: fd of the device
+ *
+ * This opens the module parameters directory (under sysfs) corresponding
+ * to the device for use with igt_sysfs_set() and igt_sysfs_get().
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_params_open(int device)
+{
+	return __igt_params_open(device, NULL);
+}
+
 /**
  * igt_params_set:
  * @device: fd of the device
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
