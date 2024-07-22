Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E05C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 09:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913F610E491;
	Mon, 22 Jul 2024 09:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfINjr8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1EB10E491
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721641512; x=1753177512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EN7Rp33ofdGA5EbSfH9sTpfOV6ycb1/kQShp+LjY34E=;
 b=MfINjr8tfu75LYBMqrCkyqOxIzAef9f4C4CPjdXd6jXZE9jZPuI25p5K
 KDF9Okuw/MJmHkgDLKNZGH7XlWtgjQRsK5hQMmBujqhP+6dokPQjdNZwR
 BgGvwlBf5jxsx3z51IRngt7zw2VHdTORB2JRImVA+81ecRizGRpbPPUG8
 968/sykS+7qNbLZYENUPgEi6S2xKLcFKfMT/Q7waUK7WoikgWLjxKFu/i
 8YhXbrUEhRLDuKpzvCVy5EssFWCb4ETEb474bYR8vaZVX+T2d6Q9WZW2h
 0YgXR2UG1ryV75NMvoRH+EOY4imrEiHcYBGfuZ9o2BxOpx1heIFhkPKmH Q==;
X-CSE-ConnectionGUID: kHKNT8X0QSSWvDp5Ksjw3w==
X-CSE-MsgGUID: nbkG4oIXSnOx1OI9J1WnUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30586735"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="30586735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:45:11 -0700
X-CSE-ConnectionGUID: N6xKBGG5T2KOnWnyIwkHDg==
X-CSE-MsgGUID: 3DvW6vBUToCkdNwjuaAeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="82845457"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:45:10 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] BMG: lib/intel_compute: Enable compute tests for BMG
Date: Mon, 22 Jul 2024 11:45:00 +0200
Message-Id: <20240722094500.92690-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nirmoy Das <nirmoy.das@intel.com>

BMG is XE2 based so compute tests should run as it is.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c                | 31 ++++++++++++++++++++++++++++++
 lib/intel_compute_square_kernels.c | 28 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 72025a4811..54d1814f38 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1449,6 +1449,21 @@ static const struct {
 		.compute_exec = xehpc_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(20, 00),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
+	{
+		.ip_ver = IP_VER(20, 01),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_exec,
@@ -1719,11 +1734,27 @@ static const struct {
 			     bool threadgroup_preemption);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
+	{
+		.ip_ver = IP_VER(20, 00),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
+	{
+		.ip_ver = IP_VER(20, 01),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index efd55da0b9..39c34dc5e0 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3866,6 +3866,34 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.size = sizeof(xehpc_kernel_square_bin),
 		.kernel = xehpc_kernel_square_bin,
 	},
+	{
+		.ip_ver = IP_VER(20, 00),
+		.size = sizeof(xe2lpg_kernel_square_bin),
+		.kernel = xe2lpg_kernel_square_bin,
+		.long_kernel = xe2lpg_kernel_inc_bin,
+		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
+		.sip_kernel = xe2lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+	},
+	{
+		.ip_ver = IP_VER(20, 01),
+		.size = sizeof(xe2lpg_kernel_square_bin),
+		.kernel = xe2lpg_kernel_square_bin,
+		.long_kernel = xe2lpg_kernel_inc_bin,
+		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
+		.sip_kernel = xe2lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+	},
+	{
+		.ip_ver = IP_VER(20, 02),
+		.size = sizeof(xe2lpg_kernel_square_bin),
+		.kernel = xe2lpg_kernel_square_bin,
+		.long_kernel = xe2lpg_kernel_inc_bin,
+		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
+		.sip_kernel = xe2lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+	},
+
 	{
 		.ip_ver = IP_VER(20, 04),
 		.size = sizeof(xe2lpg_kernel_square_bin),
-- 
2.34.1

