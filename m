Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD46E8E3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 15:59:50 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 20 Nov 2020 21:32:40 +0530
Message-Id: <20201120160240.204787-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_flink_basic: Add subtests description for test case
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
To: katarzyna.dec@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

v2: Modified a description to be more clear

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
---
 tests/i915/gem_flink_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 48b0b8b1..ad370eb4 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -161,16 +161,24 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Check if gem object can be exported to global namespace and then opened");
 	igt_subtest("basic")
 		test_flink(fd);
+
+	igt_describe("Tests that multiple flinks for the same gem object share the same name");
 	igt_subtest("double-flink")
 		test_double_flink(fd);
+
+	igt_describe("Verify that GEM_FLINK ioctl with invalid gem object retuns relevant error");
 	igt_subtest("bad-flink")
 		test_bad_flink(fd);
+
+	igt_describe("Verify that GEM_OPEN ioctl with invalid flink name retuns relevant error");
 	igt_subtest("bad-open")
 		test_bad_open(fd);
 
 	/* Flink lifetime is limited to that of the gem object it points to */
+	igt_describe("Tests flink lifetime by referencing it from multiple fd's");
 	igt_subtest("flink-lifetime")
 		test_flink_lifetime(fd);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
