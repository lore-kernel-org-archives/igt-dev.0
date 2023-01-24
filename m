Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22BB10E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 06:49:45 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Jan 2023 12:21:47 +0530
Message-Id: <20230124065152.19747-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Enable VDSC output formats validation
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

Swati Sharma (5):
  lib/dsc: Fix return value
  tests/i915/kms_dsc: Add plane_format as struct data_t member
  tests/i915/kms_dsc: Remove pointless struct
  lib/dsc: Add helpers for VDSC output format debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC output formats

 lib/igt_dsc.c               |  61 ++++++++++++++++-
 lib/igt_dsc.h               |   5 ++
 lib/igt_kms.c               |  20 ++++++
 lib/igt_kms.h               |   9 +++
 tests/i915/kms_dsc.c        | 126 ++++++++++++++++++++++++++----------
 tests/i915/kms_dsc_helper.c |  40 +++++++++++-
 tests/i915/kms_dsc_helper.h |   4 ++
 7 files changed, 226 insertions(+), 39 deletions(-)

-- 
2.25.1
