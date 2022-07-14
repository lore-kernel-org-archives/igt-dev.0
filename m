Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3105110E35C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 21:40:04 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 03:03:04 +0530
Message-Id: <20220714213306.70050-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 0/2] tests/i915/kms_mmap_write_crc: IGT test
 Cleanup
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

Convert all possible subtests to dynamic and sanitize the system
state before starting/exiting the subtest.

Mohammed Thasleem (2):
  tests/i915/kms_mmap_write_crc: Create dynamic subtests
  tests/i915/kms_mmap_write_crc: Test Cleanup

 tests/i915/kms_mmap_write_crc.c | 52 ++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

-- 
2.25.1
