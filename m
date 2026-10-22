Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB97606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBQw4Ka9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B010E1F9;
	Thu, 22 Oct 2026 04:55:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CAA1122EC
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644760; x=1824180760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bgCZUeVTiYCHgy9G8QW12/el09bxwKKPaJ+iahBh/mE=;
 b=oBQw4Ka9gY0tv271YHisMDMSnilGtPddEFznDXjzBSNvbCsEdIMO1kvQ
 U/dX0QmWc1XEjhL5rMq03uU6J0hvl8b2cWmY3+s1wJL6JPtsgrtt5hzaV
 C23G/RWjHHFqUN2xAwKN4MUFBX3v8PppZBmhibMQqF8tDB9elv6NBk3g7
 3eefSOliS+CtVzwo22wnqnjD8jfs0cGOVjtU0GfSJHYyl35fuWd6Wp4SM
 WOW36KfBkPfJINe4GnK32vcbafKy7Uv2nGy6qbgCgCBV9M48ggnOB7uAE
 ZnrYYr1yHic74++W62kSO5y9GGKAX9qh1jX7U+orAFAPaxQ6cy3X2VLmL w==;
X-CSE-ConnectionGUID: R0uKmfseSZq31W4Uhh4Lxw==
X-CSE-MsgGUID: 4G1HzwFiTNq9DJzqzbrNZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1485705"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1485705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:39 -0700
X-CSE-ConnectionGUID: ZjqJZuTPTLOw2Et1vkLhIw==
X-CSE-MsgGUID: LdfjJLA8TmeswfY6FPXE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3266158"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:38 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 1/3] lib/intel_compute: Restore support for graphics IP
 20.02
Date: Thu, 22 Oct 2026 06:52:19 +0200
Message-ID: <20261022045221.823182-2-jan.maslak@intel.com>
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

Reading the graphics IP from the GT query now reports 20.02 instead
of the hard-coded 20.01. Without a matching table entry, compute and
preemption tests skip.

Add the missing entries using the existing kernels for 20.01, with
TGP and WMTP preemption verified on hardware.

Fixes: 1d467c93321b ("lib/intel_device_info: allow xe_query to override graphics version")
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 02aa3cb425..a81e7f3e04 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2307,6 +2307,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_exec,
@@ -2814,6 +2819,12 @@ static const struct {
 		.compat = COMPAT_DRIVER_XE,
 		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index a612092fc1..79a1e2df94 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -53,6 +53,17 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe2lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe2lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.size = sizeof(xe2lpg_kernel_square_bin),
+		.kernel = xe2lpg_kernel_square_bin,
+		.long_kernel = xe2lpg_kernel_count_bin,
+		.long_kernel_size = sizeof(xe2lpg_kernel_count_bin),
+		.sip_kernel = xe2lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+		.loop_kernel = xe2lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe2lpg_kernel_loop_bin),
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.size = sizeof(xe2lpg_kernel_square_bin),
-- 
2.43.0
