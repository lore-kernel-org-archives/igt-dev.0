Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1F010F21F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 12:25:30 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 14:24:50 +0200
Message-Id: <cover.1649939026.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 00/12] code coverage: some improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This series:

1. remove the code coverage script extensions and install them
   on bindir;
2. adds a small script to test if the code coverage and its
   scripts are working properly, if excecuted with a kernel
   compiled with code coverage support;
3. adds a script that allows filtering, printing statistics,
   printing used/unused functions and generating html reports.

The parsing script enhances the code coverage data collect, as it
allows quickly checking the code coverage results per test.

For instance, using the script below:

<script>
TESTLIST="my_tests.testlist"
OUT_DIR="${HOME}/results"

mkdir -p $OUT_DIR/html

echo "igt@debugfs_test@read_all_entries" > $TESTLIST
echo "igt@core_auth@basic-auth" >> $TESTLIST
echo "igt@gem_exec_basic@basic" >> $TESTLIST

sudo IGT_KERNEL_TREE="${HOME}/linux" igt_runner -s -o --coverage-per-test \
                  --collect-script code_cov_capture --test-list $TESTLIST \
                  /usr/local/libexec/igt-gpu-tools $OUT_DIR/ | sed s,$HOME/,,

sudo chown -R $(id -u):$(id -g) $OUT_DIR/

for i in $OUT_DIR/code_cov/*.info; do
	echo -e "\n$(basename $i):"
        code_cov_parse_info --only-drm --ignore-unused --stat $i
done
echo -e "\nTOTAL:"
code_cov_parse_info --only-drm --stat --output $OUT_DIR/results.info \
        $OUT_DIR/code_cov/*.info

cd $OUT_DIR/html
genhtml -q -s --legend --branch-coverage $OUT_DIR/results.info
</script>

The parse script will filter and display the function, branch and
like coverage per test, and the total one:

core_auth_basic_auth.info:
  lines......: 11.7% (8219 of 70257 lines)
  functions..: 7.1% (776 of 10971 functions)
  branches...: 7.0% (3597 of 51041 branches)
Ignored......: non-drm headers and source files where none of its code ran.
Source files.: 23.27% (165 of 709 total), 29.57% (165 of 558 filtered)

debugfs_test_read_all_entries.info:
  lines......: 19.3% (20249 of 104802 lines)
  functions..: 17.5% (1922 of 10971 functions)
  branches...: 12.7% (9449 of 74555 branches)
Ignored......: non-drm headers and source files where none of its code ran.
Source files.: 34.70% (246 of 709 total), 44.09% (246 of 558 filtered)

gem_exec_basic_basic.info:
  lines......: 17.4% (15196 of 87570 lines)
  functions..: 13.1% (1437 of 10971 functions)
  branches...: 10.3% (6562 of 63806 branches)
Ignored......: non-drm headers and source files where none of its code ran.
Source files.: 31.17% (221 of 709 total), 39.61% (221 of 558 filtered)

TOTAL:
  lines......: 15.6% (26031 of 166849 lines)
  functions..: 22.3% (2443 of 10971 functions)
  branches...: 10.6% (11968 of 112665 branches)
Ignored......: non-drm headers.
Source files.: 78.70% (558 of 709 total)

A much more detailed report can also be produced with --print,
--print-unused (optionally with --show-lines). For instance,
reporting code coverage usage for functions with "edid_" on
its name is as simple as:

$ echo "+edid_" >filter.txt; code_cov_parse_info --func-filters filter.txt results/results.info --print --print-unused
TEST: Code_coverage_tests
__drm_get_edid_firmware_path(): unused
__drm_set_edid_firmware_path(): unused
displayid_iter_edid_begin(): executed 10 times
drm_add_edid_modes(): executed 2 times
drm_add_override_edid_modes(): unused
drm_connector_attach_edid_property(): unused
drm_connector_update_edid_property(): executed 8 times
drm_dp_send_real_edid_checksum(): unused
drm_edid_are_equal(): executed 4 times
drm_edid_block_valid(): executed 8 times
drm_edid_duplicate(): unused
drm_edid_get_monitor_name(): unused
drm_edid_header_is_valid(): executed 4 times
drm_edid_is_valid(): executed 2 times
drm_edid_to_eld(): executed 2 times
drm_edid_to_sad(): unused
drm_edid_to_speaker_allocation(): unused
drm_find_edid_extension(): executed 22 times
drm_get_edid_switcheroo(): unused
drm_load_edid_firmware(): executed 2 times
edid_firmware_get(): unused
edid_firmware_set(): unused
edid_fixup_preferred(): unused
edid_get_quirks(): executed 6 times
edid_load(): unused
edid_open(): executed 4 times
edid_show() from linux/drivers/gpu/drm/drm_debugfs.c: executed 4 times
edid_show() from linux/drivers/gpu/drm/drm_sysfs.c: unused
edid_vendor(): executed 348 times
edid_write(): unused
intel_panel_edid_downclock_mode(): unused
intel_panel_edid_fixed_mode(): unused
is_edid_digital_input_dp(): unused
Ignored......: unmatched functions m/(?^:edid_)/ and source files where none of its code ran.
Source files.: 0.90% (5 of 558 total), 55.56% (5 of 9 filtered)

Finally, it can place the data above on an html report and, when
multiple .info files are used, it places the data collected from
each .info file on a row, allowing to compare the code coverage
from different tests and from different machines.

Regards,
Mauro

Mauro Carvalho Chehab (12):
  scripts/code_cov*: remove the extensions from them
  scripts/code_cov_parse_info: add a tool to parse code coverage info
    files
  scripts/code_cov_gen_report: add support for filtering info files
  runner: execute code coverage script also from PATH
  scripts/meson.build: install code coverage scripts
  scripts/code_cov_selftest.sh: test if IGT code coverage is working
  docs/code_coverage.md: document the code coverage filter script
  scripts/code_cov_parse_info: better handle test name
  code_cov_parse_info: fix error handling when opening files
  code_cov_parse_info: fix --show-lines logic
  code_cov_parse_info: add support for exclude filters
  code_cov_parse_info: add support for generating html reports

 docs/code_coverage.md                         |  238 +++-
 meson.build                                   |    1 +
 runner/settings.c                             |  109 +-
 .../{code_cov_capture.sh => code_cov_capture} |    0
 ...r_on_build.sh => code_cov_gather_on_build} |    0
 ...her_on_test.py => code_cov_gather_on_test} |    0
 ..._cov_gen_report.sh => code_cov_gen_report} |   19 +
 scripts/code_cov_parse_info                   | 1213 +++++++++++++++++
 scripts/code_cov_selftest.sh                  |   47 +
 scripts/meson.build                           |   13 +
 10 files changed, 1585 insertions(+), 55 deletions(-)
 rename scripts/{code_cov_capture.sh => code_cov_capture} (100%)
 rename scripts/{code_cov_gather_on_build.sh => code_cov_gather_on_build} (100%)
 rename scripts/{code_cov_gather_on_test.py => code_cov_gather_on_test} (100%)
 rename scripts/{code_cov_gen_report.sh => code_cov_gen_report} (85%)
 create mode 100755 scripts/code_cov_parse_info
 create mode 100755 scripts/code_cov_selftest.sh
 create mode 100644 scripts/meson.build

-- 
2.35.1

