Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF210E070
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 16:16:57 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 17:19:23 +0200
Message-Id: <20220422151923.24435-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915: remove use of
 debugfs/i915_next_seqno
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nirmoy.das@intel.com, chris@chris-wilson.co.uk
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The patch "95898ed6856e drm/i915: Drop debugfs/i915_next_seqno"
removed this file so remove the use of this in igt as well.
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/i915/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/i915/gem.c b/lib/i915/gem.c
index 93ef4073b..27b872c28 100644
--- a/lib/i915/gem.c
+++ b/lib/i915/gem.c
@@ -125,7 +125,6 @@ static void reset_device(int i915)
 		igt_info("Found wedged device, trying to reset and continue\n");
 		igt_sysfs_printf(dir, "i915_wedged", "%llu", -1ull);
 	}
-	igt_sysfs_set(dir, "i915_next_seqno", "1");
 
 	close(dir);
 }
-- 
2.35.1
