Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562FF10E6C1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 09:34:52 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 15:04:39 +0530
Message-Id: <20230728093449.950073-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 00/10] DSC Fractional BPP Val Support
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

Swati Sharma (10):
  tests/i915/kms_dsc: add new test flag
  tests/i915/kms_dsc: use uint32_t test flag
  tests/i915/kms_dsc: use #define for default bpc
  tests/i915/kms_dsc: update if conditions
  tests/i915/kms_dsc: use igt_get_pipe_current_bpc()
  tests/i915/kms_dsc: add test validating output formats with input bpc
  tests/i915/kms_dsc: add test summary
  lib/dsc: add helpers for vdsc fractional bpp debugfs entry
  tests/i915/kms_dsc: enable validation for vdsc fractional bpp
  tests/i915/kms_dsc: add test to validate fractional bpp with input bpc

 lib/igt_dsc.c               |  84 +++++++++++++++++++++
 lib/igt_dsc.h               |   5 ++
 tests/i915/kms_dsc.c        | 146 ++++++++++++++++++++++++++++--------
 tests/i915/kms_dsc_helper.c |  73 +++++++++++++++++-
 tests/i915/kms_dsc_helper.h |   6 +-
 5 files changed, 280 insertions(+), 34 deletions(-)

-- 
2.25.1
