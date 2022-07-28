Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2505312AA8B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 12:47:43 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 14:47:35 +0200
Message-Id: <20220728124735.23529-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Open master device when
 setting error state
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

Error capture file is in /sys/class/drm/cardN/error so open the
master device instead of render dev when test needs to change
error state sysfs file.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6268
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_ctx_exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 3d94f01db..a85ea971c 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -456,7 +456,7 @@ igt_main
 	int fd;
 
 	igt_fixture {
-		fd = drm_open_driver_render(DRIVER_INTEL);
+		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 
 		gem_require_contexts(fd);
-- 
2.35.1
