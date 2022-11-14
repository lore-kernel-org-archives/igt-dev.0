Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D110E2F5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 16:46:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 17:45:59 +0100
Message-Id: <20221114164559.30419-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221114164559.30419-1-zbigniew.kempczynski@intel.com>
References: <20221114164559.30419-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/gem_lmem_swapping: retry execbuf
 on no memory error with oom testing
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

From: CQ Tang <cq.tang@intel.com>

When doing oom test, we have side processes to eat all the system memory,
so the swapping test process might encounter -ENOMEM or -ENXIO error as
well, we need to retry the operation when these errors are returned.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index cccdb3195b..969fb9080b 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -133,7 +133,7 @@ static uint32_t create_bo(int i915,
 
 retry:
 	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, region, 1);
-	if (do_oom_test && ret == -ENOMEM)
+	if (do_oom_test && (ret == -ENOMEM || ret == -ENXIO))
 		goto retry;
 	igt_assert_eq(ret, 0);
 	return handle;
-- 
2.34.1
