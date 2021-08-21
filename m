Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3166EB4B
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Aug 2021 07:12:33 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat, 21 Aug 2021 12:48:44 +0530
Message-Id: <20210821071844.1660525-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_gpgpu_fill: Add support for local
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add support for local memory region (Device memory)

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_gpgpu_fill.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
index 1fcd42e2..74a227f6 100644
--- a/tests/i915/gem_gpgpu_fill.c
+++ b/tests/i915/gem_gpgpu_fill.c
@@ -150,7 +150,8 @@ igt_main
 		igt_assert(region_info);
 
 		region_set = get_memory_region_set(region_info,
-						   I915_SYSTEM_MEMORY);
+						   I915_SYSTEM_MEMORY,
+						   I915_DEVICE_MEMORY);
 	}
 
 	igt_subtest_with_dynamic("basic") {
-- 
2.25.1
