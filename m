Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 09 May 2023 07:48:37 -0000
Message-ID: <168361851709.14157.50531629102856951@emeril.freedesktop.org>
References: <20230509073426.1154390-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230509073426.1154390-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_an_option_to_protect_Xe_test_builds?=
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

Series: Add an option to protect Xe test builds
URL   : https://patchwork.freedesktop.org/series/117500/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/876499 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41376086):
  Program rst2man-3 found: NO
  Program rst2man found: NO
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Dependency gtk-doc found: NO (tried pkgconfig and cmake)
  Program sphinx-build skipped: feature sphinx disabled
  Program rst2html-3 found: NO
  Program rst2html found: NO
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:34:3: ERROR:  Unknown variable "build_xe".
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1683618036:step_script
  section_start:1683618036:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1683618036:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/876499

