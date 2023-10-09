Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26F10E25B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:03:43 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 19D07580DAC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 03:03:36 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qpn6s-001eFp-0L
 for igt-dev@lists.freedesktop.org; Mon, 09 Oct 2023 12:03:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 12:01:40 +0200
Message-ID: <20231009100332.392968-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] intel/kms_big_fb.c: remove
 linear-addfb-size*-overflow docs
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As documented at the comment that registers the subtests:

	/*
	 * Skip linear as it doesn't hit the overflow we want
	 * on account of the tile height being effectively one,
	 * and thus the kenrnel rounding up to the next tile
	 * height won't do anything.
	 */

There are no linear tests for addfb-size-overflow and
addfb-size-offset-overflow. Remove their documentation
as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_big_fb.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 611e60896c8e..2c7b24fcab77 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -736,14 +736,6 @@ static void test_scanout(data_t *data)
 }
 
 /**
- * SUBTEST: linear-addfb-size-overflow
- * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
- *              with small bo.
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
  * SUBTEST: %s-addfb-size-overflow
  * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
  *              with small bo.
@@ -804,14 +796,6 @@ test_size_overflow(data_t *data)
 }
 
 /**
- * SUBTEST: linear-addfb-size-offset-overflow
- * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
- *              and offsets with small bo
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
  * SUBTEST: %s-addfb-size-offset-overflow
  * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
  *              and offsets with small bo
-- 
2.41.0
