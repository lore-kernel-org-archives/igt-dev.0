Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB556EB50
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:56 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:42 +0300
Message-Id: <20210423074444.175199-7-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/8] lib/i915/perf-config: sanitize GT names
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Make sure we don't have any space in there.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 2 +-
 lib/i915/perf-configs/oa_guid_registry.py  | 6 ++++++
 lib/i915/perf-configs/update-guids.py      | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index fab334919..d26ff623e 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -544,7 +544,7 @@ for arg in args.xml:
         chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW'))
         chipset_fullname = chipset
         if concurrent_group.get('SupportedGT') != None:
-            chipset_fullname = chipset_fullname + concurrent_group.get('SupportedGT')
+            chipset_fullname = chipset_fullname + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT'))
         if chipset not in chipsets:
             print_err("WARNING: unsupported chipset {0}, consider updating {1}".format(chipset, __file__))
             continue
diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
index e40c9fe09..1e082ddfd 100644
--- a/lib/i915/perf-configs/oa_guid_registry.py
+++ b/lib/i915/perf-configs/oa_guid_registry.py
@@ -1,6 +1,7 @@
 
 import copy
 import hashlib
+import re
 
 import xml.etree.ElementTree as et
 
@@ -104,3 +105,8 @@ class Registry:
 
         # Unknown HW
         assert 0
+
+
+    @staticmethod
+    def gt_name(name):
+        return re.sub(' ', '', name)
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index 16764f5bd..d38a7a955 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -128,7 +128,7 @@ for arg in args.xml:
 
         chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW')).lower()
         if concurrent_group.get('SupportedGT') != None:
-            chipset = chipset + concurrent_group.get('SupportedGT').lower()
+            chipset = chipset + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT')).lower()
 
         set_name = mdapi_set.get('SymbolName')
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
