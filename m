Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74510F363
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 11:37:46 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 May 2022 17:07:30 +0530
Message-Id: <20220511113734.27776-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] RPM Test on HEADLESS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently RPM Non-Display test skips on HEADLESS configurations.
This series fixes that issue.

Anshuman Gupta (4):
  test: i915_pm_rpm: init devid in setup_envirnoment
  i915_pm_rpm: %s/display_disabled/display_enabled
  test: i915_pm_rpm: conditional initialization of igt_display_t
  i915_pm_rpm: rpm resume by user forcewake

 tests/i915/i915_pm_rpm.c | 112 +++++++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 35 deletions(-)

-- 
2.26.2
