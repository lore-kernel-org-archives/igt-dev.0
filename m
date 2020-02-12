Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 10:20:44 -0000
Message-ID: <158150284452.24263.16224330785778140145@emeril.freedesktop.org>
References: <20200211192253.1120964-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200211192253.1120964-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fpersistence=3A_Race_context_closure_with_replac?=
 =?utf-8?q?e-engines?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_persistence: Race context closure with replace-engines
URL   : https://patchwork.freedesktop.org/series/73336/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/107590 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1608729):
   * [new tag]           intel/IGTPW_4133      -> intel/IGTPW_4133
  [32;1mChecking out 92bfd447 as intel/IGTPW_4133...[0;m
  Removing build/
  
  [32;1mSkipping Git submodules setup[0;m
  section_end:1581502583:get_sources
  [0Ksection_start:1581502583:restore_cache
  [0Ksection_end:1581502585:restore_cache
  [0Ksection_start:1581502585:download_artifacts
  [0Ksection_end:1581502588:download_artifacts
  [0Ksection_start:1581502588:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;msection_end:1581502588:build_script
  [0Ksection_start:1581502588:after_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;msection_end:1581502591:after_script
  [0Ksection_start:1581502591:upload_artifacts_on_failure
  [0Ksection_end:1581502594:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: error creating overlay mount to /var/lib/docker/overlay2/122b05885fe7bb4f5a375b1839efc5a9ac36696e0cd1caf7e006eba400f32e8a/merged: device or resource busy (executor_docker.go:740:0s)
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/107590
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
