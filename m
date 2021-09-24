Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4603F6E1CD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 10:08:36 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Fri, 24 Sep 2021 15:33:13 +0530
Message-Id: <20210924100315.1895668-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/i915/i915_pm_dc: Refactoring
 pwr_dmn_info to debugfs_dump and fix DC9-dpms test
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
Cc: jigar.bhatt@intel.com, anshuman.gupta@intel.com, nischal.varide@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Refactoring pwr_dmn_info to debugfs_dump so other test case use for
dumping. disabling the pollling during DC9 test. 
dump the i915_pm_runtime_status debugfs file in case of test
failure. Also adding igt_install_exit_handler(kms_poll_reset) for
resetting the original sysfs status.

Jigar Bhatt (2):
  tests/i915/i915_pm_dc: Refactoring pwr_dmn_info to debugfs_dump
  tests/i915/i915_pm_dc: Fix DC9 test

 tests/i915/i915_pm_dc.c | 60 +++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 17 deletions(-)

-- 
2.25.1
