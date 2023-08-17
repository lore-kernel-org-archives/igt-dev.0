Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC26F10E3F6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 05:47:48 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:22:58 +0530
Message-Id: <20230817055301.855960-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Toggle GT C States and validate power
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

Add a test that toggles GT C States by acquiring/releasing forcewake.
validate power consumed by GPU in GT C6 is lesser than GT C0.

Riana Tauro (3):
  lib/igt_power: Modify igt_power library for xe
  tests/xe: Add a test to toggle GT C states and validates power
  HAX: Add toggle-gt-c6 to xe-fast-feedback.testlist

 lib/igt_power.c                          |  5 +-
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/xe/xe_pm_residency.c               | 67 ++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.40.0
