Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694E89870
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 19:10:35 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon,  9 Aug 2021 21:10:20 +0200
Message-Id: <20210809191020.18960-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210809191020.18960-1-janusz.krzysztofik@linux.intel.com>
References: <20210809191020.18960-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 2/2] lib/sysfs: Emit debug messages on
 errors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Most sysfs accessors perform a number of operations which may fail.
Moreover, most sysfs read accessors return legal 0 values on errors.
CI users could benefit from being informed if something failed or which
step failed without the need for manual reproduction with IGT debugging
turned on.

Emit debug messages on errors.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_sysfs.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index e734143ba..6919ac361 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -100,10 +100,10 @@ char *igt_sysfs_path(int device, char *path, int pathlen)
 {
 	struct stat st;
 
-	if (device < 0)
+	if (igt_debug_on(device < 0))
 		return NULL;
 
-	if (fstat(device, &st) || !S_ISCHR(st.st_mode))
+	if (igt_debug_on(fstat(device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
 		return NULL;
 
 	snprintf(path, pathlen, "/sys/dev/char/%d:%d",
@@ -129,7 +129,7 @@ int igt_sysfs_open(int device)
 {
 	char path[80];
 
-	if (!igt_sysfs_path(device, path, sizeof(path)))
+	if (igt_debug_on(!igt_sysfs_path(device, path, sizeof(path))))
 		return -1;
 
 	return open(path, O_RDONLY);
@@ -152,7 +152,7 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
 	int fd;
 
 	fd = openat(dir, attr, O_WRONLY);
-	if (fd < 0)
+	if (igt_debug_on(fd < 0))
 		return -errno;
 
 	len = writeN(fd, data, len);
@@ -178,7 +178,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
 	int fd;
 
 	fd = openat(dir, attr, O_RDONLY);
-	if (fd < 0)
+	if (igt_debug_on(fd < 0))
 		return -errno;
 
 	len = readN(fd, data, len);
@@ -222,21 +222,21 @@ char *igt_sysfs_get(int dir, const char *attr)
 	int ret, fd;
 
 	fd = openat(dir, attr, O_RDONLY);
-	if (fd < 0)
+	if (igt_debug_on(fd < 0))
 		return NULL;
 
 	offset = 0;
 	len = 64;
 	rem = len - offset - 1;
 	buf = malloc(len);
-	if (!buf)
+	if (igt_debug_on(!buf))
 		goto out;
 
 	while ((ret = readN(fd, buf + offset, rem)) == rem) {
 		char *newbuf;
 
 		newbuf = realloc(buf, 2*len);
-		if (!newbuf)
+		if (igt_debug_on(!newbuf))
 			break;
 
 		buf = newbuf;
@@ -276,11 +276,11 @@ int igt_sysfs_scanf(int dir, const char *attr, const char *fmt, ...)
 	int ret = -1;
 
 	fd = openat(dir, attr, O_RDONLY);
-	if (fd < 0)
+	if (igt_debug_on(fd < 0))
 		return -1;
 
 	file = fdopen(fd, "r");
-	if (file) {
+	if (!igt_debug_on(!file)) {
 		va_list ap;
 
 		va_start(ap, fmt);
@@ -302,24 +302,24 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 	int ret, fd;
 
 	fd = openat(dir, attr, O_WRONLY);
-	if (fd < 0)
+	if (igt_debug_on(fd < 0))
 		return -errno;
 
 	va_copy(tmp, ap);
 	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
 	va_end(tmp);
-	if (ret < 0)
+	if (igt_debug_on(ret < 0))
 		return -EINVAL;
 
 	if (ret > sizeof(stack)) {
 		unsigned int len = ret + 1;
 
 		buf = malloc(len);
-		if (!buf)
+		if (igt_debug_on(!buf))
 			return -ENOMEM;
 
 		ret = vsnprintf(buf, ret, fmt, ap);
-		if (ret > len) {
+		if (igt_debug_on(ret > len)) {
 			free(buf);
 			return -EINVAL;
 		}
@@ -372,7 +372,7 @@ uint32_t igt_sysfs_get_u32(int dir, const char *attr)
 {
 	uint32_t result;
 
-	if (igt_sysfs_scanf(dir, attr, "%u", &result) != 1)
+	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%u", &result) != 1))
 		return 0;
 
 	return result;
@@ -392,7 +392,7 @@ uint64_t igt_sysfs_get_u64(int dir, const char *attr)
 {
 	uint64_t result;
 
-	if (igt_sysfs_scanf(dir, attr, "%"PRIu64, &result) != 1)
+	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%"PRIu64, &result) != 1))
 		return 0;
 
 	return result;
@@ -446,7 +446,7 @@ bool igt_sysfs_get_boolean(int dir, const char *attr)
 	char *buf;
 
 	buf = igt_sysfs_get(dir, attr);
-	if (!buf)
+	if (igt_debug_on(!buf))
 		return false;
 
 	if (sscanf(buf, "%d", &result) != 1) {
-- 
2.25.1
