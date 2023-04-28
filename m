Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50810EC5C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:23:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 08:22:22 +0200
Message-Id: <20230428062224.21322-16-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 15/17] lib/igt_fb: For xe assume vram is
 used on discrete
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

Assume fb bo's were created on vram on discrete, otherwise use system
memory.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
v2: use -1 for i915 region (Bhanu)
---
 lib/igt_fb.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7379b99aa8..df3d7d91a9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2545,6 +2545,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 {
 	struct intel_buf *buf;
 	uint32_t bo_name, handle, compression;
+	uint64_t region;
 	int num_surfaces;
 	int i;
 
@@ -2571,12 +2572,16 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	bo_name = gem_flink(fd, fb->gem_handle);
 	handle = gem_open(fd, bo_name);
 
-	buf = intel_buf_create_using_handle_and_size(bops, handle,
-						     fb->width, fb->height,
-						     fb->plane_bpp[0], 0,
-						     igt_fb_mod_to_tiling(fb->modifier),
-						     compression, fb->size,
-						     fb->strides[0]);
+	/* For i915 region doesn't matter, for xe does */
+	region = buf_ops_get_driver(bops) == INTEL_DRIVER_XE ?
+				vram_if_possible(fd, 0) : -1;
+	buf = intel_buf_create_full(bops, handle,
+				    fb->width, fb->height,
+				    fb->plane_bpp[0], 0,
+				    igt_fb_mod_to_tiling(fb->modifier),
+				    compression, fb->size,
+				    fb->strides[0],
+				    region);
 	intel_buf_set_name(buf, name);
 
 	/* Make sure we close handle on destroy path */
-- 
2.34.1
