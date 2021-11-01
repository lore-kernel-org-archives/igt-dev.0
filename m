Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7703A6E1A5
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Nov 2021 17:03:06 +0000 (UTC)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon,  1 Nov 2021 18:55:43 +0200
Message-Id: <20211101165543.467308-1-kai.vehmanen@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kai.vehmanen@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

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
---
 tests/core_hotunplug.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

Hello,
I'm from the audio driver team and this is my first contribution to
i-g-t. Apologies beforehand for any omissions in following
the patch submission, but all guidance in CONTRIBUTING.md should
be covered.

For background, this patch addresses a pretty fundamental issue
in the unbind test. As of now, the audio driver using DRM component
framework (e.g. snd-hda-intel and related), do not support the codec
hotplug. This was discussed with audio maintainers in:
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-September/190279.html

.. and the outcome is that this is not supported now, and as some
fundamental pieces are missing, this won't be fully supported any
time soon.

So to align with current reality, and to make test execution more
predictable, this patch adds a audio driver unload for all i915
platforms.

Looking forward to your feedback.

Br, Kai

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index b366166888cd..900d4886bd13 100644
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

base-commit: 3458490c14afe3cb8aa873fa9e520e1c815ea068
-- 
2.33.0
