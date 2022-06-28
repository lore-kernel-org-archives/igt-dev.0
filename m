Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 14:13:16 +0100
Message-Id: <20220628131318.197965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_device_scan: fix dangling
 pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

It looks like the linkto is out of scope:

../lib/igt_device_scan.c: In function ‘igt_device_add_attr’:
../lib/igt_device_scan.c:368:57: warning: dangling pointer ‘v’ to ‘linkto’ may be used [-Wdangling-pointer=]
  368 |         g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
      |                                                         ^~~~~~~~~
../lib/igt_device_scan.c:351:22: note: ‘linkto’ declared here
  351 |                 char linkto[PATH_MAX];

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index a1cee7a4..5d1d4258 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -338,6 +338,7 @@ static void igt_device_add_attr(struct igt_device *dev,
 				const char *key, const char *value)
 {
 	const char *v = value;
+	char linkto[PATH_MAX];
 
 	if (!key)
 		return;
@@ -348,7 +349,6 @@ static void igt_device_add_attr(struct igt_device *dev,
 	if (!v) {
 		struct stat st;
 		char path[PATH_MAX];
-		char linkto[PATH_MAX];
 		int len;
 
 		snprintf(path, sizeof(path), "%s/%s", dev->syspath, key);
-- 
2.36.1
