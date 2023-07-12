Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED3310E073
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 08:37:58 +0000 (UTC)
From: Andi Shyti <andi.shyti@linux.intel.com>
To: IGT dev <igt-dev@lists.freedesktop.org>
Date: Wed, 12 Jul 2023 10:37:27 +0200
Message-Id: <20230712083727.282741-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] test/i915/gem_create: Skip the test if the PAT
 index is set on a non MTL device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If we try to set the PAT index on a device that is not a Meteor
Lake, we expect an -ENODEV return value. But then, we forget to
skip and soon after we assert on the return value being '0',
forcing the error path.

Skip, as expected, in case the return value is either EINVAL or
ENODEV, the latter for meteor lake devices.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_create.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index b7961d9ef2..4b00fe6aab 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -668,14 +668,25 @@ static void create_ext_set_pat(int fd)
 	ret = __gem_create_ext(fd, &size, 0, &handle, &setparam_pat.base);
 
 	/*
-	 * With a valid PAT index specified, returning -EINVAL here
-	 * indicates set_pat extension is not supported
+	 * Currently the PAT index is supported only for Meteor Lake, so that
+	 * we expect:
+	 *
+	 *  * -EINVAL if i915 does not support the PAT index, e.g. the kernel is
+	 *    too old to have the PAT index supported.
+	 *  * -ENODEV if we are trying to set the PAT index on a non Meteor Lake
+	 *    platform.
+	 *
+	 * In both cases, though, the I915_GEM_CREATE_EXT_SET_PAT flag is not
+	 * supported.
 	 */
-	if (ret == -EINVAL)
-		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
-	else if (!IS_METEORLAKE(devid))
-		igt_assert_eq(ret, -ENODEV);
+	igt_skip_on_f(ret == -EINVAL ||
+		      (ret == -ENODEV && IS_METEORLAKE(devid)),
+		      "I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
 
+	/*
+	 * This means that we are on a Meteor Lake and the PAT
+	 * index is already supported by the running i915
+	 */
 	igt_assert(ret == 0);
 
 	/*
-- 
2.40.1
