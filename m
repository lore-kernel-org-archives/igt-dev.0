Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2110E142
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 18:30:05 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Nov 2022 00:04:31 +0530
Message-Id: <1668537274-6057-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH v4 0/3] e2138d48c2c506816868c16cf3ba64f81bdead41
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

 tests/i915/i915_pm_backlight.c | 207 ++++++++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 63 deletions(-)

-- 
1.9.1
