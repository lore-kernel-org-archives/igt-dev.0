Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 21 Oct 2021 16:40:42 -0700
Message-Id: <20211021234044.3071069-7-John.C.Harrison@Intel.com>
In-Reply-To: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] lib/igt_sysfs: Support large files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The syfs helper functions were all using basic 'int' data types for
sizs, offsets, etc. when reading from sysfs. This works fine for
little files, but not for large error capture logs (which can be
gigabytes in sizes).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 lib/igt_sysfs.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 6919ac361..ee75e3ef1 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -53,9 +53,11 @@
  * provides basic support for like igt_sysfs_open().
  */
 
-static int readN(int fd, char *buf, int len)
+static ssize_t readN(int fd, char *buf, size_t len)
 {
-	int ret, total = 0;
+	ssize_t ret;
+	size_t total = 0;
+
 	do {
 		ret = read(fd, buf + total, len - total);
 		if (ret < 0)
@@ -69,9 +71,11 @@ static int readN(int fd, char *buf, int len)
 	return total ?: ret;
 }
 
-static int writeN(int fd, const char *buf, int len)
+static ssize_t writeN(int fd, const char *buf, size_t len)
 {
-	int ret, total = 0;
+	ssize_t ret;
+	size_t total = 0;
+
 	do {
 		ret = write(fd, buf + total, len - total);
 		if (ret < 0)
@@ -218,8 +222,9 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
 char *igt_sysfs_get(int dir, const char *attr)
 {
 	char *buf;
-	int len, offset, rem;
-	int ret, fd;
+	size_t len, offset, rem;
+	ssize_t ret;
+	int fd;
 
 	fd = openat(dir, attr, O_RDONLY);
 	if (igt_debug_on(fd < 0))
-- 
2.25.1
