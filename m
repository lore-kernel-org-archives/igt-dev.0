Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4D10E5C8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 16:54:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jul 2023 22:23:51 +0530
Message-Id: <20230727165401.926688-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 00/10] DSC Fractional BPP Val Support
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

Swati Sharma (10):
  tests/i915/kms_dsc: add new test flag
  tests/i915/kms_dsc: use uint32_t test flag
  tests/i915/kms_dsc: use #define for default bpc
  tests/i915/kms_dsc: use igt_get_pipe_current_bpc()
  tests/i915/kms_dsc: add test validating output formats with input bpc
  lib/dsc: add helpers for vdsc fractional bpp debugfs entry
  tests/i915/kms_dsc: enable validation for vdsc fractional bpp
  tests/i915/kms_dsc: add test to validate fractional bpp with input bpc
  tests/i915/kms_dsc: add test summary
  HAX: Add dsc tests to fast-feedback.testlist

 lib/igt_dsc.c                         |  84 +++++++++++++++++
 lib/igt_dsc.h                         |   5 +
 tests/i915/kms_dsc.c                  | 131 +++++++++++++++++++++-----
 tests/i915/kms_dsc_helper.c           |  69 ++++++++++++++
 tests/i915/kms_dsc_helper.h           |   4 +
 tests/intel-ci/fast-feedback.testlist |  10 ++
 6 files changed, 278 insertions(+), 25 deletions(-)

-- 
2.25.1
