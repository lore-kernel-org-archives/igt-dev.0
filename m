Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D68110E093
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 07:08:23 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Dec 2022 08:07:16 +0100
Message-Id: <20221220070717.4757-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
References: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator: Fixed start offset
 and alignment
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

On some platforms it may be required to use non-zero start address
that is also aligned. Allocating memory before aligned safe start offset
may result in failures.

Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 3004f15a..060a65ce 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -910,6 +910,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 	struct alloc_resp resp;
 	uint64_t gtt_size;
 
+	if (!start)
+		req.open.start = gem_detect_safe_start_offset(fd);
+
 	if (!end) {
 		igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
 		gtt_size = gem_aperture_size(fd);
@@ -924,6 +927,8 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 	if (!default_alignment)
 		req.open.default_alignment = gem_detect_safe_alignment(fd);
 
+	req.open.start = ALIGN(req.open.start, req.open.default_alignment);
+
 	/* Get child_tid only once at open() */
 	if (child_tid == -1)
 		child_tid = gettid();
-- 
2.34.1
