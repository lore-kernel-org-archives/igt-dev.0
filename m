Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546F56E07D
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 19:03:12 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Fri, 8 Oct 2021 15:02:51 -0400
Message-ID: <20211008190251.3709425-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests: Add amdgpu test suite
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
Cc: Harry Wentland <harry.wentland@amd.com>, Nicholas Choi <Nicholas.Choi@amd.com>, Sun peng Li <sunpeng.li@amd.com>, Alexander Deucher <alexander.deucher@amd.com>, Martin Roukala <martin.roukala@mupuf.org>, Hayden Goodfellow <hayden.goodfellow@amd.com>, Simon Ser <contact@emersion.fr>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add various test suites relevant for the amdgpu driver.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Choi <Nicholas.Choi@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sun peng (Leo) Li <sunpeng.li@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Martin Roukala <martin.roukala@mupuf.org>
Cc: Hayden Goodfellow <hayden.goodfellow@amd.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Mark Yacoub <markyacoub@google.com>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 tests/amdgpu-ci/README                 |  31 +++++
 tests/amdgpu-ci/fast-feedback.testlist | 135 +++++++++++++++++++
 tests/amdgpu-ci/full-feedback.testlist | 173 +++++++++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 tests/amdgpu-ci/README
 create mode 100644 tests/amdgpu-ci/fast-feedback.testlist
 create mode 100644 tests/amdgpu-ci/full-feedback.testlist

