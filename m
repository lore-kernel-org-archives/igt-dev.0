Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 21 Feb 2020 13:56:20 +0000
Message-Id: <20200221135620.2794706-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/i915_pm_rpm: Only check for suspend
 failures after each debugfs entry
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Since we check before and then after each debugfs entry, we do not need
to check before each time as well. We will error out as soon as it does
fail, at all other times we know the system to be idle.

No impact on runtime for glk (which apparently is one of the better
behaving systems).

v2: Assert that we are currently suspended prior to opening the file,
i.e. that nothing else is waking up the device behind our backs.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Martin Peres <martin.peres@linux.intel.com>
---
 tests/i915/i915_pm_rpm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 0c2821122..36416a9db 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -183,6 +183,14 @@ static enum pc8_status get_pc8_status(void)
 		return PC8_DISABLED;
 }
 
+static bool is_suspended(void)
+{
+	if (has_pc8 && !has_runtime_pm)
+		return get_pc8_status() == PC8_ENABLED;
+	else
+		return igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_SUSPENDED;
+}
+
 static bool wait_for_pc8_status(enum pc8_status status)
 {
 	return igt_wait(get_pc8_status() == status, 10000, 100);
@@ -932,7 +940,7 @@ static int read_entry(const char *filepath,
 	int fd;
 	int rc;
 
-	igt_assert_f(wait_for_suspended(), "Before opening: %s (%s)\n",
+	igt_assert_f(is_suspended(), "Before opening: %s (%s)\n",
 		     filepath + pathinfo->base, filepath);
 
 	fd = open(filepath, O_RDONLY | O_NONBLOCK);
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
