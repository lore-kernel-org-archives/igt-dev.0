Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113FE10E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so7569620wmj.2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:29 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:13:00 +0100
Message-Id: <20220311141300.60629-13-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 12/12] ci: Add job for testing changes to tests
 in Qualcomm devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Eric Anholt <eric@anholt.net>,
 Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Will allow for more efortless testing of changes to tests that could
affect Qualcomm devices.

With these changes, it should be fairly trivial to add testing on other
KMS and GPU drivers.

v2: Update expectations after 9f32d552afd7 ("tests/kms_setmode: Use dynamic subtests")

v3: Use igt_runner and store a list of subtests for msm CI

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml            | 49 +++++++++++++++++++
 ci/msm_results.txt        | 98 ++++++++++++++++++++++++++++++++++++++
 ci/run_tests.sh           | 14 ++++++
 tests/msm_ci/msm.testlist | 99 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 ci/msm_results.txt
 create mode 100755 ci/run_tests.sh
 create mode 100644 tests/msm_ci/msm.testlist

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f820661496c4..ec865bef5e28 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -325,6 +325,55 @@ default:
       test -e "${CI_JOB_JWT_FILE}" &&
       export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
       rm "${CI_JOB_JWT_FILE}"
+
+.lava-test:arm64:
+  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
+  variables:
+    BASE_SYSTEM_HOST_PREFIX: "${MINIO_HOST}/mesa-lava"
+    FDO_UPSTREAM_REPO: gfx-ci/rootfs
+    ARCH: arm64
+    # Tag corresponding to artifacts from https://gitlab.freedesktop.org/gfx-ci/rootfs/
+    KERNEL_ROOTFS_TAG: "2022-03-11-jq--2022-03-08-bzip2--290b79e0e78eab67a83766f4e9691be554fc4afd"
+    BASE_SYSTEM_MAINLINE_HOST_PATH: "${BASE_SYSTEM_HOST_PREFIX}/${FDO_UPSTREAM_REPO}/${KERNEL_ROOTFS_TAG}/${ARCH}"
+    JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
+    JOB_RESULTS_PATH: "${JOB_ARTIFACTS_BASE}/results.tar.gz"
+    MINIO_ARTIFACT_NAME: igt-arm64
+    BUILD_PATH: "${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}.tar.gz"
+    JOB_ROOTFS_OVERLAY_PATH: "${JOB_ARTIFACTS_BASE}/job-rootfs-overlay.tar.gz"
+    KERNEL_IMAGE_NAME: Image
+    KERNEL_IMAGE_TYPE: "image"
+    VISIBILITY_GROUP: "Collabora+fdo"
+    HWCI_TEST_SCRIPT: "/install/ci/run_tests.sh"
+  dependencies:
+    - build:tests-debian-meson-arm64
+  needs:
+    - build-containers:build-debian
+    - build:tests-debian-meson-arm64
+  script:
+    - ./ci/lava/lava-submit.sh
+  artifacts:
+    name: "igt_${CI_JOB_NAME}"
+    when: always
+    paths:
+      - results/
+  tags:
+    - $RUNNER_TAG
+  after_script:
+    - wget -q "https://${JOB_RESULTS_PATH}" -O- | tar -xz
+
+test:msm:
+  extends:
+    - .lava-test:arm64
+  stage: test
+  variables:
+    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
+    DTB: sc7180-trogdor-lazor-limozeen-nots
+    BOOT_METHOD: depthcharge
+    KERNEL_IMAGE_TYPE: ""
+    IGT_FORCE_DRIVER: msm
+  tags:
+    - mesa-ci-x86-64-lava-rk3399-gru-kevin    # why it doesn't work!? mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
+
 ################### DEPLOY #########################
 
 pages:
