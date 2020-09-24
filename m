Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445386E194
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 09:13:18 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 24 Sep 2020 14:42:40 +0530
Message-Id: <20200924091240.30918-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_close: Added test description for
 test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description for test and to all the available subtests.

v2:Modified basic subtest description.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_close.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
index 58f2d4b3..76b0979a 100644
--- a/tests/i915/gem_close.c
+++ b/tests/i915/gem_close.c
@@ -24,6 +24,9 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("Tests basic gem_close ioctl by closing the gem buffer handle "
+		     "and also tests if duplicate handles are operational when original is closed.");
+
 static int batch_create(int fd)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -132,9 +135,14 @@ igt_main
 		igt_require_gem(fd);
 	}
 
+	igt_describe("Tests the basic working of gem_close ioctl." 
+		      "which releases a file-private gem buffer handle.");
 	igt_subtest("basic")
 		gem_close(fd, gem_create(fd, 4096));
 
+	igt_describe(" The test creates duplicate handles of up to 128 for the same object "
+		     "and checks if only permissible duplicate handles are allowed. "
+		     "It also checks if duplicate handles are operational when original is closed.");
 	igt_subtest("many-handles-one-vma")
 		test_many_handles(fd);
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
