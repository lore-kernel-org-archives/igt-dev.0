Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1681AC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 04:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987E10EB16;
	Wed, 13 Mar 2024 04:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXMdWLAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38E10EB16
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 04:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710304429; x=1741840429;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MDw2H7PSEsqv61jB7+CAHjK0vxHjCXeir8omBdguo1g=;
 b=PXMdWLADnPsYfkJ9Qj68M0YcYv5wMZlSvofBkcEnbQ4TIT/iUu8MfvD4
 e6g3XIaxQEkyesYqZnwQw5oknLTyqSDKFfSHCt1h+bbg5nI3gG+tHWBtn
 Rd/M5/v6IKl5BfUsR9hPFfRW8aaY0g/yVR/8xbmGzM6BYz7VApAYnuXei
 6xPPkThzJp6JSnag9w8FI1nGryvmc+tJItbbgEs73prS+W8AD8VY6pJZB
 QnIMw58/AQJPqe7N6kaPyBZG19mfit5KBDljp93FP2OLy9wCUi8I4sc++
 dv8ibSV6aEg8s/svaczg13d5Kkbm9nML+jAVIQLY/jnV9K2ytegwiiC2R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="7993225"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7993225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 21:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11673452"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2024 21:33:47 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than lmem
Date: Wed, 13 Mar 2024 10:02:21 +0530
Message-Id: <20240313043221.2240088-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Currently the tests are failing with OOO memory error.
Test requires SRAM to be as big as VRAM. For example, small-cm creates
(448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
simplicity ensure the SRAM size >= VRAM before running this test.
Added code to skip the test if the system memory size is less than local
memory size.

v2: Added memory size in the skip print.(kamil)
Also added reason as a comment for the skip.(Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 4de82c3bd..43e20ef6c 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -754,6 +754,14 @@ igt_main
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 
+		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
+		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
+		 * simplicity ensure the SRAM size >= VRAM before running this test.
+		 */
+		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
+			      "System memory %lu MiB is less than local memory %lu MiB\n",
+			      igt_get_avail_ram_mb(), vram_size >> 20);
+
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
-- 
2.25.1

