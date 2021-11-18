Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FBD6EC4B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Nov 2021 11:33:56 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu, 18 Nov 2021 16:47:01 +0530
Message-Id: <20211118111703.9723-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/i915/kms_dsc: Add a new subtest
 to validate 10bpc format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Created new subtest to validate 10 bpc format.

Also optimize logic as below:
Instead of checking the connectors dsc support in
each subtest, check at the starting of the test and
preserve the status to use all over the subtests.

Patnana Venkata Sai (2):
  tests/i915/kms_dsc: Add a new subtest to validate 10bpc format
  HAX: Add kms_dsc tests to fast-feedback

 tests/i915/kms_dsc.c                  | 94 ++++++++++++++++-----------
 tests/intel-ci/fast-feedback.testlist | 70 +-------------------
 2 files changed, 60 insertions(+), 104 deletions(-)

-- 
2.25.1
