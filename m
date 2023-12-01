Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476BA10E121
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 14:27:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 19:46:56 +0530
Message-Id: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 0/7] tests/kms_vrr: Add new subtest to switch
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

Bhanuprakash Modem (7):
  tests/kms_vrr: Use lib helper to print connector modes
  tests/kms_vrr: Clear VRR before exit
  tests/kms_vrr: Move all config constaints to new function
  tests/kms_vrr: Fix bigjoiner constraint
  tests/kms_vrr: Fix the logic to calculate expected rate
  tests/kms_vrr: Add new subtest to switch RR without modeset
  HAX: DO_NOT_MERGE: test only seamless-rr-switch

 tests/intel-ci/fast-feedback.testlist    | 178 +--------------
 tests/intel-ci/xe-fast-feedback.testlist | 265 +----------------------
 tests/kms_vrr.c                          | 214 ++++++++++++++----
 3 files changed, 184 insertions(+), 473 deletions(-)

--
2.40.0
