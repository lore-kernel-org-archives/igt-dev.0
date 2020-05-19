Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD716E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 10:54:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b12so5447335plz.13
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 03:54:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 19 May 2020 13:54:08 +0300
Message-Id: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_params: Fix verifying of debugfs
 parameters
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

After found correct place in debugfs for parameters there
was used wrong path for verifying existence of parameter
which caused fallback path to be used.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_params.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index d8649dfd..410ca650 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -143,14 +143,14 @@ static int __igt_params_open(int device, char **outpath, const char *param)
 
 		devname = openat(dir, "name", O_RDONLY);
 		igt_require_f(devname >= 0,
-		              "Driver need to name itself in debugfs!");
+			      "Driver need to name itself in debugfs!");
 
 		read(devname, searchname, sizeof(searchname));
 		close(devname);
 
 		foundname = strtok_r(searchname, " ", &ctx);
 		igt_require_f(foundname,
-		              "Driver need to name itself in debugfs!");
+			      "Driver need to name itself in debugfs!");
 
 		snprintf(searchpath, PATH_MAX, "%s_params", foundname);
 		params = openat(dir, searchpath, O_RDONLY);
@@ -162,8 +162,8 @@ static int __igt_params_open(int device, char **outpath, const char *param)
 			if (param != NULL) {
 				char filepath[PATH_MAX];
 
-				snprintf(filepath, PATH_MAX, "%s/%s",
-					 debugfspath, param);
+				snprintf(filepath, PATH_MAX, "%s/%s/%s",
+					 debugfspath, searchpath, param);
 
 				if (stat(filepath, &buffer) == 0) {
 					if (outpath != NULL)
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
