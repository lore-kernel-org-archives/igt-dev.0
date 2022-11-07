Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EA610E05D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 08:40:46 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 14:09:26 +0530
Message-Id: <20221107083926.613819-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/prime_vgem: Fix timeout/incomplete
 issue in MTL simulation
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

Fixed Timeout issue seen on MTL, Simulation environment
takes more then 1625s and gets timed out. Reduced
run from 1024 to 64 to get test executed under 150s.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

---
 tests/prime_vgem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 95c8e4fe..be3f3ac7 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -536,7 +536,7 @@ static void test_blt_interleaved(int vgem, int i915)
 	foreign = vgem_mmap(vgem, &scratch, PROT_WRITE);
 	local = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_WRITE);
 
-	for (i = 0; i < scratch.height; i++) {
+	for (i = 0; i < SLOW_QUICK(scratch.height, 64); i++) {
 		local[scratch.pitch * i / sizeof(*local)] = i;
 		igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
 				     I915_TILING_NONE, 0, i, scratch.size,
-- 
2.25.1
