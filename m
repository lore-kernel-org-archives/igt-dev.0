Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C0E10E6E0
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 11:55:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Nov 2022 17:27:11 +0530
Message-Id: <20221124115714.31557-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] VDSC YCbCr420
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

Extend validation support for VDSC YCbCr420.

v2: -addressed review comments by Ankit on patch[1][2]

Swati Sharma (3):
  lib/kms: Add helpers for VDSC YCbCr420 debugfs entry
  tests/i915/kms_dsc: Prep work for extending val support for VDSC
    YCbCr420
  tests/i915/kms_dsc: Enable validation for VDSC YCbCr420

 lib/igt_kms.c        |  67 ++++++++++++++
 lib/igt_kms.h        |   7 +-
 tests/i915/kms_dsc.c | 216 ++++++++++++++++++++++++++++++++-----------
 3 files changed, 234 insertions(+), 56 deletions(-)

-- 
2.25.1
