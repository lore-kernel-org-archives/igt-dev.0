Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBAE10F216
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 08:04:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 May 2022 13:31:57 +0530
Message-Id: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/6] Convert subtests to dynamic
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

In below tests, convert all possible subtests to dynamic. This series
will also rename the tests in BAT with updated ones.

Effected files:
 * tests/kms_pipe_crc_basic.c
 * tests/kms_cursor_legacy.c
 * tests/kms_cursor_edge_walk.c
 * tests/kms_cursor_crc.c
 * tests/kms_color.c

Bhanuprakash Modem (6):
  tests/kms_pipe_crc_basic: Convert tests to dynamic
  tests/kms_cursor_legacy: Convert tests to dynamic
  tests/kms_cursor_edge_walk: Convert tests to dynamic
  tests/kms_cursor_crc: Convert tests to dynamic
  tests/kms_color: Convert tests to dynamic
  tests/intel-ci: Rename tests in BAT

 tests/intel-ci/fast-feedback.testlist |  30 +-
 tests/kms_color.c                     | 533 ++++++++++++++------------
 tests/kms_color_helper.h              |   1 +
 tests/kms_cursor_crc.c                | 192 ++++++----
 tests/kms_cursor_edge_walk.c          |  62 ++-
 tests/kms_cursor_legacy.c             | 254 ++++++------
 tests/kms_pipe_crc_basic.c            | 111 +++---
 7 files changed, 640 insertions(+), 543 deletions(-)

--
2.35.1
