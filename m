Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6E10E1B7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:01:48 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 11:39:24 +0530
Message-Id: <20231109060931.1347354-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] extend kms_psr test to validate pr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Panel Replay behaves same as PSR for DP connector,
modify kms_psr test to validate pr feature as well

Kunal Joshi (7):
  lib/igt_psr: added enum for panel replay
  lib/igt_psr: modified psr_sink_support for pr compatability
  lib/igt_psr: modified psr_active_check for pr compatability
  lib/igt_psr: modified psr_set for pr compatability
  lib/igt_psr: modified psr_get_mode for pr compatability
  tests/intel/kms_psr: made test compaitable with pr
  HAX PATCH DO NOT MERGE

 lib/igt_psr.c                          |  90 ++++--
 lib/igt_psr.h                          |  11 +-
 tests/intel-ci/fast-feedback.testlist  |  65 ++++
 tests/intel/kms_dirtyfb.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c            |   8 +-
 tests/intel/kms_frontbuffer_tracking.c |   6 +-
 tests/intel/kms_pm_dc.c                |  15 +-
 tests/intel/kms_psr.c                  | 393 ++++++++++++++++++-------
 tests/intel/kms_psr2_sf.c              |  13 +-
 tests/intel/kms_psr2_su.c              |   7 +-
 tests/intel/kms_psr_stress_test.c      |   4 +-
 tests/kms_feature_discovery.c          |   4 +-
 12 files changed, 461 insertions(+), 159 deletions(-)

-- 
2.25.1
