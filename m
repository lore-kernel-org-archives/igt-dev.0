Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4536E52C
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 15:04:03 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 24 Feb 2020 17:03:58 +0200
Message-Id: <20200224150358.1472416-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
References: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/i915/perf: fix subslice
 availability testing
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

Fixes the perf oa-formats tests on Gen9LP.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 53f8f541ca ("lib: Add i915_perf library")
---
 lib/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 9977c745..5b5b7f90 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -157,7 +157,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 
 		perf->devinfo.slice_mask |= 1ULL << s;
 		for (uint32_t ss = 0; ss < topology->max_subslices; ss++) {
-			if (!subslice_available(topology, 0, s))
+			if (!subslice_available(topology, s, ss))
 				continue;
 
 			perf->devinfo.subslice_mask |= 1ULL << (s * bits_per_subslice + ss);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
