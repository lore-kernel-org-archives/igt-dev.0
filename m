Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068276E135
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Sep 2020 16:24:19 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat,  5 Sep 2020 21:57:36 +0530
Message-Id: <20200905162736.2024244-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_getparams_basic: Added test
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

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/i915_getparams_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
index 7cb210df..3464d951 100644
--- a/tests/i915/i915_getparams_basic.c
+++ b/tests/i915/i915_getparams_basic.c
@@ -156,9 +156,11 @@ igt_main
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
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
