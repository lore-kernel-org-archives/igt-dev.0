Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6AC96EC22
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 10:48:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07FE9ADE8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 10:48:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue,  3 Nov 2020 11:48:12 +0100
Message-Id: <20201103104813.18236-2-tzimmermann@suse.de>
In-Reply-To: <20201103104813.18236-1-tzimmermann@suse.de>
References: <20201103104813.18236-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] tests/fbdev: Store framebuffer pointer at
 function scope
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index e5efeb93..11df954d 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -42,6 +42,7 @@ igt_main
 	struct fb_var_screeninfo var_info;
 	struct fb_fix_screeninfo fix_info;
 	int fd = -1;
+	void *map = NULL;
 
 	/*
 	 * Should this test focus on the fbdev independent of any drm driver,
@@ -71,7 +72,6 @@ igt_main
 	}
 
 	igt_subtest("mmap") {
-		void *map;
 
 		igt_require(fix_info.smem_len);
 
@@ -80,10 +80,11 @@ igt_main
 		igt_assert(map != MAP_FAILED);
 
 		memset(map, 0, fix_info.smem_len);
-		munmap(map, fix_info.smem_len);
 	}
 
 	igt_fixture {
+		if (map && map != MAP_FAILED)
+			munmap(map, fix_info.smem_len);
 		close(fd);
 	}
 }
-- 
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
