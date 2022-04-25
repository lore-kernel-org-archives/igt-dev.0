Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D93410E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 12:23:51 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Apr 2022 17:51:45 +0530
Message-Id: <20220425122147.1141783-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Extend system-suspend-without-i915
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Add basic-s2idle-without-i915 and basic-s3-without-i915 to test 
s2idle and s3 cycles without i915 module.

This test will be part of CI fast-feedback test list

Rev2: Add subtests for s2idle and s3 (Anshuman)

Tauro, Riana (2):
  tests/i915/i915_suspend: Add s2idle and s3 subtests without i915
  tests/intel-ci/fast-feedback: Add suspend tests without i915 to
    fast-feedback list

 tests/i915/i915_suspend.c             | 14 +++++++++-----
 tests/intel-ci/fast-feedback.testlist |  3 ++-
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.25.1
