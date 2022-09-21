Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B510E998
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 14:21:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Sep 2022 19:48:13 +0530
Message-Id: <20220921141816.1917715-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/3] Add Negative tests to VRR
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

This Series includes:

* VRR on Non-VRR panel:
	VRR should not be enabled on the Non-VRR panel.
* Monitor Refresh Rate range:
	Read VRR range capability from EDID and check if
	the Kernel is parsing it correctly.

Bhanuprakash Modem (3):
  tests/kms_vrr: Add Negative tests to validate VRR
  tests/kms_vrr: Add a test for VRR range capability
  HAX: Add VRR negative tests to BAT

 tests/intel-ci/fast-feedback.testlist |   3 +
 tests/kms_vrr.c                       | 181 ++++++++++++++++++++++++--
 2 files changed, 176 insertions(+), 8 deletions(-)

--
2.37.3
