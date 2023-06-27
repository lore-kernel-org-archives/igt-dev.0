Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4240910E2E2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:21:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:50:21 +0530
Message-Id: <20230627122030.675526-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/9] DSC Fractional BPP Val Support
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

Swati Sharma (9):
  tests/i915/kms_dsc: add new test flag
  tests/i915/kms_dsc: use uint32_t test flag
  tests/i915/kms_dsc: use #define for default bpc
  tests/i915/kms_dsc: add get_status()
  tests/i915/kms_dsc: add subtest
  lib/dsc: add helpers for vdsc fractional bpp debugfs entry
  tests/i915/kms_dsc: enable validation for vdsc fractional bpp
  tests/i915/kms_dsc: add subtest
  tests/i915/kms_dsc: add test summary

 lib/igt_dsc.c               |  84 +++++++++++++++++++++++
 lib/igt_dsc.h               |   5 ++
 tests/i915/kms_dsc.c        | 131 +++++++++++++++++++++++++++++-------
 tests/i915/kms_dsc_helper.c |  60 +++++++++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 5 files changed, 260 insertions(+), 24 deletions(-)

-- 
2.25.1
