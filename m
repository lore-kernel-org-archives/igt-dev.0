Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 May 2020 15:17:23 +0100
Message-Id: <20200526141723.401469-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Update inter-engine
 semaphore detection
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The kernel no longer uses semaphores between engines, unless it can do
so by preempting them with timeslices. Update the semaphore-busy to only
run when we expect semaphore usage, i.e. not on bdw/bsw.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1939
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/perf_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index e54a0d47e..e80f730cf 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -822,6 +822,7 @@ sema_busy(int gem_fd,
 	int fd;
 
 	igt_require(gem_scheduler_has_semaphores(gem_fd));
+	igt_require(gem_scheduler_has_preemption(gem_fd));
 
 	fd = open_group(gem_fd,
 			I915_PMU_ENGINE_SEMA(e->class, e->instance), -1);
-- 
2.27.0.rc0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
