Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A413910E6C6
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 10:26:19 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Aug 2023 16:01:07 +0530
Message-Id: <20230804103111.21214-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Modify igt_pm functions and add GT
 C6 freeze test
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

1) Modify igt_pm d3cold_allowed get/set tests
2) Change i915 suspend and xe pm tests to use the igt_pm
   d3cold_allowed functions
3) Add a test to validate residency across s2idle

Rev2: Add justification for change in commit message
      Skip disabling d3cold_allowed for igfx

Riana Tauro (4):
  lib/igt_device: Add a function to get the pci slot name
  lib/igt_pm: change d3cold_allowed function parameters
  tests/xe: use igt_pm library functions
  tests/xe: Add a test that validates residency during s2idle

 lib/igt_device.c           | 20 ++++++++++++++
 lib/igt_device.h           |  1 +
 lib/igt_pm.c               | 22 +++++++--------
 lib/igt_pm.h               |  4 +--
 tests/i915/i915_suspend.c  |  8 +++---
 tests/xe/xe_pm.c           | 43 +++++------------------------
 tests/xe/xe_pm_residency.c | 56 ++++++++++++++++++++++++++++++++++----
 7 files changed, 96 insertions(+), 58 deletions(-)

-- 
2.40.0
