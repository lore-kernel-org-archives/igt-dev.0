Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9DF10E4CE
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 00:08:40 +0000 (UTC)
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 17:10:39 -0700
Message-Id: <20230727001039.3923486-2-fei.yang@intel.com>
In-Reply-To: <20230727001039.3923486-1-fei.yang@intel.com>
References: <20230727001039.3923486-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/1] test/i915/gem_create: skip set_pat for non
 MTL devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>, tvrtko.ursulin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Fix the logic checking for non-meteorlake devices.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 4b00fe6aa..87fde2963 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -680,7 +680,7 @@ static void create_ext_set_pat(int fd)
 	 * supported.
 	 */
 	igt_skip_on_f(ret == -EINVAL ||
-		      (ret == -ENODEV && IS_METEORLAKE(devid)),
+		      (ret == -ENODEV && !IS_METEORLAKE(devid)),
 		      "I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
 
 	/*
-- 
2.25.1
