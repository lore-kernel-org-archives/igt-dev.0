Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF56E52E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 13:47:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 19 Nov 2020 14:47:41 +0100
Message-Id: <20201119134746.28020-4-tzimmermann@suse.de>
In-Reply-To: <20201119134746.28020-1-tzimmermann@suse.de>
References: <20201119134746.28020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v5 3/8] tests/fbdev: Add tests for read operations
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
To: petri.latvala@intel.com, chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

The read tests check the read buffer against the content of the mapped
framebuffer.

v4:
	* test malloc() success with igt_require()
	* replace igt_require() by igt_assert() in "read" (Petri)
	* add read test to CI
v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c                         | 25 +++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 26 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index eebd2a83..d8c78a5e 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -25,6 +25,7 @@
 
 #include "igt.h"
 
+#include <errno.h>
 #include <fcntl.h>
 #include <string.h>
 #include <sys/ioctl.h>
@@ -64,6 +65,7 @@ static void framebuffer_tests(int fd)
 {
 	struct fb_fix_screeninfo fix_info;
 	void * volatile map;
+	void * volatile buf;
 
 	igt_fixture {
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
@@ -73,10 +75,33 @@ static void framebuffer_tests(int fd)
 			   PROT_WRITE, MAP_SHARED, fd, 0);
 		igt_assert(map != MAP_FAILED);
 
+		buf = malloc(fix_info.smem_len);
+		igt_require(buf);
+	}
+
+	igt_describe("Check read operations on framebuffer memory");
+	igt_subtest("read") {
+		ssize_t ret;
+		int cmp;
+
+		/* fill framebuffer with 0 and compare */
 		memset(map, 0, fix_info.smem_len);
+		ret = pread(fd, buf, fix_info.smem_len, 0);
+		igt_assert_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_assert_f(!cmp, "read buffer differs from mapped framebuffer for 0\n");
+
+		/* fill framebuffer with 0x55 and compare */
+		memset(map, 0x55, fix_info.smem_len);
+		ret = pread(fd, buf, fix_info.smem_len, 0);
+		igt_assert_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_assert_f(!cmp, "read buffer differs from mapped framebuffer for 0x55\n");
 	}
 
 	igt_fixture {
+		free(buf);
+		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
 		munmap(map, fix_info.smem_len);
 	}
 }
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index cf66b4da..fc8a605f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -3,6 +3,7 @@
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@info
+igt@fbdev@read
 igt@gem_basic@bad-close
 igt@gem_basic@create-close
 igt@gem_basic@create-fd-close
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
