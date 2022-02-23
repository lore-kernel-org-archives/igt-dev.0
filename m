Return-path: <SRS0=UqwI=TG=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A06410F1FF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 12:48:33 +0000 (UTC)
From: apoorva1.singh@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Wed, 23 Feb 2022 18:28:37 +0530
Message-Id: <20220223125837.340407-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_flink_basic: Add subtests description for test case
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

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

v2: Modified a description to be more clear

v3: Rebase

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
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
