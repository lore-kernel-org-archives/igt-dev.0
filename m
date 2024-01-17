Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F710E091
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 06:39:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 0/2] tests/kms_vrr: Enhance flip accuracy measurement
Date: Wed, 17 Jan 2024 12:03:37 +0530
Message-Id: <20240117063339.3805517-1-bhanuprakash.modem@intel.com>
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

Revise the threshold to allow for a deviation of approximately
(+/-) 1 Hz will improve the accuracy of flip measurements across
a wider range of panel refresh rates.

Bhanuprakash Modem (2):
  tests/kms_vrr: Enhance flip accuracy measurement
  HAX/DO_NOT_MERGE: Test VRR subtests in BAT

 tests/intel-ci/fast-feedback.testlist    |  6 ++++++
 tests/intel-ci/xe-fast-feedback.testlist |  6 ++++++
 tests/kms_vrr.c                          | 27 ++++++++++++++----------
 3 files changed, 28 insertions(+), 11 deletions(-)

--
2.40.0
