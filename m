Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE910E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 07:18:12 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:01:39 +0530
Message-Id: <20231114073144.708242-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 0/5] Add multi-gt support for RC6 residency test
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

Add multi-gt support for the i915_pm_rc6_residency test

Sujaritha Sundaresan (5):
  tests/intel: Add multi-gt support for rc6-idle test
  tests/intel: Add multi-gt support for rc6-fence test
  tests/intel: Add multi-gt support for rc6-accuracy test
  tests/intel: Print drpc info for rc6_residency test
  HAX: Add rc6 residency to fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 161 ++++++++++++++++----------
 2 files changed, 104 insertions(+), 58 deletions(-)

-- 
2.25.1
