Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC73FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 11:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490110E25F;
	Mon,  4 May 2026 11:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzGrr0V0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A298910E25F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777894702; x=1809430702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5usoRB94C2p6xd61uUosVX7dTSigtpt9lNy9Zgl+sDo=;
 b=DzGrr0V0hVDwf88xQswxLJVq8oODBuUDxtAPswLtFUa5ICYXoEBFLp3b
 mQqHg0LqKFr89IYXpWct2VBV0tQrCL04TypcftbfzcMoDydrUu9ogokCE
 l/0W8wqaY2LTki5zbC0UeSf4KJO7mvgbNi0C5VlxWfBcJ0iuHTz9ivVs5
 rXwHRyWkdbRnzS9ezHxqZA+7m7hvssYtN5pkCHSo0ikpPZ0gBHifesXkv
 8cKfNnqhAxS6DT4ESzMKTGeP82Q0FkV5ZC9S8+rn/2KB251Cm1eWc8Ntt
 PKO60ye0fEu7E3wAy36Ccgy94OSGs4qHYCoa9ui3leJ9tzsQcL0c3Y7Ni g==;
X-CSE-ConnectionGUID: 7KK5aKT1RrmaQXRStClb4A==
X-CSE-MsgGUID: k/XmJOJIT12kbdXWYRVQmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78799375"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78799375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 04:38:21 -0700
X-CSE-ConnectionGUID: /+yprfo7ThKN8aAs/lgVWQ==
X-CSE-MsgGUID: 2vHH/TbgSlu6LrVcbC0W9g==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 04:38:20 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Fix localgroup size passed in
 indirect data for Xe3p
Date: Mon,  4 May 2026 13:38:15 +0200
Message-ID: <20260504113814.3720157-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Previously hardcoded constants are not correct for handling larger buffers
in compute square tests in Xe3p. Replace these values to commonly used
localgroup size definitions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 7dda423c80..680675982a 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2054,7 +2054,7 @@ static void xe3p_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
 	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
 	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
-	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
+	addr_bo_buffer_batch[b++] = 0x000003FF; /* dw6 */ // Local X/Y/Z Dimension
 
 	if (threadgroup_preemption)
 		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
@@ -2081,7 +2081,7 @@ static void xe3p_compute_exec_compute(int fd,
 
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
-	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
+	addr_bo_buffer_batch[b++] = 0x0C000000 | THREADS_PER_GROUP; /* dw24 */
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
 	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
 
@@ -2135,9 +2135,9 @@ static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
 	addr_bo_buffer_batch[b++] = loop_count;
-	addr_bo_buffer_batch[b++] = 0x00000200;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-- 
2.43.0

