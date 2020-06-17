Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jun 2020 09:29:15 -0000
Message-ID: <159238615537.29979.8100889850260435275@emeril.freedesktop.org>
References: <20200616123758.3331-1-ramadevi.gandi@intel.com>
In-Reply-To: <20200616123758.3331-1-ramadevi.gandi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?ntel=3A_sync_i915=5Fpciids=2Eh_with_kernel?=
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
To: ramadevi.gandi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel: sync i915_pciids.h with kernel
URL   : https://patchwork.freedesktop.org/series/78460/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/162102 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3144273):
  Using docker image sha256:e4a87da4fe6196122355f939b4abe813b13894a992a96ee7ae734c1f6bb4e129 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-d07444b4189bc9e8322249fef7af2c4741edf40c ...
  section_end:1592385843:prepare_executor
  section_start:1592385843:prepare_script
  Preparing environment
  Running on runner-z2CifdYy-project-3185-concurrent-2 via gst-htz-3...
  section_end:1592385844:prepare_script
  section_start:1592385844:get_sources
  Getting source from Git repository
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  warning: redirecting to https://gitlab-ci-hetzner.freedesktop.org/gfx-ci/igt-ci-tags.git/
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1592385907:get_sources
  section_start:1592385907:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1592385908:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3144269):
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-d07444b4189bc9e8322249fef7af2c4741edf40c ...
  section_end:1592385842:prepare_executor
  section_start:1592385842:prepare_script
  Preparing environment
  Running on runner-thys1kA2-project-3185-concurrent-1 via gst-htz-2...
  section_end:1592385843:prepare_script
  section_start:1592385843:get_sources
  Getting source from Git repository
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  warning: redirecting to https://gitlab-ci-hetzner.freedesktop.org/gfx-ci/igt-ci-tags.git/
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1592385906:get_sources
  section_start:1592385906:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1592385907:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/162102
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
