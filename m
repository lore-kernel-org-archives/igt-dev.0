Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3210E1B7
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 07:19:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Feb 2023 12:51:15 +0530
Message-Id: <20230202072121.26153-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] Enable VDSC output formats validation
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

This series is split from
https://patchwork.freedesktop.org/series/111342/

Initial dsc lib related changes got merged. Received review
comments on driver debugfs YCBCR420 changes, to make debugfs
entry generic so that all supported output formats can be
validated.

In this series, review comments from above PW are addressed.
Along, with that changes are done to make test generic to
validate all supported dsc formats.

Swati Sharma (6):
  lib/dsc: Fix return value
  tests/i915/kms_dsc: Add plane_format as struct data_t member
  tests/i915/kms_dsc: Remove pointless struct
  tests/i915/kms_dsc: Make bpc_list static
  lib/dsc: Add helpers for VDSC output format debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC output formats

 lib/igt_dsc.c               |  56 +++++++++++++++-
 lib/igt_dsc.h               |   5 ++
 lib/igt_kms.c               |  18 +++++
 lib/igt_kms.h               |   7 ++
 tests/i915/kms_dsc.c        | 128 ++++++++++++++++++++++++++----------
 tests/i915/kms_dsc_helper.c |  40 ++++++++++-
 tests/i915/kms_dsc_helper.h |   4 ++
 7 files changed, 218 insertions(+), 40 deletions(-)

-- 
2.25.1
