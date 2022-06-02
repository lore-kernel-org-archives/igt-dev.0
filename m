Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5337112BC7
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 08:22:42 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu,  2 Jun 2022 10:22:21 +0200
Message-Id: <20220602082224.387953-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_device_scan: Fix dangling
 pointer usage
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

When the attribute value is duplicated in g_hash_table_insert, v may be
a pointer to linkto, which is no longer in scope at that point.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_device_scan.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index a1cee7a4..b07268db 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -337,7 +337,7 @@ static void igt_device_add_prop(struct igt_device *dev,
 static void igt_device_add_attr(struct igt_device *dev,
 				const char *key, const char *value)
 {
-	const char *v = value;
+	char *v;
 
 	if (!key)
 		return;
@@ -345,11 +345,13 @@ static void igt_device_add_attr(struct igt_device *dev,
 	/* It's possible we have symlink at key filename, but udev
 	 * library resolves only few of them
 	 */
-	if (!v) {
+	if (value) {
+		v = strdup(value);
+	} else {
 		struct stat st;
 		char path[PATH_MAX];
 		char linkto[PATH_MAX];
-		int len;
+		ssize_t len;
 
 		snprintf(path, sizeof(path), "%s/%s", dev->syspath, key);
 		if (lstat(path, &st) != 0)
@@ -362,10 +364,11 @@ static void igt_device_add_attr(struct igt_device *dev,
 		v = strrchr(linkto, '/');
 		if (v == NULL)
 			return;
-		v++;
+
+		v = strdup(v + 1);
 	}
 
-	g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
+	g_hash_table_insert(dev->attrs_ht, strdup(key), v);
 }
 
 /* Iterate over udev properties list and rewrite it to igt_device properties
-- 
2.36.1
