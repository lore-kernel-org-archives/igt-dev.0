Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0DE6E19A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2020 07:56:03 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 27 Oct 2020 09:55:55 +0200
Message-Id: <20201027075555.254057-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: ensure conversion script
 preserves order of attributes
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

We've been bitten by this before.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index f61a1cd1f..172ef0600 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -44,6 +44,7 @@ import re
 import sys
 import time
 import uuid
+import collections
 
 import xml.etree.ElementTree as et
 import xml.sax.saxutils as saxutils
@@ -544,8 +545,14 @@ def process_mux_configs(mdapi_set):
     return mux_configs
 
 
+def create_sub_element(parent, name):
+    el = et.SubElement(parent, name)
+    el.attrib = collections.OrderedDict()
+    return el
+
+
 def add_register_config(set, priority, availability, regs, type):
-    reg_config = et.SubElement(set, 'register_config')
+    reg_config = create_sub_element(set, 'register_config')
 
     reg_config.set('type', type)
 
@@ -555,7 +562,7 @@ def add_register_config(set, priority, availability, regs, type):
         reg_config.set('availability', availability)
 
     for reg in regs:
-        elem = et.SubElement(reg_config, 'register')
+        elem = create_sub_element(reg_config, 'register')
         elem.set('type', type)
         elem.set('address', "0x%08X" % reg[0])
         elem.set('value', "0x%08X" % reg[1])
@@ -617,7 +624,7 @@ for arg in args.xml:
             print_err("WARNING: skipping metric set '{0}', report size {1} invalid".format(set_symbol_name, mdapi_set.get('SnapshotReportSize')))
             continue
 
-        set = et.SubElement(metrics, 'set')
+        set = create_sub_element(metrics, 'set')
 
         set.set('chipset', chipset)
 
@@ -759,7 +766,7 @@ for arg in args.xml:
 
             symbol_name = mdapi_counter.get('SymbolName')
 
-            counter = et.SubElement(set, 'counter')
+            counter = create_sub_element(set, 'counter')
             counter.set('name', apply_aliases(mdapi_counter.get('ShortName'), aliases))
             counter.set('symbol_name', mdapi_counter.get('SymbolName'))
             counter.set('underscore_name', underscore(mdapi_counter.get('SymbolName')))
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
