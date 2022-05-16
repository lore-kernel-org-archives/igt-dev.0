Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F118510E0D7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 14:09:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 19:36:06 +0530
Message-Id: <20220516140617.3428438-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 00/11] tests/kms: IGT test cleanup
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

In below tests, convert all possible subtests to dynamic and
sanitize the system statte before starting/exiting the subtest.
This series will also rename the tests in BAT with updated ones.

Effected files:
 * tests/kms_pipe_crc_basic.c
 * tests/kms_cursor_legacy.c
 * tests/kms_cursor_edge_walk.c
 * tests/kms_cursor_crc.c
 * tests/kms_color.c
 * tests/kms_dither.c

Bhanuprakash Modem (11):
  tests/kms_pipe_crc_basic: Convert tests to dynamic
  tests/kms_pipe_crc_basic: Test Cleanup
  tests/kms_cursor_legacy: Convert tests to dynamic
  tests/kms_cursor_legacy: Test Cleanup
  tests/kms_cursor_edge_walk: Convert tests to dynamic
  tests/kms_cursor_crc: Convert tests to dynamic
  tests/kms_cursor_crc: Test Cleanup
  tests/kms_color: Convert tests to dynamic
  tests/kms_color: Test Cleanup
  tests/kms_dither: Rename dynamic tests
  tests/intel-ci: Rename tests in BAT

 tests/intel-ci/fast-feedback.testlist |  30 +-
 tests/kms_color.c                     | 544 ++++++++++++++------------
 tests/kms_color_helper.h              |   1 +
 tests/kms_cursor_crc.c                | 222 +++++++----
 tests/kms_cursor_edge_walk.c          |  63 ++-
 tests/kms_cursor_legacy.c             | 332 ++++++++++------
 tests/kms_dither.c                    |   3 +-
 tests/kms_pipe_crc_basic.c            | 162 +++++---
 8 files changed, 764 insertions(+), 593 deletions(-)

--
2.35.1
