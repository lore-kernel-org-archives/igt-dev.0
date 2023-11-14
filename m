Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1AC10E1B8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 04:38:52 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 10:22:18 +0530
Message-Id: <20231114045224.622841-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/6] Add multi-gt support for RC6 residency test
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

Bhanuprakash Modem (1):
  Revert "syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, |
    WAIT_AVAILABLE"

Sujaritha Sundaresan (5):
  tests/intel: Add multi-gt support for rc6-idle test
  tests/intel: Add multi-gt support for rc6-fence test
  tests/intel: Add multi-gt support for rc6-accuracy test
  tests/intel: Print drpc info for rc6_residency test
  HAX: Add rc6 residency to fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 158 ++++++++++++++++----------
 tests/syncobj_timeline.c              |   4 +-
 3 files changed, 104 insertions(+), 59 deletions(-)

-- 
2.25.1
