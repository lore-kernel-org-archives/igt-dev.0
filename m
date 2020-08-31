Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80D46E2E9
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 15:09:57 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 31 Aug 2020 18:09:45 +0300
Message-Id: <20200831150951.357727-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
References: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/8] lib/i915/perf: fixup converter script
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

This script was previous run in python2, but because IGT is python3
only there are differences in what it generates. In particular the
attribute order differs in the tostring() of the ElementTree
function...

Reorder them alphabetically manually.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 53f8f541caae ("lib: Add i915_perf library")
---
 lib/i915/perf-configs/oa_guid_registry.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
index 0ed3983f..2df6bdfb 100644
--- a/lib/i915/perf-configs/oa_guid_registry.py
+++ b/lib/i915/perf-configs/oa_guid_registry.py
@@ -54,9 +54,19 @@ class Registry:
         changes that might affect our useages.
         """
 
+        def reorder_attributes(root):
+            for el in root.iter():
+                attrib = el.attrib
+                if len(attrib) > 1:
+                    # adjust attribute order, e.g. by sorting
+                    attribs = sorted(attrib.items())
+                    attrib.clear()
+                    attrib.update(attribs)
+
         config = et.Element('config')
         for registers in mdapi_metric_set.findall(".//RegConfigStart"):
             config.append(copy.deepcopy(registers))
+        reorder_attributes(config)
         registers_str = et.tostring(config)
 
         return hashlib.md5(registers_str).hexdigest()
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
