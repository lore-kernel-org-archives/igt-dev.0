Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EC610E1C9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:26:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 20:58:23 +0530
Message-Id: <20230109152832.3310-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] VDSC YCbCr420 + Fractional BPP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In this series, fractional BPP patches are added
on top of VDSC YCbCr420 from
https://patchwork.freedesktop.org/series/110336/
Here, on top of previous changes dsc related functions
are moved from igt_kms to igt_dsc.
Also, kms_dsc_helper file is created to consolidate all
the wrapper functions used in kms_dsc.

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
 lib/igt_dsc.c               | 302 +++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  46 +++++
 lib/igt_kms.c               | 144 ++--------------
 lib/igt_kms.h               |  16 +-
 lib/meson.build             |   1 +
 tests/i915/kms_dsc.c        | 323 ++++++++++++++++--------------------
 tests/i915/kms_dsc_helper.c | 246 +++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  74 +++++++++
 tests/meson.build           |  10 +-
 10 files changed, 842 insertions(+), 321 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

-- 
2.25.1
