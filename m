Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC716E12A
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Oct 2020 09:04:23 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat, 10 Oct 2020 14:37:01 +0530
Message-Id: <20201010090701.1772297-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_freq: Added sub-test
 description
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
 tests/i915/gem_ctx_freq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a34472de..8570afda 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -211,6 +211,7 @@ igt_main
 		disable_boost();
 	}
 
+	igt_describe("Tests executing the workload on restricted frequencies");
 	igt_subtest_f("sysfs")
 		sysfs_range(i915);
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
