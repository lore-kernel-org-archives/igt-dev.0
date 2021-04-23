Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA59E6E075
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:49 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:37 +0300
Message-Id: <20210423074444.175199-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/8] lib/i915/perf: add name checker for
 conversion
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

List all supported generations so we can fail sooner.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py |  2 +-
 lib/i915/perf-configs/oa_guid_registry.py  | 23 ++++++++++++++++++++++
 lib/i915/perf-configs/update-guids.py      |  2 +-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index b184a6385..7d9f35e4d 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -546,7 +546,7 @@ for arg in args.xml:
             print_err("WARNING: duplicate set named \"" + set_symbol_name + "\" (SKIPPING)")
             continue
 
-        chipset = mdapi_set.get('SupportedHW')
+        chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW'))
         if concurrent_group.get('SupportedGT') != None:
             chipset = chipset + concurrent_group.get('SupportedGT')
         if chipset not in chipsets:
diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
index 2df6bdfb3..e40c9fe09 100644
--- a/lib/i915/perf-configs/oa_guid_registry.py
+++ b/lib/i915/perf-configs/oa_guid_registry.py
@@ -81,3 +81,26 @@ class Registry:
         """
 
         return "%s-%s" % (chipset, hash)
+
+
+    @staticmethod
+    def chipset_name(name):
+        known_chipsets = ( 'HSW',
+                           'BDW',
+                           'CHV',
+                           'SKL',
+                           'BXT',
+                           'KBL',
+                           'GLK',
+                           'CFL',
+                           'CNL',
+                           'ICL',
+                           'EHL',
+                           'TGL',
+                           'RKL',
+                           'DG1' )
+        if name in known_chipsets:
+            return name
+
+        # Unknown HW
+        assert 0
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index 4a9392171..16764f5bd 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -126,7 +126,7 @@ for arg in args.xml:
 
         mdapi_config_hash = oa_registry.Registry.mdapi_hw_config_hash(mdapi_set)
 
-        chipset = mdapi_set.get('SupportedHW').lower()
+        chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW')).lower()
         if concurrent_group.get('SupportedGT') != None:
             chipset = chipset + concurrent_group.get('SupportedGT').lower()
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
