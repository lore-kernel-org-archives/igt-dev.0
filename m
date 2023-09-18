Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914510E1F2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:53:40 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 13:24:05 +0530
Message-Id: <20230918075411.247122-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] tests/kms_atomic: Test cleanup and
 dynamic conversion
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

In this patch series, code rework is done. Also, subtests are
converted to dynamic subtests. Flexibility is added to run subtests
on all valid pipe/output combinations.

Swati Sharma (6):
  tests/kms_atomic: cosmetic changes
  tests/kms_atomic: rename subtest
  tests/kms_atomic: test cleanup
  tests/kms_atomic: convert subtests to dynamic subtests
  tests/kms_atomic: check validity of pipe-output combo
  tests/kms_atomic: add flexibility to run tests on all pipes

 tests/kms_atomic.c | 1070 ++++++++++++++++++++++++--------------------
 1 file changed, 595 insertions(+), 475 deletions(-)

-- 
2.25.1
