Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEDA6E21D
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Dec 2020 17:08:27 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 20 Dec 2020 22:40:49 +0530
Message-Id: <20201220171049.333955-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_query: Add subtests description
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

Add description for all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/i915_query.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 29b938e9..7cd190f3 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -735,34 +735,47 @@ igt_main
 		devid = intel_get_drm_devid(fd);
 	}
 
+	igt_describe("Verify that query ioctl doesn't succeed with invalid query struct");
 	igt_subtest("query-garbage")
 		test_query_garbage(fd);
 
+	igt_describe("Check the query ioctl behaviour with invalid/partial-invalid "
+	       "query item struct");
 	igt_subtest("query-garbage-items") {
 		igt_require(query_topology_supported(fd));
 		test_query_garbage_items(fd);
 	}
 
+	igt_describe("Verify that kernel writes the data at correct place while "
+	       "filing topology info");
 	igt_subtest("query-topology-kernel-writes") {
 		igt_require(query_topology_supported(fd));
 		test_query_topology_kernel_writes(fd);
 	}
 
+	igt_describe("Test that query ioctl querying topology info fails for device "
+	       "which doesn't support topology query");
 	igt_subtest("query-topology-unsupported") {
 		igt_require(!query_topology_supported(fd));
 		test_query_topology_unsupported(fd);
 	}
 
+	igt_describe("Verfiy that slice/subslice masks retrieved using legacy getparam "
+	       "and new query ioctl are same");
 	igt_subtest("query-topology-coherent-slice-mask") {
 		igt_require(query_topology_supported(fd));
 		test_query_topology_coherent_slice_mask(fd);
 	}
 
+	igt_describe("Verify that total number of EUs obtained using getparam "
+	       "and topology query ioctl are same");
 	igt_subtest("query-topology-matches-eu-total") {
 		igt_require(query_topology_supported(fd));
 		test_query_topology_matches_eu_total(fd);
 	}
 
+	igt_describe("Verfiy that some known specifications based on PCI id matches "
+	       "with the corresponding values obtained using topology query ioctl");
 	igt_subtest("query-topology-known-pci-ids") {
 		igt_require(query_topology_supported(fd));
 		igt_require(IS_HASWELL(devid) || IS_BROADWELL(devid) ||
@@ -771,14 +784,18 @@ igt_main
 		test_query_topology_known_pci_ids(fd, devid);
 	}
 
+	igt_describe("Test querying engine info");
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(query_engine_info_supported(fd));
 		}
 
+		igt_describe("Verify the query ioctl behaviour with invalid values");
 		igt_subtest("engine-info-invalid")
 			engines_invalid(fd);
 
+		igt_describe("Basic sanity test of query ioctl and the engine info "
+		       "obtained using it");
 		igt_subtest("engine-info")
 			engines(fd);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
