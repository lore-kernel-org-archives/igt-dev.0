Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Jan 2022 18:23:47 -0000
Message-ID: <164149342711.20692.4336980759514611275@emeril.freedesktop.org>
References: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_T?=
 =?utf-8?q?ests_and_intel=5Fgpu=5Ftop_with_fdinfo_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Tests and intel_gpu_top with fdinfo support
URL   : https://patchwork.freedesktop.org/series/98555/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/478447 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17324128):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 ...
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1641491330:prepare_executor
  section_start:1641491330:prepare_script
  Preparing environment
  Running on runner-ya9tm6yf-project-3185-concurrent-2 via fdo-packet-m1xl-2...
  section_end:1641491335:prepare_script
  section_start:1641491335:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641493137:get_sources
  section_start:1641493137:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641493138:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17324127):
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1641491291:prepare_executor
  section_start:1641491291:prepare_script
  Preparing environment
  Running on runner-z2cifdyy-project-3185-concurrent-0 via gst-htz-3...
  section_end:1641491291:prepare_script
  section_start:1641491291:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; HTTP 504 curl 22 The requested URL returned error: 504
  fatal: the remote end hung up unexpectedly
  section_end:1641491893:get_sources
  section_start:1641491893:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1641491894:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17324120):
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1641490848:prepare_executor
  section_start:1641490848:prepare_script
  Preparing environment
  Running on runner-ya9tm6yf-project-3185-concurrent-0 via fdo-packet-m1xl-2...
  section_end:1641490851:prepare_script
  section_start:1641490851:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641492652:get_sources
  section_start:1641492652:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641492653:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17324124):
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb95f3bfe381b726e0f5b3798d1b75fba1db54b2 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1641491258:prepare_executor
  section_start:1641491258:prepare_script
  Preparing environment
  Running on runner-zbmz6-qr-project-3185-concurrent-0 via fdo-packet-m1xl-1...
  section_end:1641491260:prepare_script
  section_start:1641491260:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641493063:get_sources
  section_start:1641493063:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641493065:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/478447
