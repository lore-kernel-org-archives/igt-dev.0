Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72E10E1C5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 06:44:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Jan 2023 12:16:54 +0530
Message-Id: <20230103064658.27655-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Test cleanup and dynamic conversion
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

This series addresses review comments from
https://patchwork.freedesktop.org/series/109648/

Swati Sharma (4):
  tests/kms_atomic: Cosmetic changes
  tests/kms_atomic: Test cleanup
  tests/kms_atomic: Convert tests to dynamic
  tests/kms_atomic: Add flexibility to run tests on all pipes

 tests/kms_atomic.c | 1031 ++++++++++++++++++++++++--------------------
 1 file changed, 562 insertions(+), 469 deletions(-)

-- 
2.25.1
