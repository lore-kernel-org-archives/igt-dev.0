Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9488B10E03F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:07 +0000
Message-Id: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/28] Second part of DG2 OA tests
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

Add tests for changes in perf OA for DG2.This is part 2 of "Add DG2 OA test"

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

v6:
- ACM metrics patch message size is large and gets dropped by the email
  server. Break the patch into smaller chunks.

v7:
- Posting part 2 of DG2 IGT OA series

v8:
- Enable sseu-config tests back for gfx12
- Drop patch for rc6-disable as the failure is not seen on DG2 anymore

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (15):
  lib/i915/perf: implement report accumulation for new format
  tools/i915-perf-recorder: add ability to select device
  lib/i915/perf: fixup report validity
  lib/i915/perf: add a helper to read timestamps
  lib/i915/perf: store bit shifting required for OA timestamps
  lib/i915/perf: indentation fix
  tools/i915-perf-recorder: capture OA & CS frequencies
  tools/i915-perf: make timestamp range easier to compare
  tools/i915-perf: printout CPU clock used
  tools/i915-perf: record remaining perf data on exit
  lib/i915/perf: add a raw timestamp utility
  lib/i915/perf: add helper function to get report reason
  tools/i915-perf: add option to printout reports data
  lib/i915: add new ACM/DG2 format in codegen
  lib/i915/perf: configure OA timestamp shift and mask for ACM

Umesh Nerlige Ramappa (13):
  lib/i915/perf-config: Bump up the soversion
  i915/perf: Check regularly if we are done reading reports
  i915/perf: Fix OA short_reads test
  i915/perf: Check return value from getparam
  i915/perf: Skip sseu-config tests for gfx12.50+
  i915/perf: Account for OA sampling interval in polling test
  i915/perf: Define OA report types and fix oa-formats test
  i915/perf: Use ARRAY_SIZE consistently for num_properties
  i915/perf: Use gt in perf tests and lib
  i915/perf: Explicitly state rendercopy needs for a test
  i915/perf: Skip tests that use rendercopy
  i915/perf: Add OA formats for DG2
  i915/perf: Fix CS timestamp vs OA timstamp mismatch

 include/drm-uapi/i915_drm.h                   |  10 +
 .../perf-configs/perf-metricset-codegen.py    |  13 +
 lib/i915/perf.c                               | 232 ++++++++++++++--
 lib/i915/perf.h                               |  29 +-
 lib/i915/perf_data_reader.c                   |  29 +-
 lib/meson.build                               |   4 +-
 tests/i915/perf.c                             | 251 ++++++++++++++----
 tools/i915-perf/i915_perf_reader.c            | 117 ++++++--
 tools/i915-perf/i915_perf_recorder.c          | 112 +++++++-
 9 files changed, 662 insertions(+), 135 deletions(-)

-- 
2.25.1
