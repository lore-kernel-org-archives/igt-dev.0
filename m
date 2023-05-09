Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7610E31F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 05:43:06 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 11:12:18 +0530
Message-Id: <20230509054221.162805-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] DSC Fractional BPP Val Support
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

Swati Sharma (3):
  lib/dsc: Add helpers for VDSC Fractional BPP debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC Fractional BPP
  tests/i915/kms_dsc: Add test summary

 lib/igt_dsc.c               | 84 +++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h               |  5 +++
 tests/i915/kms_dsc.c        | 40 ++++++++++++++++++
 tests/i915/kms_dsc_helper.c | 60 ++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  4 ++
 5 files changed, 193 insertions(+)

-- 
2.25.1
