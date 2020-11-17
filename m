Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB126EA98
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 14:43:59 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 17 Nov 2020 16:43:56 +0200
Message-Id: <20201117144356.1253838-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/fbdev: Add mmap readback subtest
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
List-ID: <igt-dev@lists.freedesktop.org>

Add a simple subtest checking that the mmap address we get for an FB
corresponds to the content that we read back from the FB via the read
syscall.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/fbdev.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index e5efeb93d..38623b215 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -83,6 +83,27 @@ igt_main
 		munmap(map, fix_info.smem_len);
 	}
 
+	igt_subtest("mmap-readback") {
+		const uint32_t pattern = 0x55aa55aa;
+		uint32_t *map;
+		uint32_t buf;
+
+		igt_require(fix_info.smem_len);
+
+		kmstest_set_vt_graphics_mode();
+
+		map = mmap(NULL, fix_info.smem_len,
+			   PROT_WRITE, MAP_SHARED, fd, 0);
+		igt_assert(map != MAP_FAILED);
+
+		map[0] = pattern;
+
+		munmap(map, fix_info.smem_len);
+
+		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+		igt_assert_eq(buf, pattern);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
