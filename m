Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  2 Jul 2020 13:39:08 +0100
Message-Id: <20200702123908.227124-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/perf: Instantiate a local drm_fd for
 the unprivileged helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

While the test is blocked, we keep trying the gen12_single_ctx_helper().
As this is using the parent's drm_fd, all of our context allocations are
persistent. Reopen the device in the child so that when we exit, our
allocations are freed along with the process -- avoiding a total memory
leak if the test is stuck.

This does not explain why the test was stuck, it just prevents us from
exacerbating the error condition. Hopefully leaving the system in a more
debuggable state.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/2126
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index d4ebae30d..dbf7e3497 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -3845,6 +3845,7 @@ static void gen12_single_ctx_helper(void)
 		.format = test_set->perf_oa_format
 	};
 
+	drm_fd = gem_reopen_driver(drm_fd);
 	bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
 	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
 
@@ -4107,6 +4108,7 @@ static void gen12_single_ctx_helper(void)
 	drm_intel_gem_context_destroy(context1);
 	drm_intel_bufmgr_destroy(bufmgr);
 	__perf_close(stream_fd);
+	close(drm_fd);
 }
 
 static void
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
