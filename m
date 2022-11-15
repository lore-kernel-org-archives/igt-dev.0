Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987410E13D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 12:56:11 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 18:30:47 +0530
Message-Id: <1668517250-4514-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 0/3] Add new subtest and test cleanup
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

 tests/i915/i915_pm_backlight.c | 208 ++++++++++++++++++++++++++++-------------
 1 file changed, 145 insertions(+), 63 deletions(-)

-- 
1.9.1
