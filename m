Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3286B10E04A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 07:31:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 12:52:44 +0530
Message-Id: <20230911072249.1935228-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 0/5] Add XE suppor for display tests
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

Add IGT support to work kms tests on XE driver.

V2: - Rebase
V3: - Update testlist
V4: - Rebase
V5: - Rebase

Bhanuprakash Modem (5):
  tests/i915/kms_ccs: Add XE support
  tests/i915/kms_fb_coherency: Add XE support
  tests/i915/kms_fbcon_fbt: Add XE support
  tests/kms_prime: Add XE support
  tests/intel-ci/xe: Drop Xe supported tests from blocklist

 tests/intel-ci/xe.blocklist.txt |   2 -
 tests/intel/kms_ccs.c           |  42 +++--
 tests/intel/kms_fb_coherency.c  |  43 +++---
 tests/intel/kms_fbcon_fbt.c     |   2 +-
 tests/kms_prime.c               | 261 +++++++++++++++++++++++++++-----
 5 files changed, 273 insertions(+), 77 deletions(-)

--
2.40.0
