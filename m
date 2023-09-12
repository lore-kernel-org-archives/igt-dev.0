Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1977210E439
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 16:24:11 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 21:52:15 +0530
Message-Id: <20230912162219.1316473-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v9 0/4] DSC Fractional BPP Val Support
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
v8: rebase
v9: rebase

Swati Sharma (4):
  lib/dsc: fix documentation style
  lib/dsc: add helpers for vdsc fractional bpp debugfs entry
  tests/intel/kms_dsc: enable validation for vdsc fractional bpp
  tests/intel/kms_dsc: add test to validate fractional bpp with input
    bpc

 lib/igt_dsc.c                | 123 ++++++++++++++++++++++++++++++++---
 lib/igt_dsc.h                |   6 ++
 tests/intel/kms_dsc.c        |  56 ++++++++++------
 tests/intel/kms_dsc_helper.c |  57 ++++++++++++++++
 tests/intel/kms_dsc_helper.h |   4 ++
 5 files changed, 217 insertions(+), 29 deletions(-)

-- 
2.25.1
