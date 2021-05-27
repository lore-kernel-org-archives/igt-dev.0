Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32696E11F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 14:07:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lg14so261243ejb.9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 07:07:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 27 May 2021 16:07:32 +0200
Message-Id: <20210527140732.5762-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/vgem_basic: Fix unload testcase
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

An mmap _should_ keep the module alive.

This reverts

commit 8abe91985b30f8a26cdcb6816d2393956f171ea5
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Wed Oct 5 14:40:16 2016 +0100

    igt/vgem_basic: Allow mmap() to persist without the vgem module loaded

With real drivers there is usually more than just shmem around, so
encoding this as some kind of expectation just doesn't make sense at
all.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/vgem_basic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 526636dd1772..57c575e2e51b 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -382,14 +382,18 @@ static void test_unload(void)
 	close(dmabuf);
 
 	/* Although closed, the mmap should keep the dmabuf/module alive */
-	igt_assert_f(module_unload() == 0,
-		     "A mmap should not keep the module alive\n");
+	igt_assert_f(module_unload() != 0,
+		     "A mmap should keep the module alive\n");
 
 	for (int page = 0; page < bo.size >> 12; page++)
 		ptr[1024*page + page%1024] = page;
 
 	/* And finally we should have no more uses on the module. */
 	munmap(ptr, bo.size);
+
+	igt_assert_f(module_unload() == 0,
+		     "No mmap anymore, should be able to unload\n");
+
 }
 
 static bool has_prime_export(int fd)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
