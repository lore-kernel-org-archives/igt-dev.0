Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41A610E5CC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 12:06:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 17:32:34 +0530
Message-Id: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 00/11] tests/kms: IGT test cleanup
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
 tests/kms_color.c                     | 546 ++++++++++++++------------
 tests/kms_color_helper.h              |   1 +
 tests/kms_cursor_crc.c                | 222 +++++++----
 tests/kms_cursor_edge_walk.c          |  63 ++-
 tests/kms_cursor_legacy.c             | 406 ++++++++++++-------
 tests/kms_dither.c                    |   3 +-
 tests/kms_pipe_crc_basic.c            | 162 +++++---
 8 files changed, 824 insertions(+), 609 deletions(-)

--
2.35.1
