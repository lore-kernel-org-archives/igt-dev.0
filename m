Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471E510E855
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 10:57:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 ankit.k.nautiyal@intel.com, karthik.b.s@intel.com
Date: Tue, 28 Mar 2023 16:23:09 +0530
Message-Id: <20230328105313.3727321-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/4] Fix Bigjoiner checks
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

Bhanuprakash Modem (4):
  lib/igt_kms: Fix Bigjoiner checks
  tests/i915/kms_big_joiner: Fix Bigjoiner checks
  tests/i915/kms_dsc: Update bigjoiner pipe constraint
  tests/kms_invalid_mode: Use helpers from IGT lib

 lib/igt_kms.c               | 39 ++++++++++++++++++++--
 lib/igt_kms.h               |  1 +
 tests/i915/kms_big_joiner.c | 66 ++++++++++++++++++++++---------------
 tests/i915/kms_dsc.c        | 17 +++++-----
 tests/i915/kms_dsc_helper.h |  2 --
 tests/kms_invalid_mode.c    | 23 +------------
 6 files changed, 86 insertions(+), 62 deletions(-)

--
2.40.0
