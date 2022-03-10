Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Date: Thu, 10 Mar 2022 08:14:10 -0000
Message-ID: <164690005094.17008.6507964405123387760@emeril.freedesktop.org>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_R?=
 =?utf-8?q?un_CI_on_Qualcomm_devices_=28rev2=29?=
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

Series: Run CI on Qualcomm devices (rev2)
URL   : https://patchwork.freedesktop.org/series/101195/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/528220 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604901):
  $ unset CI_JOB_JWT
  $ echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
  section_end:1646899713:unset_env_vars_section
  
  $ export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
  $ meson --cross-file meson-cross-arm64.txt build
  Could not find any valid candidate for cross files: meson-cross-arm64.txt
  
  ERROR: Cannot find specified cross file: meson-cross-arm64.txt
  section_end:1646899717:step_script
  section_start:1646899717:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646899724:after_script
  section_start:1646899724:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646899727:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604900):
  $ echo -n "${CI_JOB_JWT}" > "${CI_JOB_JWT_FILE}"
  $ unset CI_JOB_JWT
  $ echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
  section_end:1646899712:unset_env_vars_section
  
  $ export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
  $ meson --cross-file meson-cross-armhf.txt build
  
  ERROR: Cannot find specified cross file: meson-cross-armhf.txt
  section_end:1646899715:step_script
  section_start:1646899715:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646899721:after_script
  section_start:1646899721:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646899727:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604902):
  $ echo -n "${CI_JOB_JWT}" > "${CI_JOB_JWT_FILE}"
  $ unset CI_JOB_JWT
  $ echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
  section_end:1646899713:unset_env_vars_section
  
  $ export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
  $ meson --cross-file meson-cross-mips.txt build
  
  ERROR: Cannot find specified cross file: meson-cross-mips.txt
  section_end:1646899717:step_script
  section_start:1646899717:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646899724:after_script
  section_start:1646899724:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646899728:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/528220
