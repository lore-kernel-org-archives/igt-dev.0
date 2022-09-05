Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E810E2D5
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:01 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53V-007p8g-8Y
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:52:48 +0200
Message-Id: <fd2de32091188cfbbf40c2b97fc570427f55756b.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 14/77] i915/gem_userptr_blits: Close device
 before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

 tests/i915/gem_userptr_blits.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 1343b1097aef..6985086694c4 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -62,6 +62,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_types.h"
 #include "sw_sync.h"
 
 #include "eviction_common.c"
@@ -2299,7 +2300,7 @@ static void test_userfault(int i915)
 
 uint64_t total_ram;
 uint64_t aperture_size;
-int fd, count;
+int count;
 
 static int opt_handler(int opt, int opt_index, void *data)
 {
@@ -2319,6 +2320,7 @@ const char *help_str = "  -c\tBuffer count\n";
 igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 {
 	int size = sizeof(linear);
+	igt_fd_t(fd);
 
 	igt_fixture {
 		unsigned int mmo_max = 0;
-- 
2.37.2
