Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274A910E2E0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 17:03:29 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 22:32:42 +0530
Message-Id: <20220421170245.11898-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] RPM Test on HEADLESS
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

Currently RPM test skips on HEADLESS configurations.
This series fixes that issue.

Anshuman Gupta (3):
  test: i915_pm_rpm: init devid in setup_envirnoment
  test: i915_pm_rpm: conditional initialization of igt_display_t
  i915_pm_rpm: rpm resume by user forcewake

 tests/i915/i915_pm_rpm.c | 81 +++++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 18 deletions(-)

-- 
2.26.2
