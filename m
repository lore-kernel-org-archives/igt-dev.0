Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6FA6E922
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 10:00:52 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Tue, 21 Sep 2021 15:25:15 +0530
Message-Id: <20210921095517.1840418-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/i915/i915_pm_dc: Refactoring
 pwr_dmn_info to debugfs_dump and fix DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, uma.shankar@intel.com, nischal.varide@intel.com, swati2.sharma@intel.com, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Refactoring pwr_dmn_info to debugfs_dump so other test case use for
dumping. disabling the pollling during DC9 test. 
dump the i915_pm_runtime_status debugfs file in case of test
failure. 

Jigar Bhatt (2):
  tests/i915/i915_pm_dc: Refactoring pwr_dmn_info to debugfs_dump
  tests/i915/i915_pm_dc: Fix DC9 test

 tests/i915/i915_pm_dc.c | 45 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

-- 
2.25.1
