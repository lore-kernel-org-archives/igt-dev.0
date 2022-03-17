Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBEC10EBA1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 05:30:17 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 sai.gowtham.ch@intel.com
Date: Thu, 17 Mar 2022 11:00:02 +0530
Message-Id: <20220317053003.402-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220317053003.402-1-sai.gowtham.ch@intel.com>
References: <20220317053003.402-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_basic: Added test
 description for test case.
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_basic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 13ecce52..17ae190c 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -39,6 +39,8 @@
 #include "drm.h"
 #include "i915/gem_create.h"
 
+IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
+
 static void
 test_bad_close(int fd)
 {
@@ -83,10 +85,15 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Verify that gem_close fails with bad params.");
 	igt_subtest("bad-close")
 		test_bad_close(fd);
+
+	igt_describe("Verify basic functionality of gem_create and gem_close.");
 	igt_subtest("create-close")
 		test_create_close(fd);
+
+	igt_describe("Verify that closing drm driver is possible with opened gem object.");
 	igt_subtest("create-fd-close")
 		test_create_fd_close(fd);
 }
-- 
2.35.1
