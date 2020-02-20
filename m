Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 19:10:28 -0000
Message-ID: <158222582869.17409.5733775608607852004@emeril.freedesktop.org>
References: <20200220173056.23088-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200220173056.23088-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/i915=3A_Restrict_mmap_types_to_GTT_if_no_MMAP=5FOFFSET_suppo?=
 =?utf-8?b?cnQgKHJldjMp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915: Restrict mmap types to GTT if no MMAP_OFFSET support (rev3)
URL   : https://patchwork.freedesktop.org/series/73719/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110989 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1690042):
  [0KRunning with gitlab-runner 12.6.0 (ac8e767a)
  [0;m[0K  on gst-gitlab-htz-runner7 eBGGUWcX
  [0;msection_start:1582225738:prepare_executor
  [0K[0KUsing Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  [0;m[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[0KPulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  [0;m[0KUsing docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  [0;msection_end:1582225740:prepare_executor
  [0Ksection_start:1582225740:prepare_script
  [0KRunning on runner-eBGGUWcX-project-3185-concurrent-1 via gst-gitlab-htz-runner7...
  section_end:1582225741:prepare_script
  [0Ksection_start:1582225741:get_sources
  [0Ksection_end:1582225741:get_sources
  [0Ksection_start:1582225741:upload_artifacts_on_failure
  [0Ksection_end:1582225743:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: error creating overlay mount to /var/lib/docker/overlay2/56cce20ad06e949191451b0b18948701ff4ae79facfa8b339fac38a7a4359952/merged: device or resource busy (executor_docker.go:742:0s)
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110989
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
