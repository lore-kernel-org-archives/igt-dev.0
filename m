Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A1610E1E7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:04:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 19:16:51 +0530
Message-Id: <20231129134657.2826744-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/6] tests/kms_vrr: Add new subtest to switch RR
 without modeset
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

Bhanuprakash Modem (6):
  tests/kms_vrr: Use lib helper to print connector modes
  tests/kms_vrr: Clear VRR before exit
  tests/kms_vrr: Move all config constaints to new function
  tests/kms_vrr: Fix bigjoiner constraint
  tests/kms_vrr: Add new subtest to switch RR without modeset
  HAX: Add seamless-rr-switch subtest to BAT

 tests/intel-ci/fast-feedback.testlist    | 177 +---------------
 tests/intel-ci/xe-fast-feedback.testlist | 258 +----------------------
 tests/kms_vrr.c                          | 222 +++++++++++++++----
 3 files changed, 186 insertions(+), 471 deletions(-)

--
2.40.0
