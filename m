Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1B10E57E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 19:43:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  3 Aug 2023 01:03:24 +0530
Message-Id: <20230802193330.3843896-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 1/7] testplan/i915: Exclude non-i915 tests from
 i915 testplan
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
List-ID: <igt-dev@lists.freedesktop.org>

Using wildcards in testplan configs, and keeping other configs
(Xe & kms) in same dir may leads to the problem. Hence, exclude
non-i915 tests from i915 testplan.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/i915_test_config.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
index a029801a6..c15ef2580 100644
--- a/tests/i915/i915_test_config.json
+++ b/tests/i915/i915_test_config.json
@@ -12,7 +12,8 @@
                "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
                "../syncobj_timeline.c", "../syncobj_wait.c",
                "../vgem_basic.c", "../vgem_slow.c" ],
-    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c" ],
+    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
+                       "xe_*" ],
     "fields": {
 	"Mega feature": {
                 "_properties_": {
-- 
2.40.0


