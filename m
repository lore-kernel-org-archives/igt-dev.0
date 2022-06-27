Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3B711ABF5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 18:40:43 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 00:11:36 +0530
Message-Id: <20220627184140.7529-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 PATCH i-g-t 0/4] tests/i915/kms_flip_scaled_crc: New
 tests
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

Add tests covering pixel formats and tiling.
Convert subtest to dynamic subtests.

Also, 2 additional patches are added to validate
NN scaling filter.

Swati Sharma (4):
  tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
  tests/i915/kms_flip_scaled_crc: Add new tests covering modifiers and
    pixel-formats
  lib/igt_kms: Add scaling filter property
  tests/kms_flip_scaled_crc: Validate NN scaling filter

 lib/igt_kms.c                    |  24 ++
 lib/igt_kms.h                    |   3 +
 tests/i915/kms_flip_scaled_crc.c | 423 +++++++++++++++++++++++++------
 3 files changed, 379 insertions(+), 71 deletions(-)

-- 
2.25.1
