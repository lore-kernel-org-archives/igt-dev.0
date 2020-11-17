Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE946E1F8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 12:53:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 17 Nov 2020 13:52:51 +0100
Message-Id: <20201117125257.28089-3-tzimmermann@suse.de>
In-Reply-To: <20201117125257.28089-1-tzimmermann@suse.de>
References: <20201117125257.28089-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v4 2/8] tests/fbdev: Map framebuffer in igt_fixture
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

The mapping of the framebuffer memory will be useful for read/write
tests. Move it into an igt_fixture block.

v4:
	* declare map as volatile (Petri)
	* test struct fb_fix_screeninfo.smem_len with igt_assert()
	* remove mmap test from CI

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c                         | 14 ++++++--------
 tests/intel-ci/fast-feedback.testlist |  1 -
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 44a26a6d..eebd2a83 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -63,22 +63,20 @@ static void mode_tests(int fd)
 static void framebuffer_tests(int fd)
 {
 	struct fb_fix_screeninfo fix_info;
+	void * volatile map;
 
 	igt_fixture {
 		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
-	}
-
-	igt_describe("Check mmap operations on framebuffer memory");
-	igt_subtest("mmap") {
-		void *map;
-
-		igt_require(fix_info.smem_len);
+		igt_assert(fix_info.smem_len);
 
 		map = mmap(NULL, fix_info.smem_len,
 			   PROT_WRITE, MAP_SHARED, fd, 0);
-		igt_require(map != MAP_FAILED);
+		igt_assert(map != MAP_FAILED);
 
 		memset(map, 0, fix_info.smem_len);
+	}
+
+	igt_fixture {
 		munmap(map, fix_info.smem_len);
 	}
 }
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index a40410a8..cf66b4da 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -3,7 +3,6 @@
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@info
-igt@fbdev@mmap
 igt@gem_basic@bad-close
 igt@gem_basic@create-close
 igt@gem_basic@create-fd-close
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
