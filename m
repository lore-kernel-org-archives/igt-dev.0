Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6D910E566
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 18:17:20 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 23:47:10 +0530
Message-Id: <20230817181713.1114620-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 0/3] DSC Fractional BPP Val Support
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

Existing i-g-t is extended to enable validation for dsc
fractional bpp.
This series is split from
https://patchwork.freedesktop.org/series/111342/

v2: addressed review comments from Ankit
v3: addressed review comments from Ankit
v5: fixed if() conditions and documentation (Ankit)
v6: fixed if() condition, tests were getting executed on non-dsc
    panels (CI)
v7: rebase

7/10 patches merged. 3/10 remaining.

Swati Sharma (3):
  lib/dsc: add helpers for vdsc fractional bpp debugfs entry
  tests/i915/kms_dsc: enable validation for vdsc fractional bpp
  tests/i915/kms_dsc: add test to validate fractional bpp with input bpc

 lib/igt_dsc.c               | 103 ++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |   6 +++
 tests/i915/kms_dsc.c        |  42 ++++++++++++++-
 tests/i915/kms_dsc_helper.c |  57 ++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 5 files changed, 210 insertions(+), 2 deletions(-)

-- 
2.25.1
