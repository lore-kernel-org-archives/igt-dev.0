Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B511010E26A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 07:56:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 13:24:58 +0530
Message-Id: <20221114075500.90281-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Add Negative tests to VRR
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

Bhanuprakash Modem (2):
  tests/kms_vrr: Add Negative tests to validate VRR
  HAX: Add VRR negative tests to BAT

 tests/intel-ci/fast-feedback.testlist |  3 ++
 tests/kms_vrr.c                       | 70 ++++++++++++++++++++-------
 2 files changed, 55 insertions(+), 18 deletions(-)

--
2.38.0
