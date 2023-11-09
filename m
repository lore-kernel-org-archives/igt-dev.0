Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07FC10E1F7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 09:01:49 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 14:45:06 +0530
Message-Id: <20231109091510.371016-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] [TEST] Testing rc6 residency with multi-gt
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

This is only a test run patch. Kindly do not review.

Sujaritha Sundaresan (4):
  tests/intel: Add multi-gt support for rc6-idle test
  tests/intel: Add multi-gt support for rc6-fence test
  tests/intel: Add multi-gt support for rc6-accuracy test
  HAX: Add rc6 residency test to fast feedback testlist

 tests/intel-ci/fast-feedback.testlist |  2 +
 tests/intel/i915_pm_rc6_residency.c   | 79 +++++++++++++++------------
 2 files changed, 45 insertions(+), 36 deletions(-)

-- 
2.25.1
