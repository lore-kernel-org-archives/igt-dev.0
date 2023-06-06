Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA1710E31A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 09:51:58 +0000 (UTC)
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>
Date: Tue,  6 Jun 2023 11:51:23 +0200
Message-Id: <20230606095123.476130-2-andi.shyti@linux.intel.com>
In-Reply-To: <20230606095123.476130-1-andi.shyti@linux.intel.com>
References: <20230606095123.476130-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/1] test/gem_create: limit set_pat to GEN12+
 platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: IGT dev <igt-dev@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

For platforms prior to GEN12 the set_pat extension should
return -ENODEV.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/i915/gem_create.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index e9e8216d2b..a3428e5890 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -657,6 +657,7 @@ static void create_ext_set_pat(int fd)
 		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
 		.pat_index = 65,
 	};
+	uint32_t devid = intel_get_drm_devid(fd);
 	struct drm_i915_gem_caching arg;
 	uint64_t size;
 	uint32_t handle;
@@ -670,8 +671,13 @@ static void create_ext_set_pat(int fd)
 	 * With a valid PAT index specified, returning -EINVAL here
 	 * indicates set_pat extension is not supported
 	 */
-	if (ret == -EINVAL)
+	if (!IS_METEORLAKE(devid)) {
+		igt_assert(ret == -ENODEV);
+		return;
+	} else if (ret == -EINVAL) {
 		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
+	}
+
 	igt_assert(ret == 0);
 
 	/*
-- 
2.40.1
