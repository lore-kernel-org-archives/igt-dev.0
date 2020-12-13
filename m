Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56589A0F
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Dec 2020 13:28:14 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 13 Dec 2020 19:00:41 +0530
Message-Id: <20201213133041.297904-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_cs_prefetch: Add subtests
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

Add description for all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_cs_prefetch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_cs_prefetch.c b/tests/i915/gem_cs_prefetch.c
index f329ba7e..7b97cb20 100644
--- a/tests/i915/gem_cs_prefetch.c
+++ b/tests/i915/gem_cs_prefetch.c
@@ -142,7 +142,10 @@ igt_main
 {
 	const struct intel_execution_engine *e;
 
-	for (e = intel_execution_engines; e->name; e++)
+	for (e = intel_execution_engines; e->name; e++) {
+		igt_describe_f("For %s engine, verify that over-eager prefetch behavior of CS "
+		       "does not result into page faults", e->name);
 		igt_subtest_f("%s", e->name)
 			test_ring(eb_ring(e));
+	}
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
