Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8185A10E41D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:48 +0200
Message-Id: <20230817094652.40243-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/intel_compute: Add name field for
 debugging purposes
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

Debugging without knowledge about object characteristics is hard and
time consuming. Simple name field added for printing binded addresses
and their sizes might speed up development. I experienced this on
extending to DG2 so I decided to permanently add it. But to avoid
annoying output this is limited to igt_debug() which will print
only on user request or on the test failure.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/intel_compute.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index ef4ae539e8..0c89118bcd 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -37,6 +37,7 @@ struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
 	void *data;
+	const char *name;
 };
 
 struct bo_execenv {
@@ -92,6 +93,11 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
 			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
 			memset(bo_dict[i].data, 0, bo_dict[i].size);
+
+			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
+				  i, bo_dict[i].name, bo_dict[i].data,
+				  (long long)bo_dict[i].addr,
+				  (long long)bo_dict[i].size);
 		}
 
 		syncobj_destroy(fd, sync.handle);
@@ -480,13 +486,26 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 {
 #define TGL_BO_DICT_ENTRIES 7
 	struct bo_dict_entry bo_dict[TGL_BO_DICT_ENTRIES] = {
-		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL}, // kernel
-		{ .addr = ADDR_DYNAMIC_STATE_BASE, .size =  0x1000}, // dynamic state
-		{ .addr = ADDR_SURFACE_STATE_BASE, .size =  0x1000}, // surface state
-		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START, .size =  0x10000}, // indirect data
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT }, // input
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
-		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
+		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
+		  .name = "kernel" },
+		{ .addr = ADDR_DYNAMIC_STATE_BASE,
+		  .size =  0x1000,
+		  .name = "dynamic state base" },
+		{ .addr = ADDR_SURFACE_STATE_BASE,
+		  .size =  0x1000,
+		  .name = "surface state base" },
+		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START,
+		  .size =  0x10000,
+		  .name = "indirect data start" },
+		{ .addr = ADDR_INPUT,
+		  .size = SIZE_BUFFER_INPUT,
+		  .name = "input" },
+		{ .addr = ADDR_OUTPUT,
+		  .size = SIZE_BUFFER_OUTPUT,
+		  .name = "output" },
+		{ .addr = ADDR_BATCH,
+		  .size = SIZE_BATCH,
+		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
 	float *dinput;
-- 
2.34.1
