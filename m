Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Mar 2020 00:19:27 -0000
Message-ID: <158397236787.4949.6343199058382454277@emeril.freedesktop.org>
References: <20200311235447.195238-1-jose.souza@intel.com>
In-Reply-To: <20200311235447.195238-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bv3=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftr?=
 =?utf-8?q?acking=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v3,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74606/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118820 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1907991):
  Running with gitlab-runner 12.8.0 (1b659122)
    on fdo-packet-m1xl-4 enRL7Lrv
  section_start:1583972117:prepare_executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  section_end:1583972117:prepare_executor
  section_start:1583972117:prepare_script
  section_end:1583972237:prepare_script
  section_start:1583972237:upload_artifacts_on_failure
  section_end:1583972237:upload_artifacts_on_failure
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (executor_docker.go:716:120s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118820
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
