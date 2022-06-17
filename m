Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC611ACCB
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 11:07:45 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 16:38:26 +0530
Message-Id: <20220617110828.26508-1-swati2.sharma@intel.com>
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

Add tests covering pixel formats and tiling.
Convert subtest to dynamic subtest.

Swati Sharma (2):
  tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
  tests/i915/kms_flip_scaled_crc: Add new tests covering modifiers and
    pixel-formats

 tests/i915/kms_flip_scaled_crc.c | 375 +++++++++++++++++++++++++------
 1 file changed, 307 insertions(+), 68 deletions(-)

-- 
2.25.1
