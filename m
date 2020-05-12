Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C826E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 10:24:58 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 12 May 2020 12:24:47 +0200
Message-Id: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exec_nop: "headless" requires
 submicrosecond precision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@ists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Commit 16f067ae42a6 ("i915/gem_exec_nop: Remove submission batching")
claimed to address the requirement of "headless" subtest for more
precise time measurement by keeping submission batching for it in
place.  Unfortunately, that was not implemented and the requirement
is now not addressed.

Check how many requests can be submitted per second and skip the
subtest if less than 1000.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_nop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 1c17d023d..2586db2d2 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -377,6 +377,8 @@ stable_nop_on_ring(int fd, uint32_t handle,
 		double time;
 
 		time = nop_on_ring(fd, handle, e, timeout, &count);
+		igt_skip_on_f(count < 1000 * timeout,
+			      "submicrosecond precision of time measurement\n");
 		igt_stats_push_float(&s, time / count);
 	}
 
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
