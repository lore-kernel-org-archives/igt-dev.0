Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B95310FCD5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 08:07:15 +0000 (UTC)
To: Petri Latvala <petri.latvala@intel.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
 <20220311141300.60629-13-tomeu.vizoso@collabora.com>
 <YkrPzhCgpKaUxKjK@platvala-desk.ger.corp.intel.com>
 <a31f4d98-2020-7dc1-884f-52750d137f04@collabora.com>
 <YmJWug08Xp/Dx40b@platvala-desk.ger.corp.intel.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <94e4210b-ab02-ec50-ea36-83b13a941fb7@collabora.com>
Date: Fri, 22 Apr 2022 10:07:09 +0200
MIME-Version: 1.0
In-Reply-To: <YmJWug08Xp/Dx40b@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3 12/12] ci: Add job for testing changes to
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

On 4/22/22 9:18 AM, Petri Latvala wrote:
> On Thu, Apr 21, 2022 at 09:28:48AM +0200, Tomeu Vizoso wrote:
>>
>>
>> On 4/4/22 1:00 PM, Petri Latvala wrote:
>>> On Fri, Mar 11, 2022 at 03:13:00PM +0100, Tomeu Vizoso wrote:
>>>> Will allow for more efortless testing of changes to tests that could
>>>> affect Qualcomm devices.
>>>>
>>>> With these changes, it should be fairly trivial to add testing on other
>>>> KMS and GPU drivers.
>>>>
>>>> v2: Update expectations after 9f32d552afd7 ("tests/kms_setmode: Use dynamic subtests")
>>>>
>>>> v3: Use igt_runner and store a list of subtests for msm CI
>>>>
>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>> ---
>>>>    .gitlab-ci.yml            | 49 +++++++++++++++++++
>>>>    ci/msm_results.txt        | 98 ++++++++++++++++++++++++++++++++++++++
>>>>    ci/run_tests.sh           | 14 ++++++
>>>>    tests/msm_ci/msm.testlist | 99 +++++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 260 insertions(+)
>>>>    create mode 100644 ci/msm_results.txt
>>>>    create mode 100755 ci/run_tests.sh
>>>>    create mode 100644 tests/msm_ci/msm.testlist
>>>>
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index f820661496c4..ec865bef5e28 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>>> @@ -325,6 +325,55 @@ default:
>>>>          test -e "${CI_JOB_JWT_FILE}" &&
>>>>          export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
>>>>          rm "${CI_JOB_JWT_FILE}"
>>>> +
>>>> +.lava-test:arm64:
>>>> +  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
>>>> +  variables:
>>>> +    BASE_SYSTEM_HOST_PREFIX: "${MINIO_HOST}/mesa-lava"
>>>> +    FDO_UPSTREAM_REPO: gfx-ci/rootfs
>>>> +    ARCH: arm64
>>>> +    # Tag corresponding to artifacts from https://gitlab.freedesktop.org/gfx-ci/rootfs/
>>>> +    KERNEL_ROOTFS_TAG: "2022-03-11-jq--2022-03-08-bzip2--290b79e0e78eab67a83766f4e9691be554fc4afd"
>>>> +    BASE_SYSTEM_MAINLINE_HOST_PATH: "${BASE_SYSTEM_HOST_PREFIX}/${FDO_UPSTREAM_REPO}/${KERNEL_ROOTFS_TAG}/${ARCH}"
>>>> +    JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
>>>> +    JOB_RESULTS_PATH: "${JOB_ARTIFACTS_BASE}/results.tar.gz"
>>>> +    MINIO_ARTIFACT_NAME: igt-arm64
>>>> +    BUILD_PATH: "${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}.tar.gz"
>>>> +    JOB_ROOTFS_OVERLAY_PATH: "${JOB_ARTIFACTS_BASE}/job-rootfs-overlay.tar.gz"
>>>> +    KERNEL_IMAGE_NAME: Image
>>>> +    KERNEL_IMAGE_TYPE: "image"
>>>> +    VISIBILITY_GROUP: "Collabora+fdo"
>>>> +    HWCI_TEST_SCRIPT: "/install/ci/run_tests.sh"
>>>> +  dependencies:
>>>> +    - build:tests-debian-meson-arm64
>>>> +  needs:
>>>> +    - build-containers:build-debian
>>>> +    - build:tests-debian-meson-arm64
>>>> +  script:
>>>> +    - ./ci/lava/lava-submit.sh
>>>> +  artifacts:
>>>> +    name: "igt_${CI_JOB_NAME}"
>>>> +    when: always
>>>> +    paths:
>>>> +      - results/
>>>> +  tags:
>>>> +    - $RUNNER_TAG
>>>> +  after_script:
>>>> +    - wget -q "https://${JOB_RESULTS_PATH}" -O- | tar -xz
>>>> +
>>>> +test:msm:
>>>> +  extends:
>>>> +    - .lava-test:arm64
>>>> +  stage: test
>>>> +  variables:
>>>> +    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
>>>> +    DTB: sc7180-trogdor-lazor-limozeen-nots
>>>> +    BOOT_METHOD: depthcharge
>>>> +    KERNEL_IMAGE_TYPE: ""
>>>> +    IGT_FORCE_DRIVER: msm
>>>> +  tags:
>>>> +    - mesa-ci-x86-64-lava-rk3399-gru-kevin    # why it doesn't work!? mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
>>>> +
>>>
>>>
>>> I'm not sure how to dress these questions into words, I'll try my
>>> best...
>>>
>>> What's the aim of this, from the range of "support testing the kernel"
>>> to "just test that IGT doesn't break"? In particular, what's the
>>> kernel used here, how/when is it changed?
>>
>> The goal here is definitely "just test that IGT doesn't break".
>>
>>> Can that runner handle the load induced by merging this? For the
>>> record, IGT forks run the pipelines too, and i915 CI pushes postmerge
>>> tags _and_ premerge tags to its own ci-tags repository fork so it's
>>> quote a bit more load than just for every merge to IGT proper.
>>
>> For now I think we have plenty of capacity as the boards in use are also
>> used for Mesa CI, which needs to shard to a minimum of 2 boards, more often
>> 5-10.
>>
>> Also, the number of tests being run are quite small at the moment. If the
>> executions start taking longer, then capacity might not be enough.
>>
>>> If I read that correctly, the results.json is stored in pipeline
>>> artifacts so there's a way to access the logs if something breaks,
>>> ok...
>>
>> Yep, and also the first devcoredump.
>>
>>> What's the procedure if someone wants to extend this kind of testing
>>> on their own platform?
>>
>> I can add docs for this in a future iteration, but most of the work is in
>> providing a lab that can receive test jobs from a gitlab runner.
>>
>>> Is IGT_FORCE_DRIVER necessary? FYI there's also
>>> IGT_DEVICE=pci:vendor=vendorstring along with other types of
>>> IGT_DEVICE filters. The semantics are slightly different but
>>> IGT_FORCE_DRIVER is the older, slightly less capable, device selection
>>> interface from before IGT_DEVICE.
>>
>> Back when I looked at this for kernelci.org, that only worked for PCI
>> devices, but not platform. Has this changed?
> 
> What does "platform" mean here? "Any msm device"?

I meant this: 
https://www.kernel.org/doc/html/latest/driver-api/driver-model/platform.html

> The device filters can use pci:vendor=hexcode for selecting the first
> device matching the vendor part of the PCI ID, or the sysfs selector
> like sys:/sys/devices/platform/vgem. You can check what the device
> selection can use with tools/lsgpu. The default listing is only --drm
> selectors, try --sys / --pci options separately.
> 
> (There's named vendors mappint strings to hex in
> lib/igt_device_scan.c, looks like so far there's only intel="8086" and
> amd="1002")
> 
> The major difference with FORCE_DRIVER vs. IGT_DEVICE is the
> capability for selecting multiple devices to be used with
> drm_open_driver_another(), for testing e.g. prime between msm and
> vkms. I don't know how relevant that would be to you. Under the hood
> FORCE_DRIVER only forces DRIVER_ANY to mean
> DRIVER_THISONE. Practically that does nothing if there's only one
> /dev/dri/card* node in the system.

On Arm devices (though not in Qcom's case) there is often different 
drivers for display and GPU, so one needs a way to specify which one is 
to be tested.

Regards,

Tomeu
