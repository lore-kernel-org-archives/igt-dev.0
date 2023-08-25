Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61210E5FF
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 05:42:06 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 11:16:56 +0530
Message-Id: <20230825054659.1320824-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Toggle GT C States and validate power
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
Validate power consumed by GPU in GT C6 is lesser than GT C0.

Rev2: Fix cosmetic review comments
      Change exit handler function name

Riana Tauro (3):
  lib/igt_power: Modify igt_power library for xe
  tests/xe: Add a test to toggle GT C states and validate power
  HAX: Add toggle-gt-c6 to xe-fast-feedback.testlist

 lib/igt_power.c                          |  6 ++-
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/xe/xe_pm_residency.c               | 68 ++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.40.0
