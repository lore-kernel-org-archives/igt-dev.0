Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 May 2020 14:25:48 +0100
Message-Id: <20200526132548.76656-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Restore hangcheck modparams
 between tests
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

The hangcheck/reset modparam has far reaching effects and disables
functionality if switch off. This can surprise a few tests causing them
to skip.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/1929
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/i915/gem.c b/lib/i915/gem.c
index 3ef31ed33..45db8a0fd 100644
--- a/lib/i915/gem.c
+++ b/lib/i915/gem.c
@@ -130,6 +130,13 @@ static void reset_device(int i915)
 	close(dir);
 }
 
+static void restore_params(int i915)
+{
+	/* Re-enable modparams if left clobbered */
+	igt_params_set(i915, "reset", "%u", -1);
+	igt_params_set(i915, "enable_hangcheck", "%u", 1);
+}
+
 void igt_require_gem(int i915)
 {
 	int err;
@@ -150,6 +157,7 @@ void igt_require_gem(int i915)
 	 * sequences of batches.
 	 */
 	reset_device(i915);
+	restore_params(i915);
 	restore_defaults(i915);
 
 	err = 0;
-- 
2.27.0.rc0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
