Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 12:32:01 -0000
Message-ID: <158436192165.18994.15574294720357710681@emeril.freedesktop.org>
References: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_T?=
 =?utf-8?q?est_configurable_poll_delay_in_perf_OA_=28rev2=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA (rev2)
URL   : https://patchwork.freedesktop.org/series/74655/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/120135 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1941150):
  Running with gitlab-runner 12.5.0 (577f813d)
    on gst-gitlab-htz-runner2 sGiTXgBC
  section_start:1584361515:prepare_executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-2c9542abda7cdbd05b695c6287974c8f51cc2a55 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-2c9542abda7cdbd05b695c6287974c8f51cc2a55 ...
  Using docker image sha256:20ce37ce0dd99e42a1a28192a10ddd453c0dc2ae3056621938b8ec4221e3cf3c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-2c9542abda7cdbd05b695c6287974c8f51cc2a55 ...
  section_end:1584361518:prepare_executor
  section_start:1584361518:prepare_script
  Running on runner-sGiTXgBC-project-3185-concurrent-0 via gst-gitlab-htz-runner2...
  section_end:1584361520:prepare_script
  section_start:1584361520:get_sources
  section_end:1584361520:get_sources
  section_start:1584361520:upload_artifacts_on_failure
  section_end:1584361522:upload_artifacts_on_failure
  ERROR: Job failed (system failure): Error response from daemon: error creating overlay mount to /var/lib/docker/overlay2/945d3c854bf186a8f4d3e9c7ec964f6393595815de03e96745c2b99f42134acf/merged: device or resource busy (executor_docker.go:740:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/120135
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
