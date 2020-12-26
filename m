Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE5789842
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Dec 2020 09:31:35 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat, 26 Dec 2020 15:03:52 +0530
Message-Id: <20201226093352.357813-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_big: Add subtest description
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
To: igt-dev@lists.freedesktop.org, katarzyna.dec@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
---
 tests/i915/gem_exec_big.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 63de42d5..7bb24da3 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -306,9 +306,13 @@ igt_main
 		use_64bit_relocs = intel_gen(intel_get_drm_devid(i915)) >= 8;
 	}
 
+	igt_describe("Test that relocations are being taken care of while executing "
+	       "a very large batch");
 	igt_subtest("single")
 		single(i915);
 
+	igt_describe("Test that relocations are being taken care of while executing "
+	       "batch buffers of sizes ranging from small to very big");
 	igt_subtest("exhaustive")
 		exhaustive(i915);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
