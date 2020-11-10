Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8289895
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 07:51:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 10 Nov 2020 08:51:01 +0100
Message-Id: <20201110075102.5033-8-tzimmermann@suse.de>
In-Reply-To: <20201110075102.5033-1-tzimmermann@suse.de>
References: <20201110075102.5033-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 7/8] tests/fbdev: Add tests for accessing
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
To: daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Fbdev has some specific behavior when reading/writing near the EOF, which
the eof test checks. If at least one bytes has been written, the number
of bytes has to be returned, otherwise an error code (if any) has to be
returned, or otherwise 0 has to returned. Not all drivers get this right.

v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 522da8e2..8fd920be 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -78,7 +78,8 @@ static void framebuffer_tests(int fd)
 			   PROT_WRITE, MAP_SHARED, fd, 0);
 		igt_assert(map != MAP_FAILED);
 
-		buf = malloc(fix_info.smem_len);
+		/* allocate two additional bytes for eof test */
+		buf = malloc(fix_info.smem_len + 2);
 		igt_assert(buf);
 
 		ret = sysconf(_SC_PAGESIZE);
@@ -184,6 +185,50 @@ static void framebuffer_tests(int fd)
 		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - map);
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
+		igt_require_f(ret == 1, "write crossed EOF, ret=%zd\n", ret);
+		igt_require_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
+		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* write at EOF; get ENOSPC */
+		ret = pwrite(fd, &buflast[1], 1, lastindex + 1);
+		igt_require_f((ret == -1) && (errno == ENOSPC), "write at EOF, ret=%zd\n", ret);
+
+		*maplast = 0;
+
+		/* write final byte */
+		ret = pwrite(fd, buflast, 1, lastindex);
+		igt_require_f(ret == 1, "write before EOF, ret=%zd\n", ret);
+		igt_require_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
+		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* write after EOF; get EFBIG */
+		ret = pwrite(fd, &buflast[2], 1, lastindex + 2);
+		igt_require_f((ret == -1) && (errno == EFBIG), "write after EOF, ret=%zd\n", ret);
+
+		*maplast = 0;
+
+		/* read across the EOF; get remaining bytes */
+		ret = pread(fd, buflast, 2, lastindex);
+		igt_require_f(ret == 1, "read before EOF, ret=%zd\n", ret);
+		igt_require_f(*maplast == *buflast, "read buffer differs from mapped framebuffer at final byte, "
+		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
+
+		/* read after EOF; get 0 */
+		ret = pread(fd, &buflast[1], 1, lastindex + 1);
+		igt_require_f(ret == 0, "read at EOF, ret=%zd\n", ret);
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
