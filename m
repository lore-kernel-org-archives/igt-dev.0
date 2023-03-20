Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456C010E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 10:04:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 20 Mar 2023 15:30:12 +0530
Message-Id: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/5] Enable ADDFB tests for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, mchehab@kernel.org, jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add IGT support to enable ADDFB tests to XE BAT.

Bhanuprakash Modem (5):
  lib/xe/xe_ioctl: Add a helper to map the buffer
  lib/igt_fb: Add support for allocating buffers for XE
  tests/kms_addfb_basic: Add XE support
  tests/kms_force_connector_basic: Add XE support
  xe-fast-feedback: Add basic kms tests to XE BAT

 lib/igt_fb.c                             | 16 +++++++--
 lib/xe/xe_ioctl.c                        | 14 ++++++--
 lib/xe/xe_ioctl.h                        |  1 +
 tests/intel-ci/xe-fast-feedback.testlist | 30 +++++++++++++++++
 tests/kms_addfb_basic.c                  | 42 ++++++++++++++++--------
 tests/kms_force_connector_basic.c        |  4 ++-
 6 files changed, 87 insertions(+), 20 deletions(-)

--
2.40.0


