Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 16:03:02 -0000
Message-ID: <157625298259.23800.6858748452069039845@emeril.freedesktop.org>
References: <1576251706-32439-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1576251706-32439-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Ffrontbuffer=5Ftracking=3A_optimize_test_execution_ti?=
 =?utf-8?b?bWUgKHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_frontbuffer_tracking: optimize test execution time (rev2)
URL   : https://patchwork.freedesktop.org/series/70126/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88630 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1145695):
  [0Ksection_start:1576252919:download_artifacts
  [0K[32;1mDownloading artifacts for build:tests-fedora (1145677)...[0;m
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1145677 responseStatus[0;m=200 OK token[0;m=rRQ7EKxe
  section_end:1576252923:download_artifacts
  [0Ksection_start:1576252923:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[32;1m$ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY[0;m
  Login Succeeded!
  [32;1m$ .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt[0;m
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-2a588532399bc5a39c459c911c4f2f6c7fa9e6de
  Getting image source signatures
  Copying blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc
  Error: error creating build container: Error writing blob: error storing blob to file "/var/tmp/storage462020485/1": read tcp 172.17.0.2:38860->173.194.215.128:443: read: connection reset by peer
  section_end:1576252932:build_script
  [0Ksection_start:1576252932:after_script
  [0Ksection_end:1576252933:after_script
  [0Ksection_start:1576252933:upload_artifacts_on_failure
  [0Ksection_end:1576252935:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88630
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
