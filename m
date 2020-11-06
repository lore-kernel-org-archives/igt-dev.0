Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A398A6EA6B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:52 +0100
Message-Id: <20201106082955.8939-6-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
References: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 5/8] tests/fbdev: Add tests for write
 operations on framebuffer
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

The write tests check the written buffer against the content of the mapped
framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 48ffbbf5..f40a9ee1 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -138,6 +138,27 @@ static void framebuffer_tests(int fd)
 		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - buf);
 	}
 
+	igt_subtest("write") {
+		ssize_t ret;
+		int cmp;
+
+		igt_describe("Check write operations on framebuffer memory");
+
+		/* write 0 to framebuffer and compare */
+		memset(buf, 0, fix_info.smem_len);
+		ret = pwrite(fd, buf, fix_info.smem_len, 0);
+		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
+
+		/* write 0x55 to framebuffer and compare */
+		memset(buf, 0x55, fix_info.smem_len);
+		ret = pwrite(fd, buf, fix_info.smem_len, 0);
+		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
-- 
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
