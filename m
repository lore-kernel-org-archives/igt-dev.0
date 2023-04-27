Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5657A10EBE4
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:06:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:03:07 +0200
Message-Id: <20230427200307.240349-17-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
References: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 16/16] tests/kms_big_fb: Deduce region
 for xe framebuffer
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

For discrete framebuffer reside on vram/device memory and for
integrated on system memory. Due to xe requirement regarding
size and alignment on different memory regions during intel_buf
creation pass deduced memory region.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_fb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index a29a05a282..a0d5ef7301 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -28,6 +28,7 @@
 #include <string.h>
 
 #include "i915/gem_create.h"
+#include "xe/xe_query.h"
 
 IGT_TEST_DESCRIPTION("Test big framebuffers");
 
@@ -62,7 +63,10 @@ static struct intel_buf *init_buf(data_t *data,
 				  const char *buf_name)
 {
 	struct intel_buf *buf;
+	enum intel_driver driver = buf_ops_get_driver(data->bops);
 	uint32_t name, handle, tiling, stride, width, height, bpp, size;
+	uint64_t region = driver == INTEL_DRIVER_XE ?
+				vram_if_possible(data->drm_fd, 0) : -1;
 
 	igt_assert_eq(fb->offsets[0], 0);
 
@@ -75,8 +79,10 @@ static struct intel_buf *init_buf(data_t *data,
 
 	name = gem_flink(data->drm_fd, fb->gem_handle);
 	handle = gem_open(data->drm_fd, name);
-	buf = intel_buf_create_using_handle(data->bops, handle, width, height,
-					    bpp, 0, tiling, 0);
+	buf = intel_buf_create_full(data->bops, handle, width, height,
+				    bpp, 0, tiling, 0, size, 0,
+				    region);
+
 	intel_buf_set_name(buf, buf_name);
 	intel_buf_set_ownership(buf, true);
 
-- 
2.34.1
