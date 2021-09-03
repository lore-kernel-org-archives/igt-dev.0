Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43E6E84F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 07:32:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  3 Sep 2021 13:02:45 +0530
Message-Id: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2 0/6] tests/kms_color: 3D LUT tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Here are some basic tests for 3D LUTs. The kernel support is at [1]
but as the actual use case for this dried up I'm not going to land it
and thus I'm not proposing to land the igt tests either.

I'd like to land the two prep igt patches from this series however so
that it'll be easier to resurrect this in the future if needed. And
rather than posting them separately I figured I'd just post the whole
thing to provide full context for the changes.

[1] git://github.com/vsyrjala/linux.git 3dlut

Bhanuprakash Modem (2):
  tests/kms_color: Initialize lut_size before running the test
  tests/kms_color_chamelium: Initialize lut_size before running the test

Ville Syrjälä (4):
  tests/kms_color: Refactor invalid LUT size tests
  tests/kms_color: Store r/g/b separately for LUT color tests
  lib/kms: Add GAMMA_LUT_3D support
  tests/kms_color: Add GAMMA_LUT_3D tests

 lib/igt_kms.c               |   5 ++
 lib/igt_kms.h               |   2 +
 tests/kms_color.c           | 150 +++++++++++++++++++++++++++++---
 tests/kms_color_chamelium.c |  45 +++++++---
 tests/kms_color_helper.c    | 166 ++++++++++++++++++++++--------------
 tests/kms_color_helper.h    |  20 ++++-
 6 files changed, 301 insertions(+), 87 deletions(-)

--
2.32.0
