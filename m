Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E8D10E501
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:06 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:26 +0000
Message-Id: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 00/34] Add DG2 OA test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests for changes in perf OA for DG2.

v2:
- Rebase
- Reposting since some patches did no land in the ML

v3:
- Fix author/sign-off name mismatch in one patch

v4:
- Add review comments
- Drop below patches

"i915/perf: Bump timestamp tolerance for DG1"
(Not able to reproduce it with latest drm-tip)

"i915/perf: Add support for 64-bit counters"
"i915/perf: Add a test for non-power-of-2 oa reports"
"i915/perf: Treat ticks as 64 bit"
"i915/perf: Treat timestamp as 64 bit value"
"i915/perf: Fix DG2 A0 report header"
(Separate out 64-bit OA formats from this series)

v5:
- Add patches from lionel for updated metric sets

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (21):
  lib/i915/perf: implement report accumulation for new format
  lib/i915/perf: fixup conversion script for XEHPSDV
  lib/i915/perf: make warning message more helpful
  lib/i915/perf: expose new operators for codegen
  tools/i915-perf-recorder: add ability to select device
  lib/i915/perf: fixup report validity
  lib/i915/perf: add a helper to read timestamps
  lib/i915/perf: store bit shifting required for OA timestamps
  lib/i915/perf: indentation fix
  tools/i915-perf-recorder: capture OA & CS frequencies
  tools/i915-perf: make timestamp range easier to compare
  tools/i915-perf: printout CPU clock used
  tools/i915-perf: record remaining perf data on exit
  lib/i915/perf: add support for new EuDualSubslicesTotalCount var
  lib/i915/perf-config: extend the device info
  i915/perf: update import script
  lib/i915/perf: add a raw timestamp utility
  lib/i915/perf: add helper function to get report reason
  tools/i915-perf: add option to printout reports data
  lib/i915: prepare codegen for new ACM/DG2 variables
  lib/i915/perf: Add ACM metrics

Umesh Nerlige Ramappa (13):
  i915/perf: Check regularly if we are done reading reports
  i915/perf: Fix OA short_reads test
  i915/perf: Check return value from getparam
  i915/perf: Limit sseu-config tests for gen11
  i915/perf: Account for OA sampling interval in polling test
  i915/perf: Define OA report types and fix oa-formats test
  i915/perf: Use ARRAY_SIZE consistently for num_properties
  i915/perf: Use gt in perf tests and lib
  i915/perf: Explicitly state rendercopy needs for a test
  i915/perf: Skip tests that use rendercopy
  i915/perf: Add OA formats for DG2
  i915/perf: Fix CS timestamp vs OA timstamp mismatch
  i915/perf: Wait longer for rc6 residency in DG2

 include/drm-uapi/i915_drm.h                   |     10 +
 lib/i915/perf-configs/codegen.py              |    110 +-
 lib/i915/perf-configs/guids.xml               |   1909 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |    244 +-
 lib/i915/perf-configs/oa-acmgt1.xml           |  76252 +++++
 lib/i915/perf-configs/oa-acmgt2.xml           | 118222 +++++++
 lib/i915/perf-configs/oa-acmgt3.xml           | 250108 +++++++++++++++
 lib/i915/perf-configs/oa-bdw.xml              |      2 +-
 lib/i915/perf-configs/oa_guid_registry.py     |     15 +-
 .../perf-configs/perf-metricset-codegen.py    |     13 +
 lib/i915/perf-configs/update-guids.py         |     23 +-
 lib/i915/perf.c                               |    332 +-
 lib/i915/perf.h                               |    115 +-
 lib/i915/perf_data_reader.c                   |     29 +-
 lib/meson.build                               |      5 +-
 tests/i915/perf.c                             |    260 +-
 tools/i915-perf/i915_perf_reader.c            |    117 +-
 tools/i915-perf/i915_perf_recorder.c          |    112 +-
 18 files changed, 447626 insertions(+), 252 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-acmgt1.xml
 create mode 100644 lib/i915/perf-configs/oa-acmgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-acmgt3.xml

-- 
2.25.1
