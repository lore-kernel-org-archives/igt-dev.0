Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80B76EA4A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 10:18:49 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Feb 2021 15:33:06 +0530
Message-Id: <20210203100310.19441-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/4] PC state igt test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

v2 after removing the powertop usages from igt tests.

Anshuman Gupta (4):
  i915/i915_pm_rpm: Enable PC8+ residency test
  i915/i915_pm_rpm: optimize modeset-pc8-residency-stress test
  i915/i915_pm_rpm: Add PC10 display off test
  i915/i915_pm_rpm: Add PC10 idle display on test

 tests/i915/i915_pm_rpm.c | 100 +++++++++++++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 19 deletions(-)

-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
