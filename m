Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0B610E1A7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Apr 2023 13:57:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Apr 2023 19:23:13 +0530
Message-Id: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 0/6] Fix Bigjoiner checks
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

Bigjoiner will come in the picture when the resolution > 5K or
clock > max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

Bhanuprakash Modem (6):
  lib/igt_kms: Fix Bigjoiner checks
  tests/i915/kms_big_joiner: Fix Bigjoiner checks
  tests/i915/kms_dsc: Update bigjoiner pipe constraint
  tests/kms_invalid_mode: Use helpers from IGT lib
  tests/kms_flip: Fix Bigjoiner checks
  tests/kms_setmode: Fix Bigjoiner checks

 lib/igt_kms.c               | 71 ++++++++++++++++++++++++++++++--
 lib/igt_kms.h               |  2 +
 tests/i915/kms_big_joiner.c | 80 ++++++++++++++++++++++---------------
 tests/i915/kms_dsc.c        | 30 +++++++-------
 tests/i915/kms_dsc_helper.h |  2 -
 tests/kms_flip.c            | 12 +++---
 tests/kms_invalid_mode.c    | 38 +-----------------
 tests/kms_setmode.c         | 15 ++++---
 8 files changed, 148 insertions(+), 102 deletions(-)

--
2.40.0
