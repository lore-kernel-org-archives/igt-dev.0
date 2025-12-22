Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074C7E674B1
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 13:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C7F10E4A6;
	Mon, 22 Dec 2025 13:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Okw6yj3N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F228010E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766410651; x=1797946651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IVQQ9wNaIjjd61cEbifF3T6w+rtzKymjYLhDoOvxIqI=;
 b=Okw6yj3NMeis4RYN7j/MyXDrjQ94PXsuVICFy3p4Q18WD2aub9w1W3EE
 it9g24O+Q0rkXmKtHi3Uf7qnHgvf29LGVEvtp+d1zYEZV2p59Dpqz+2ao
 bAd9JnhLmrOkbLmHrRZWjLpyobJXbMC+6UzwpjoaLhD7xZzkyB4uVxVIt
 Fg03Mz60pYfZP2QKzAXi52oWYOnQD4JRUcc2YspN/Qo6MAlpNhUWzj358
 O2aeIThr75si7cyZ2xLhGq7wNM8x8RAVa0f05LAJDLrx3wFXxqlqTMtgJ
 +FL0tBVuV7EypOr71OCv1EE1ZL3lUo9F5jPkVj5Z/Z+FtAiHAQK8Yk6E9 g==;
X-CSE-ConnectionGUID: wbtNoFLJSx+vrMZoU/X1DQ==
X-CSE-MsgGUID: 6J0jiwGpQd+f5K7BeyUgZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93735259"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="93735259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 05:37:30 -0800
X-CSE-ConnectionGUID: UlpcoB1LRVCxzqvhKIIutA==
X-CSE-MsgGUID: 8YnSTBpNSbqwDq/EMdpHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="198762303"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 05:37:29 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Unblock NVL-S compute and preemption
 tests
Date: Mon, 22 Dec 2025 14:37:25 +0100
Message-ID: <20251222133724.221995-2-zbigniew.kempczynski@intel.com>
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

Novalake-S uses same pipeline and shaders+sip as Pantherlake.
Add its definition in compute lib and unblock compute-square
and preemption tests.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e112e57b5d..16f2c76498 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1948,6 +1948,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 04),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 static const struct intel_compute_kernels
@@ -2293,6 +2298,12 @@ static const struct {
 		.compat = COMPAT_DRIVER_XE,
 		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
+	{
+		.ip_ver = IP_VER(30, 04),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
+	},
 };
 
 static int find_preempt_batch(unsigned int ip_ver)
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 7bf35d1f4c..3c888ebd85 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -75,5 +75,16 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe3lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 04),
+		.size = sizeof(xe3lpg_kernel_square_bin),
+		.kernel = xe3lpg_kernel_square_bin,
+		.long_kernel = xe3lpg_kernel_count_bin,
+		.long_kernel_size = sizeof(xe3lpg_kernel_count_bin),
+		.sip_kernel = xe3lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe3lpg_kernel_sip_bin),
+		.loop_kernel = xe3lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
+	},
 	{}
 };
-- 
2.43.0

