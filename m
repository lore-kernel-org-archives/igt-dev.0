Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1D910E501
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:11 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:53 +0000
Message-Id: <20221010181300.513297-28-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 27/34] lib/i915/perf: add support for new
 EuDualSubslicesTotalCount var
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

We already assume that the number of subslices is the same as the
number of dualsubslices.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/codegen.py           | 1 +
 lib/i915/perf-configs/mdapi-xml-convert.py | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index b53d0358..8268c606 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -168,6 +168,7 @@ class Gen:
             "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
             "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
             "$EuSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
+            "$EuDualSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
             "$EuThreadsCount": { 'c': "perf->devinfo.eu_threads_count" },
             "$SliceMask": { 'c': "perf->devinfo.slice_mask" },
             "$DualSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 1d161674..7b5be901 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -167,7 +167,8 @@ sys_vars = { "EuCoresTotalCount",
              "GpuTimestampFrequency",
              "SliceMask",
              "SubsliceMask",
-             "EuSubslicesTotalCount"
+             "EuSubslicesTotalCount",
+             "EuDualSubslicesTotalCount",
            }
 
 def underscore(name):
-- 
2.25.1
