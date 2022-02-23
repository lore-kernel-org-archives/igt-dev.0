Return-path: <SRS0=UqwI=TG=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFBB10E70E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 10:33:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 11:33:03 +0100
Message-Id: <20220223103303.24510-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220223103303.24510-1-zbigniew.kempczynski@intel.com>
References: <20220223103303.24510-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/api_intel_allocator: Add
 default-alignment test
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

Test verifies that intel-allocator uses caller default-alignment setting
during open() instead of choosing safe alignment instead. Also check
does alloc() can overwrite default setting used by the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/api_intel_allocator.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 7ae4a00b7..daf771363 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -120,6 +120,34 @@ static void reserve(int fd, uint8_t type)
 	igt_assert_eq(intel_allocator_close(ahnd), true);
 }
 
+static void alignment(int fd)
+{
+	struct test_obj obj[3];
+	uint64_t ahnd, default_alignment = 0x4000;
+
+	ahnd = intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH,
+					 default_alignment);
+
+	for (int i = 0; i < ARRAY_SIZE(obj); i++) {
+		obj[i].handle = gem_handle_gen();
+		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle, 4096,
+				i == 2 ? 4096 : 0);
+		igt_debug("obj[%d].offset: %llx, handle: %u\n", i,
+			 (long long) obj[i].offset, obj[i].handle);
+	}
+
+	igt_assert_eq(obj[1].offset - obj[0].offset, default_alignment);
+	/* obj[2] should be between obj[0] and obj[1] */
+	igt_assert(obj[0].offset < obj[2].offset);
+	igt_assert(obj[2].offset < obj[1].offset);
+
+	for (int i = 0; i < ARRAY_SIZE(obj); i++)
+		intel_allocator_free(ahnd, obj[i].handle);
+
+	igt_assert_eq(intel_allocator_close(ahnd), true);
+}
+
 static bool overlaps(struct test_obj *buf1, struct test_obj *buf2)
 {
 	uint64_t begin1 = buf1->offset;
@@ -692,6 +720,11 @@ igt_main
 	igt_subtest_f("reserve")
 		reserve(fd, INTEL_ALLOCATOR_SIMPLE);
 
+	igt_describe("For simple allocator check does default alignment is "
+		     "properly handled for open and alloc functions");
+	igt_subtest_f("alignment")
+		alignment(fd);
+
 	for (a = als; a->name; a++) {
 		igt_subtest_with_dynamic_f("%s-allocator", a->name) {
 			igt_dynamic("basic")
-- 
2.32.0
