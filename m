Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6F10E8DD
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Sep 2022 19:52:32 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 23 Sep 2022 19:52:23 +0000
Message-Id: <20220923195224.283045-17-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
References: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 16/17] lib/i915/perf: make warning
 message more helpful
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

This helped debugging some XEHPSDV stuff but is also more readable.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index f27d6657..1d161674 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -884,10 +884,15 @@ for arg in args.xml:
             # delta equations are expected to be identical so warn if that's
             # not true...
             if bool(raw_read_eq) ^ bool(delta_read_eq) or raw_read_eq != delta_read_eq:
-                print_err("WARNING: Inconsistent raw and delta report equations for " + \
-                          mdapi_set.get('ShortName') + " :: " + mdapi_counter.get('SymbolName') + \
-                          "(" + mdapi_counter.get('ShortName') + ")" + ": raw=\"" + str(raw_read_eq) + \
-                          "\" delta=\"" + str(delta_read_eq) + "\" (SKIPPING)")
+                print_err(("WARNING: Inconsistent raw and delta report equations for {0} :: {1} ({2}): " +
+                           "raw=\"{3}\" / \"{4}\" delta=\"{5}\" / \"{6}\" (SKIPPING)")
+                          .format(mdapi_set.get('ShortName'),
+                                  mdapi_counter.get('SymbolName'),
+                                  mdapi_counter.get('ShortName'),
+                                  str(raw_read_eq),
+                                  mdapi_counter.get('SnapshotReportReadEquation'),
+                                  str(delta_read_eq),
+                                  mdapi_counter.get('DeltaReportReadEquation')))
                 set.remove(counter)
                 continue
 
-- 
2.25.1
