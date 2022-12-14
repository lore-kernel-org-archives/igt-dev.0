Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587CB10E051
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 07:30:16 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 08:29:43 +0100
Message-Id: <20221214072944.3492-4-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
References: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/api_intel_allocator: Fixed
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

On some platforms it may be required to use safe start offset
instead of hardcoded one.

Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 87abd900..cf401176 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -96,7 +96,7 @@ static void reserve_simple(int fd)
 static void reserve(int fd, uint8_t type)
 {
 	struct test_obj obj;
-	uint64_t ahnd, offset = 0x40000, size = 0x1000;
+	uint64_t ahnd, offset = gem_detect_safe_start_offset(fd), size = 0x1000;
 
 	ahnd = intel_allocator_open(fd, 0, type);
 
-- 
2.34.1
