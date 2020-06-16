Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Jun 2020 15:24:03 -0000
Message-ID: <159232104350.4596.13992162261648645474@emeril.freedesktop.org>
References: <20200615102516.7376-1-petri.latvala@intel.com>
In-Reply-To: <20200615102516.7376-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_scripts/verify-black?=
 =?utf-8?q?list=3A_Script_for_checking_blacklist_files?=
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

Series: series starting with [i-g-t,v3,1/2] scripts/verify-blacklist: Script for checking blacklist files
URL   : https://patchwork.freedesktop.org/series/78368/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/160705 for the overview.

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3098121):
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  section_end:1592218945:prepare_executor
  section_start:1592218945:prepare_script
  Preparing environment
  Running on runner-j4Lrg1oF-project-3185-concurrent-1 via gst-htz-1...
  section_end:1592218947:prepare_script
  section_start:1592218947:get_sources
  Getting source from Git repository
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  warning: redirecting to https://gitlab-ci-hetzner.freedesktop.org/gfx-ci/igt-ci-tags.git/
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1592219009:get_sources
  section_start:1592219009:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1592219011:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3098120):
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  section_end:1592218945:prepare_executor
  section_start:1592218945:prepare_script
  Preparing environment
  Running on runner-z2CifdYy-project-3185-concurrent-0 via gst-htz-3...
  section_end:1592218946:prepare_script
  section_start:1592218946:get_sources
  Getting source from Git repository
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  warning: redirecting to https://gitlab-ci-hetzner.freedesktop.org/gfx-ci/igt-ci-tags.git/
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1592219009:get_sources
  section_start:1592219009:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1592219010:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/160705
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
