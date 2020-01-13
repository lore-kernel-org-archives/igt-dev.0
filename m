Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jan 2020 14:28:01 -0000
Message-ID: <157892568188.25473.11998940768322356290@emeril.freedesktop.org>
References: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_S?=
 =?utf-8?q?implify_working_on_tiled_surfaces_over_GenX_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Simplify working on tiled surfaces over GenX (rev3)
URL   : https://patchwork.freedesktop.org/series/71740/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/96506 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1338517):
  [0KRunning with gitlab-runner 12.5.0 (577f813d)
  [0;m[0K  on fdo-gitlab-gce-runner3 81280d8f
  [0;msection_start:1578925612:prepare_executor
  [0K[0KUsing Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-913d676259dfa9ca77d6fd151d5d3935d974f603 ...
  [0;m[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[0KPulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-913d676259dfa9ca77d6fd151d5d3935d974f603 ...
  [0;m[0KUsing docker image sha256:47a8063079b291849f7909d2b6b54f3cf13b909f8f90be38166db80fd5634b5f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-913d676259dfa9ca77d6fd151d5d3935d974f603 ...
  [0;msection_end:1578925613:prepare_executor
  [0Ksection_start:1578925613:prepare_script
  [0KRunning on runner-81280d8f-project-3185-concurrent-1 via fdo-gitlab-gce-runner3.c.fdo-gitlab.internal...
  section_end:1578925615:prepare_script
  [0Ksection_start:1578925615:get_sources
  [0Ksection_end:1578925615:get_sources
  [0Ksection_start:1578925615:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1338517 responseStatus[0;m=201 Created token[0;m=i2BuxZMa
  section_end:1578925621:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: error creating overlay mount to /var/lib/docker/overlay2/5805603f0e18a03bbf520a3099cbac03113b8a1a46139a4f0c6c4aae78924385/merged: device or resource busy (executor_docker.go:740:0s)
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/96506
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
