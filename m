Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jul 2020 12:07:46 -0000
Message-ID: <159550606609.23573.10718211328265500484@emeril.freedesktop.org>
References: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fatomic=5Ftran?=
 =?utf-8?q?sition=3A_Add_explicit_curly_brackets?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_atomic_transition: Add explicit curly brackets
URL   : https://patchwork.freedesktop.org/series/79800/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/181063 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3765130):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  Using docker image sha256:e4a87da4fe6196122355f939b4abe813b13894a992a96ee7ae734c1f6bb4e129 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  section_end:1595503872:prepare_executor
  section_start:1595503872:prepare_script
  Preparing environment
  Running on runner-thys1ka2-project-3185-concurrent-1 via gst-htz-2...
  section_end:1595503873:prepare_script
  section_start:1595503873:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: Unknown error code (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1595503936:get_sources
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/3765129):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-b59c1dc758f8a435396a1142acbcdb8770921c9c ...
  section_end:1595503862:prepare_executor
  section_start:1595503862:prepare_script
  Preparing environment
  Running on runner-thys1ka2-project-3185-concurrent-0 via gst-htz-2...
  section_end:1595503863:prepare_script
  section_start:1595503863:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: Unknown error code (err 1)
  fatal: the remote end hung up unexpectedly
  section_end:1595503925:get_sources
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/181063
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
