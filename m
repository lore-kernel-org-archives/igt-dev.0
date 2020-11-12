Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85026E0E1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 04:50:16 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu, 12 Nov 2020 10:19:20 +0530
Message-Id: <20201112044920.28130-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_render_linear_blits: Add test
 description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added more test description to the test and basic subtest.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_render_linear_blits.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
index 8e646127..0cbd205c 100644
--- a/tests/i915/gem_render_linear_blits.c
+++ b/tests/i915/gem_render_linear_blits.c
@@ -55,6 +55,9 @@
 #define HEIGHT 512
 #define SIZE (HEIGHT*STRIDE)
 
+IGT_TEST_DESCRIPTION("This is a test of doing many blits, with a working set"
+		" larger than the aperture size. The goal is to simply ensure"
+		" the basics work.");
 static uint32_t linear[WIDTH*HEIGHT];
 static igt_render_copyfunc_t render_copy;
 
@@ -170,6 +173,8 @@ igt_main
 		igt_require_gem(fd);
 	}
 
+	igt_describe("This is a basic test for render blit where it"
+			" does many blits, with a working set larger than the aperture size.");
 	igt_subtest("basic") {
 		run_test(fd, 2);
 	}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
