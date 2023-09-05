Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679310E2E9
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 16:50:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 22:12:25 +0530
Message-Id: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/5] Enable hang tests for XE
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

Bhanuprakash Modem (5):
  lib/igt_gt: Fix igt_post_hang_ring for XE driver
  tests/kms_vblank: Allow hang tests to run on XE
  tests/kms_flip: Fix testplan documentation for hang tests
  tests/intel-ci/xe.blocklist: Drop hang tests from xe blocklist
  HAX: Add hang tests to xe BAT

 lib/igt_gt.c                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist | 105 ++++++++++++++++++++++-
 tests/intel-ci/xe.blocklist.txt          |   2 -
 tests/kms_flip.c                         |  25 +++++-
 tests/kms_vblank.c                       |   5 +-
 5 files changed, 133 insertions(+), 6 deletions(-)

--
2.40.0
