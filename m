Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF951C982D3
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 15:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C0210E8CC;
	Fri, 16 Jan 2026 15:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKzQaWy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367CD10E8CE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768578416; x=1800114416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbXt6ZSrZzr+p9JaJu6hMYl2MAYIRnoHgo1cHviYPRA=;
 b=bKzQaWy5Gs9oEpuNhjAnZISaMg75Me5DmVeWOo8oP6QBaq8dQcDKmQ2j
 zIXlbAIdicY+v8d5g45pnnB4Pi8bXqLWWDQBrHN0rhM3BGv6VY89DlOdA
 UM7druk877rdEbXL8rtILL0CGAsnoxufnv2tasvqPxFOWSBNQaw/ZJCOI
 MVbAWAQCFJzZTyb69IwQJK6blgPCLxHvW5x1+oY4LNWHNjAwmXCu1DxwJ
 JR4YzXr7LXyK0vDcWuzbGbYGtVc/dxn6Yir6sRm5SeJ/IIWWgOukzOpM8
 i0SSN0+H9C5IMPEAyMrE6uwEkKzU3RptQST8qbmX4BWK+EsO6PnRNBsH/ Q==;
X-CSE-ConnectionGUID: l2v9QOa3SBSLVOfOwIZD3g==
X-CSE-MsgGUID: QOJzGDs5Reu9FR1wX4aEfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68905312"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="68905312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:46:56 -0800
X-CSE-ConnectionGUID: 0TPrGS3SS9a1UnL8Sx4tfw==
X-CSE-MsgGUID: fqmaw1ctSjyjTPmqYY/1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="209749488"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:46:55 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 3/5] lib/intel_compute: Add xe3p SIP support
Date: Fri, 16 Jan 2026 16:46:40 +0100
Message-ID: <20260116154636.204553-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
References: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
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
index 05ea92c7db..75cf1beba6 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1920,6 +1920,7 @@ static void xe3p_compute_exec_compute(int fd,
 				      uint32_t *addr_bo_buffer_batch,
 				      uint64_t kernel_start_pointer,
 				      uint64_t context_data_base_addr,
+				      uint64_t sip_start_pointer,
 				      bool threadgroup_preemption,
 				      uint32_t work_size)
 {
@@ -1960,6 +1961,12 @@ static void xe3p_compute_exec_compute(int fd,
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
@@ -2115,7 +2122,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	xe3p_compute_exec_compute(fd, &idata,
 				  bo_dict[4].data,
 				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
-				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false,
+				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false,
 				  execenv.array_size);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
-- 
2.43.0

