Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDEF10FBB1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 07:25:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Jul 2022 09:24:51 +0200
Message-Id: <20220719072451.12323-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220719072451.12323-1-zbigniew.kempczynski@intel.com>
References: <20220719072451.12323-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/perf_pmu: Eliminate store
 dword for initialize semaphore
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

On Broadwell we observe semaphore is not entering polling. According to
its initialization with store dword I conclude for this platform there's
rare risk of delayed write thus semaphore is not entering polling wait.

Ensure semaphore will enter waiting by eliminating store dword and
initializing semaphore memory to expected value on bo creation path.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/2383

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/perf_pmu.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 39e9fc5fef..3157ed1f21 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -805,13 +805,8 @@ static uint32_t
 create_sema(int gem_fd, uint64_t ahnd,
 	    struct drm_i915_gem_relocation_entry *reloc, __u64 *poffset)
 {
+	uint32_t initial = 1;
 	uint32_t cs[] = {
-		/* Reset our semaphore wait */
-		MI_STORE_DWORD_IMM,
-		0,
-		0,
-		1,
-
 		/* Wait until the semaphore value is set to 0 [by caller] */
 		MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_NEQ_SDD,
 		1,
@@ -827,19 +822,16 @@ create_sema(int gem_fd, uint64_t ahnd,
 	handle = gem_create(gem_fd, 4096);
 	*poffset = get_offset(ahnd, handle, 4096, 0);
 
-	memset(reloc, 0, 2 * sizeof(*reloc));
+	memset(reloc, 0, 1 * sizeof(*reloc));
 	reloc[0].target_handle = handle;
-	reloc[0].offset = 64 + 1 * sizeof(uint32_t);
-	reloc[1].target_handle = handle;
-	reloc[1].offset = 64 + 6 * sizeof(uint32_t);
+	reloc[0].offset = 64 + 2 * sizeof(uint32_t);
 
 	if (ahnd) {
-		cs[1] = *poffset;
-		cs[2] = *poffset >> 32;
-		cs[6] = *poffset;
-		cs[7] = *poffset >> 32;
+		cs[2] = *poffset;
+		cs[3] = *poffset >> 32;
 	}
 
+	gem_write(gem_fd, handle, 0, &initial, sizeof(initial));
 	gem_write(gem_fd, handle, 64, cs, sizeof(cs));
 	return handle;
 }
@@ -859,7 +851,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = create_sema(gem_fd, ahnd, reloc, &obj.offset),
-		.relocation_count = !ahnd ? 2 : 0,
+		.relocation_count = !ahnd ? 1 : 0,
 		.relocs_ptr = to_user_pointer(reloc),
 		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
 	};
-- 
2.34.1
