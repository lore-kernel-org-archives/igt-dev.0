Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9DE10E052
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:43:07 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so5703785pje.1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 08:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
 <20220311141300.60629-13-tomeu.vizoso@collabora.com>
 <YkrPzhCgpKaUxKjK@platvala-desk.ger.corp.intel.com>
 <a31f4d98-2020-7dc1-884f-52750d137f04@collabora.com>
In-Reply-To: <a31f4d98-2020-7dc1-884f-52750d137f04@collabora.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 21 Apr 2022 08:42:55 -0700
Message-ID: <CAJs_Fx7gpM+G63VEFonbyKDvOux+YW6sLsEv74md-bFpFCYjkw@mail.gmail.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH v3 12/12] ci: Add job for testing changes to
 tests in Qualcomm devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, Eric Anholt <emma@anholt.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 12:28 AM Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
>
>
>
> On 4/4/22 1:00 PM, Petri Latvala wrote:
> > On Fri, Mar 11, 2022 at 03:13:00PM +0100, Tomeu Vizoso wrote:
> >> Will allow for more efortless testing of changes to tests that could
> >> affect Qualcomm devices.
> >>
> >> With these changes, it should be fairly trivial to add testing on other
> >> KMS and GPU drivers.
> >>
> >> v2: Update expectations after 9f32d552afd7 ("tests/kms_setmode: Use dynamic subtests")
> >>
> >> v3: Use igt_runner and store a list of subtests for msm CI
> >>
> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >> ---
> >>   .gitlab-ci.yml            | 49 +++++++++++++++++++
> >>   ci/msm_results.txt        | 98 ++++++++++++++++++++++++++++++++++++++
> >>   ci/run_tests.sh           | 14 ++++++
> >>   tests/msm_ci/msm.testlist | 99 +++++++++++++++++++++++++++++++++++++++
> >>   4 files changed, 260 insertions(+)
> >>   create mode 100644 ci/msm_results.txt
> >>   create mode 100755 ci/run_tests.sh
> >>   create mode 100644 tests/msm_ci/msm.testlist
> >>
> >> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> >> index f820661496c4..ec865bef5e28 100644
> >> --- a/.gitlab-ci.yml
> >> +++ b/.gitlab-ci.yml
> >> @@ -325,6 +325,55 @@ default:
> >>         test -e "${CI_JOB_JWT_FILE}" &&
> >>         export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
> >>         rm "${CI_JOB_JWT_FILE}"
> >> +
> >> +.lava-test:arm64:
> >> +  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
> >> +  variables:
> >> +    BASE_SYSTEM_HOST_PREFIX: "${MINIO_HOST}/mesa-lava"
> >> +    FDO_UPSTREAM_REPO: gfx-ci/rootfs
> >> +    ARCH: arm64
> >> +    # Tag corresponding to artifacts from https://gitlab.freedesktop.org/gfx-ci/rootfs/
> >> +    KERNEL_ROOTFS_TAG: "2022-03-11-jq--2022-03-08-bzip2--290b79e0e78eab67a83766f4e9691be554fc4afd"
> >> +    BASE_SYSTEM_MAINLINE_HOST_PATH: "${BASE_SYSTEM_HOST_PREFIX}/${FDO_UPSTREAM_REPO}/${KERNEL_ROOTFS_TAG}/${ARCH}"
> >> +    JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
> >> +    JOB_RESULTS_PATH: "${JOB_ARTIFACTS_BASE}/results.tar.gz"
> >> +    MINIO_ARTIFACT_NAME: igt-arm64
> >> +    BUILD_PATH: "${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}.tar.gz"
> >> +    JOB_ROOTFS_OVERLAY_PATH: "${JOB_ARTIFACTS_BASE}/job-rootfs-overlay.tar.gz"
> >> +    KERNEL_IMAGE_NAME: Image
> >> +    KERNEL_IMAGE_TYPE: "image"
> >> +    VISIBILITY_GROUP: "Collabora+fdo"
> >> +    HWCI_TEST_SCRIPT: "/install/ci/run_tests.sh"
> >> +  dependencies:
> >> +    - build:tests-debian-meson-arm64
> >> +  needs:
> >> +    - build-containers:build-debian
> >> +    - build:tests-debian-meson-arm64
> >> +  script:
> >> +    - ./ci/lava/lava-submit.sh
> >> +  artifacts:
> >> +    name: "igt_${CI_JOB_NAME}"
> >> +    when: always
> >> +    paths:
> >> +      - results/
> >> +  tags:
> >> +    - $RUNNER_TAG
> >> +  after_script:
> >> +    - wget -q "https://${JOB_RESULTS_PATH}" -O- | tar -xz
> >> +
> >> +test:msm:
> >> +  extends:
> >> +    - .lava-test:arm64
> >> +  stage: test
> >> +  variables:
> >> +    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
> >> +    DTB: sc7180-trogdor-lazor-limozeen-nots
> >> +    BOOT_METHOD: depthcharge
> >> +    KERNEL_IMAGE_TYPE: ""
> >> +    IGT_FORCE_DRIVER: msm
> >> +  tags:
> >> +    - mesa-ci-x86-64-lava-rk3399-gru-kevin    # why it doesn't work!? mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
> >> +
> >
> >
> > I'm not sure how to dress these questions into words, I'll try my
> > best...
> >
> > What's the aim of this, from the range of "support testing the kernel"
> > to "just test that IGT doesn't break"? In particular, what's the
> > kernel used here, how/when is it changed?
>
> The goal here is definitely "just test that IGT doesn't break".
>
> > Can that runner handle the load induced by merging this? For the
> > record, IGT forks run the pipelines too, and i915 CI pushes postmerge
> > tags _and_ premerge tags to its own ci-tags repository fork so it's
> > quote a bit more load than just for every merge to IGT proper.
>
> For now I think we have plenty of capacity as the boards in use are also
> used for Mesa CI, which needs to shard to a minimum of 2 boards, more
> often 5-10.
>
> Also, the number of tests being run are quite small at the moment. If
> the executions start taking longer, then capacity might not be enough.
>
> > If I read that correctly, the results.json is stored in pipeline
> > artifacts so there's a way to access the logs if something breaks,
> > ok...
>
> Yep, and also the first devcoredump.

We should probably disable the devcoredump collection for igt.. one of
the tests is intentionally triggering various sorts of hangs to test
the devcoredump mechanism, and if we have the runner script
periodically checking for a devcore, it would be racing with the test
(which is also trying to collect and clear the devcore)

BR,
-R

> > What's the procedure if someone wants to extend this kind of testing
> > on their own platform?
>
> I can add docs for this in a future iteration, but most of the work is
> in providing a lab that can receive test jobs from a gitlab runner.
>
> > Is IGT_FORCE_DRIVER necessary? FYI there's also
> > IGT_DEVICE=pci:vendor=vendorstring along with other types of
> > IGT_DEVICE filters. The semantics are slightly different but
> > IGT_FORCE_DRIVER is the older, slightly less capable, device selection
> > interface from before IGT_DEVICE.
>
> Back when I looked at this for kernelci.org, that only worked for PCI
> devices, but not platform. Has this changed?
>
> Thanks,
>
> Tomeu
