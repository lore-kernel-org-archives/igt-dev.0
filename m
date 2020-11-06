Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD816EA6A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:50 +0100
Message-Id: <20201106082955.8939-4-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
References: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 3/8] tests/fbdev: Add tests for read operations
 on framebuffer
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
To: daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

The read tests check the read buffer against the content of the mapped
framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 078aa880..e060e3c3 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -25,6 +25,7 @@
 
 #include "igt.h"
 
+#include <errno.h>
 #include <fcntl.h>
 #include <string.h>
 #include <sys/ioctl.h>
@@ -65,6 +66,7 @@ static void framebuffer_tests(int fd)
 {
 	struct fb_fix_screeninfo fix_info;
 	void *map;
+	void *buf;
 
 	igt_fixture {
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
@@ -74,10 +76,34 @@ static void framebuffer_tests(int fd)
 			   PROT_WRITE, MAP_SHARED, fd, 0);
 		igt_assert(map != MAP_FAILED);
 
+		buf = malloc(fix_info.smem_len);
+		igt_assert(buf);
+	}
+
+	igt_subtest("read") {
+		ssize_t ret;
+		int cmp;
+
+		igt_describe("Check read operations on framebuffer memory");
+
+		/* fill framebuffer with 0 and compare */
 		memset(map, 0, fix_info.smem_len);
+		ret = pread(fd, buf, fix_info.smem_len, 0);
+		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0\n");
+
+		/* fill framebuffer with 0x55 and compare */
+		memset(map, 0x55, fix_info.smem_len);
+		ret = pread(fd, buf, fix_info.smem_len, 0);
+		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0x55\n");
 	}
 
 	igt_fixture {
+		free(buf);
+		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
 		munmap(map, fix_info.smem_len);
 	}
 }
-- 
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
