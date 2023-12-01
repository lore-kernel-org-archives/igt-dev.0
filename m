Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691B510E099
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 10:18:59 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 15:37:23 +0530
Message-Id: <20231201100725.8646-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/2] LNL_DC9
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

DC5 counter on disp ver >=14 is not expected to get reset in DC9 state.
Add LNL patform to use runtime_suspended_time value to validate DC9
dpms test.

Mohammed Thasleem (2):
  lib/intel_chipset: Add AT_LEAST_DISPLAY for display version campare
  tests/intel/kms_pm_dc: Add LNL platform for dc9-dpms validation

 lib/intel_chipset.h     | 1 +
 tests/intel/kms_pm_dc.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1
