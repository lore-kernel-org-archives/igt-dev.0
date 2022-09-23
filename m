Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632D710E11A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Sep 2022 19:52:30 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 23 Sep 2022 19:52:07 +0000
Message-Id: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 00/17] Add DG2 OA test
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (4):
  lib/i915/perf: implement report accumulation for new format
  lib/i915/perf: fixup conversion script for XEHPSDV
  lib/i915/perf: make warning message more helpful
  lib/i915/perf: Add DG2 metrics

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

 include/drm-uapi/i915_drm.h                   |   10 +
 lib/i915/perf-configs/guids.xml               |   24 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |   70 +-
 lib/i915/perf-configs/oa-dg2.xml              | 9920 +++++++++++++++++
 .../perf-configs/perf-metricset-codegen.py    |   13 +
 lib/i915/perf-configs/update-guids.py         |    2 +-
 lib/i915/perf.c                               |  104 +-
 lib/meson.build                               |    2 +-
 tests/i915/perf.c                             |  260 +-
 9 files changed, 10316 insertions(+), 89 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-dg2.xml

-- 
2.25.1
