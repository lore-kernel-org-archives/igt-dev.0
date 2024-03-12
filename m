Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D637C54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 07:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179910F0E5;
	Tue, 12 Mar 2024 07:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdcgQc31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BAD10F0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710227789; x=1741763789;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gl5Gy5ay8jXeG6xHJXNqvBqfUvcY0aFtJlvRAXJKptQ=;
 b=IdcgQc31U71yrGJxlRqhgAj684VwhllPqIuGt6ZEh9XepKM2uExyTeHa
 f9yV2KcB7BKhvMaK3/29MTYEGuZpA1xQFgMIT+QasOalQKOUhkJLe91Ha
 8OqtkkENNbVWf3rlzkFKNtl5KLj3kx3isV7MsWk1skFj04BF3oliBM+zX
 s48psV8VkfCcrMxUGvaNJnTzyk3yIbv8Vav9igT2U/21Wixqb0O+H38RK
 76DRdusyNQkcGY991P+2oYimYNfapIcRclKrC0gQz57VO5QP9q8HmVYw3
 KAM+c/n1wIIQq9N51bOGWdiDPBvvBkipJ/3PDKaLXCHg+0a4ZIAToiikm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5095897"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5095897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="48885601"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orviesa001.jf.intel.com with ESMTP; 12 Mar 2024 00:16:26 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, venkata.ramana.nayana@intel.com,
 matthew.brost@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than lmem
Date: Tue, 12 Mar 2024 12:45:02 +0530
Message-Id: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
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
Added code to skip the test if the system memory size is less than local
memory size.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 4de82c3bd..2dc3fe542 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -753,6 +753,8 @@ igt_main
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
+			      "System memory is less than local memory \n");
 
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
-- 
2.25.1

