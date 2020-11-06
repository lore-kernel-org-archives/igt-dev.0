Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A46EA6A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:53 +0100
Message-Id: <20201106082955.8939-7-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
References: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 6/8] tests/fbdev: Add tests for unaligned
 writes on framebuffer memory
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

The tests for unaligned writes start and stop writing within pages.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index f40a9ee1..d9f2e664 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -159,6 +159,36 @@ static void framebuffer_tests(int fd)
 		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
 	}
 
+	igt_subtest("unaligned-write") {
+		off_t off;
+		size_t len;
+		ssize_t ret;
+		const unsigned char *pos;
+
+		igt_describe("Check write operations on unaligned locations in framebuffer memory");
+
+		off = pagesize + (pagesize >> 2); // 1.25 * pagesize
+		len = (pagesize << 2) + (pagesize >> 1); // 4.5 * pagesize
+		igt_require_f((off + len) < fix_info.smem_len, "framebuffer too small\n");
+
+		/* read at unaligned location and compare */
+		memset(map, 0xff, fix_info.smem_len);
+		memset(buf, 0, fix_info.smem_len);
+		memset(&buf[off], 0x55, len);
+		ret = pwrite(fd, &buf[off], len, off);
+		igt_require_f(ret == (ssize_t)len, "pwrite failed, ret=%zd\n", ret);
+		pos = memchr(map, 0x55, fix_info.smem_len);
+		igt_require_f(pos, "0x55 not found within framebuffer\n");
+		igt_require_f(pos == &map[off], "0x55 found at pos %zu, expected %lld\n",
+			     pos - map, (long long)off);
+		pos = memchr(&map[off], 0xff, fix_info.smem_len - off);
+		igt_require_f(pos, "0xff not found within framebuffer\n");
+		igt_require_f(pos == &map[off + len], "0xff found at pos %zu, expected %lld\n",
+			     pos - map, (long long)(off + len));
+		pos = memchr(&map[off + len], 0x55, fix_info.smem_len - off + len);
+		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - map);
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
