Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6410E2F0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 03:37:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	manasi.d.navare@intel.com
Date: Tue, 22 Feb 2022 09:05:58 +0530
Message-Id: <20220222033601.43925-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/3] Add Negative tests to VRR
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
	Both vrr_min & vrr_max must be zero for Non-VRR panel.

Bhanuprakash Modem (3):
  tests/kms_vrr: Create dynamic subtests
  tests/kms_vrr: Add Negative tests to validate VRR
  HAX: Add VRR negative tests to BAT

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/kms_vrr.c                       | 100 ++++++++++++++++++++++----
 2 files changed, 86 insertions(+), 15 deletions(-)

--
2.35.0
