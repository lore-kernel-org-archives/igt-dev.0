Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  2 Jul 2020 18:46:20 +0100
Message-Id: <20200702174620.230048-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200702123908.227124-1-chris@chris-wilson.co.uk>
References: <20200702123908.227124-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf: Instantiate a local drm_fd for
 the unprivileged helper
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
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index d4ebae30d..92edc9f1f 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4120,8 +4120,13 @@ gen12_test_single_ctx_render_target_writes_a_counter(void)
 
 	do {
 		igt_fork_helper(&child) {
+			/* A local device for local resources. */
+			drm_fd = gem_reopen_driver(drm_fd);
+
 			igt_drop_root();
 			gen12_single_ctx_helper();
+
+			close(drm_fd);
 		}
 		child_ret = igt_wait_helper(&child);
 		igt_assert(WEXITSTATUS(child_ret) == EAGAIN ||
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
