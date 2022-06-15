Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D9B10F712
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 09:58:14 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 15:29:04 +0530
Message-Id: <20220615095906.23688-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/i915/kms_flip_scaled_crc: New
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

Convert subtest to dynamic subtest.
Add tests covering pixel formats and tiling.

Swati Sharma (2):
  tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
  tests/i915/kms_flip_scaled_crc: Add new tests covering modifiers and
    pixel-formats

 tests/i915/kms_flip_scaled_crc.c | 327 ++++++++++++++++++++++++++-----
 1 file changed, 273 insertions(+), 54 deletions(-)

-- 
2.25.1
