Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5372910EA96
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 05:17:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	manasi.d.navare@intel.com
Date: Thu, 24 Feb 2022 10:46:43 +0530
Message-Id: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/5] Add Negative tests to VRR
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

* Dynamic subtests with crtc/connector combinations
* VRR on Non-VRR panel:
	VRR should not be enabled on the Non-VRR panel.
	Hence Kernel should reject the commit.
* Monitor Refresh Rate range:
	Read VRR range capability from EDID and check if
	the Kernel is parsing it correctly.

Bhanuprakash Modem (5):
  tests/kms_vrr: Create dynamic subtests
  lib/igt_edid: Helper to read monitor range from EDID
  tests/kms_vrr: Add Negative tests to validate VRR
  tests/kms_vrr: Add a test for VRR range capability
  HAX: Add VRR negative tests to BAT

 lib/igt_edid.c                        |  24 ++++
 lib/igt_edid.h                        |   2 +
 tests/intel-ci/fast-feedback.testlist |   2 +
 tests/kms_vrr.c                       | 157 +++++++++++++++++++++++---
 4 files changed, 171 insertions(+), 14 deletions(-)

--
2.35.0
