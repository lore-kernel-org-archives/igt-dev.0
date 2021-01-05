Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 Jan 2021 21:26:06 +0000
Message-Id: <20210105212606.3399854-2-chris@chris-wilson.co.uk>
In-Reply-To: <20210105212606.3399854-1-chris@chris-wilson.co.uk>
References: <20210105212606.3399854-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_spin_batch: Check for userptr
 before use
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

If the device cannot handle coherent memory, it will disallow userptr.
Check before use.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2904
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_spin_batch.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index c2ce2373b..2ec278857 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -176,6 +176,25 @@ static void spin_all(int i915, unsigned int flags)
 	}
 }
 
+static bool has_userptr(int fd)
+{
+	struct drm_i915_gem_userptr userptr;
+	int err;
+
+	memset(&userptr, 0, sizeof(userptr));
+	userptr.user_size = 8192;
+	userptr.user_ptr = -4096;
+
+	err = 0;
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr)) {
+		err = errno;
+		igt_assume(err);
+	}
+	errno = 0;
+
+	return err == EFAULT;
+}
+
 igt_main
 {
 	const struct intel_execution_engine2 *e2;
@@ -235,8 +254,10 @@ igt_main
 	igt_subtest("spin-each")
 		spin_on_all_engines(fd, 0, 3);
 
-	igt_subtest("user-each")
+	igt_subtest("user-each") {
+		igt_require(has_userptr(fd));
 		spin_on_all_engines(fd, IGT_SPIN_USERPTR, 3);
+	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
