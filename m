Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Apr 2023 09:51:13 -0000
Message-ID: <168060187358.18900.16749864525112990357@emeril.freedesktop.org>
References: <20230404070844.204306-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230404070844.204306-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?estplan/meson=2Ebuild=3A_only_run_igt=5Frunner_if_it_is_compile?=
 =?utf-8?q?d_=28rev2=29?=
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

Series: testplan/meson.build: only run igt_runner if it is compiled (rev2)
URL   : https://patchwork.freedesktop.org/series/116065/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/847575 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/39294527):
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
  
  docs/testplan/meson.build:12:0: ERROR:  Unknown variable "test_executables".
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1680601423:step_script
  section_start:1680601423:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1680601423:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/847575

