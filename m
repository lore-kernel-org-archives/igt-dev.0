Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020E11345F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 11:01:37 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com
Date: Mon, 20 Jun 2022 16:30:45 +0530
Message-Id: <20220620110046.3057440-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220620110046.3057440-1-janga.rahul.kumar@intel.com>
References: <20220620110046.3057440-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/prime_vgem : Added subtests description
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Added test description to basic subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/prime_vgem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 5fa6e537..4eae723f 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1128,15 +1128,19 @@ igt_main
 		gem_require_mmap_device_coherent(i915);
 	}
 
+	igt_describe("Examine read acess path.");
 	igt_subtest("basic-read")
 		test_read(vgem, i915);
 
+	igt_describe("Examine write acess path.");
 	igt_subtest("basic-write")
 		test_write(vgem, i915);
 
+	igt_describe("Check that we wrap the vgem mmap with userptr.");
 	igt_subtest("basic-userptr")
 		test_userptr(vgem, i915);
 
+	igt_describe("Examine acess path through gtt.");
 	igt_subtest("basic-gtt") {
 		gem_require_mappable_ggtt(i915);
 		test_gtt(vgem, i915);
@@ -1180,8 +1184,11 @@ igt_main
 			igt_require(vgem_has_fences(vgem));
 		}
 
+		igt_describe("Examine read acess path fencing.");
 		igt_subtest("basic-fence-read")
 			test_fence_read(i915, vgem);
+
+		igt_describe("Examine gtt access path fencing.");
 		igt_subtest("basic-fence-mmap") {
 			gem_require_mappable_ggtt(i915);
 			test_fence_mmap(i915, vgem);
-- 
2.25.1
