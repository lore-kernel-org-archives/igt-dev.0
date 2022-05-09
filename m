Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB88D10E750
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 07:29:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 12:56:31 +0530
Message-Id: <20220509072637.3291112-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/6] Convert subtests to dynamic
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
  tests/kms_pipe_crc_basic: Create dynamic subtests
  tests/kms_cursor_legacy: Create dynamic subtests
  tests/kms_cursor_edge_walk: Create dynamic subtests
  tests/kms_cursor_crc: Create dynamic subtests
  tests/kms_color: Create dynamic subtests
  tests/intel-ci: Rename tests in BAT

 tests/intel-ci/fast-feedback.testlist |  33 +-
 tests/kms_color.c                     | 534 ++++++++++++++------------
 tests/kms_color_helper.h              |   1 +
 tests/kms_cursor_crc.c                | 162 +++++---
 tests/kms_cursor_edge_walk.c          |  66 ++--
 tests/kms_cursor_legacy.c             | 254 ++++++------
 tests/kms_pipe_crc_basic.c            | 111 +++---
 7 files changed, 639 insertions(+), 522 deletions(-)

--
2.35.1
