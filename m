Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E2D37E3F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 15:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52AD10E2C2;
	Wed, 14 Jan 2026 15:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrBEjLUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6171410E584
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768403997; x=1799939997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hsfn6q8jIWLpxVp0SEnJf7YdnqSqVmyopUMcPs8TgLE=;
 b=IrBEjLUz2Z2wHE8HxzN8ulkg26z+4mNrDDCVPprXQdqq2SWxREeI/Rlm
 Z7vh1QJU/rC9mIUCs7pnj7MVKOYRkckvfGmiD9hvGWjPKChoody/4q2cq
 Zo4EFHKWJAdCJ1HyAohMH8hEGufoSkaUTzoFUB52pmnOsWQbYzXIqwpai
 NVIbnGDSZhipaqiHdXxfxw/IHEpQQRQXM8g3xV/ODa8nU8Z69DD/MZ4L8
 Oxp0xy23hahEItjQNLUyqo3FeQ63gP/DZHr1xVJgJDX3RdoaGmbyPNy0U
 Tn2m/y7us78hvCmfvrZ5zAXXofbUoFBoVMZYYDhTagxZGudQ3tO6ZyHk1 g==;
X-CSE-ConnectionGUID: MSe07SNTSXmRdpaKJlACzQ==
X-CSE-MsgGUID: 0i0x0pSjRwmn44ZY1+5BlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69764369"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69764369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:19:56 -0800
X-CSE-ConnectionGUID: sfewdfcRSPOllEX03NWIuw==
X-CSE-MsgGUID: fGJi5L4aQeCBy0cWrtpU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204595940"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:19:54 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 3/5] lib/intel_compute: Add xe3p SIP support
Date: Wed, 14 Jan 2026 16:19:34 +0100
Message-ID: <20260114151930.211512-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
References: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
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
index 397cef0ae9..9d1f6fcacc 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1920,6 +1920,7 @@ static void xe3p_compute_exec_compute(int fd,
 				      uint32_t *addr_bo_buffer_batch,
 				      uint64_t kernel_start_pointer,
 				      uint64_t context_data_base_addr,
+				      uint64_t sip_start_pointer,
 				      bool threadgroup_preemption)
 
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
-				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false);
+				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-- 
2.43.0

