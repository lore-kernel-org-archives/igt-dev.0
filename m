Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB7606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XUHARPYE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3267310E1F9;
	Thu, 22 Oct 2026 04:51:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B41122F7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644563; x=1824180563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lEpSRLvxEqyEUC4txh7Xhs+0sL/cwCT+cF54dIFTtSU=;
 b=XUHARPYExk4KGJYk7MoMTRgJc6iYVULdoBmGbQfeqrMNXLGYBN3eWa5c
 tNpnW9tEUkwz+SoNwXFYoPFcvnOyu9L1aBYZFDFt7PtY8FKXunheuoQy8
 iPlV4ALFa88mYRWwyhGS3BzAanRwtLDgc9jWzB/f67eSFeA41jrHImx+j
 j+phaK4R4xvU6Ywn7xqoF1bHiPxOpf9pOLLy1W/3WHRlt/44EJmt/Yqd2
 qoq1Mt4KSPJ7ok7iRwrKQJYhecw+bZymvazrD4XE9RqxoeGOYXmLV8rSR
 9RHU3ONxOFgiArLWeT5KbyK9EoOEHDTFJl3J6y3p/J8A6Xfa6+KiYS9VT Q==;
X-CSE-ConnectionGUID: sM960IN4QC6mv1va6vKu6w==
X-CSE-MsgGUID: VCSpvkxzRKCJ76IifF2PIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1420057"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1420057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:21 -0700
X-CSE-ConnectionGUID: JGoFtN2mRYmjkSdTlVxXJg==
X-CSE-MsgGUID: zZWrOgoQRYK7AvHRWrBLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3615263"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:20 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 3/3] lib/intel_compute: Add support for graphics IP 30.05
Date: Thu, 22 Oct 2026 06:49:03 +0200
Message-ID: <20261022044903.823091-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022044903.823091-1-jan.maslak@intel.com>
References: <20261022044903.823091-1-jan.maslak@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Graphics IP 30.05 supports the existing compute kernels and both
TGP and WMTP preemption. Add its missing table entries.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c79af91964..ecf4e3bf02 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2337,6 +2337,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 05),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(35, 10),
 		.compute_exec = xe3p_compute_exec,
@@ -2860,6 +2865,12 @@ static const struct {
 		.compat = COMPAT_DRIVER_XE,
 		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
+	{
+		.ip_ver = IP_VER(30, 05),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
+	},
 	{
 		.ip_ver = IP_VER(35, 10),
 		.compute_exec = xe3p_compute_preempt_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 28283b6f05..e5ad465f4f 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -119,6 +119,17 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe3lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 05),
+		.size = sizeof(xe3lpg_kernel_square_bin),
+		.kernel = xe3lpg_kernel_square_bin,
+		.long_kernel = xe3lpg_kernel_count_bin,
+		.long_kernel_size = sizeof(xe3lpg_kernel_count_bin),
+		.sip_kernel = xe3lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe3lpg_kernel_sip_bin),
+		.loop_kernel = xe3lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
+	},
 	{
 		.ip_ver = IP_VER(35, 10),
 		.size = sizeof(xe3p_kernel_square_bin),
-- 
2.43.0

