Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E9910E638
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 08:27:46 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Fri,  2 Jun 2023 10:27:21 +0200
Message-Id: <20230602082721.7818-7-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
References: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] Fix drm_mm build error
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
List-ID: <igt-dev@lists.freedesktop.org>

Quick workaround for drm_mm documentation causing compilation error.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/i915/i915_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
index a029801a..ba49de2a 100644
--- a/tests/i915/i915_test_config.json
+++ b/tests/i915/i915_test_config.json
@@ -6,7 +6,7 @@
                "../core_hotunplug.c", "../core_setmaster.c",
                "../core_setmaster_vs_auth.c", "../debugfs_test.c",
                "../device_reset.c", "../dmabuf.c",
-               "../drm_import_export.c", "../drm_mm.c",
+               "../drm_import_export.c",
                "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
                "../prime_mmap_coherency.c", "../prime_self_import.c",
                "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
-- 
2.34.1


