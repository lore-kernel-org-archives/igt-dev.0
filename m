Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F110E0D8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:50:42 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 23:20:34 +0530
Message-Id: <20230908175039.1291593-1-swati2.sharma@intel.com>
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
 tests/intel/kms_pm_dc.c        | 32 ++++++++++++++------------------
 tests/intel/kms_pm_lpsp.c      |  6 +++---
 3 files changed, 23 insertions(+), 27 deletions(-)

-- 
2.25.1
