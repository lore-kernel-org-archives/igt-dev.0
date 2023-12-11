Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B89210E399
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 11:48:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Subject: [i-g-t V7 0/8] tests/kms_vrr: Add new subtest to switch RR without
 modeset
Date: Mon, 11 Dec 2023 17:06:42 +0530
Message-Id: <20231211113650.3520399-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add new subtests to
- Toggle the VRR enabled
- Switch between low refresh rate to high refresh rate and vice versa

seamlessly without modeset.

V2: Minor cleanups
V3: Fix few condition checks
V4: Fix Negative subtest
V5: Different tests for VRR & DRRS
V6: Include VRR-fastset as part of this series.
V7: Squash few patches

Bhanuprakash Modem (8):
  tests/kms_vrr: Use lib helper to print connector modes
  tests/kms_vrr: Clear VRR before exit
  tests/kms_vrr: Move all config constaints to new function
  tests/kms_vrr: Fix pipe/output combo validity constraint
  tests/kms_vrr: Add new subtest to switch RR without modeset
  tests/kms_vrr: Add new subtest for DRRS without modeset
  tests/kms_vrr: New subtest for toggle VRR during fastsets
  HAX: DO_NOT_MERGE: test only vrr tests

 tests/intel-ci/fast-feedback.testlist    | 180 +--------------
 tests/intel-ci/xe-fast-feedback.testlist | 267 +----------------------
 tests/kms_vrr.c                          | 243 +++++++++++++++++----
 3 files changed, 213 insertions(+), 477 deletions(-)

--
2.40.0
