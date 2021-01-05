Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ABF6E0DB
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:05 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:47 +0200
Message-Id: <20210105111749.463432-5-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] lib/i915/perf: add EHL availability
 condition to HDCAndSF counters
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

The availability of those counters depends on the topology.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/oa-ehl.xml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf-configs/oa-ehl.xml b/lib/i915/perf-configs/oa-ehl.xml
index d32e04492..4a6af977c 100644
--- a/lib/i915/perf-configs/oa-ehl.xml
+++ b/lib/i915/perf-configs/oa-ehl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843424" merge_md5="">
+<metrics version="1609843831" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="EHL"
        symbol_name="RenderBasic"
@@ -3825,6 +3825,7 @@
              units="percent"
              semantic_type="duration"
              equation="C 0 READ B 7 READ FSUB 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SubsliceMask 3 AND"
              mdapi_group="GPU/Data Port"
              mdapi_usage_flags="Tier3 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -3839,6 +3840,7 @@
              units="percent"
              semantic_type="duration"
              equation="C 2 READ C 1 READ FSUB 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SubsliceMask 12 AND"
              mdapi_group="GPU/Data Port"
              mdapi_usage_flags="Tier3 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -3853,6 +3855,7 @@
              units="percent"
              semantic_type="duration"
              equation="C 4 READ C 3 READ FSUB 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SubsliceMask 48 AND"
              mdapi_group="GPU/Data Port"
              mdapi_usage_flags="Tier3 Frame Batch Draw"
              mdapi_supported_apis=""
@@ -3867,6 +3870,7 @@
              units="percent"
              semantic_type="duration"
              equation="C 6 READ C 5 READ FSUB 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SubsliceMask 192 AND"
              mdapi_group="GPU/Data Port"
              mdapi_usage_flags="Tier3 Frame Batch Draw"
              mdapi_supported_apis=""
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
