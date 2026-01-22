Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E4DC44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126B10E97C;
	Thu, 22 Jan 2026 10:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZbsWCSw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDE10E97C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769078733; x=1800614733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/nIatVrNSlijakKJSrDUon6FjmI3q1dllwaRlOUir9o=;
 b=KZbsWCSwif6hhb+D0KfaAuWqb1qGGBCzhAGa36jx9TaQGPj3LgMEZpRv
 8D0BVag4/O96gFFQtYpRxcesJTLt3W6aN9lJ/RyuS35KwBLzQnPQddXHY
 jQonxvatve4miY9+X56hOOc6J8le/jBRiG9gdOglS6BOhn94EtRyV2fOX
 26+TKoVp/jyGsO2IK816+Fvb05fp2Tg3fw3MlEgUmzDem+QWcQ1dNcj9/
 WzdmTPO07DeKDw2hvkeqVN7o3D7OzNTd0gW8KQiIQ+DL6Myqr7Kg28/fa
 JfFflgEGXL2B/ZkYPt7OQ1nTZzkYfBPf/YMAW0CPX+baQY6qZcAdj9m1l Q==;
X-CSE-ConnectionGUID: B04EhZwTRpGnQiJ2+YcI5g==
X-CSE-MsgGUID: Atafy1kUTFaQBRGoam5CjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74177380"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="74177380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:45:33 -0800
X-CSE-ConnectionGUID: P7LGYSm2RIO6xFK22bJr1A==
X-CSE-MsgGUID: 6GHP8DgkTfShymHTFOU0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237966130"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:45:31 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Wait for compute walker before
 returning to ring
Date: Thu, 22 Jan 2026 11:45:29 +0100
Message-ID: <20260122104528.980532-2-zbigniew.kempczynski@intel.com>
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

Most compute tests don't need to synchronize at the batch level as
kmd executes pipe-control at some point. Last xe driver proposal (link
below) causes turning off preemption before pipe-control preventing
entering to SIP and finish the WMTP test properly.

Change adds pipe-control at batch level causing sync wait on
compute-walker and preventing disabling the preemption prematurely.

Link: https://patchwork.freedesktop.org/series/160113/
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 00ef280e8f..8578b6e402 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1694,6 +1694,13 @@ static void xe2lpg_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
 	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
 }
 
@@ -2032,6 +2039,13 @@ static void xe3p_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
 	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
 
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
 	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
 }
 
-- 
2.43.0

