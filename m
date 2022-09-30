Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5210E169
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 11:59:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 17:29:10 +0530
Message-Id: <20220930115913.2640024-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 0/3] Add Negative tests to VRR
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
 tests/kms_vrr.c                       | 152 +++++++++++++++++++++++---
 2 files changed, 138 insertions(+), 18 deletions(-)

--
2.37.3
