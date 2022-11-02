Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1514410E008
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 04:38:32 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Nov 2022 10:08:12 +0530
Message-Id: <20221102043814.3821683-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add a basic hwmon testcase
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a new testcase to verify the hwmon directory in dgfx

Rev2 : Add the test to fast-feedback
       Addressed cosmetic review comments

Riana Tauro (2):
  tests/debugfs_test: Add basic-hwmon test
  tests/intel-ci/fast-feedback: Add basic-hwmon test to BAT

 tests/debugfs_test.c                  | 14 ++++++++++++--
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.25.1
