Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725EB10E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 09:37:48 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Jul 2023 15:11:18 +0530
Message-Id: <20230714094121.1446298-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] Test for gtidle properties
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

1) Add basic idle residency test that validates residency over
   a time interval is within the tolerance.

2) Add a test to check if gt is in c6 when idle.

Patch for gtidle properties
https://patchwork.freedesktop.org/series/119262/

Rev2: Fix cosmetic review comments
Rev3: Rebase
Rev4: Add changes to accommodate tile sysfs
Rev5: Fix cosmetic review comments

Riana Tauro (3):
  tests/xe: Add basic idle residency test
  tests/xe: Validate GT is in C6 on idle
  xe-fast-feedback.testlist: Add gt-c6-on-idle to BAT

 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/meson.build                        |   1 +
 tests/xe/xe_pm_residency.c               | 123 +++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 tests/xe/xe_pm_residency.c

-- 
2.40.0
