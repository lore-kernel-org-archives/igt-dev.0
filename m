Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Mon, 15 May 2023 15:28:10 -0000
Message-ID: <168416449027.22015.10436751987083148586@emeril.freedesktop.org>
References: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_g?=
 =?utf-8?q?putop/intel=5Fgpu=5Ftop=3A_Move_name_to_be_the_last_field?=
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

Series: gputop/intel_gpu_top: Move name to be the last field
URL   : https://patchwork.freedesktop.org/series/117768/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881545 for the overview.

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41747357):
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Native dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program sphinx-build skipped: feature sphinx disabled
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:35:1: ERROR:  The += operator currently only works with arrays, strings or ints 
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1684164286:step_script
  section_start:1684164286:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684164287:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881545