diff --git a/ci/msm_results.txt b/ci/msm_results.txt
new file mode 100644
index 000000000000..4e5d4ce2fcf5
--- /dev/null
+++ b/ci/msm_results.txt
@@ -0,0 +1,98 @@
+igt@core_auth@getclient-simple,dmesg-warn
+igt@core_auth@getclient-master-drop,pass
+igt@core_auth@basic-auth,pass
+igt@core_auth@many-magics,pass
+igt@core_getclient,pass
+igt@core_getstats,pass
+igt@core_getversion,pass
+igt@core_setmaster_vs_auth,pass
+igt@drm_read@invalid-buffer,pass
+igt@drm_read@fault-buffer,pass
+igt@drm_read@empty-block,pass
+igt@drm_read@empty-nonblock,pass
+igt@drm_read@short-buffer-block,pass
+igt@drm_read@short-buffer-nonblock,pass
+igt@drm_read@short-buffer-wakeup,pass
+igt@kms_addfb_basic@unused-handle,pass
+igt@kms_addfb_basic@unused-pitches,pass
+igt@kms_addfb_basic@unused-offsets,pass
+igt@kms_addfb_basic@unused-modifier,pass
+igt@kms_addfb_basic@clobberred-modifier,skip
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete,skip
+igt@kms_addfb_basic@legacy-format,dmesg-warn
+igt@kms_addfb_basic@no-handle,pass
+igt@kms_addfb_basic@basic,pass
+igt@kms_addfb_basic@bad-pitch-0,pass
+igt@kms_addfb_basic@bad-pitch-32,pass
+igt@kms_addfb_basic@bad-pitch-63,pass
+igt@kms_addfb_basic@bad-pitch-128,pass
+igt@kms_addfb_basic@bad-pitch-256,pass
+igt@kms_addfb_basic@bad-pitch-1024,pass
+igt@kms_addfb_basic@bad-pitch-999,pass
+igt@kms_addfb_basic@bad-pitch-65536,pass
+igt@kms_addfb_basic@size-max,pass
+igt@kms_addfb_basic@too-wide,pass
+igt@kms_addfb_basic@too-high,dmesg-warn
+igt@kms_addfb_basic@bo-too-small,pass
+igt@kms_addfb_basic@small-bo,pass
+igt@kms_addfb_basic@bo-too-small-due-to-tiling,skip
+igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
+igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy,skip
+igt@kms_addfb_basic@addfb25-x-tiled-legacy,skip
+igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling,skip
+igt@kms_addfb_basic@addfb25-y-tiled-legacy,skip
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy,skip
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy,skip
+igt@kms_addfb_basic@basic-x-tiled-legacy,skip
+igt@kms_addfb_basic@framebuffer-vs-set-tiling,skip
+igt@kms_addfb_basic@tile-pitch-mismatch,skip
+igt@kms_addfb_basic@basic-y-tiled-legacy,skip
+igt@kms_addfb_basic@invalid-get-prop-any,pass
+igt@kms_addfb_basic@invalid-get-prop,pass
+igt@kms_addfb_basic@invalid-set-prop-any,pass
+igt@kms_addfb_basic@invalid-set-prop,pass
+igt@kms_addfb_basic@master-rmfb,pass
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,pass
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,pass
+igt@kms_atomic@test-only,fail
+igt@kms_atomic@plane-cursor-legacy,pass
+igt@kms_atomic@plane-invalid-params,pass
+igt@kms_atomic@plane-invalid-params-fence,skip
+igt@kms_atomic@crtc-invalid-params,pass
+igt@kms_atomic@crtc-invalid-params-fence,skip
+igt@kms_atomic@atomic-invalid-params,pass
+igt@kms_atomic@atomic_plane_damage,pass
+igt@kms_flip_event_leak,fail
+igt@kms_prop_blob@basic,pass
+igt@kms_prop_blob@blob-prop-core,pass
+igt@kms_prop_blob@blob-prop-validate,pass
+igt@kms_prop_blob@blob-prop-lifetime,pass
+igt@kms_prop_blob@blob-multiple,pass
+igt@kms_prop_blob@invalid-get-prop-any,pass
+igt@kms_prop_blob@invalid-get-prop,pass
+igt@kms_prop_blob@invalid-set-prop-any,pass
+igt@kms_prop_blob@invalid-set-prop,pass
+igt@kms_setmode@basic@pipe-a-edp-1,pass
+igt@kms_setmode@basic@pipe-b-edp-1,pass
+igt@kms_setmode@basic-clone-single-crtc,skip
+igt@kms_setmode@invalid-clone-single-crtc,skip
+igt@kms_setmode@invalid-clone-exclusive-crtc,skip
+igt@kms_setmode@clone-exclusive-crtc,skip
+igt@kms_setmode@invalid-clone-single-crtc-stealing,skip
+igt@msm_mapping@ring,dmesg-fail
+igt@msm_mapping@sqefw,dmesg-fail
+igt@msm_mapping@shadow,skip
+igt@msm_recovery@hangcheck,skip
+igt@msm_recovery@gpu-fault,dmesg-warn
+igt@msm_recovery@iova-fault,dmesg-warn
+igt@msm_submit@empty-submit,pass
+igt@msm_submit@invalid-queue-submit,pass
+igt@msm_submit@invalid-flags-submit,pass
+igt@msm_submit@invalid-in-fence-submit,pass
+igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
+igt@msm_submit@valid-submit,pass
diff --git a/ci/run_tests.sh b/ci/run_tests.sh
new file mode 100755
index 000000000000..16612c59f51b
--- /dev/null
+++ b/ci/run_tests.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+/install/runner/igt_runner --test-list /install/msm_ci/msm.testlist /install/tests -o /results
+jq -r '.tests | to_entries | .[] | [.key, .value.result] | @csv' < /results/results.json | tr -d '"' > /results/results.txt
+
+if diff -q /install/ci/msm_results.txt /results/results.txt; then
+    cd $oldpath
+    exit 0
+fi
+
+echo Unexpected change in results, resync baseline with patch -p0:
+diff --label /results/results.txt --label ci/msm_results.txt -u /install/ci/msm_results.txt /results/results.txt
+cd $oldpath
+exit 1
diff --git a/tests/msm_ci/msm.testlist b/tests/msm_ci/msm.testlist
new file mode 100644
index 000000000000..8e3fa8d94698
--- /dev/null
+++ b/tests/msm_ci/msm.testlist
@@ -0,0 +1,99 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@clobberred-modifier
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@framebuffer-vs-set-tiling
+igt@kms_addfb_basic@tile-pitch-mismatch
+igt@kms_addfb_basic@basic-y-tiled-legacy
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@plane-invalid-params-fence
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@crtc-invalid-params-fence
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic@atomic_plane_damage
+igt@kms_flip_event_leak
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_setmode@basic
+igt@kms_setmode@basic-clone-single-crtc
+igt@kms_setmode@invalid-clone-single-crtc
+igt@kms_setmode@invalid-clone-exclusive-crtc
+igt@kms_setmode@clone-exclusive-crtc
+igt@kms_setmode@invalid-clone-single-crtc-stealing
+igt@msm_mapping@ring
+igt@msm_mapping@sqefw
+igt@msm_mapping@shadow
+igt@msm_recovery@hangcheck
+igt@msm_recovery@gpu-fault
+igt@msm_recovery@iova-fault
+igt@msm_submit@empty-submit
+igt@msm_submit@invalid-queue-submit
+igt@msm_submit@invalid-flags-submit
+igt@msm_submit@invalid-in-fence-submit
+igt@msm_submit@invalid-duplicate-bo-submit
+igt@msm_submit@invalid-cmd-idx-submit
+igt@msm_submit@invalid-cmd-type-submit
+igt@msm_submit@valid-submit
-- 
2.31.1
