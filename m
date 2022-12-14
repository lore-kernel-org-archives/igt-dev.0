Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F40710E219
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 07:30:17 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 08:29:44 +0100
Message-Id: <20221214072944.3492-5-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
References: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/i915/api_intel_allocator: Fixed
 start alignment
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
 tests/i915/api_intel_allocator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index cf401176..c9fe881c 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -50,6 +50,7 @@ static void alloc_simple(int fd)
 	igt_assert(!freed);
 
 	intel_allocator_get_address_range(ahnd, &start, &end);
+	start = ALIGN(start, gem_detect_safe_alignment(fd));
 	offset0 = intel_allocator_alloc(ahnd, 1, end - start, 0);
 	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, ALLOC_STRATEGY_NONE);
 	igt_assert(offset1 == ALLOC_INVALID_ADDRESS);
-- 
2.34.1
