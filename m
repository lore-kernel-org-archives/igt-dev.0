Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014CD10E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:31:53 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 15:05:00 +0530
Message-Id: <20230628093504.517988-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Test for gtidle properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

1) Add basic idle residency test that checks the residency within
   a time interval within tolerance

2) Add a test to check if gt is in c6 when idle

Remove rc6 tests from guc_pc and BAT as the above tests are added

TODO: add c0 on exec test

Patch for gtidle properties
https://patchwork.freedesktop.org/series/119262/

Riana Tauro (4):
  tests/xe: Add basic idle residency test
  tests/xe : Add a test to check if gt is in c6 on idle
  tests/xe/xe_guc_pc: Remove rc6 tests
  xe-fast-feedback.testlist: Remove rc6 tests from BAT

 tests/intel-ci/xe-fast-feedback.testlist |   3 +-
 tests/meson.build                        |   1 +
 tests/xe/xe_guc_pc.c                     |  44 --------
 tests/xe/xe_pm_residency.c               | 130 +++++++++++++++++++++++
 4 files changed, 132 insertions(+), 46 deletions(-)
 create mode 100644 tests/xe/xe_pm_residency.c

-- 
2.40.0
