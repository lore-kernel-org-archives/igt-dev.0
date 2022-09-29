Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D84C10E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 08:16:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 13:45:44 +0530
Message-Id: <20220929081547.2424642-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 0/3] Add Negative tests to VRR
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

 tests/intel-ci/fast-feedback.testlist |   4 +
 tests/kms_vrr.c                       | 154 +++++++++++++++++++++++---
 2 files changed, 141 insertions(+), 17 deletions(-)

--
2.37.3
