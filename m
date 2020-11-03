Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D656E8D7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 17:55:22 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Tue,  3 Nov 2020 23:28:27 +0530
Message-Id: <20201103175827.78443-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_flink_basic: Add subtests
 description for test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_flink_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 48b0b8b1..a67fb8fc 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -161,16 +161,24 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Basic test for GEM_FLINK and GEM_OPEN ioctls");
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
