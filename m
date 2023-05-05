Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD6610E5BD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 10:36:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  5 May 2023 16:01:17 +0530
Message-Id: <20230505103119.3309148-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/2] Add testplan support for kms tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation & testplan support for kms tests in
XE BAT list.

V2: - Cleanup
    - Drop hax

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (2):
  tests/kms: Document kms subtests for XE BAT
  testplan: Add testplan support for kms tests

 docs/testplan/meson.build              |   6 +-
 tests/chamelium/kms_chamelium_edid.c   |  27 +++++
 tests/chamelium/kms_chamelium_frames.c |  22 ++++
 tests/chamelium/kms_chamelium_hpd.c    |  39 +++++++
 tests/i915/kms_psr.c                   |  31 ++++++
 tests/kms_addfb_basic.c                | 138 +++++++++++++++++++++++++
 tests/kms_cursor_legacy.c              |  40 +++++++
 tests/kms_flip.c                       |  27 +++++
 tests/kms_force_connector_basic.c      |  29 ++++++
 tests/kms_pipe_crc_basic.c             |  58 +++++++++++
 tests/kms_prop_blob.c                  |  12 +++
 tests/kms_test_config.json             |  36 +++++++
 12 files changed, 463 insertions(+), 2 deletions(-)
 create mode 100644 tests/kms_test_config.json

--
2.40.0


