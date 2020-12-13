Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BEC89971
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Dec 2020 15:55:31 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 13 Dec 2020 21:27:59 +0530
Message-Id: <20201213155759.298897-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_gtt_hog: Add test description
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

Add description for the test

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_gtt_hog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
index 1372245b..32ab76f9 100644
--- a/tests/i915/gem_gtt_hog.c
+++ b/tests/i915/gem_gtt_hog.c
@@ -42,6 +42,8 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("Verify the integrity of GTT under hogged scenarios");
+
 static const uint32_t canary = 0xdeadbeef;
 
 typedef struct data {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
