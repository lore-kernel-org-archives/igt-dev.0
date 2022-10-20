Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9C110E650
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 09:33:53 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Oct 2022 15:03:05 +0530
Message-Id: <20221020093305.2985455-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/i915/i915_module_load: Use
 GEM_BUSY instead of SET_CACHE for sanity check
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

Use GEM_BUSY ioctl for sanity check as SET_CACHING ioctl is not supported on latest platforms like MTL.
    
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
    
---
 tests/i915/i915_module_load.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 1009a22b..eebb3167 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -226,13 +226,13 @@ inject_fault(const char *module_name, const char *opt, int fault)
 
 static void gem_sanitycheck(void)
 {
-	struct drm_i915_gem_caching args = {};
+	struct drm_i915_gem_busy args = {};
 	int i915 = __drm_open_driver(DRIVER_INTEL);
 	int expected = gem_has_lmem(i915) ? -ENODEV : -ENOENT;
 	int err;
 
 	err = 0;
-	if (ioctl(i915, DRM_IOCTL_I915_GEM_SET_CACHING, &args))
+	if (ioctl(i915,DRM_IOCTL_I915_GEM_BUSY, &args))
 		err = -errno;
 	if (err == expected)
 		store_all(i915);
-- 
2.25.1
