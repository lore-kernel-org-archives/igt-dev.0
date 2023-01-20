Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1590810E0F9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:39:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 23:11:14 +0530
Message-Id: <20230120174119.3937-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] tests/i915/kms_dsc: Reorg + Fix
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

Adding fix to the original series for testing.
Series was reverted since it broke gitlab pipeline.

Kamil Konieczny (1):
  lib/igt_fb: add missing include in header

Swati Sharma (4):
  lib/dsc: Move VDSC functions to separate lib file
  Move wrapper functions from kms_dsc to kms_dsc_helper
  tests/i915/kms_dsc: Add disp_ver as struct data_t member
  tests/i915/kms_dsc_helper: Improve format string

 lib/igt.h                   |   1 +
 lib/igt_dsc.c               | 133 ++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  19 +++++
 lib/igt_fb.h                |   1 +
 lib/igt_kms.c               | 127 ---------------------------------
 lib/igt_kms.h               |  10 ---
 lib/meson.build             |   1 +
 tests/i915/kms_dsc.c        | 137 ++++--------------------------------
 tests/i915/kms_dsc_helper.c |  99 ++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  35 +++++++++
 tests/meson.build           |   9 ++-
 11 files changed, 309 insertions(+), 263 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

-- 
2.25.1
