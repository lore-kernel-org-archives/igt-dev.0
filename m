Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20810E594
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 08:16:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 13:38:34 +0530
Message-Id: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 0/6] Enable hang tests for XE
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

Enable KMS hang tests on XE driver.

V2: - Fix igt_post_hang_ring() for XE
V3: - Fix kms_flip

Bhanuprakash Modem (6):
  lib/igt_gt: Fix igt_post_hang_ring for XE driver
  tests/kms_vblank: Allow hang tests to run on XE
  tests/kms_flip: Allow hang tests to run on XE
  tests/kms_flip: Fix testplan documentation for hang tests
  tests/intel-ci/xe.blocklist: Drop hang tests from xe blocklist
  HAX: Add hang tests to xe BAT

 lib/igt_gt.c                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist | 221 +++--------------------
 tests/intel-ci/xe.blocklist.txt          |   2 -
 tests/kms_flip.c                         |  40 +++-
 tests/kms_vblank.c                       |   5 +-
 5 files changed, 68 insertions(+), 202 deletions(-)

--
2.40.0
