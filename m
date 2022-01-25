Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882F410EC52
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 06:52:40 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 25 Jan 2022 07:52:29 +0100
Message-Id: <20220125065231.16986-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
References: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/intel_bufops: Relax swizzle
 condition to allow using software tiling
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On gen8+ or VLV i915 doesn't set swizzle bits so disabling software
tiling when we're not able to get swizzle bits (via GEM_SET_TILING)
is not necessary.

Software tiling is useful for detecting correctness of tiled surfaces
produced by render-copy or fast-copy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_bufops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f13063fa9..e8160c823 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1359,7 +1359,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bool supported = probe_hw_tiling(bops, I915_TILING_X,
 						 &swizzling_supported);
 
-		if (!swizzling_supported) {
+		if (!swizzling_supported && bops->intel_gen < 8) {
 			igt_debug("Swizzling for X is not supported\n");
 			bops->supported_tiles &= ~TILE_X;
 		}
@@ -1377,7 +1377,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bool supported = probe_hw_tiling(bops, I915_TILING_Y,
 						 &swizzling_supported);
 
-		if (!swizzling_supported) {
+		if (!swizzling_supported && bops->intel_gen < 8) {
 			igt_debug("Swizzling for Y is not supported\n");
 			bops->supported_tiles &= ~TILE_Y;
 		}
-- 
2.32.0
