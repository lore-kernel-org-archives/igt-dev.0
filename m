Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318DB10E21B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 07:30:15 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 08:29:42 +0100
Message-Id: <20221214072944.3492-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
References: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/intel_allocator: Fixed start
 alignment
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

On some platforms it may be required to use aligned start address.

Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 64616984..060a65ce 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -927,6 +927,8 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 	if (!default_alignment)
 		req.open.default_alignment = gem_detect_safe_alignment(fd);
 
+	req.open.start = ALIGN(req.open.start, req.open.default_alignment);
+
 	/* Get child_tid only once at open() */
 	if (child_tid == -1)
 		child_tid = gettid();
-- 
2.34.1
