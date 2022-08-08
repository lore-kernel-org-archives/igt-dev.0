Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3511368A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 17:55:05 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 Aug 2022 10:54:58 -0700
Message-Id: <20220808175458.156815-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/perf_pmu: Use correct context id
 in "enable-race"
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

Use correct context id in "enable-race" test.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/5490
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index e2b13540e76e..f363db2ba135 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1809,7 +1809,7 @@ test_enable_race(int gem_fd, const intel_ctx_t *ctx,
 	int fd;
 
 	igt_require(gem_scheduler_has_engine_busy_stats(gem_fd));
-	igt_require(gem_context_has_engine(gem_fd, 0, e->flags));
+	igt_require(gem_context_has_engine(gem_fd, ctx->id, e->flags));
 
 	obj.handle = gem_create(gem_fd, 4096);
 	gem_write(gem_fd, obj.handle, 0, &bbend, sizeof(bbend));
-- 
2.34.1
