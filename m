Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 29 Dec 2022 16:56:53 -0000
Message-ID: <167233301399.3304.12253657350443705311@emeril.freedesktop.org>
References: <20221229163928.27894-1-markyacoub@chromium.org>
In-Reply-To: <20221229163928.27894-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?esting_headers_in_CI?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: testing headers in CI
URL   : https://patchwork.freedesktop.org/series/112294/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/771144 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986423):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd18b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1672332825:prepare_executor
  section_start:1672332825:prepare_script
  Preparing environment
  Running on runner-svmukzxa-project-3185-concurrent-2 via fdo-equinix-m3l-8...
  section_end:1672332829:prepare_script
  section_start:1672332829:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332834:get_sources
  section_start:1672332834:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332838:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986425):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1672332833:prepare_executor
  section_start:1672332833:prepare_script
  Preparing environment
  Running on runner-z8lnzmhw-project-3185-concurrent-3 via fdo-equinix-m3l-10...
  section_end:1672332834:prepare_script
  section_start:1672332834:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332835:get_sources
  section_start:1672332835:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332835:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986427):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1672332840:prepare_executor
  section_start:1672332840:prepare_script
  Preparing environment
  Running on runner-svmukzxa-project-3185-concurrent-3 via fdo-equinix-m3l-8...
  section_end:1672332843:prepare_script
  section_start:1672332843:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332847:get_sources
  section_start:1672332847:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332851:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986418):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1672332822:prepare_executor
  section_start:1672332822:prepare_script
  Preparing environment
  Running on runner-z8lnzmhw-project-3185-concurrent-0 via fdo-equinix-m3l-10...
  section_end:1672332824:prepare_script
  section_start:1672332824:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332826:get_sources
  section_start:1672332826:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332827:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986422):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1672332822:prepare_executor
  section_start:1672332822:prepare_script
  Preparing environment
  Running on runner-z8lnzmhw-project-3185-concurrent-2 via fdo-equinix-m3l-10...
  section_end:1672332824:prepare_script
  section_start:1672332824:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332826:get_sources
  section_start:1672332826:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332827:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986421):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1672332827:prepare_executor
  section_start:1672332827:prepare_script
  Preparing environment
  Running on runner-svmukzxa-project-3185-concurrent-1 via fdo-equinix-m3l-8...
  section_end:1672332830:prepare_script
  section_start:1672332830:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332834:get_sources
  section_start:1672332834:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332837:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986419):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1672332827:prepare_executor
  section_start:1672332827:prepare_script
  Preparing environment
  Running on runner-svmukzxa-project-3185-concurrent-0 via fdo-equinix-m3l-8...
  section_end:1672332830:prepare_script
  section_start:1672332830:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332834:get_sources
  section_start:1672332834:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332838:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33986420):
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-5b511e7384aa52321e275b9db1637ac51996f22c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1672332822:prepare_executor
  section_start:1672332822:prepare_script
  Preparing environment
  Running on runner-z8lnzmhw-project-3185-concurrent-1 via fdo-equinix-m3l-10...
  section_end:1672332824:prepare_script
  section_start:1672332824:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  remote: The git server, Gitaly, is not available at this time. Please contact your administrator.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 503
  section_end:1672332826:get_sources
  section_start:1672332826:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1672332827:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/771144
