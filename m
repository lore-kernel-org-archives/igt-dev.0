Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE0D10E53B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:35 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 020AF580DDD
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRk-000Re4-0M
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:17:19 +0200
Message-Id: <9996b2f57ca4489a053c6f8f693cc5f4193aee70.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 14/76] i915/gem_userptr_blits: Close device before
 exit
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
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

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
2.37.3
