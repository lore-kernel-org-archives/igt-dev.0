Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076D6E1B5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:49 +0100
Message-Id: <20201106082955.8939-3-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
References: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 2/8] tests/fbdev: Map framebuffer in igt_fixture
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

The mapping of the framebuffer memory will be useful for read/write
tests. Move it into an igt_fixture block.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index b61e1cea..078aa880 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -64,16 +64,10 @@ static void mode_tests(int fd)
 static void framebuffer_tests(int fd)
 {
 	struct fb_fix_screeninfo fix_info;
+	void *map;
 
 	igt_fixture {
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
-	}
-
-	igt_subtest("mmap") {
-		void *map;
-
-		igt_describe("Check mmap operations on framebuffer memory");
-
 		igt_require(fix_info.smem_len);
 
 		map = mmap(NULL, fix_info.smem_len,
@@ -81,6 +75,9 @@ static void framebuffer_tests(int fd)
 		igt_assert(map != MAP_FAILED);
 
 		memset(map, 0, fix_info.smem_len);
+	}
+
+	igt_fixture {
 		munmap(map, fix_info.smem_len);
 	}
 }
-- 
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
