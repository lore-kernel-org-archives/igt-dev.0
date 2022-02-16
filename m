Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13C110E15C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 05:12:30 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed, 16 Feb 2022 10:46:36 +0530
Message-Id: <20220216051636.2445965-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/i915_getparams_basic: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test description to all the available subtests.

v2: Rebase

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/i915_getparams_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
index 09b38d8a..5422d585 100644
--- a/tests/i915/i915_getparams_basic.c
+++ b/tests/i915/i915_getparams_basic.c
@@ -153,9 +153,11 @@ igt_main
 		init();
 	}
 
+	igt_describe("Examine the export of SUBSLICE_TOTAL parameter");
 	igt_subtest("basic-subslice-total")
 		subslice_total();
 
+	igt_describe("Examine the export of EU_TOTAL parameter");
 	igt_subtest("basic-eu-total")
 		eu_total();
 }
-- 
2.25.1
