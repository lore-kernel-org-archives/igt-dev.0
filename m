Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEA810E400
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 14:23:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 19:52:02 +0530
Message-Id: <20220308142205.275928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 i-g-t 0/3] tests/kms_setmode: Fix stealing test
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

This series will:
* Convert to dynamic subtests.
* Revert the restriction of execution to 2 pipes, since we
  are using dynamic subtests.
* Sort connector modes only if they don't fit into link BW.

Bhanuprakash Modem (3):
  tests/kms_setmode: Use dynamic subtests
  Revert "tests/kms_setmode: Restrict the test execution to two pipes"
  tests/kms_setmode: Sort modes only if they dont fit in link BW

 tests/kms_setmode.c | 201 +++++++++++++++++++++-----------------------
 1 file changed, 94 insertions(+), 107 deletions(-)

--
2.35.1
