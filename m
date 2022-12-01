Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CC110E5CF
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 13:03:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Dec 2022 14:03:10 +0100
Message-Id: <20221201130312.69093-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
References: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/api_intel_allocator: Remove
 duplicated reuse and reserve subtests
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

For SIMPLE allocator those subtest are duplicated outside loop which
exercises all defined allocators. Lets remove it and not waste time
for double run.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 098b9e6960..b55587e549 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -769,12 +769,6 @@ igt_main
 	igt_subtest_f("reserve-simple")
 		reserve_simple(fd);
 
-	igt_subtest_f("reuse")
-		reuse(fd, INTEL_ALLOCATOR_SIMPLE);
-
-	igt_subtest_f("reserve")
-		reserve(fd, INTEL_ALLOCATOR_SIMPLE);
-
 	igt_describe("For simple allocator check does default alignment is "
 		     "properly handled in open and alloc functions");
 	igt_subtest_f("default-alignment")
-- 
2.34.1
