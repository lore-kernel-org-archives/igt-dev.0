Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86F10EF37
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 18:03:22 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jun 2022 23:30:22 +0530
Message-Id: <20220616180024.98304-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/i915/kms_mmap_write_crc: IGT test
 Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert all possible subtests to dynamic and sanitize the system
state before starting/exiting the subtest.

Mohammed Thasleem (2):
  tests/i915/kms_mmap_write_crc: Create dynamic subtests
  tests/i915/kms_mmap_write_crc: Test Cleanup

 tests/i915/kms_mmap_write_crc.c | 43 ++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 22 deletions(-)

-- 
2.25.1
