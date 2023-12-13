Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6710E6D1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 04:48:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V8 0/7] tests/kms_vrr: Add new subtest to switch RR without
 modeset
Date: Wed, 13 Dec 2023 10:07:34 +0530
Message-Id: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
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
V8: Drop HAX patch

Bhanuprakash Modem (7):
  tests/kms_vrr: Use lib helper to print connector modes
  tests/kms_vrr: Clear VRR before exit
  tests/kms_vrr: Move all config constaints to new function
  tests/kms_vrr: Fix pipe/output combo validity constraint
  tests/kms_vrr: Add new subtest to switch RR without modeset
  tests/kms_vrr: Add new subtest for DRRS without modeset
  tests/kms_vrr: New subtest for toggle VRR during fastsets

 tests/kms_vrr.c | 243 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 201 insertions(+), 42 deletions(-)

--
2.40.0
