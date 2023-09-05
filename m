Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4134510E16E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 05:15:25 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 10:50:56 +0530
Message-Id: <20230905052058.2216763-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add GT id to identify failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add GT id to test assertions to identify which gt is causing 
a failure

Riana Tauro (2):
  tests/intel/xe_pm_residency: Add GT id to C6 assertions
  tests/intel/xe_guc_pc: Add GT id to C6 assertions

 tests/intel/xe_guc_pc.c       | 18 ++++++++++++------
 tests/intel/xe_pm_residency.c |  8 ++++----
 2 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.40.0
