Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8510EB83
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:22 -0700
Message-Id: <20230323225534.3739835-19-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 18/30] lib/i915/perf: Set missing metric
 unit for some counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
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
