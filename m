Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 12 Oct 2023 10:02:17 -0000
Message-ID: <169710493791.25005.9490806645983538654@emeril.freedesktop.org>
References: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/xe=5Fcreate=3A_Remove_create-invalid-size_subtest_=28rev2?=
 =?utf-8?q?=29?=
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

Series: tests/xe_create: Remove create-invalid-size subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/119866/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1008398 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50210855):
  [116/1309] Compiling C object 'lib/76b5a35@@igt-intel_allocator_msgchannel_c@sta/intel_allocator_msgchannel.c.o'.
  [117/1309] Linking static target lib/libigt-intel_allocator_msgchannel_c.a.
  [118/1309] Compiling C object 'lib/76b5a35@@igt-intel_allocator_reloc_c@sta/intel_allocator_reloc.c.o'.
  [119/1309] Linking static target lib/libigt-intel_allocator_reloc_c.a.
  [120/1309] Compiling C object 'lib/76b5a35@@igt-intel_chipset_c@sta/intel_chipset.c.o'.
  [121/1309] Linking static target lib/libigt-intel_chipset_c.a.
  [122/1309] Compiling C object 'lib/76b5a35@@igt-intel_allocator_simple_c@sta/intel_allocator_simple.c.o'.
  [123/1309] Linking static target lib/libigt-intel_allocator_simple_c.a.
  [124/1309] Compiling C object 'lib/76b5a35@@igt-intel_allocator_c@sta/intel_allocator.c.o'.
  [125/1309] Compiling C object 'lib/76b5a35@@igt-intel_compute_square_kernels_c@sta/intel_compute_square_kernels.c.o'.
  [126/1309] Linking static target lib/libigt-intel_allocator_c.a.
  [127/1309] Linking static target lib/libigt-intel_compute_square_kernels_c.a.
  [128/1309] Compiling C object 'lib/76b5a35@@igt-intel_cmds_info_c@sta/intel_cmds_info.c.o'.
  [129/1309] Linking static target lib/libigt-intel_cmds_info_c.a.
  section_end:1697104642:step_script
  section_start:1697104642:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697104643:cleanup_file_variables
  ERROR: Job failed: exit code 137
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50210851):
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 19341e82 as detached HEAD (ref is intel/IGTPW_9990)...
  
  Skipping Git submodules setup
  section_end:1697104635:get_sources
  section_start:1697104635:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-19341e8289e49e1ee8fe21996962fd876039507d with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson $MESON_OPTIONS build
  section_end:1697104638:step_script
  section_start:1697104638:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697104639:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1008398
