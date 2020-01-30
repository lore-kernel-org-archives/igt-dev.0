Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432A6FA35
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 21:18:04 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 30 Jan 2020 13:17:48 -0800
Message-Id: <20200130211748.629-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_concurrent_all: Skip GTT
 mapping when aperture not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The test iterates over several mappings and BOs creation options, when
GTT mapping is not available skip those options.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_concurrent_all.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index f1be4a85..22f429e8 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -440,6 +440,11 @@ static void create_vgem_require(const struct create *create, unsigned count)
 	create_dmabuf_require(create, count);
 }
 
+static void create_gtt_require(const struct create *create, unsigned count)
+{
+	gem_require_mappable_ggtt(fd);
+}
+
 static drm_intel_bo *
 vgem_create_bo(const struct buffers *b)
 {
@@ -1406,6 +1411,7 @@ static void cpu_require(void)
 
 static void gtt_require(void)
 {
+	gem_require_mappable_ggtt(fd);
 }
 
 static void bcs_require(void)
@@ -1722,6 +1728,7 @@ igt_main
 		{
 			.name = "gtt",
 			.create_bo = gtt_create_bo,
+			.require = create_gtt_require,
 			.set_bo = gtt_set_bo,
 			.cmp_bo = gtt_cmp_bo,
 			.release_bo = nop_release_bo,
@@ -1729,6 +1736,7 @@ igt_main
 		{
 			.name = "gttX",
 			.create_bo = gttX_create_bo,
+			.require = create_gtt_require,
 			.set_bo = gtt_set_bo,
 			.cmp_bo = gtt_cmp_bo,
 			.release_bo = nop_release_bo,
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
