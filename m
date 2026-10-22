Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F94606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ndTIs5yz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8FA10E1F9;
	Thu, 22 Oct 2026 04:55:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C82112307
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644764; x=1824180764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9UhO4S8VNU62K9TIChegFyDyD0PRBoY0V7ZqrAbTLNI=;
 b=ndTIs5yziCE/kJkU42/7aKzHoiEPw2qxu/09fFduc0muPNDCXreAlleT
 0jK9/TVrAPsft8n1nZXknDa5HqD5NQHlm9/gdkRCx2SPAAHYVKGu5xuXW
 WdInPkF9OAG9l1lcjXXqTE51pwWprw/5AwMhaWd69LJvIR8ukUimGHCa5
 i+XoF/lXrvQWyKQO5cIc6nu5ihmhrj2Y4Zqod80TlwK8SUwgGYBPCgPln
 CP3vLVJifbyNnSgpC1KlLGhrXhh2hpFKYEzFBARY/lsqrSJsxJS7iLvWs
 Rqe9s2WaPsSFERCA1S0TKJky7il3uQfd4DuTfIL/iN7jcK2qIBTgzkC/Z g==;
X-CSE-ConnectionGUID: NHtKNSuzR2GPSrPLi06V5g==
X-CSE-MsgGUID: hMd5XxyZTtKC21u2c0zbqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1485710"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1485710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:42 -0700
X-CSE-ConnectionGUID: GzBDKcfuRcKgjhTPMG+v2g==
X-CSE-MsgGUID: 7HOYsjHTR42neafmXugkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3266164"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:41 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 3/3] lib/intel_compute: Restore support for graphics IP
 30.05
Date: Thu, 22 Oct 2026 06:52:21 +0200
Message-ID: <20261022045221.823182-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022045221.823182-1-jan.maslak@intel.com>
References: <20261022045221.823182-1-jan.maslak@intel.com>
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

Reading the graphics IP from the GT query now reports 30.05 instead
of the hard-coded 30.04. Without a matching table entry, compute and
preemption tests skip.

Add the missing entries using the existing kernels for 30.04, with
TGP and WMTP preemption verified on hardware.

Fixes: 1d467c93321b ("lib/intel_device_info: allow xe_query to override graphics version")
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
