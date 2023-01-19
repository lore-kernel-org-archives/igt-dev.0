Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271810E8F0
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 09:23:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Jan 2023 14:55:26 +0530
Message-Id: <20230119092530.3780-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/4] tests/i915/kms_dsc: Reorg
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

In this patch series, helper functions for kms_dsc
are introuduced which will reduce code duplication
while creating dsc concurrent tests (eg: PSR)

This is split from https://patchwork.freedesktop.org/series/111342/
since YCBCR420 DSC required driver+igt changes.

Also, few other trivial changes are done.

Swati Sharma (4):
  lib/dsc: Move VDSC functions to separate lib file
  Move wrapper functions from kms_dsc to kms_dsc_helper
  tests/i915/kms_dsc: Add disp_ver as struct data_t member
  tests/i915/kms_dsc_helper: Improve format string

 lib/igt.h                   |   1 +
 lib/igt_dsc.c               | 133 ++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  19 +++++
 lib/igt_kms.c               | 127 ---------------------------------
 lib/igt_kms.h               |  10 ---
 lib/meson.build             |   1 +
 tests/i915/kms_dsc.c        | 137 ++++--------------------------------
 tests/i915/kms_dsc_helper.c |  99 ++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  35 +++++++++
 tests/meson.build           |   9 ++-
 10 files changed, 308 insertions(+), 263 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

-- 
2.25.1
