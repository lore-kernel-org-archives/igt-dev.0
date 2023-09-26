Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0010E371
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 08:19:31 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:57:11 +0530
Message-Id: <20230926082712.281687-2-kunal1.joshi@intel.com>
In-Reply-To: <20230926082712.281687-1-kunal1.joshi@intel.com>
References: <20230926082712.281687-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_dpcd: move dpcd_read and
 dpcd_write to lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

moved dpcd_read and dpcd_write to lib/igt_dpcd

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_dpcd.c   | 47 +++++++++++++++++++++++++++++++++++++
 lib/igt_dpcd.h   | 19 +++++++++++++++
 tools/dpcd_reg.c | 60 +-----------------------------------------------
 3 files changed, 67 insertions(+), 59 deletions(-)
 create mode 100644 lib/igt_dpcd.c
 create mode 100644 lib/igt_dpcd.h

diff --git a/lib/igt_dpcd.c b/lib/igt_dpcd.c
new file mode 100644
index 000000000..eecc13b15
--- /dev/null
+++ b/lib/igt_dpcd.c
@@ -0,0 +1,47 @@
+#include "igt_dpcd.h"
+
+int dpcd_read(int fd, uint32_t offset, size_t count)
+{
+    int ret = EXIT_SUCCESS;
+    uint8_t *buf = calloc(count, sizeof(uint8_t));
+    ssize_t bytes_read;
+
+    if (!buf) {
+        fprintf(stderr, "Can't allocate read buffer\n");
+        return ENOMEM;
+    }
+
+    bytes_read = pread(fd, buf, count, offset);
+
+    if (bytes_read < 0) {
+        fprintf(stderr, "Failed to read - %s\n", strerror(errno));
+        ret = errno;
+    } else {
+        printf("0x%04x: ", offset);
+        for (ssize_t i = 0; i < bytes_read; i++) {
+            printf(" %02x", buf[i]);
+        }
+        printf("\n");
+    }
+
+    free(buf);
+    return ret;
+}
+
+int dpcd_write(int fd, uint32_t offset, uint8_t val)
+{
+    int ret = EXIT_SUCCESS;
+    ssize_t bytes_written;
+
+    bytes_written = pwrite(fd, &val, sizeof(uint8_t), offset);
+
+    if (bytes_written < 0) {
+        fprintf(stderr, "Failed to write - %s\n", strerror(errno));
+        ret = errno;
+    } else if (bytes_written == 0) {
+        fprintf(stderr, "Zero bytes were written\n");
+        ret = EXIT_FAILURE;
+    }
+
+    return ret;
+}
diff --git a/lib/igt_dpcd.h b/lib/igt_dpcd.h
new file mode 100644
index 000000000..b88e34e01
--- /dev/null
+++ b/lib/igt_dpcd.h
@@ -0,0 +1,19 @@
+#ifndef IGT_DPCD_H
+#define IGT_DPCD_H
+
+#include <stdio.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+
+int dpcd_read(int fd, uint32_t offset, size_t count);
+int dpcd_write(int fd, uint32_t offset, uint8_t val);
+
+#endif /* IGT_DPCD_H */
diff --git a/tools/dpcd_reg.c b/tools/dpcd_reg.c
index 2761168d0..b7454cca1 100644
--- a/tools/dpcd_reg.c
+++ b/tools/dpcd_reg.c
@@ -25,16 +25,7 @@
  * and write, so CONFIG_DRM_DP_AUX_DEV needs to be set.
  */
 
-#include <stdio.h>
-#include <errno.h>
-#include <string.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <getopt.h>
-#include <stdint.h>
-#include <unistd.h>
-#include <limits.h>
-#include <stdbool.h>
+#include "igt_dpcd.h"
 
 #define MAX_DP_OFFSET	0xfffff
 #define DRM_AUX_MINORS	256
@@ -214,55 +205,6 @@ static int parse_opts(struct dpcd_data *dpcd, int argc, char **argv)
 	return EXIT_SUCCESS;
 }
 
-static int dpcd_read(int fd, uint32_t offset, size_t count)
-{
-	int ret = EXIT_SUCCESS, pret, i;
-	uint8_t *buf = calloc(count, sizeof(uint8_t));
-
-	if (!buf) {
-		fprintf(stderr, "Can't allocate read buffer\n");
-		return ENOMEM;
-	}
-
-	pret = pread(fd, buf, count, offset);
-	if (pret < 0) {
-		fprintf(stderr, "Failed to read - %s\n", strerror(errno));
-		ret = errno;
-		goto out;
-	}
-
-	if (pret < count) {
-		fprintf(stderr,
-			"Read %u byte(s), expected %zu bytes, starting at offset %x\n\n", pret, count, offset);
-		ret = EXIT_FAILURE;
-	}
-
-	printf("0x%04x: ", offset);
-	for (i = 0; i < pret; i++)
-		printf(" %02x", *(buf + i));
-	printf("\n");
-
-out:
-	free(buf);
-	return ret;
-}
-
-static int dpcd_write(int fd, uint32_t offset, uint8_t val)
-{
-	int ret = EXIT_SUCCESS, pret;
-
-	pret = pwrite(fd, (const void *)&val, sizeof(uint8_t), offset);
-	if (pret < 0) {
-		fprintf(stderr, "Failed to write - %s\n", strerror(errno));
-		ret = errno;
-	} else if (pret == 0) {
-		fprintf(stderr, "Zero bytes were written\n");
-		ret = EXIT_FAILURE;
-	}
-
-	return ret;
-}
-
 static int dpcd_dump(int fd)
 {
 	size_t count;
-- 
2.25.1
