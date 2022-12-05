Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDF110E2BB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 23:04:11 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 15:03:48 -0800
Message-Id: <20221205230348.2086715-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Support all future platforms in bufops
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

The basic assumption is that any future/unknown platform will derive its
feature set from the last known generation, so we can use their
definitions as our defaults.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_bufops.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index c63a5760..72c2189e 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -101,7 +101,7 @@ struct buf_ops {
 	int fd;
 	int gen_start;
 	int gen_end;
-	int intel_gen;
+	unsigned int intel_gen;
 	uint32_t supported_tiles;
 	uint32_t supported_hw_tiles;
 	uint32_t swizzle_x;
@@ -440,8 +440,8 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
 		       uint32_t *linear, enum ccs_copy_direction dir)
 {
 	uint64_t size, offset, ccs_size;
+	unsigned int gen;
 	void *map;
-	int gen;
 
 	if (!buf->compression || HAS_FLATCCS(intel_get_drm_devid(bops->fd)))
 		return;
@@ -1214,7 +1214,7 @@ static void __intel_buf_write_to_png(struct buf_ops *bops,
 	cairo_status_t ret;
 	void *linear;
 	int format, width, height, stride, offset;
-	int gen = bops->intel_gen;
+	unsigned int gen = bops->intel_gen;
 
 	igt_assert_eq(posix_memalign(&linear, 16, intel_buf_size(buf)), 0);
 
@@ -1265,7 +1265,7 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 	.ys_to_linear       = copy_ys_to_linear, \
 	.tile4_to_linear    = copy_tile4_to_linear
 
-struct buf_ops buf_ops_arr[] = {
+static const struct buf_ops buf_ops_arr[] = {
 	{
 		DEFAULT_BUFOPS(2, 8),
 		.supported_tiles    = TILE_NONE | TILE_X | TILE_Y,
@@ -1277,7 +1277,7 @@ struct buf_ops buf_ops_arr[] = {
 	},
 
 	{
-		DEFAULT_BUFOPS(12, 12),
+		DEFAULT_BUFOPS(12, ~0U),
 		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
 	},
 };
@@ -1394,28 +1394,27 @@ uint64_t intel_buf_bo_size(const struct intel_buf *buf)
 static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 {
 	struct buf_ops *bops = calloc(1, sizeof(*bops));
+	unsigned int generation;
 	uint32_t devid;
-	int generation;
 
 	igt_assert(bops);
 
 	devid = intel_get_drm_devid(fd);
 	generation = intel_gen(devid);
 
-	/* Predefined settings */
+	/* Predefined settings: see intel_device_info? */
 	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
 		if (generation >= buf_ops_arr[i].gen_start &&
 		    generation <= buf_ops_arr[i].gen_end) {
 			memcpy(bops, &buf_ops_arr[i], sizeof(*bops));
-			bops->fd = fd;
-			bops->intel_gen = generation;
-			igt_debug("generation: %d, supported tiles: 0x%02x\n",
-				  generation, bops->supported_tiles);
 			break;
 		}
 	}
 
-	igt_assert(bops->intel_gen);
+	bops->fd = fd;
+	bops->intel_gen = generation;
+	igt_debug("generation: %d, supported tiles: 0x%02x\n",
+		  bops->intel_gen, bops->supported_tiles);
 
 	/*
 	 * Warning!
-- 
2.38.1
