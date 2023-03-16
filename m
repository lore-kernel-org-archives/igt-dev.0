Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC5510EDE1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:29 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:10 -0700
Message-Id: <20230316233323.2638668-19-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 18/31] lib/i915/perf: Set missing metric
 unit for some counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some counters do not have units specified, so use 'number' as the unit.

v2: Drop " from commit description (Kamil)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 3b7d0663..eee12ad5 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -819,9 +819,14 @@ for arg in args.xml:
             # XXX Not sure why EU metrics tend to just be bundled under 'gpu'
             counter.set('mdapi_hw_unit_type', mdapi_counter.get('HWUnitType').lower())
 
+            # Some counters do not have MetricUnits, treat them as number.
+            if mdapi_counter.get('MetricUnits') == None:
+                units = "number"
+            else:
+                units = mdapi_counter.get('MetricUnits').lower()
+
             # There are counters representing cycle counts that have a semantic
             # type of 'duration' which doesn't seem to make sense...
-            units = mdapi_counter.get('MetricUnits').lower()
             if units == "cycles":
                 semantic_type = "event"
             else:
-- 
2.36.1
