Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD976E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 15:09:59 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 31 Aug 2020 18:09:46 +0300
Message-Id: <20200831150951.357727-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
References: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/8] lib/i915/perf: small ICL equation
 refactor
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

No functional changes.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/oa-icl.xml | 38 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index 4a6e7132..eac32092 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1598349212" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
@@ -815,20 +815,6 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="EU AVG IPC Rate"
-             symbol_name="EuAvgIpcRate"
-             underscore_name="eu_avg_ipc_rate"
-             description="The average rate of IPC calculated for 2 FPU pipelines."
-             data_type="float"
-             max_equation="2"
-             units="number"
-             semantic_type="ratio"
-             equation="A 9 READ A 10 READ A 11 READ FADD A 9 READ FSUB FDIV 1 FADD"
-             mdapi_group="EU Array"
-             mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
     <counter name="EU Both FPU Pipes Active"
              symbol_name="EuFpuBothActive"
              underscore_name="eu_fpu_both_active"
@@ -871,6 +857,20 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="EU AVG IPC Rate"
+             symbol_name="EuAvgIpcRate"
+             underscore_name="eu_avg_ipc_rate"
+             description="The average rate of IPC calculated for 2 FPU pipelines."
+             data_type="float"
+             max_equation="2"
+             units="number"
+             semantic_type="ratio"
+             equation="A 9 READ  A 10 READ  A 11 READ FADD  A 9 READ FSUB FDIV 1 FADD"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="EU Send Pipe Active"
              symbol_name="EuSendActive"
              underscore_name="eu_send_active"
@@ -9071,7 +9071,7 @@
              data_type="uint64"
              units="cycles"
              semantic_type="event"
-             equation="A 13 READ A 1 READ UDIV"
+             equation="A 13 READ $VsThreads UDIV"
              mdapi_group="EU Array/Vertex Shader"
              mdapi_usage_flags="Tier4 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -9098,7 +9098,7 @@
              data_type="uint64"
              units="cycles"
              semantic_type="event"
-             equation="A 14 READ A 1 READ UDIV"
+             equation="A 14 READ $VsThreads UDIV"
              mdapi_group="EU Array/Vertex Shader"
              mdapi_usage_flags="Tier4 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -9181,7 +9181,7 @@
              data_type="uint64"
              units="cycles"
              semantic_type="event"
-             equation="A 19 READ A 6 READ UDIV"
+             equation="A 19 READ $PsThreads UDIV"
              mdapi_group="EU Array/Fragment Shader"
              mdapi_usage_flags="Tier4 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -9208,7 +9208,7 @@
              data_type="uint64"
              units="cycles"
              semantic_type="event"
-             equation="A 20 READ A 6 READ UDIV"
+             equation="A 20 READ $PsThreads UDIV"
              mdapi_group="EU Array/Fragment Shader"
              mdapi_usage_flags="Tier4 Frame Batch Draw"
              mdapi_supported_apis=""
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
