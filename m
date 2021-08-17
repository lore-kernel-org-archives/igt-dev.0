Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47126E213
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 17:24:52 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 17 Aug 2021 10:24:39 -0700
Message-Id: <20210817172439.2159386-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rps: ensure array size matches
 loop method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

There are 2 methods often used to loop over an array: 1) a sentinel
item; 2) keep around the number of elements. Here we were mixing both.
Since NUMFREQ is required for stack declarations, use it and
ensure the array we are looping over matches it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/i915/i915_pm_rps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index b37f15c2..40740be7 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -26,6 +26,7 @@
  *
  */
 
+#include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -72,9 +73,10 @@ struct sysfs_file {
 	{ "RP1", "r", NULL },
 	{ "RPn", "r", NULL },
 	{ "boost", "rb+", NULL },
-	{ NULL, NULL, NULL }
 };
 
+static_assert(ARRAY_SIZE(sysfs_files) == NUMFREQ, "array size mismatch");
+
 static int readval(FILE *filp)
 {
 	int val;
-- 
2.31.1
