Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A760E8FDB1
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 11:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250AD10E1BD;
	Mon, 29 Dec 2025 11:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEBCUNdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16FA10E1BD
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Dec 2025 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767007098; x=1798543098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rqZmXJCY6jAeLffnFAOl6qzmaN7qWJdFpHPJMgAipU=;
 b=gEBCUNdhn2azaRV+t/00yC8K4FEjV1PfwWOz7vty0z6C23eCuKS9pzqB
 jk/On8Z104NGGy4J1bFVjSOccLzhGg3Cg1EzFtnpFUQypBKUhYnfzSn8W
 6o+nD3dzH6tDTH6FNQFmMqB7vEw4ArJZK3zrmN5V1MQ37z99kF0JsCoef
 T1T4ekcF/sMOhVin15hquc1GgPlGMZvr+T+VyfRMIIN1AnlxfDRq7QN7c
 dp6SrDUl6EkERU0NyFwUt/1lePwqm+4yM2SqkmIGfyRlIrn25QaWFPQE5
 EPcESVmTUrMpvRkGiJDAM08JP4iDTQOl83CHjV8umsqqMRqRcKqkdoWD/ w==;
X-CSE-ConnectionGUID: +PZ9NHYlTauEZk7khP7VwQ==
X-CSE-MsgGUID: G+E3OzYoS9CcNkUA4PeGTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68689076"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68689076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:18:18 -0800
X-CSE-ConnectionGUID: eRmxloG3QGmLNLUdOJd7rQ==
X-CSE-MsgGUID: wS+X7jeQTd28pFsMK/7kFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="205374224"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.9])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:18:17 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 4/5] lib/intel_compute: Add xe3p SIP support
Date: Mon, 29 Dec 2025 12:17:53 +0100
Message-ID: <20251229111748.375729-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229111748.375729-7-zbigniew.kempczynski@intel.com>
References: <20251229111748.375729-7-zbigniew.kempczynski@intel.com>
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
index 60fa4de5ba..3e0c7500c5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1916,6 +1916,7 @@ static void xe3p_compute_exec_compute(int fd,
 				      uint32_t *addr_bo_buffer_batch,
 				      uint64_t kernel_start_pointer_addr,
 				      uint64_t context_data_base_addr,
+				      uint64_t sip_start_pointer,
 				      bool threadgroup_preemption)
 
 {
@@ -1957,6 +1958,12 @@ static void xe3p_compute_exec_compute(int fd,
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
@@ -2113,7 +2120,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	xe3p_compute_exec_compute(fd, &idata,
 				  bo_dict[4].data,
 				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
-				  ADDR_STATE_CONTEXT_DATA_BASE, false);
+				  ADDR_STATE_CONTEXT_DATA_BASE, 0, false);
 
 	if (user && user->loop_kernel_duration) {
 		bo_execenv_exec_async(&execenv, ADDR_BATCH);
-- 
2.43.0

