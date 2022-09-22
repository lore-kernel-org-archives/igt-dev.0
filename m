Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17210E061
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:14:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:41:34 +0530
Message-Id: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/8] Revert Color patches
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

As we are suspecting dynamic subtests are causing regression,
revert all the way back to before the dynamic subtest conversion.

Bhanuprakash Modem (8):
  Revert "tests/kms_color: fix crc assert condition"
  Revert "tests/kms: Fix to use max_bpc constraint helper"
  Revert "tests/kms_color: Fix multiple failures in deep-color tests"
  Revert "tests/kms_color: Fix memory leaks"
  Revert "tests/kms_color: Test Cleanup"
  Revert "tests/kms_color: Convert tests to dynamic"
  Revert "tests/kms_color_chamelium: Convert tests to dynamic"
  tests/kms_color: Fix crc compare check in CTM tests

 tests/chamelium/kms_color_chamelium.c | 1034 +++++++++++++------------
 tests/kms_color.c                     |  665 ++++++++--------
 tests/kms_color_helper.h              |    2 -
 tests/kms_dither.c                    |   25 +-
 tests/kms_hdr.c                       |   44 +-
 5 files changed, 908 insertions(+), 862 deletions(-)

--
2.37.3
