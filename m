Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6B010E565
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Jul 2022 03:05:43 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 20:05:34 -0700
Message-Id: <66f946b7db165e36068f62ce2413c3bb06fed9a5.1656731010.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1656731010.git.ashutosh.dixit@intel.com>
References: <cover.1656731010.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_device_scan: Fix
 -Wdangling-pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[12/1181] Compiling C object lib/libigt_device_scan.a.p/igt_device_scan.c.o
../lib/igt_device_scan.c: In function ‘igt_device_add_attr’:
../lib/igt_device_scan.c:368:57: warning: dangling pointer ‘v’ to ‘linkto’ may be used [-Wdangling-pointer=]
  368 |         g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
      |                                                         ^~~~~~~~~
../lib/igt_device_scan.c:351:22: note: ‘linkto’ declared here
  351 |                 char linkto[PATH_MAX];
      |                      ^~~~~~

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index a1cee7a42aeb..b51275e43acb 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -337,6 +337,7 @@ static void igt_device_add_prop(struct igt_device *dev,
 static void igt_device_add_attr(struct igt_device *dev,
 				const char *key, const char *value)
 {
+	char linkto[PATH_MAX];
 	const char *v = value;
 
 	if (!key)
@@ -348,7 +349,6 @@ static void igt_device_add_attr(struct igt_device *dev,
 	if (!v) {
 		struct stat st;
 		char path[PATH_MAX];
-		char linkto[PATH_MAX];
 		int len;
 
 		snprintf(path, sizeof(path), "%s/%s", dev->syspath, key);
-- 
2.34.1
