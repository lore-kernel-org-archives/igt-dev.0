Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2B989E59
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Apr 2021 06:05:12 +0000 (UTC)
From: viswax.krishna.raveendra.talabattula@intel.com
Date: Mon, 19 Apr 2021 11:39:28 +0530
Message-Id: <20210419060928.671111-1-viswax.krishna.raveendra.talabattula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [i-g-t] tests/i915: Remove I915_CACHING_NONE
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
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>

The userptr memory does not support I915_CACHING_NONE(no caching) level
as per the below commit related to i915 in the kernel

drm/i915: Reject more ioctls for userptr, v2.

Hence removing the cache level of I915_CACHING_NONE from the test case

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>
---
 tests/i915/gem_userptr_blits.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index aad5f141..f0c63535 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2011,7 +2011,6 @@ static void test_sd_probe(int i915)
 static void test_set_caching(int i915)
 {
 	const int levels[] = {
-		I915_CACHING_NONE,
 		I915_CACHING_CACHED,
 	};
 	uint32_t handle;
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
