Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F51C79F8A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 12:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EC010E159;
	Mon,  5 Jan 2026 12:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAe9goF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623BD10E22B
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767617299; x=1799153299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mK3gzz1jE15LM+KchhoZPGBUdMMmP9h3D9KL3iAW6ZM=;
 b=MAe9goF7SIZ9oyG51SN0LA3vp8PmqFk4rOLGRoFWKND5YpK/r9A5wsWO
 QPThVgcQFo9IUFndZ7Hj4lUWpkpXP8X0rbfBQcuM+5sDjgYsBfUHKR6qC
 nDFeYmIevQA0FxBdkviI7Xj8888yreX5hi3pKg0ApV5sOYzHxdo2rdpA6
 9qg8YrB0C0Vys4SJ0lYUBRv0LJjIdMcYM9QsWOgVme4IYBLYhYdLKZtz9
 RCpXMgt3QReMywUV3qbC111dIWOK8QlPJ9TRVCBevCBCRJU4PlE44RS8q
 /o3gCTPUlL2cDOPmGMM5QZ8W/eOIC4IyzlqTtuO/UniuckROL8fJ8ax/8 g==;
X-CSE-ConnectionGUID: fbenDq4sQ2+BrdafsojIvg==
X-CSE-MsgGUID: NmBA0RinSeSVvC23/9cRLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68961092"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68961092"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:18 -0800
X-CSE-ConnectionGUID: hMQrYGaGT8WMt8x0fCK5Zg==
X-CSE-MsgGUID: HLz1JlwxS+esqS3B9WusgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="206943485"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.165])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:17 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/5] lib/intel_compute: Add xe3p SIP support
Date: Mon,  5 Jan 2026 13:48:01 +0100
Message-ID: <20260105124757.1421059-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
References: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
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

Extend xe3p pipeline to handle sip for WTMP tests.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_compute.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c3a5cf83bc..9c512bd64f 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1922,6 +1922,7 @@ static void xe3p_compute_exec_compute(int fd,
 				      uint32_t *addr_bo_buffer_batch,
 				      uint64_t kernel_start_pointer_addr,
 				      uint64_t context_data_base_addr,
+				      uint64_t sip_start_pointer,
 				      bool threadgroup_preemption)
 
 {
@@ -1963,6 +1964,12 @@ static void xe3p_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = context_data_base_addr;
 	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
 
+	if (sip_start_pointer && !threadgroup_preemption) {
+		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
+		addr_bo_buffer_batch[b++] = sip_start_pointer;
+		addr_bo_buffer_batch[b++] = sip_start_pointer >> 32;
+	}
+
 	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
@@ -2118,7 +2125,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	xe3p_compute_exec_compute(fd, &idata,
 				  bo_dict[4].data,
 				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
-				  ADDR_STATE_CONTEXT_DATA_BASE, false);
+				  ADDR_STATE_CONTEXT_DATA_BASE, 0, false);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-- 
2.43.0

