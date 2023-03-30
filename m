Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Mar 2023 06:25:01 -0000
Message-ID: <168015750148.18827.4269706060784246905@emeril.freedesktop.org>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?mprove_igt=5Fdoc=2Epy_=28rev2=29?=
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

Series: Improve igt_doc.py (rev2)
URL   : https://patchwork.freedesktop.org/series/115667/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/843145 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/39018529):
  Program rst2man-3 found: NO
  Program rst2man found: NO
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Dependency gtk-doc found: NO (tried pkgconfig and cmake)
  Program sphinx-build found: NO
  Program rst2html-3 found: NO
  Program rst2html found: NO
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:24:1: ERROR:  Invalid use of addition: can only concatenate list (not "str") to list
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1680156901:step_script
  section_start:1680156901:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1680156902:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/843145

