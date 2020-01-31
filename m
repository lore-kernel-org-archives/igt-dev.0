Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713A6E939
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 00:15:25 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 30 Jan 2020 16:15:16 -0800
Message-Id: <20200131001516.2228-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_basic: Skip subtest gtt
 if gtt mapping is unavailable
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

The subtest tries to do a gtt mapping but if there is no mappable
aperture that is not possible.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
---
 tests/i915/gem_exec_basic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 70dce34b..08336168 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -93,6 +93,7 @@ static void gtt(int fd, uint64_t flags)
 	struct drm_i915_gem_exec_object2 *exec;
 	uint32_t handle;
 
+	gem_require_mappable_ggtt(fd);
 	gem_require_ring(fd, flags);
 
 	handle = gem_create(fd, 4096);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
