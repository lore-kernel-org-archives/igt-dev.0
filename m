Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6104710E0F1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 12:03:08 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Thu, 20 Jul 2023 17:31:44 +0530
Message-Id: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Update code to use xe_sysfs_gt_open
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Tests have been updated to use xe_sysfs_gt_open function.
Updated code to work non privileged user.
Modified documentation.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
  tests/intel-ci: Remove xe_sysfs from blacklist
  xe-fast-feedback.testlist: Add sysfs tests to BAT

 tests/intel-ci/xe-fast-feedback.testlist | 10 +++++++
 tests/intel-ci/xe.blocklist.txt          |  2 --
 tests/xe/xe_sysfs_defaults.c             | 16 +++++++-----
 tests/xe/xe_sysfs_scheduler.c            | 33 +++++++++++++++++-------
 4 files changed, 42 insertions(+), 19 deletions(-)

-- 
2.25.1
