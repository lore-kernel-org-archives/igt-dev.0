Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Mar 2023 12:15:15 -0000
Message-ID: <167931451529.26306.996163805284338789@emeril.freedesktop.org>
References: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_B?=
 =?utf-8?q?uild_Xe_test_documentation?=
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

Series: Build Xe test documentation
URL   : https://patchwork.freedesktop.org/series/115373/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/833959 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38387199):
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Run-time dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:7:0: ERROR: Program(s) ['rst2pdf'] not found or not executable
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679314053:step_script
  section_start:1679314053:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679314053:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38387203):
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Run-time dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:7:0: ERROR: Program(s) ['rst2pdf'] not found or not executable
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679314060:step_script
  section_start:1679314060:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679314062:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38387202):
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Run-time dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:7:0: ERROR: Program(s) ['rst2pdf'] not found or not executable
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679314054:step_script
  section_start:1679314054:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679314055:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38387200):
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Run-time dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:7:0: ERROR: Program(s) ['rst2pdf'] not found or not executable
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679314055:step_script
  section_start:1679314055:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679314056:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38387201):
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Native dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:7:0: ERROR:  Program(s) ['rst2pdf'] not found or not executable
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679314054:step_script
  section_start:1679314054:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679314055:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/833959

