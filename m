Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F53606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d/CaRTzy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEBA1122EC;
	Thu, 22 Oct 2026 04:51:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14D31122F5
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644560; x=1824180560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YrcWtX5DvPTLPzAq9SOvoCWY9k0lfDt/FsnJhy3wrrk=;
 b=d/CaRTzyGpXXUBi0hFUuRo53Y0KLFOIo3r/6z9Izt6yVFTUndhzgnegb
 7SFwvPOEnU+VZcelRYrEm52gq7LfIhytRbmuWJty9ATn9dq3nh2rqUhL/
 WPfxYLIfGyM1Aw7CcgKNr6T1XXYpsz95Ue11CwJYM0256jNitrRFIBdsq
 JRcQV8ZUXFEv0e1kffA4QE6ZLnFaiDM57p9OCApRvhb+DeObveKxTushF
 DF1gNdPV74ZhZD3CAw32nsoBlR00GCZg/u7veV66sQd46bR1rv1ca/Cvn
 wGSlXa40FT3N0P5yeeN6tqj3BSBKyzfxYspTcMSB6lWZJUElAjWxQXqZr w==;
X-CSE-ConnectionGUID: MfpITdW+SDKrtHQ3Np0qow==
X-CSE-MsgGUID: HYb2wAIWQs+iovosY9V9YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1420055"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1420055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:20 -0700
X-CSE-ConnectionGUID: fEXT6cQwQpCAqywTofHLLw==
X-CSE-MsgGUID: tB8O4jy3Rui4ErRs48d8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3615259"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:19 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 2/3] lib/intel_compute: Add support for graphics IP 30.01
Date: Thu, 22 Oct 2026 06:49:02 +0200
Message-ID: <20261022044903.823091-3-jan.maslak@intel.com>
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

Graphics IP 30.01 supports the existing compute kernels and both
TGP and WMTP preemption. Add its missing table entries.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index a81e7f3e04..c79af91964 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2322,6 +2322,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 01),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(30, 03),
 		.compute_exec = xe2lpg_compute_exec,
@@ -2837,6 +2842,12 @@ static const struct {
 		.compat = COMPAT_DRIVER_XE,
 		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
+	{
+		.ip_ver = IP_VER(30, 01),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
+	},
 	{
 		.ip_ver = IP_VER(30, 03),
 		.compute_exec = xe2lpg_compute_preempt_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 79a1e2df94..28283b6f05 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -86,6 +86,17 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe3lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 01),
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
 		.ip_ver = IP_VER(30, 03),
 		.size = sizeof(xe3lpg_kernel_square_bin),
-- 
2.43.0

