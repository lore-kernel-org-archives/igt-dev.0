Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9533910FDC7
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 09:23:56 +0000 (UTC)
To: Petri Latvala <petri.latvala@intel.com>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
 <20220310073800.22067-13-tomeu.vizoso@collabora.com>
 <Yim/6c0/18rV7wUS@platvala-desk.ger.corp.intel.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <4f5e6179-8976-e116-0beb-2a84b7220d27@collabora.com>
Date: Thu, 10 Mar 2022 10:23:51 +0100
MIME-Version: 1.0
In-Reply-To: <Yim/6c0/18rV7wUS@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v2 12/12] ci: Add job for testing changes to
 tests in Qualcomm devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Sean Paul <seanpaul@chromium.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 3/10/22 10:07 AM, Petri Latvala wrote:
> On Thu, Mar 10, 2022 at 08:38:00AM +0100, Tomeu Vizoso wrote:
>> Will allow for more efortless testing of changes to tests that could
>> affect Qualcomm devices.
>>
>> With these changes, it should be fairly trivial to add testing on other
>> KMS and GPU drivers.
>>
>> v2: Update expectations after 9f32d552afd7 ("tests/kms_setmode: Use dynamic subtests")
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> ---
>>   .gitlab-ci.yml     | 49 +++++++++++++++++++++++
>>   ci/msm_results.txt | 97 ++++++++++++++++++++++++++++++++++++++++++++++
>>   ci/msm_tests.txt   | 14 +++++++
>>   ci/run_tests.sh    | 87 +++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 247 insertions(+)
>>   create mode 100644 ci/msm_results.txt
>>   create mode 100644 ci/msm_tests.txt
>>   create mode 100755 ci/run_tests.sh
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 302043a61bf7..0437c8ec53c0 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -329,6 +329,55 @@ default:
>>         test -e "${CI_JOB_JWT_FILE}" &&
>>         export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
>>         rm "${CI_JOB_JWT_FILE}"
>> +
>> +.lava-test:arm64:
>> +  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
>> +  variables:
>> +    BASE_SYSTEM_HOST_PREFIX: "${MINIO_HOST}/mesa-lava"
>> +    FDO_UPSTREAM_REPO: gfx-ci/rootfs
>> +    ARCH: arm64
>> +    # Tag corresponding to artifacts from https://gitlab.freedesktop.org/gfx-ci/rootfs/
>> +    KERNEL_ROOTFS_TAG: "2022-03-08-igt-deps--2022-03-08-bzip2--290b79e0e78eab67a83766f4e9691be554fc4afd"
>> +    BASE_SYSTEM_MAINLINE_HOST_PATH: "${BASE_SYSTEM_HOST_PREFIX}/${FDO_UPSTREAM_REPO}/${KERNEL_ROOTFS_TAG}/${ARCH}"
>> +    JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
>> +    JOB_RESULTS_PATH: "${JOB_ARTIFACTS_BASE}/results.tar.gz"
>> +    MINIO_ARTIFACT_NAME: igt-arm64
>> +    BUILD_PATH: "${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}.tar.gz"
>> +    JOB_ROOTFS_OVERLAY_PATH: "${JOB_ARTIFACTS_BASE}/job-rootfs-overlay.tar.gz"
>> +    KERNEL_IMAGE_NAME: Image
>> +    KERNEL_IMAGE_TYPE: "image"
>> +    VISIBILITY_GROUP: "Collabora+fdo"
>> +    HWCI_TEST_SCRIPT: "/install/ci/run_tests.sh"
>> +  dependencies:
>> +    - build:tests-debian-meson-arm64
>> +  needs:
>> +    - build-containers:build-debian
>> +    - build:tests-debian-meson-arm64
>> +  script:
>> +    - ./ci/lava/lava-submit.sh
>> +  artifacts:
>> +    name: "igt_${CI_JOB_NAME}"
>> +    when: always
>> +    paths:
>> +      - results/
>> +  tags:
>> +    - $RUNNER_TAG
>> +  after_script:
>> +    - wget -q "https://${JOB_RESULTS_PATH}" -O- | tar -xz
>> +
>> +test:msm:
>> +  extends:
>> +    - .lava-test:arm64
>> +  stage: test
>> +  variables:
>> +    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
>> +    DTB: sc7180-trogdor-lazor-limozeen-nots
>> +    BOOT_METHOD: depthcharge
>> +    KERNEL_IMAGE_TYPE: ""
>> +    IGT_FORCE_DRIVER: msm
>> +  tags:
>> +    - mesa-ci-x86-64-lava-rk3399-gru-kevin    # why it doesn't work!? mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
>> +
>>   ################### DEPLOY #########################
>>   
>>   pages:
>> diff --git a/ci/msm_results.txt b/ci/msm_results.txt
>> new file mode 100644
>> index 000000000000..7e8cda489a49
>> --- /dev/null
>> +++ b/ci/msm_results.txt
>> @@ -0,0 +1,97 @@
>> +core_auth:getclient-simple pass
>> +core_auth:getclient-master-drop pass
>> +core_auth:basic-auth pass
>> +core_auth:many-magics pass
>> +core_getclient pass
>> +core_getstats pass
>> +core_getversion pass
>> +core_setmaster_vs_auth pass
>> +drm_read:invalid-buffer pass
>> +drm_read:fault-buffer pass
>> +drm_read:empty-block pass
>> +drm_read:empty-nonblock pass
>> +drm_read:short-buffer-block pass
>> +drm_read:short-buffer-nonblock pass
>> +drm_read:short-buffer-wakeup pass
>> +kms_addfb_basic:unused-handle pass
>> +kms_addfb_basic:unused-pitches pass
>> +kms_addfb_basic:unused-offsets pass
>> +kms_addfb_basic:unused-modifier pass
>> +kms_addfb_basic:clobberred-modifier skip
>> +kms_addfb_basic:invalid-smem-bo-on-discrete skip
>> +kms_addfb_basic:legacy-format pass
>> +kms_addfb_basic:no-handle pass
>> +kms_addfb_basic:basic pass
>> +kms_addfb_basic:bad-pitch-0 pass
>> +kms_addfb_basic:bad-pitch-32 pass
>> +kms_addfb_basic:bad-pitch-63 pass
>> +kms_addfb_basic:bad-pitch-128 pass
>> +kms_addfb_basic:bad-pitch-256 pass
>> +kms_addfb_basic:bad-pitch-1024 pass
>> +kms_addfb_basic:bad-pitch-999 pass
>> +kms_addfb_basic:bad-pitch-65536 pass
>> +kms_addfb_basic:size-max pass
>> +kms_addfb_basic:too-wide pass
>> +kms_addfb_basic:too-high pass
>> +kms_addfb_basic:bo-too-small pass
>> +kms_addfb_basic:small-bo pass
>> +kms_addfb_basic:bo-too-small-due-to-tiling skip
>> +kms_addfb_basic:addfb25-modifier-no-flag pass
>> +kms_addfb_basic:addfb25-bad-modifier pass
>> +kms_addfb_basic:addfb25-x-tiled-mismatch-legacy skip
>> +kms_addfb_basic:addfb25-x-tiled-legacy skip
>> +kms_addfb_basic:addfb25-framebuffer-vs-set-tiling skip
>> +kms_addfb_basic:addfb25-y-tiled-legacy skip
>> +kms_addfb_basic:addfb25-yf-tiled-legacy skip
>> +kms_addfb_basic:addfb25-y-tiled-small-legacy skip
>> +kms_addfb_basic:basic-x-tiled-legacy skip
>> +kms_addfb_basic:framebuffer-vs-set-tiling skip
>> +kms_addfb_basic:tile-pitch-mismatch skip
>> +kms_addfb_basic:basic-y-tiled-legacy skip
>> +kms_addfb_basic:invalid-get-prop-any pass
>> +kms_addfb_basic:invalid-get-prop pass
>> +kms_addfb_basic:invalid-set-prop-any pass
>> +kms_addfb_basic:invalid-set-prop pass
>> +kms_addfb_basic:master-rmfb pass
>> +kms_atomic:plane-overlay-legacy skip
>> +kms_atomic:plane-primary-legacy pass
>> +kms_atomic:plane-primary-overlay-mutable-zpos skip
>> +kms_atomic:plane-immutable-zpos pass
>> +kms_atomic:test-only fail
>> +kms_atomic:plane-cursor-legacy pass
>> +kms_atomic:plane-invalid-params pass
>> +kms_atomic:plane-invalid-params-fence skip
>> +kms_atomic:crtc-invalid-params pass
>> +kms_atomic:crtc-invalid-params-fence skip
>> +kms_atomic:atomic-invalid-params pass
>> +kms_atomic:atomic_plane_damage pass
>> +kms_flip_event_leak fail
>> +kms_prop_blob:basic pass
>> +kms_prop_blob:blob-prop-core pass
>> +kms_prop_blob:blob-prop-validate pass
>> +kms_prop_blob:blob-prop-lifetime pass
>> +kms_prop_blob:blob-multiple pass
>> +kms_prop_blob:invalid-get-prop-any pass
>> +kms_prop_blob:invalid-get-prop pass
>> +kms_prop_blob:invalid-set-prop-any pass
>> +kms_prop_blob:invalid-set-prop pass
>> +kms_setmode:basic pass
>> +kms_setmode:basic-clone-single-crtc skip
>> +kms_setmode:invalid-clone-single-crtc skip
>> +kms_setmode:invalid-clone-exclusive-crtc skip
>> +kms_setmode:clone-exclusive-crtc skip
>> +kms_setmode:invalid-clone-single-crtc-stealing skip
>> +msm_mapping:ring fail
>> +msm_mapping:sqefw fail
>> +msm_mapping:shadow skip
>> +msm_recovery:hangcheck skip
>> +msm_recovery:gpu-fault pass
>> +msm_recovery:iova-fault pass
>> +msm_submit:empty-submit pass
>> +msm_submit:invalid-queue-submit pass
>> +msm_submit:invalid-flags-submit pass
>> +msm_submit:invalid-in-fence-submit pass
>> +msm_submit:invalid-duplicate-bo-submit pass
>> +msm_submit:invalid-cmd-idx-submit pass
>> +msm_submit:invalid-cmd-type-submit pass
>> +msm_submit:valid-submit pass
>> diff --git a/ci/msm_tests.txt b/ci/msm_tests.txt
>> new file mode 100644
>> index 000000000000..857dc895426e
>> --- /dev/null
>> +++ b/ci/msm_tests.txt
>> @@ -0,0 +1,14 @@
>> +core_auth
>> +core_getclient
>> +core_getstats
>> +core_getversion
>> +core_setmaster_vs_auth
>> +drm_read
>> +kms_addfb_basic
>> +kms_atomic
>> +kms_flip_event_leak
>> +kms_prop_blob
>> +kms_setmode
>> +msm_mapping
>> +msm_recovery
>> +msm_submit
>> diff --git a/ci/run_tests.sh b/ci/run_tests.sh
>> new file mode 100755
>> index 000000000000..8ba2b1141d27
>> --- /dev/null
>> +++ b/ci/run_tests.sh
>> @@ -0,0 +1,87 @@
>> +#!/bin/sh
>> +
>> +# Copyright (C) 2019,2022 Collabora Limited
>> +# Author: Guillaume Tucker <guillaume.tucker@collabora.com>
>> +# Author: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> +#
>> +# This script is free software; you can redistribute it and/or modify it under
>> +# the terms of the GNU Lesser General Public License as published by the Free
>> +# Software Foundation; either version 2.1 of the License, or (at your option)
>> +# any later version.
>> +#
>> +# This library is distributed in the hope that it will be useful, but WITHOUT
>> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
>> +# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
>> +# details.
>> +#
>> +# You should have received a copy of the GNU Lesser General Public License
>> +# along with this library; if not, write to the Free Software Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> +
>> +PATH=$PATH:${CI_PROJECT_DIR}/build/tests
>> +
>> +# See lib/igt_core.h
>> +IGT_EXIT_SUCCESS=0
>> +IGT_EXIT_INVALID=79
>> +IGT_EXIT_FAILURE=98
>> +IGT_EXIT_SKIP=77
>> +
>> +# Check the test case exit status and report the result
>> +test_case_status()
>> +{
>> +    name="$1"
>> +    stat="$2"
>> +
>> +    case $stat in
>> +        $IGT_EXIT_SUCCESS)
>> +            res="pass"
>> +            ;;
>> +        $IGT_EXIT_FAILURE)
>> +            res="fail"
>> +            ;;
>> +        $IGT_EXIT_SKIP)
>> +            res="skip"
>> +            ;;
>> +        $IGT_EXIT_INVALID)
>> +            echo "WARNING: invalid subtest $t/$sub"
>> +            res="skip"
>> +            ;;
>> +        *)
>> +            echo "WARNING: unhandled exit status: $stat"
>> +            res="skip"
>> +            ;;
>> +    esac
>> +
>> +    echo "$name" "$res" >> /results/igt.txt
>> +}
>> +
>> +mkdir -p /results/
>> +
>> +oldpath=`pwd`
>> +cd ${CI_PROJECT_DIR}/build/
>> +
>> +tests=`cat ./ci/${IGT_FORCE_DRIVER}_tests.txt`
>> +for cmd in $tests; do
>> +    subtests=$($cmd --list-subtests)
>> +
>> +    if [ -n "$subtests" ]; then
>> +        for sub in $subtests; do
>> +            $cmd --run-subtest $sub
>> +            test_case_status $cmd:$sub $?
>> +        done
>> +    else
>> +        $cmd
>> +        test_case_status $cmd $?
>> +    fi
>> +done
> 
> Why are the tests run and processed manually instead of with
> igt_runner?

Because I didn't know about it yet, thanks!

>> +
>> +if diff -q ./ci/msm_results.txt /results/igt.txt; then
>> +    cd $oldpath
>> +    exit 0
>> +fi
>> +
>> +echo Unexpected change in results:
>> +diff -u ./ci/msm_results.txt /results/igt.txt
> 
> This doesn't scale. It will require changes if subtests ever get
> renamed, removed or worse, when added.

How do you recommend to do the regression analysis?

Thanks,

Tomeu
