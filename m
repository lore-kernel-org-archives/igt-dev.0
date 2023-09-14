Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA53910E298
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 14:03:31 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 19:33:56 +0530
Message-Id: <20230914140401.11101-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Add XE support for display PM tests
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

Add XE driver support for kms PM tests.

Swati Sharma (5):
  tests/intel/kms_pm_backlight: Add XE support
  tests/intel/kms_pm_lpsp: Add XE support
  tests/intel/kms_pm_dc: Use linear modifier to set primary plane
  tests/intel/kms_pm_dc: Use gem_has_lmem()
  tests/intel/kms_pm_dc: Add XE support

 tests/intel/kms_pm_backlight.c | 12 ++++++------
 tests/intel/kms_pm_dc.c        | 33 ++++++++++++++-------------------
 tests/intel/kms_pm_lpsp.c      |  6 +++---
 3 files changed, 23 insertions(+), 28 deletions(-)

-- 
2.25.1
