Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0F10E79F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 16:49:10 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 22:20:15 +0530
Message-Id: <20230118165017.32078-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/2] tests/i915/kms_dsc: Reorg
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

Swati Sharma (2):
  lib/dsc: Move VDSC functions to separate lib file
  Move wrapper functions from kms_dsc to kms_dsc_helper

 lib/igt.h                   |   1 +
 lib/igt_dsc.c               | 133 ++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  19 ++++++
 lib/igt_kms.c               | 127 ----------------------------------
 lib/igt_kms.h               |  10 ---
 lib/meson.build             |   1 +
 tests/i915/kms_dsc.c        | 133 +++---------------------------------
 tests/i915/kms_dsc_helper.c |  99 +++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  35 ++++++++++
 tests/meson.build           |   9 ++-
 10 files changed, 305 insertions(+), 262 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

-- 
2.25.1
