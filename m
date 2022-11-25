Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDF310E73F
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 11:56:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 17:28:02 +0530
Message-Id: <20221125115808.13394-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] VDSC YCbCr420 + Fractional BPP
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

Swati Sharma (6):
  lib/kms: Add helpers for VDSC YCbCr420 debugfs entry
  tests/i915/kms_dsc: Prep work for extending val support for VDSC
    YCbCr420
  tests/i915/kms_dsc: Enable validation for VDSC YCbCr420
  lib/kms: Add helpers for VDSC Fractional BPP debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC Fractional BPP
  tests/i915/kms_dsc: Add test summary

 lib/igt_kms.c        | 145 ++++++++++++++++++++
 lib/igt_kms.h        |  11 +-
 tests/i915/kms_dsc.c | 312 +++++++++++++++++++++++++++++++++++--------
 3 files changed, 411 insertions(+), 57 deletions(-)

-- 
2.25.1
