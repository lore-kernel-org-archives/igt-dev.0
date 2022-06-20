Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06A710E0E6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 16:25:47 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Jun 2022 21:56:38 +0530
Message-Id: <20220620162640.10530-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 PATCH i-g-t 0/2] tests/i915/kms_flip_scaled_crc: New
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
Convert subtest to dynamic subtest.

Swati Sharma (2):
  tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
  tests/i915/kms_flip_scaled_crc: Add new tests covering modifiers and
    pixel-formats

 tests/i915/kms_flip_scaled_crc.c | 378 +++++++++++++++++++++++++------
 1 file changed, 308 insertions(+), 70 deletions(-)

-- 
2.25.1
