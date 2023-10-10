Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4697010E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 05:58:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 11:29:34 +0530
Message-Id: <20231010055940.41997-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 0/6] tests/kms_atomic: Test cleanup and dynamic
 conversion
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
