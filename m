Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8010EE20
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:29 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:11 -0700
Message-Id: <20230316233323.2638668-20-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 19/31] lib/i915/perf: Add MTL to
 supported HW in OA guid registry
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

Add MTL to supprted HW in oa guid registry

v2: Improve commit message (Kamil)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/perf-configs/oa_guid_registry.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
index 50076e95..f520f817 100644
--- a/lib/i915/perf-configs/oa_guid_registry.py
+++ b/lib/i915/perf-configs/oa_guid_registry.py
@@ -100,7 +100,8 @@ class Registry:
                            'RKL',
                            'DG1',
                            'ACM',
-                           'PVC' )
+                           'PVC',
+                           'MTL', )
         if name in known_chipsets:
             return name
 
-- 
2.36.1
