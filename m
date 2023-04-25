Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEFB10E771
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 15:41:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 17:40:17 +0200
Message-Id: <20230425154017.374465-16-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 15/15] tests/kms_big_fb: Deduce region
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
