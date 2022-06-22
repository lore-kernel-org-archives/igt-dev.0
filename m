Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5E6112DCE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 07:44:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jun 2022 13:13:46 +0530
Message-Id: <20220622074348.31284-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 PATCH i-g-t 0/2] tests/i915/kms_flip_scaled_crc: New
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
