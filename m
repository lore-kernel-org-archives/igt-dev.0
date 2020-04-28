Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C186E891
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 20:23:57 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y25so11344982pfn.5
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 13:23:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 28 Apr 2020 23:22:52 +0300
Message-Id: <20200428202255.31309-5-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/params: add igt_params_open() which
 will return path
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

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
