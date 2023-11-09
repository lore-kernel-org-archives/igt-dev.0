Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A810E1B5
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:18:47 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 12:02:07 +0530
Message-Id: <20231109063212.359798-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/5] Add multi-gt support for RC6 residency test
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

Add multi-gt support for the i915_pm_rc6_residency test.

Sujaritha Sundaresan (5):
  tests/intel: Add multi-gt support for rc6-idle test
  tests/intel: Add multi-gt support for rc6-fence test
  tests/intel: Add multi-gt support for rc6-accuracy test
  tests/intel: Print drpc info for rc6_residency test
  HAX: Add rc6 residency to fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist |   4 +
 tests/intel/i915_pm_rc6_residency.c   | 133 ++++++++++++++++----------
 2 files changed, 88 insertions(+), 49 deletions(-)

-- 
2.25.1
