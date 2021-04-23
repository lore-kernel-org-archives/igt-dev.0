Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E176EB4E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:53 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:39 +0300
Message-Id: <20210423074444.175199-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/i915/perf-config: simplify
 converter script
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

Rather than having all GTs types, just rely on the chipset name to
find the set of registers that are relevant.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 24 +++++++++-------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 7d9f35e4d..fab334919 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -111,20 +111,15 @@ chipsets = {
     },
     'BDW': gen8_11_chipset_params,
     'CHV': gen8_11_chipset_params,
-    'SKLGT2': gen8_11_chipset_params,
-    'SKLGT3': gen8_11_chipset_params,
-    'SKLGT4': gen8_11_chipset_params,
+    'SKL': gen8_11_chipset_params,
     'BXT': gen8_11_chipset_params,
-    'KBLGT2': gen8_11_chipset_params,
-    'KBLGT3': gen8_11_chipset_params,
+    'KBL': gen8_11_chipset_params,
     'GLK': gen8_11_chipset_params,
-    'CFLGT2': gen8_11_chipset_params,
-    'CFLGT3': gen8_11_chipset_params,
+    'CFL': gen8_11_chipset_params,
     'CNL': gen8_11_chipset_params,
     'ICL': gen8_11_chipset_params,
     'EHL': gen8_11_chipset_params,
-    'TGLGT1': gen8_11_chipset_params,
-    'TGLGT2': gen8_11_chipset_params,
+    'TGL': gen8_11_chipset_params,
     'RKL': gen8_11_chipset_params,
     'DG1': gen8_11_chipset_params,
     'ADL': gen8_11_chipset_params,
@@ -547,8 +542,9 @@ for arg in args.xml:
             continue
 
         chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW'))
+        chipset_fullname = chipset
         if concurrent_group.get('SupportedGT') != None:
-            chipset = chipset + concurrent_group.get('SupportedGT')
+            chipset_fullname = chipset_fullname + concurrent_group.get('SupportedGT')
         if chipset not in chipsets:
             print_err("WARNING: unsupported chipset {0}, consider updating {1}".format(chipset, __file__))
             continue
@@ -571,7 +567,7 @@ for arg in args.xml:
 
         set = et.SubElement(metrics, 'set')
 
-        set.set('chipset', chipset)
+        set.set('chipset', chipset_fullname)
 
         set.set('name', mdapi_set.get('ShortName'))
         set.set('symbol_name', set_symbol_name)
@@ -628,16 +624,16 @@ for arg in args.xml:
             add_register_config(set, 0, None, flex_regs, "FLEX")
 
         mdapi_hw_config_hash = oa_registry.Registry.mdapi_hw_config_hash(mdapi_set)
-        guid_hash = oa_registry.Registry.chipset_derive_hash(chipset.lower(),
+        guid_hash = oa_registry.Registry.chipset_derive_hash(chipset_fullname.lower(),
                                                              mdapi_hw_config_hash)
         hw_config_hash = oa_registry.Registry.hw_config_hash(set)
 
         if guid_hash in guids:
             set.set('hw_config_guid', guids[guid_hash])
         else:
-            print_err("WARNING: No GUID found for metric set " + chipset + ", " + set_symbol_name + " (SKIPPING)")
+            print_err("WARNING: No GUID found for metric set " + chipset_fullname + ", " + set_symbol_name + " (SKIPPING)")
             print_err("WARNING: If this is a new config add the following to guids.xml:")
-            print_err("<guid config_hash=\"" + hw_config_hash + "\" mdapi_config_hash=\"" + mdapi_hw_config_hash + "\" id=\"" + str(uuid.uuid4()) + "\" chipset=\"" + chipset.lower() + "\" name=\"" + set_symbol_name + "\" />")
+            print_err("<guid config_hash=\"" + hw_config_hash + "\" mdapi_config_hash=\"" + mdapi_hw_config_hash + "\" id=\"" + str(uuid.uuid4()) + "\" chipset=\"" + chipset_fullname.lower() + "\" name=\"" + set_symbol_name + "\" />")
             metrics.remove(set)
             continue
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
