Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41F610E027
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 18:15:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 23:46:36 +0530
Message-Id: <20221031181639.15046-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] VDSC YCbCr420
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

Swati Sharma (3):
  lib/kms: Add helpers for VDSC YCbCr420 debugfs entry
  tests/i915/kms_dsc: Prep work for extending val support for VDSC
    YCbCr420
  tests/i915/kms_dsc: Enable validation for VDSC YCbCr420

 lib/igt_kms.c        |  67 +++++++++++++
 lib/igt_kms.h        |   7 +-
 tests/i915/kms_dsc.c | 219 ++++++++++++++++++++++++++++++++-----------
 3 files changed, 237 insertions(+), 56 deletions(-)

-- 
2.25.1
