Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FD510E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 07:52:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	vidya.srinivas@intel.com
Date: Mon,  4 Dec 2023 13:11:02 +0530
Message-Id: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 0/9] tests/kms_vrr: Add new subtest to switch
 RR without modeset
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

Add new subtest to switch between low refresh rate to high
refresh rate and vice versa seamlessly without modeset.

V2: Minor cleanups
V3: Fix few condition checks
V4: Fix Negative subtest
V5: Different tests for VRR & DRRS

Bhanuprakash Modem (9):
  tests/kms_vrr: Use lib helper to print connector modes
  tests/kms_vrr: Clear VRR before exit
  tests/kms_vrr: Move all config constaints to new function
  tests/kms_vrr: Fix bigjoiner constraint
  tests/kms_vrr: Fix the logic to calculate expected rate
  tests/kms_vrr: Add a helper to get the low refresh mode
  tests/kms_vrr: Add new subtest to switch RR without modeset
  tests/kms_vrr: Add new subtest for DRRS without modeset
  HAX: DO_NOT_MERGE: test only seamless-rr-switch

 tests/intel-ci/fast-feedback.testlist    | 179 +--------------
 tests/intel-ci/xe-fast-feedback.testlist | 266 +----------------------
 tests/kms_vrr.c                          | 223 +++++++++++++++----
 3 files changed, 195 insertions(+), 473 deletions(-)

--
2.40.0
