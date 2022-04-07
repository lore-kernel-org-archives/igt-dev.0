Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13B10E6C6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 20:04:13 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 13:03:40 -0700
Message-Id: <20220407200340.3457341-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: apply audio unload
 for all i915 hw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The HDA audio driver does not support dynamic hotplug of a HDA codec and
that applies also to the display HDA codec.

To test unbind of i915, audio driver must be first unbound and/or
unloaded. This is the only way to ensure clean unbind, and possibility
to cleanly reestablish connection between audio and i915.

Without this fix, the core_hotunplug test only works if the audio
controller is runtime suspended when the test is run. This is very
brittle and subject to timing races, differences in system configuration
and so forth. A more predictable test is to explicitly unload the audio
and in case some entity is using the audio driver, this is flagged with
a clear, easily understandable error.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/1602
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/core_hotunplug.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 2f2fb7ac..02eae19e 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -621,13 +621,12 @@ igt_main
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
 		if (is_i915_device(fd_drm)) {
-			uint32_t devid = intel_get_drm_devid(fd_drm);
-
-			if ((IS_HASWELL(devid) || IS_BROADWELL(devid) ||
-			     IS_DG1(devid)) && (igt_kmod_is_loaded("snd_hda_intel"))) {
-				igt_debug("Enable WA to unload snd driver\n");
-				priv.snd_unload = true;
-			}
+			/*
+			 * Audio driver does not support hot unplug via DRM
+			 * audio component framework, so driver must be unloaded
+			 * explicitly for i915 unbind tests.
+			 */
+			priv.snd_unload = true;
 
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
-- 
2.35.1
