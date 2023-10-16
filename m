Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Mon, 16 Oct 2023 14:24:57 -0000
Message-ID: <169746629793.13505.15664443856295215480@emeril.freedesktop.org>
References: <20231016131752.39196-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231016131752.39196-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ools/intel=5Fgpu=5Ffrequency=3A_fix_device_opening?=
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

Series: tools/intel_gpu_frequency: fix device opening
URL   : https://patchwork.freedesktop.org/series/125170/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1011498 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50376860):
  Removing installdir/
  Removing undocumented_tests.txt
  
  Skipping Git submodules setup
  section_end:1697465840:get_sources
  section_start:1697465840:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-b5e66552e5c58d9c4a430eaa38f8b494c454b7b8 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
  $ meson --cross-file meson-cross-armhf.txt build
  section_end:1697465844:step_script
  section_start:1697465844:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697465846:cleanup_file_variables
  ERROR: Job failed: exit code 137
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50376855):
  Transaction test succeeded.
  Running transaction
    Preparing        :                                                        1/1 
    Erasing          : meson-0.52.0-1.module_f31+6771+f5d842eb.noarch         1/1 
    Running scriptlet: meson-0.52.0-1.module_f31+6771+f5d842eb.noarch         1/1 
    Verifying        : meson-0.52.0-1.module_f31+6771+f5d842eb.noarch         1/1 
  
  Removed:
    meson-0.52.0-1.module_f31+6771+f5d842eb.noarch                                
  
  Complete!
  $ pip install /usr/src/meson-*.tar.gz
  WARNING: Running pip install with root privileges is generally not a good idea. Try `pip install --user` instead.
  Processing /usr/src/meson-0.47.2.tar.gz
  section_end:1697465843:step_script
  section_start:1697465843:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697465845:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1011498
