Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76F210E6FD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 10:26:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 11:26:33 +0100
Message-Id: <20230111102633.27518-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
References: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_mmap_offset: Avoid FPE in
 calculating npages to clear
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

Add a small delay (ala gem_create/clear) to busywait when we run out of
pages to allocate, avoid the FPE and continue on a bit later once the
other threads have released some pages of their own.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7788

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_mmap_offset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index b38b7edae3..962fc1b739 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -673,8 +673,13 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 
 	max = *global;
 	do {
+		while (max < 16) {
+			usleep(10);
+			max = *global;
+		}
+
 		old = max;
-		try = 1 + npages % (max / 2);
+		try = 1 + npages % (max / 2 - 1);
 		max -= try;
 	} while ((max = atomic_compare_swap_u64(global, old, max)) != old);
 
-- 
2.34.1
