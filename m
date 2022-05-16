Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9B110FEBD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 07:47:08 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 13:14:14 +0530
Message-Id: <20220516074417.3097812-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/3] Extend system-suspend-without-i915
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

Add basic-s2idle-without-i915 and basic-s3-without-i915 to test 
s2idle and s3 cycles without i915 module.

These tests will be part of CI fast-feedback test list

Rev2: Add subtests for s2idle and s3 (Anshuman)
Rev3, Rev4 : rebase
Rev5: Optimized test to reduce CI Execution time (Anshuman)
Rev6: Addressed cosmetic review comments

Riana Tauro (3):
  lib/igt_aux: add library function to read current selected state of
    mem_sleep
  tests/i915/i915_suspend: Add s2idle and s3 subtests without i915
  tests/intel-ci/fast-feedback: Add suspend tests without i915 to
    fast-feedback list

 lib/igt_aux.c                         | 52 +++++++++++++++++++++++++++
 lib/igt_aux.h                         | 19 ++++++++++
 tests/i915/i915_suspend.c             | 16 ++++++---
 tests/intel-ci/fast-feedback.testlist |  3 +-
 4 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.25.1
