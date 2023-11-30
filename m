Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Thu, 30 Nov 2023 15:26:28 -0000
Message-ID: <170135798894.15643.3286992480392358154@emeril.freedesktop.org>
References: <20231130132050.2132447-1-jeevan.b@intel.com>
In-Reply-To: <20231130132050.2132447-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_U?=
 =?utf-8?q?pdate_PSR/PSR2=5FSF_documenation_and_Add_FBC_support?=
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

Series: Update PSR/PSR2_SF documenation and Add FBC support
URL   : https://patchwork.freedesktop.org/series/127121/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1046086 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52198810):
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 2bb5b87f as detached HEAD (ref is intel/IGTPW_10304)...
  Removing build/
  
  Skipping Git submodules setup
  section_end:1701357858:get_sources
  section_start:1701357858:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (52198795)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=52198795 responseStatus=200 OK token=64_eZh8c
  section_end:1701357863:download_artifacts
  section_start:1701357863:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1701357865:step_script
  section_start:1701357865:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701357865:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1046086