diff --git a/tests/amdgpu-ci/README b/tests/amdgpu-ci/README
new file mode 100644
index 00000000..bd34245c
--- /dev/null
+++ b/tests/amdgpu-ci/README
@@ -0,0 +1,31 @@
+This directory contains test lists that are used by AMD's CI. The
+files are passed to piglit with the --test-list parameter directly.
+
+The test lists are contained in the IGT repository for several
+reasons:
+
+- The lists stay synchronized with the IGT codebase.
+- Public availability. Kernel developers can see what tests are run,
+  and can see what changes are done to the set, when, and why.
+
+Changing the test lists should only happen with approval from:
+- Harry Wentland <harry.wentland@amd.com>
+- Nicholas Choi <Nicholas.Choi@amd.com>
+- Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
+- Sun peng (Leo) Li <sunpeng.li@amd.com>
+
+======================
+fast-feedback.testlist
+======================
+
+Fast-feedback contains tests that roughly tests a wide coverage of features in
+a short time. We use this list for presubmission validation. Results of a
+fast-feedback test round should only be considered to mean that the kernel is
+not obviously broken.
+
+======================
+full-feedback.testlist
+======================
+
+This is an extensive set of tests that takes a long time to complete in which
+we usually use as post-submission.
diff --git a/tests/amdgpu-ci/fast-feedback.testlist b/tests/amdgpu-ci/fast-feedback.testlist
new file mode 100644
index 00000000..025bea16
--- /dev/null
+++ b/tests/amdgpu-ci/fast-feedback.testlist
@@ -0,0 +1,135 @@
+# tests to be run at the beginning
+igt@kms_setmode@basic
+
+
+# SINGLE-DISPLAY - Light-up, hotplug, bootup, and general functionality tests for single non tiled display
+igt@amdgpu/amd_hotplug@basic
+igt@amdgpu/amd_hotplug@basic-suspend
+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+
+
+# ATOMIC-MODESETTING - Atomic modesetting tests
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@plane-invalid-params-fence
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@crtc-invalid-params-fence
+igt@kms_atomic@atomic-invalid-params
+igt@kms_content_protection@atomic
+igt@kms_flip@basic-flip-vs-dpms@a-dp1
+igt@kms_flip@basic-flip-vs-dpms@c-dp1
+igt@kms_flip@basic-plain-flip@a-dp1
+igt@kms_flip@basic-plain-flip@c-dp1
+igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-dp1
+igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1
+
+
+# COLOR - Color Adjustments
+igt@kms_color@pipe-a-gamma
+igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb
+igt@kms_color@pipe-a-degamma
+igt@amdgpu/amd_color@crtc-linear-degamma
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid
+igt@kms_color@pipe-a-ctm-0-25
+igt@amdgpu/amd_color@crtc-linear-regamma
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max
+igt@kms_color@pipe-a-ctm-negative
+igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb
+igt@kms_color@pipe-a-ctm-blue-to-red
+igt@kms_color@pipe-a-ctm-0-75
+igt@kms_color@pipe-a-legacy-gamma
+igt@kms_color@pipe-a-ctm-0-5
+igt@kms_color@pipe-a-ctm-max
+igt@kms_color@pipe-a-ctm-red-to-blue
+igt@amdgpu/amd_color@crtc-lut-accuracy
+igt@kms_color@pipe-a-ctm-green-to-red
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min
+igt@kms_plane_alpha_blend@pipe-a-alpha-basic
+igt@kms_color@pipe-a-legacy-gamma-reset
+
+
+# VRR
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flip-dpms
+
+
+# MODES - Tests mode settings
+igt@kms_plane_scaling@plane-scaling@pipe-a-plane-scaling
+igt@kms_plane_scaling@plane-scaling@pipe-c-plane-scaling
+igt@kms_setmode@basic-clone-single-crtc
+igt@kms_setmode@invalid-clone-single-crtc
+igt@kms_setmode@invalid-clone-exclusive-crtc
+igt@kms_setmode@clone-exclusive-crtc
+igt@kms_setmode@invalid-clone-single-crtc-stealing
+
+
+# PLANE - DRM plane-level tests
+igt@kms_plane@plane-panning-top-left@pipe-a-planes
+igt@kms_cursor_legacy@flip-vs-cursor-atomic
+igt@kms_plane@plane-position-hole-dpms@pipe-a-planes
+igt@kms_properties@plane-properties-legacy
+igt@kms_plane_cursor@pipe-a-primary-size-256
+igt@kms_plane@plane-position-covered@pipe-a-planes
+igt@kms_plane@plane-position-hole-dpms@pipe-b-planes
+igt@kms_plane@plane-position-hole@pipe-b-planes
+igt@kms_plane_multiple@atomic-pipe-a-tiling-none
+igt@kms_plane@plane-panning-top-left@pipe-b-planes
+igt@kms_plane@plane-position-covered@pipe-b-planes
+igt@kms_plane_cursor@pipe-a-primary-size-128
+igt@kms_cursor_legacy@cursor-vs-flip-legacy
+igt@kms_plane@plane-panning-bottom-right@pipe-b-planes
+igt@kms_plane_multiple@atomic-pipe-c-tiling-none
+igt@kms_plane@plane-panning-bottom-right@pipe-a-planes
+igt@kms_plane_cursor@pipe-a-primary-size-64
+igt@kms_plane@plane-position-hole@pipe-a-planes
+
+
+# DPMS - DPMS
+igt@kms_content_protection@atomic-dpms
+
+
+# HDCP - HDCP functionality
+igt@kms_content_protection@legacy
+
+
+# DISPLAY-LAYER - General DRM API tests and display driver tests
+igt@core_auth@basic-auth
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a
+igt@kms_atomic_interruptible@legacy-pageflip@dp-1-pipe-a
+igt@kms_atomic_interruptible@legacy-cursor@dp-1-pipe-a
+igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a
+igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+
+
+# S3 - S3
+igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes
+
+
+# ASSR - ASSR
+igt@amdgpu/amd_assr@assr-links
+igt@amdgpu/amd_assr@assr-links-dpms
diff --git a/tests/amdgpu-ci/full-feedback.testlist b/tests/amdgpu-ci/full-feedback.testlist
new file mode 100644
index 00000000..cc837d47
--- /dev/null
+++ b/tests/amdgpu-ci/full-feedback.testlist
@@ -0,0 +1,173 @@
+# tests to be run at the beginning
+igt@kms_setmode@basic
+
+
+# SINGLE-DISPLAY - Light-up, hotplug, bootup, and general functionality tests for single non tiled display
+igt@amdgpu/amd_hotplug@basic
+igt@amdgpu/amd_hotplug@basic-suspend
+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+
+
+# ATOMIC-MODESETTING - Atomic modesetting tests
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@plane-invalid-params-fence
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@crtc-invalid-params-fence
+igt@kms_atomic@atomic-invalid-params
+igt@kms_content_protection@atomic
+igt@kms_flip@basic-flip-vs-dpms@a-dp1
+igt@kms_flip@basic-flip-vs-dpms@c-dp1
+igt@kms_flip@basic-plain-flip@a-dp1
+igt@kms_flip@basic-plain-flip@c-dp1
+igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-dp1
+igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1
+igt@kms_flip_event_leak
+
+
+# COLOR - Color Adjustments
+igt@kms_color@pipe-a-gamma
+igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb
+igt@kms_color@pipe-a-degamma
+igt@amdgpu/amd_color@crtc-linear-degamma
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid
+igt@kms_color@pipe-a-ctm-0-25
+igt@amdgpu/amd_color@crtc-linear-regamma
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max
+igt@kms_color@pipe-a-ctm-negative
+igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb
+igt@kms_color@pipe-a-ctm-blue-to-red
+igt@kms_color@pipe-a-ctm-0-75
+igt@kms_color@pipe-a-legacy-gamma
+igt@kms_color@pipe-a-ctm-0-5
+igt@kms_color@pipe-a-ctm-max
+igt@kms_color@pipe-a-ctm-red-to-blue
+igt@amdgpu/amd_color@crtc-lut-accuracy
+igt@kms_color@pipe-a-ctm-green-to-red
+igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min
+igt@kms_plane_alpha_blend@pipe-a-alpha-basic
+igt@kms_color@pipe-a-legacy-gamma-reset
+
+
+# VRR
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flip-dpms
+igt@amdgpu/amd_vrr_range@freesync-parsing-dp
+igt@amdgpu/amd_vrr_range@freesync-parsing-dp-suspend
+igt@amdgpu/amd_vrr_range@freesync-range-dp
+igt@amdgpu/amd_vrr_range@freesync-range-dp-suspend
+
+
+# MODES - Tests mode settings
+igt@kms_plane_scaling@plane-scaling@pipe-a-plane-scaling
+igt@kms_plane_scaling@plane-scaling@pipe-c-plane-scaling
+igt@kms_setmode@basic-clone-single-crtc
+igt@kms_setmode@invalid-clone-single-crtc
+igt@kms_setmode@invalid-clone-exclusive-crtc
+igt@kms_setmode@clone-exclusive-crtc
+igt@kms_setmode@invalid-clone-single-crtc-stealing
+
+
+# PLANE - DRM plane-level tests
+igt@kms_plane@plane-panning-top-left@pipe-a-planes
+igt@kms_cursor_legacy@flip-vs-cursor-atomic
+igt@kms_plane@plane-position-hole-dpms@pipe-a-planes
+igt@kms_properties@plane-properties-legacy
+igt@kms_plane_cursor@pipe-a-primary-size-256
+igt@kms_plane@plane-position-covered@pipe-a-planes
+igt@kms_plane@plane-position-hole-dpms@pipe-b-planes
+igt@kms_plane@plane-position-hole@pipe-b-planes
+igt@kms_plane_multiple@atomic-pipe-a-tiling-none
+igt@kms_plane@plane-panning-top-left@pipe-b-planes
+igt@kms_plane@plane-position-covered@pipe-b-planes
+igt@kms_plane_cursor@pipe-a-primary-size-128
+igt@kms_cursor_legacy@cursor-vs-flip-legacy
+igt@kms_plane@plane-panning-bottom-right@pipe-b-planes
+igt@kms_plane_multiple@atomic-pipe-c-tiling-none
+igt@kms_plane@plane-panning-bottom-right@pipe-a-planes
+igt@kms_plane_cursor@pipe-a-primary-size-64
+igt@kms_plane@plane-position-hole@pipe-a-planes
+igt@kms_cursor_crc@pipe-a-cursor-size-change
+igt@kms_cursor_crc@pipe-b-cursor-size-change
+igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque
+igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque
+igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent
+igt@kms_cursor_crc@pipe-b-cursor-alpha-transparent
+igt@kms_cursor_crc@pipe-a-cursor-dpms
+igt@kms_cursor_crc@pipe-b-cursor-dpms
+igt@kms_cursor_crc@pipe-a-cursor-suspend
+igt@kms_cursor_crc@pipe-b-cursor-suspend
+igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-max-size-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding
+igt@kms_cursor_crc@pipe-a-cursor-max-size-random
+igt@kms_cursor_crc@pipe-b-cursor-max-size-random
+igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement
+igt@kms_concurrent@pipe-a
+igt@kms_concurrent@pipe-b
+
+
+# DPMS - DPMS
+igt@kms_content_protection@atomic-dpms
+
+
+# HDCP - HDCP functionality
+igt@kms_content_protection@legacy
+
+
+# DISPLAY-LAYER - General DRM API tests and display driver tests
+igt@core_auth@basic-auth
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_vblank@pipe-a-ts-continuation-suspend
+igt@amdgpu/amd_mem_leak@connector-suspend-resume
+igt@amdgpu/amd_mem_leak@connector-hotplug
+igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a
+igt@kms_atomic_interruptible@atomic-setmode@dp-1-pipe-a
+igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a
+igt@kms_atomic_interruptible@legacy-pageflip@dp-1-pipe-a
+igt@kms_atomic_interruptible@legacy-cursor@dp-1-pipe-a
+igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a
+igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_sysfs_edid_timing
+
+
+# S3 - S3
+igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes
+
+
+# ASSR - ASSR
+igt@amdgpu/amd_assr@assr-links
+igt@amdgpu/amd_assr@assr-links-dpms
+igt@amdgpu/amd_assr@assr-links-suspend
+
+
+# tests with higher probability of hanging the system
+igt@amdgpu/amd_link_settings@link-training-configs
-- 
2.25.1
