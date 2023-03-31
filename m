Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F246510F101
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 06:54:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Fri, 31 Mar 2023 12:20:22 +0530
Message-Id: <20230331065029.3869109-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 0/7] Fix Bigjoiner checks
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

Bhanuprakash Modem (7):
  lib/igt_kms: Fix Bigjoiner checks
  tests/i915/kms_big_joiner: Fix Bigjoiner checks
  tests/i915/kms_dsc: Update bigjoiner pipe constraint
  tests/i915/kms_dsc: Drop bigjoiner check
  tests/kms_invalid_mode: Use helpers from IGT lib
  tests/kms_flip: Fix Bigjoiner checks
  tests/kms_setmode: Fix Bigjoiner checks

 lib/igt_kms.c               | 56 ++++++++++++++++++++++++++++---
 lib/igt_kms.h               |  2 ++
 tests/i915/kms_big_joiner.c | 67 +++++++++++++++++++++----------------
 tests/i915/kms_dsc.c        | 25 ++++++--------
 tests/i915/kms_dsc_helper.h |  2 --
 tests/kms_flip.c            | 12 +++----
 tests/kms_invalid_mode.c    | 23 +------------
 tests/kms_setmode.c         | 15 +++++----
 8 files changed, 119 insertions(+), 83 deletions(-)

--
2.40.0
