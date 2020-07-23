Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jul 2020 15:28:59 -0000
Message-ID: <159551813917.23573.4934816571238868615@emeril.freedesktop.org>
References: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_new_IGT_test_to_validate_crtc_Dithering_=28rev3=29?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add new IGT test to validate crtc Dithering (rev3)
URL   : https://patchwork.freedesktop.org/series/79661/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/181216 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3770125):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  section_end:1595517314:prepare_executor
  section_start:1595517314:prepare_script
  Preparing environment
  Running on runner-z2cifdyy-project-3185-concurrent-0 via gst-htz-3...
  section_end:1595517314:prepare_script
  section_start:1595517314:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: Unknown error code (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1595517379:get_sources
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3770127):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-7c27fc9636dd5a6db464749cc9f32627b36d6a35 ...
  section_end:1595517338:prepare_executor
  section_start:1595517338:prepare_script
  Preparing environment
  Running on runner-z2cifdyy-project-3185-concurrent-1 via gst-htz-3...
  section_end:1595517340:prepare_script
  section_start:1595517340:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: Unknown error code (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1595517402:get_sources
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/181216
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
