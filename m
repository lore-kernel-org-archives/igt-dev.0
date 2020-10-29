Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC4D6E8B4
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2020 16:07:55 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 29 Oct 2020 16:07:46 +0000
Message-Id: <20201029160746.3488818-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] fbdev: Force module load
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
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

If there are no /dev/fbN, force loading of the first available drm
module and try again.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2582
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/fbdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index fe320b14f..e60a19297 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -43,8 +43,16 @@ igt_main
 	struct fb_fix_screeninfo fix_info;
 	int fd = -1;
 
+	/*
+	 * Should this test focus on the fbdev independent of any drm driver,
+	 * or should it look for fbdev of a particular device?
+	 */
 	igt_fixture {
 		fd = open("/dev/fb0", O_RDWR);
+		if (fd < 0) {
+			close(drm_open_driver(DRIVER_ANY));
+			fd = open("/dev/fb0", O_RDWR);
+		}
 		igt_require_f(fd != -1, "/dev/fb0\n");
 
 		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) == 0);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
