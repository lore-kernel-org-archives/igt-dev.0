Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538110E239
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:11:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jun 2023 21:31:05 +0530
Message-Id: <20230626160106.2632928-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 3/4] testplan/i915: Exclude non-i915 tests from
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
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Using wildcards in testplan configs, and keeping other configs
(Xe & kms) in same dir may leads to the problem. Hence, exclude
non-i915 tests from i915 testplan.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/i915_test_config.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 83317e65d..dda29bf9c 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -10,7 +10,8 @@
                "../dumb_buffer.c", "../prime_vgem.c", "../sw_sync.c",
                "../syncobj_basic.c", "../syncobj_timeline.c", "../syncobj_wait.c",
                "../vgem_basic.c", "../vgem_slow.c" ],
-    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c" ],
+    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
+                       "xe_*" ],
     "fields": {
 	"Mega feature": {
                 "_properties_": {
-- 
2.40.0


