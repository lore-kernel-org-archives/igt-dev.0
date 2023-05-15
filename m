Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 15 May 2023 16:18:20 -0000
Message-ID: <168416750098.22014.6470137250321637925@emeril.freedesktop.org>
References: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?eson=2Ebuild=3A_update_minimal_version_to_0=2E48?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson.build: update minimal version to 0.48
URL   : https://patchwork.freedesktop.org/series/117774/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881582 for the overview.

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41753426):
  Installing collected packages: meson
    Running setup.py install for meson: started
      Running setup.py install for meson: finished with status 'done'
  Successfully installed meson-0.47.2
  $ meson $MESON_OPTIONS build
  The Meson build system
  Version: 0.47.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR:  Meson version is 0.47.2 but project requires >=0.48.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1684167162:step_script
  section_start:1684167162:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684167165:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881582

