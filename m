Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449CE10F055
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jan 2022 12:02:19 +0000 (UTC)
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date: Tue, 11 Jan 2022 14:01:53 +0200
Message-Id: <20220111120153.2920064-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3] tests/i915/gem_userptr_blits: Skip sd-probe
 test for discrete platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The DRM_IOCTL_I915_GEM_SET_DOMAIN ioctl is not supported on discrete platforms.
It skips sd-probe test for discrete platforms.

https://patchwork.freedesktop.org/patch/msgid/20210715101536.2606307-5-matthew.auld@intel.com

v2: add a newline at the end of the skip string and fix the skip string. (Petri)
v3: update the commit message. (Petri)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_userptr_blits.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index a4dca4c0..ec3f2755 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2374,8 +2374,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("forbidden-operations")
 			test_forbidden_ops(fd);
 
-		igt_subtest("sd-probe")
+		igt_subtest("sd-probe") {
+			igt_skip_on_f(gem_has_lmem(fd),
+				      "GEM_SET_DOMAIN not supported on discrete platforms\n");
 			test_sd_probe(fd);
+		}
 
 		igt_subtest("set-cache-level")
 			test_set_caching(fd);
-- 
2.34.1
