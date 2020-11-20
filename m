Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A776E8AF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 10:52:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 20 Nov 2020 11:52:15 +0100
Message-Id: <20201120105217.5058-7-tzimmermann@suse.de>
In-Reply-To: <20201120105217.5058-1-tzimmermann@suse.de>
References: <20201120105217.5058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v6 6/8] tests/fbdev: Add tests for unaligned
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
To: petri.latvala@intel.com, chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

The tests for unaligned writes start and stop writing within pages.

v6:
	* remove test from fast-feedback.testlist
v4:
	* replace igt_require() by igt_assert() in "unaligned-write" (Petri)
	* clarify error message about framebuffer size (Petri)
	* add unaligned-write test to CI
v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 23ff146c..c4cb357f 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -155,6 +155,35 @@ static void framebuffer_tests(int fd)
 		igt_assert_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
 	}
 
+	igt_describe("Check write operations on unaligned locations in framebuffer memory");
+	igt_subtest("unaligned-write") {
+		off_t off;
+		size_t len;
+		ssize_t ret;
+		const unsigned char *pos;
+
+		off = pagesize + (pagesize >> 2); // 1.25 * pagesize
+		len = (pagesize << 2) + (pagesize >> 1); // 4.5 * pagesize
+		igt_require_f((off + len) < fix_info.smem_len, "framebuffer too small to test\n");
+
+		/* read at unaligned location and compare */
+		memset(map, 0xff, fix_info.smem_len);
+		memset(buf, 0, fix_info.smem_len);
+		memset(&buf[off], 0x55, len);
+		ret = pwrite(fd, &buf[off], len, off);
+		igt_assert_f(ret == (ssize_t)len, "pwrite failed, ret=%zd\n", ret);
+		pos = memchr(map, 0x55, fix_info.smem_len);
+		igt_assert_f(pos, "0x55 not found within framebuffer\n");
+		igt_assert_f(pos == &map[off], "0x55 found at pos %zu, expected %lld\n",
+			     pos - map, (long long)off);
+		pos = memchr(&map[off], 0xff, fix_info.smem_len - off);
+		igt_assert_f(pos, "0xff not found within framebuffer\n");
+		igt_assert_f(pos == &map[off + len], "0xff found at pos %zu, expected %lld\n",
+			     pos - map, (long long)(off + len));
+		pos = memchr(&map[off + len], 0x55, fix_info.smem_len - off + len);
+		igt_assert_f(pos, "found 0x55 at pos %zu, none expected\n", pos - map);
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
