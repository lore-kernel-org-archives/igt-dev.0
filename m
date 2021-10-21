Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3346EA9F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 04:43:39 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 21 Oct 2021 10:05:05 +0530
Message-Id: <20211021043508.1158148-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] i915/gem_engine_topology: Add compute
 class
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add compute class to engine base names.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 lib/i915/gem_engine_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 4e497a5c..729f42b0 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -130,6 +130,7 @@ static const char *class_names[] = {
 	[I915_ENGINE_CLASS_COPY]	  = "bcs",
 	[I915_ENGINE_CLASS_VIDEO]	  = "vcs",
 	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
+	[I915_ENGINE_CLASS_COMPUTE]       = "ccs",
 };
 
 static void init_engine(struct intel_execution_engine2 *e2,
-- 
2.25.1
