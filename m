Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EC16E8AF
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:15:36 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:15:26 +0300
Message-Id: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] tests/kms_color: 3D LUT tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Updated set of 3D LUT tests and associated refactoring/fixes.

Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>

Ville Syrjälä (6):
  tests/kms_color: Refactor invalid LUT size tests
  tests/kms_color: Store r/g/b separately for LUT color tests
  tests/kms_color: Pass pipe to invalid LUT size tests
  tests/kms_color: Run each subtest only for a single connector
  lib/kms: Add GAMMA_LUT_3D support
  tests/kms_color: Add GAMMA_LUT_3D tests

 lib/igt_kms.c            |   5 +
 lib/igt_kms.h            |   2 +
 tests/kms_color.c        | 782 ++++++++++++++++++++++-----------------
 tests/kms_color_helper.c | 181 +++++----
 tests/kms_color_helper.h |  27 +-
 5 files changed, 587 insertions(+), 410 deletions(-)

-- 
2.31.1
