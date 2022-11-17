Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0610E0C0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 11:40:21 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Nov 2022 17:14:55 +0530
Message-Id: <1668685498-10679-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH v5 0/3] Add new subtest and test cleanup
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

Add new subtest to validate dual panel backlight,
create structure for subtests and convert exixting
subtests to dynamic subtests for better reporting.

Nidhi Gupta (3):
  tests/i915/i915_pm_backlight: Add new subtest to validate dual panel
    backlight
  tests/i915/i915_pm_backlight: Add a common structure for all subtests
  tests/i915/i915_pm_backlight: Create dynamic subtests

 tests/i915/i915_pm_backlight.c | 205 ++++++++++++++++++++++++++++-------------
 1 file changed, 142 insertions(+), 63 deletions(-)

-- 
1.9.1
