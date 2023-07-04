Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAF510E135
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 13:53:54 +0000 (UTC)
From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 19:25:15 +0530
Message-Id: <20230704135516.1884775-1-venkata.ramana.nayana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] tests/xe/perf_pmu: Tests for the XE
 pmu interface
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

There are set of engine group busyness counters provided by HW which are
exposed via PMU events. Adding a basic unit tests to read those
counters.

v2: Added idle condition checks while reading the counters. (Rahul)

Below is the Xe PMU driver patch for expose events and it's in review.
Verified igt tests with these changes.
https://patchwork.freedesktop.org/series/119504/


./build/tests/xe_perf_pmu --r compute-busy --debug
IGT-Version: 1.27.1-g22009ac9c (x86_64) (Linux: 6.4.0-xe+ x86_64)
Opened device: /dev/dri/card1
(xe_perf_pmu:3946) drmtest-DEBUG: Test requirement passed: !(fd<0)
Starting subtest: compute-busy
(xe_perf_pmu:3946) DEBUG: Test requirement passed: !(!num_placements)
(xe_perf_pmu:3946) DEBUG: Test requirement passed: !(perf_fd < 0 &&
errno == ENODEV)
(xe_perf_pmu:3946) DEBUG: Incrementing counter compute-busy-gt-0
1310720 ns
(xe_perf_pmu:3946) DEBUG: Test requirement passed: !(!num_placements)
(xe_perf_pmu:3946) DEBUG: Test requirement passed: !(perf_fd < 0 &&
errno == ENODEV)
(xe_perf_pmu:3946) DEBUG: Incrementing counter compute-busy-gt-1
1292800 ns
Subtest compute-busy: SUCCESS (0.532s)
(xe_perf_pmu:3946) igt_core-DEBUG: Exiting with status code 0

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>


Venkata Ramana Nayana (1):
  tests/xe/perf_pmu: Tests for the XE pmu interface

 include/drm-uapi/xe_drm.h |  22 +++
 lib/igt_perf.c            |  36 +++++
 lib/igt_perf.h            |   5 +
 tests/meson.build         |   1 +
 tests/xe/xe_perf_pmu.c    | 331 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 395 insertions(+)
 create mode 100644 tests/xe/xe_perf_pmu.c

-- 
2.25.1
