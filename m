Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8D9A7259
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 23:57:04 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 Aug 2022 23:56:34 +0000
Message-Id: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/23] Add DG2 OA test
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (4):
  lib/i915/perf: implement report accumulation for new format
  lib/i915/perf: fixup conversion script for XEHPSDV
  lib/i915/perf: make warning message more helpful
  lib/i915/perf: Add DG2 metrics

Nerlige Ramappa, Umesh (1):
  i915/perf: Limit sseu-config tests for gen11

Umesh Nerlige Ramappa (18):
  i915/perf: Check regularly if we are done reading reports
  i915/perf: Fix OA short_reads test
  i915/perf: Check return value from getparam
  i915/perf: Bump timestamp tolerance for DG1
  i915/perf: Account for OA sampling interval in polling test
  i915/perf: Add support for 64-bit counters
  i915/perf: Define OA report types
  i915/perf: Use ARRAY_SIZE consistently for num_properties
  i915/perf: Use gt in perf tests and lib
  i915/perf: Explicitly state rendercopy needs for a test
  i915/perf: Skip tests that use rendercopy
  i915/perf: Add OA formats for DG2
  i915/perf: Add a test for non-power-of-2 oa reports
  i915/perf: Fix CS timestamp vs OA timstamp mismatch
  i915/perf: Treat ticks as 64 bit
  i915/perf: Treat timestamp as 64 bit value
  i915/perf: Fix DG2 A0 report header
  i915/perf: Wait longer for rc6 residency in DG2

 include/drm-uapi/i915_drm.h                   |   12 +
 lib/i915/perf-configs/guids.xml               |   24 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |   70 +-
 lib/i915/perf-configs/oa-dg2.xml              | 9920 +++++++++++++++++
 .../perf-configs/perf-metricset-codegen.py    |   13 +
 lib/i915/perf-configs/update-guids.py         |    2 +-
 lib/i915/perf.c                               |  104 +-
 lib/meson.build                               |    2 +-
 tests/i915/perf.c                             |  623 +-
 9 files changed, 10589 insertions(+), 181 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-dg2.xml

-- 
2.25.1
