Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8249A10E14F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 19:48:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 20:46:51 +0100
Message-Id: <20220218194651.25977-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/api_intel_allocator: change copy
 instruction for new gens
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

Use XY_FAST_COPY_BLT on newer GPU generations.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index bb1b3838..487eafce 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -575,15 +575,20 @@ static void execbuf_with_allocator(int fd)
 
 	/* Blit src -> dst */
 	i = 0;
-	batch[i++] = XY_SRC_COPY_BLT_CMD |
-		  XY_SRC_COPY_BLT_WRITE_ALPHA |
-		  XY_SRC_COPY_BLT_WRITE_RGB;
-	if (gen >= 8)
-		batch[i - 1] |= 8;
-	else
-		batch[i - 1] |= 6;
-
-	batch[i++] = (3 << 24) | (0xcc << 16) | 4;
+	if (gen >= 9) {
+		batch[i++] = XY_FAST_COPY_BLT; /* No tiling */
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | 0x10;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			  XY_SRC_COPY_BLT_WRITE_ALPHA |
+			  XY_SRC_COPY_BLT_WRITE_RGB;
+		if (gen >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | (0xcc << 16) | 4;
+	}
 	batch[i++] = 0;
 	batch[i++] = (1 << 16) | 4;
 	batch[i++] = object[1].offset;
-- 
2.32.0
