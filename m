Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 16:36:26 +0200
Message-Id: <20230413143626.311639-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_reset_stats: Don't allow request
 watchdog to interfere
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A user reported recently that some subtests are failing.  The test was
blocklisted in 2018, so we've lost CI feedback on its results since then.

In 2021, request watchdog with 20 seconds timeout was introduced to i915.
Kernel logs from failed subtest runs indicate that the request watchdog
interfers with engine heartbeat and request preemption used by the test
for exercising reset statistics.

Disable request watchdog during the test execution.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8310
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_reset_stats.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index baa101517d..7b003d88b6 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -906,6 +906,7 @@ igt_main
 	igt_fixture {
 		bool has_reset_stats;
 		bool using_full_reset;
+		char *tmp;
 
 		device = drm_open_driver(DRIVER_INTEL);
 		devid = intel_get_drm_devid(device);
@@ -922,6 +923,12 @@ igt_main
 			      "No reset stats ioctl support. Too old kernel?\n");
 		igt_require_f(using_full_reset,
 			      "Full GPU reset is not enabled. Is enable_hangcheck set?\n");
+
+		/* Don't allow request watchdog to interfere */
+		tmp = __igt_params_get(device, "request_timeout_ms");
+		if (tmp && atoi(tmp))
+			igt_params_save_and_set(device, "request_timeout_ms", "%u", 0);
+		free(tmp);
 	}
 
 	igt_subtest("params")
-- 
2.25.1
