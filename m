Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F1E10E886
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:29 +0530
Message-Id: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/8] VDSC YCbCr420 + Fractional BPP
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

In this series, fractional BPP patches are added
on top of VDSC YCbCr420 from
https://patchwork.freedesktop.org/series/110336/
DSC related functions are moved from igt_kms to igt_dsc (new lib file).
kms_dsc_helper file is created to consolidate all the wrapper functions
used in kms_dsc.
Based on the review comments, function parameters are modified so that
they can be resused for PSR2+DSC testcases.

Swati Sharma (8):
  lib/dsc: Move VDSC functions to separate lib file
  Move wrapper functions from kms_dsc to kms_dsc_helper
  lib/dsc: Add helpers for VDSC YCbCr420 debugfs entry
  tests/i915/kms_dsc: Prep work for extending val support for VDSC
    YCbCr420
  tests/i915/kms_dsc: Enable validation for VDSC YCbCr420
  lib/dsc: Add helpers for VDSC Fractional BPP debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC Fractional BPP
  tests/i915/kms_dsc: Add test summary

 lib/igt.h                   |   1 +
 lib/igt_dsc.c               | 284 ++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  28 ++++
 lib/igt_kms.c               | 144 +++---------------
 lib/igt_kms.h               |  16 +-
 lib/meson.build             |   1 +
 tests/i915/kms_dsc.c        | 258 ++++++++++++++------------------
 tests/i915/kms_dsc_helper.c | 204 ++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  43 ++++++
 tests/meson.build           |  10 +-
 10 files changed, 703 insertions(+), 286 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

-- 
2.25.1
