Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E5210E551
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:49:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:49:23 +0100
Message-Id: <20230117144923.59940-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_create: Ensure newly created
 handles are not reusing same offset
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

We need to ensure second group of spinners won't stuck on vma eviction
and they will be scheduled for the execution. We need to propose new
offsets to avoid situation spinner batch and object dependency handle
offset will overlap. Since reloc allocator is tracking offsets for
handles we need to explicitly release it.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7679

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index af530ccc2f..c719ab6c77 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -325,6 +325,7 @@ static void busy_create(int i915, const struct gem_memory_region *r, int timeout
 					      .flags = ((flags & BUSY_HOG ? IGT_SPIN_NO_PREEMPTION : 0) |
 							IGT_SPIN_SOFTDEP));
 			gem_close(i915, handle);
+			put_offset(ahnd, handle);
 
 			igt_spin_free(i915, spin[e->flags]);
 			spin[e->flags] = next;
-- 
2.34.1
