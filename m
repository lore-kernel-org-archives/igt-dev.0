Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE4889864
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 07:51:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 10 Nov 2020 08:50:56 +0100
Message-Id: <20201110075102.5033-3-tzimmermann@suse.de>
In-Reply-To: <20201110075102.5033-1-tzimmermann@suse.de>
References: <20201110075102.5033-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 2/8] tests/fbdev: Map framebuffer in igt_fixture
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
 tests/fbdev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 46641fea..fc66210a 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -63,15 +63,10 @@ static void mode_tests(int fd)
 static void framebuffer_tests(int fd)
 {
 	struct fb_fix_screeninfo fix_info;
+	void *map;
 
 	igt_fixture {
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
-	}
-
-	igt_describe("Check mmap operations on framebuffer memory");
-	igt_subtest("mmap") {
-		void *map;
-
 		igt_require(fix_info.smem_len);
 
 		map = mmap(NULL, fix_info.smem_len,
@@ -79,6 +74,9 @@ static void framebuffer_tests(int fd)
 		igt_assert(map != MAP_FAILED);
 
 		memset(map, 0, fix_info.smem_len);
+	}
+
+	igt_fixture {
 		munmap(map, fix_info.smem_len);
 	}
 }
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
