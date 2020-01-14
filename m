Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jan 2020 09:38:10 -0000
Message-ID: <157899469064.24908.3458107138583132678@emeril.freedesktop.org>
References: <20200114091745.4555-1-petri.latvala@intel.com>
In-Reply-To: <20200114091745.4555-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/4=5D_lib=3A_Don=27t_dump_log_b?=
 =?utf-8?q?uffer_when_dynamic_subtest_failure_is_inherited?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib: Don't dump log buffer when dynamic subtest failure is inherited
URL   : https://patchwork.freedesktop.org/series/71997/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/96871 for the overview.

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1347812):
  [0;m[0KUsing docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-99d665dbc9efaffe69fe0c2f2994ddf52d2f1e49 ...
  [0;msection_end:1578994502:prepare_executor
  [0Ksection_start:1578994502:prepare_script
  [0KRunning on runner-eBGGUWcX-project-3185-concurrent-1 via gst-gitlab-htz-runner7...
  section_end:1578994504:prepare_script
  [0Ksection_start:1578994504:get_sources
  [0K[32;1mFetching changes...[0;m
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  [32;1mChecking out 99d665db as intel/IGTPW_3921...[0;m
  
  [32;1mSkipping Git submodules setup[0;m
  section_end:1578994506:get_sources
  [0Ksection_start:1578994506:restore_cache
  [0Ksection_end:1578994507:restore_cache
  [0Ksection_start:1578994507:download_artifacts
  [0Ksection_end:1578994507:download_artifacts
  [0Ksection_start:1578994507:upload_artifacts_on_failure
  [0Ksection_end:1578994509:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: error creating overlay mount to /var/lib/docker/overlay2/e3ed3c84cc0a8aa83724802bc2ccf0b41aa2029303c81e3f210add41ce14b23d/merged: device or resource busy (executor_docker.go:740:0s)
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/96871
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
