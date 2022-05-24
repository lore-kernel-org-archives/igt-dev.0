Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418710E65D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 11:18:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 May 2022 13:18:36 +0200
Message-Id: <20220524111836.152123-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use detected start
 offset in intel-bb instead 0x0
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

On some platforms (like on ATS) 0x0 may not be available so allocator
should be instantiated with safe start offset to avoid getting -ENOSPC.
Change require also relaxation of automatic range selection in the
allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/intel_allocator.c   | 2 +-
 lib/intel_batchbuffer.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 340b888286..7882e484b5 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -909,7 +909,7 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 	struct alloc_resp resp;
 	uint64_t gtt_size;
 
-	if (!start && !end) {
+	if (!end) {
 		igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
 		gtt_size = gem_aperture_size(fd);
 		if (!gem_uses_full_ppgtt(fd))
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 8680c9ba93..555618e463 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1359,6 +1359,9 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 	if (!ibb->uses_full_ppgtt)
 		do_relocs = true;
 
+	/* Use safe start offset instead assuming 0x0 is safe */
+	start = max_t(uint64_t, start, gem_detect_safe_start_offset(i915));
+
 	/* if relocs are set we won't use an allocator */
 	if (do_relocs)
 		allocator_type = INTEL_ALLOCATOR_NONE;
-- 
2.32.0
