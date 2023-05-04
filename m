Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868B10E41F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 10:29:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 15:54:48 +0530
Message-Id: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/3] Add testplan support for kms tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation & testplan support for kms tests in
XE BAT list.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (3):
  tests/kms: Document kms subtests for XE BAT
  testplan: Add testplan support for kms tests
  scripts/test_list: Ignore non-XE tests for missing documentation

 docs/testplan/meson.build              |   6 +-
 scripts/test_list.py                   |   7 +-
 tests/chamelium/kms_chamelium_edid.c   |  27 +++++
 tests/chamelium/kms_chamelium_frames.c |  22 ++++
 tests/chamelium/kms_chamelium_hpd.c    |  39 +++++++
 tests/i915/kms_psr.c                   |  31 ++++++
 tests/kms_addfb_basic.c                | 147 +++++++++++++++++++++++++
 tests/kms_cursor_legacy.c              |  44 ++++++++
 tests/kms_flip.c                       |  27 +++++
 tests/kms_force_connector_basic.c      |  29 +++++
 tests/kms_pipe_crc_basic.c             |  58 ++++++++++
 tests/kms_prop_blob.c                  |  12 ++
 tests/kms_test_config.json             |  41 +++++++
 13 files changed, 487 insertions(+), 3 deletions(-)
 create mode 100644 tests/kms_test_config.json

--
2.40.0


