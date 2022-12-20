Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D1A10E08A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 07:08:23 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Dec 2022 08:07:17 +0100
Message-Id: <20221220070717.4757-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
References: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/api_intel_allocator: Fixed
 start offset
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

It is safer to use intel_allocator_get_address_range than arbitrary
hardcoded start offset that may be too low.

Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 87abd900..e9039a21 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -96,9 +96,10 @@ static void reserve_simple(int fd)
 static void reserve(int fd, uint8_t type)
 {
 	struct test_obj obj;
-	uint64_t ahnd, offset = 0x40000, size = 0x1000;
+	uint64_t ahnd, offset, size = 0x1000;
 
 	ahnd = intel_allocator_open(fd, 0, type);
+	intel_allocator_get_address_range(ahnd, &offset, NULL);
 
 	igt_assert_eq(intel_allocator_reserve(ahnd, 0, size, offset), true);
 	/* try overlapping won't succeed */
-- 
2.34.1
