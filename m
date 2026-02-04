Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8BE6E815
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 05:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D149D10E0BA;
	Wed,  4 Feb 2026 05:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSEDuQ9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333C310E0BA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 05:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770183532; x=1801719532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vt6TKeowllClfEFmwPBeJ2EElgeizcs+5V0QznXGfgo=;
 b=HSEDuQ9jOhxhtm8n4mV96YwuaktSKlWspNsaedBMw5yTSGKCCK4dF3TD
 ntAKvX24W22eN13vM9xLFil6Dj+89d4pJMaj0Y6QvdE5eKcCCmhm6A6uM
 Tylv9hWY4rSYIsqQQu3YS26YS/k4ays51OM/ZLGV7ShqaqSDeiAoD2IUU
 04iVqkWY4QrzOAszUfTHfRw3Ea4M0olQf4PR0MQEd4+VyCKqdfPZ9anIf
 FLWMirAP6D3TwLM45t3VHW3w9OzCSiY5HzIBHPnq10SKmHZRyl6dWCs8U
 cPk/ScVZvbBaTBqJlO5NFH77eFb7D36+jgTn4XJbIAizTkGayZLMDJpV9 A==;
X-CSE-ConnectionGUID: o9AGsTU+RrahCL62uNh0Cw==
X-CSE-MsgGUID: GQ65sIKoQL2l1A+52O7g3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71263638"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71263638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:38:51 -0800
X-CSE-ConnectionGUID: 6S/IBtFtRiu2ka5xfR6qHA==
X-CSE-MsgGUID: e1AT0jWjQvm9NEMtUpMmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="240744581"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:38:49 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Tessita Thomas <Tessita.Thomas@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_jpeg_dec: Fix compilation warnings
Date: Wed,  4 Feb 2026 11:04:52 +0530
Message-ID: <20260204053452.741530-1-karthik.b.s@intel.com>
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

Fix compilation warning:

[1611/2036] Compiling C object tests/amdgpu/amd_jpeg_dec.p/amd_jpeg_dec.c.o
../tests/amdgpu/amd_jpeg_dec.c: In function ‘amdgpu_cs_jpeg_decode’:
../tests/amdgpu/amd_jpeg_dec.c:201:9: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
  201 |         unsigned int ib_dw_capacity = IB_SIZE / 4;
      |

Cc: Tessita Thomas <Tessita.Thomas@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: 020b7f0da24d ("tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/amdgpu/amd_jpeg_dec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index f0876bfe1..81638bae0 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -170,6 +170,12 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	uint32_t idx;
 	struct mmd_context acontext = {0};
 	struct mmd_context *context = &acontext;
+	/*
+	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
+	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
+	 */
+	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
+	unsigned int ib_dw_capacity = IB_SIZE / 4;
 
 	r = mmd_context_init(device_handle, context);
 	igt_assert_eq(r, 0);
@@ -193,12 +199,6 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
 	}
 
-	/*
-	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
-	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
-	 */
-	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
-	unsigned int ib_dw_capacity = IB_SIZE / 4;
 	igt_assert_eq(idx & 1, 0);
 
 	while (idx & 0xF) {
-- 
2.43.0

