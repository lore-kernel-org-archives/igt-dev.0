Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256946EB19
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:24:36 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Wed, 24 Nov 2021 20:37:57 +0530
Message-Id: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/i915/kms_dsc: Add a new subtest
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

This series contain new subtest addition
improvement in dsc check.

Patnana Venkata Sai (3):
  tests/i915/kms_dsc: Add a new subtest to validate 10bpc format
  tests/i915/kms_dsc: optimiz logic for dsc checks
  HAX: Add kms_dsc tests to fast-feedback

 tests/i915/kms_dsc.c                  |  94 +++++++++++-------
 tests/intel-ci/fast-feedback.testlist | 134 +-------------------------
 2 files changed, 60 insertions(+), 168 deletions(-)

-- 
2.25.1
