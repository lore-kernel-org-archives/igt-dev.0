Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200056E0DF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:07 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:48 +0200
Message-Id: <20210105111749.463432-6-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/6] lib/i915/perf: reorder CNL counter
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

Simply moving the counter around.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/oa-cnl.xml | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/i915/perf-configs/oa-cnl.xml b/lib/i915/perf-configs/oa-cnl.xml
index 0bf5fa180..cb7eb8c69 100644
--- a/lib/i915/perf-configs/oa-cnl.xml
+++ b/lib/i915/perf-configs/oa-cnl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843423" merge_md5="">
+<metrics version="1609843831" merge_md5="">
   <set name="Render Metrics Basic Gen10"
        chipset="CNL"
        symbol_name="RenderBasic"
@@ -4722,6 +4722,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="Slice0 L3 Bank0 Accesses"
              symbol_name="L3Bank00Accesses"
              underscore_name="l3_bank00_accesses"
@@ -4833,19 +4846,6 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Shader Barrier Messages"
-             symbol_name="ShaderBarriers"
-             underscore_name="shader_barriers"
-             description="The total number of shader barrier messages."
-             data_type="uint64"
-             units="messages"
-             semantic_type="event"
-             equation="A 35 READ"
-             mdapi_group="EU Array/Barrier"
-             mdapi_usage_flags="Tier3 Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
     <counter name="GTI L3 Throughput"
              symbol_name="GtiL3Throughput"
              underscore_name="gti_l3_throughput"
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
