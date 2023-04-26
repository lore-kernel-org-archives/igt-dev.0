Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225D510E95A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:16:53 +0530
Message-Id: <20230426114725.2244653-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 13/45] lib/igt_fb: For xe assume vram is used
 on discrete
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Assume fb bo's were created on vram on discrete, otherwise use system
memory.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7379b99aa..76f2e1245 100644
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
+				vram_if_possible(fd, 0) : 0;
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
2.40.0
