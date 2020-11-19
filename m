Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4726E52F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 13:47:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 19 Nov 2020 14:47:45 +0100
Message-Id: <20201119134746.28020-8-tzimmermann@suse.de>
In-Reply-To: <20201119134746.28020-1-tzimmermann@suse.de>
References: <20201119134746.28020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v5 7/8] tests/fbdev: Add tests for accessing
 framebuffer near EOF
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

Fbdev has some specific behavior when reading/writing near the EOF, which
the eof test checks. If at least one bytes has been written, the number
of bytes has to be returned, otherwise an error code (if any) has to be
returned, or otherwise 0 has to returned. Not all drivers get this right.

v4:
	* replace igt_require() by igt_assert() in "eof" (Petri)
	* add eof test to CI
v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c                         | 47 ++++++++++++++++++++++++++-
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index c4cb357f..62aa99b4 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -78,7 +78,8 @@ static void framebuffer_tests(int fd)
 			   PROT_WRITE, MAP_SHARED, fd, 0);
 		igt_assert(map != MAP_FAILED);
 
-		buf = malloc(fix_info.smem_len);
+		/* allocate two additional bytes for eof test */
+		buf = malloc(fix_info.smem_len + 2);
 		igt_require(buf);
 
 		ret = sysconf(_SC_PAGESIZE);
@@ -184,6 +185,50 @@ static void framebuffer_tests(int fd)
 		igt_assert_f(pos, "found 0x55 at pos %zu, none expected\n", pos - map);
 	}
 
+	igt_describe("Check framebuffer access near EOF");
+	igt_subtest("eof") {
+		unsigned long lastindex = fix_info.smem_len - 1;
+		unsigned char *maplast = &((unsigned char *)map)[lastindex];
+		unsigned char *buflast = &((unsigned char *)buf)[lastindex];
+		ssize_t ret;
+
+		*buflast = 0x55;
+
+		/* write across EOF; set remaining bytes */
+		ret = pwrite(fd, buflast, 2, lastindex);
+		igt_assert_f(ret == 1, "write crossed EOF, ret=%zd\n", ret);
+		igt_assert_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
+						   "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* write at EOF; get ENOSPC */
+		ret = pwrite(fd, &buflast[1], 1, lastindex + 1);
+		igt_assert_f((ret == -1) && (errno == ENOSPC), "write at EOF, ret=%zd\n", ret);
+
+		*maplast = 0;
+
+		/* write final byte */
+		ret = pwrite(fd, buflast, 1, lastindex);
+		igt_assert_f(ret == 1, "write before EOF, ret=%zd\n", ret);
+		igt_assert_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
+						   "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* write after EOF; get EFBIG */
+		ret = pwrite(fd, &buflast[2], 1, lastindex + 2);
+		igt_assert_f((ret == -1) && (errno == EFBIG), "write after EOF, ret=%zd\n", ret);
+
+		*maplast = 0;
+
+		/* read across the EOF; get remaining bytes */
+		ret = pread(fd, buflast, 2, lastindex);
+		igt_assert_f(ret == 1, "read before EOF, ret=%zd\n", ret);
+		igt_assert_f(*maplast == *buflast, "read buffer differs from mapped framebuffer at final byte, "
+						   "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* read after EOF; get 0 */
+		ret = pread(fd, &buflast[1], 1, lastindex + 1);
+		igt_assert_f(ret == 0, "read at EOF, ret=%zd\n", ret);
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 5bad1341..0423de80 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -2,6 +2,7 @@
 
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
+igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@read
 igt@fbdev@unaligned-read
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
