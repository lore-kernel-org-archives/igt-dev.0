Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 28 Aug 2020 09:59:26 +0200
Message-Id: <20200828075927.17061-21-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
References: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 20/21] tests/core_hotunplug: HSW audio
 issue workaround
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Unbinding the i915 driver on some Haswell platforms with Azalia audio
results in a kernel WARNING on "i915 raw-wakerefs=1 wakelocks=1 on
cleanup".  The issue can be worked around by manually enabling runtime
power management for the conflicting audio adapter.  Use that method
but also display a warning to preserve visibility of the issue.  Also
tag the workaround with a FIXME comment.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 361d601af..a3d2a04ed 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -473,9 +473,23 @@ igt_main
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
 		if (is_i915_device(fd_drm)) {
+			uint32_t devid = intel_get_drm_devid(fd_drm);
+
 			gem_quiescent_gpu(fd_drm);
 			igt_skip_on_f(local_i915_healthcheck(fd_drm, "pre-"),
 				      "i915 device not healthy on test start\n");
+
+			/**
+			 * FIXME: Unbinding the i915 driver on some Haswell
+			 * platforms with Azalia audio results in a kernel WARN
+			 * on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".  The
+			 * below CI friendly user level workaround prevents the
+			 * warning from appearing.  Drop this hack as soon as
+			 * this is fixed in the kernel.
+			 */
+			if (igt_warn_on_f((bool) IS_HASWELL(devid),
+			    "Manually enabling audio PM to work around a kernel WARN\n"))
+				igt_pm_enable_audio_runtime_pm();
 		}
 
 		/* Make sure subtests always reopen the same device */
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
