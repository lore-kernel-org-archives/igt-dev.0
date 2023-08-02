Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352010E522
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 08:40:40 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Wed,  2 Aug 2023 14:08:56 +0530
Message-Id: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4 Update code to use xe_sysfs_gt_open
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

v2: Split updated tests patch into 2 patches
1 with only to use xe_sysfs_gt_open and other
to update documentation, non privileged user.(Tejas)

v3: Updated code to check when root user try to set value beyond
local min/max scheduler property.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (4):
  xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
  xe/xe_sysfs: Modified code to work for non priv user
  xe-fast-feedback.testlist: Add sysfs tests to BAT
  tests/intel-ci: Remove xe_sysfs from blacklist

 tests/intel-ci/xe-fast-feedback.testlist | 10 ++++++++
 tests/intel-ci/xe.blocklist.txt          |  2 --
 tests/xe/xe_sysfs_defaults.c             | 16 ++++++------
 tests/xe/xe_sysfs_scheduler.c            | 31 +++++++++++++++++-------
 4 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.25.1
