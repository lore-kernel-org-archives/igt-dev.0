Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557A4C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 11:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070E710EC57;
	Fri, 14 Feb 2025 11:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fgbpcnmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2910EC57
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739533533; x=1771069533;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IdOhYi6YUM9ZaydZ5fyZmqc1Ujgyur9DLUCSbD+43vo=;
 b=Fgbpcnmfc0MZWOuOsOv6Vb4dFAgT0o5HRFs/3vmHr1vznfGXSz69+0Rm
 ukXCgxFD88HLHDillEjeqk5RT7WOvmG5Gr5DfaLQJeITEICYe27FCM9vZ
 35xoQh2fZnBRir15rP2YNhkEVQtQrXeEBo/cLfn+p5XJxVOPqNU44NIa1
 oYQTPlW2qn5gzYMxy2BQCK1lqeCfgX7R7EjikJdvl7pOlh/N4ZjCyHWVr
 l7zcVVuVNWTjyYY4MyaHSLq2E6Z6mWZTp8zEiIfvK8P6oTNnktgc9SxKt
 wLI9l6jWy/L8ohB6JU/AXkmCfhrsOPlFGudah8FD9w06k6xYgci97cvfv A==;
X-CSE-ConnectionGUID: BQ9vLPlYQtur5OokJ+JmaA==
X-CSE-MsgGUID: 8Gp+szk8QaGlu/lA6IEvXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="65631941"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="65631941"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:45:32 -0800
X-CSE-ConnectionGUID: dTfgeeY2QWyjd6kKXk21Jg==
X-CSE-MsgGUID: U+b22EJYQS+G/NSwJe/16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113925154"
Received: from dut2146ptlh.iind.intel.com ([10.190.234.52])
 by orviesa007.jf.intel.com with ESMTP; 14 Feb 2025 03:45:30 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH] lib/intel_compute_square_kernels: Extend compute test for ptl
Date: Fri, 14 Feb 2025 11:45:29 +0000
Message-ID: <20250214114529.76197-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Current compute square kernel tests dosen't support on PTL, this enables
tests to work on PTL.

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_compute.c                |  5 ++++
 lib/intel_compute_square_kernels.c | 37 ++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 233835c6c..bca763328 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1729,6 +1729,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 00),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 static bool __run_intel_compute_kernel(int fd,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index b0912e7e4..aa608eab8 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3889,6 +3889,38 @@ unsigned char xelpg_kernel_square_bin[] = {
 	0x00, 0x00, 0x00, 0x00
 };
 
+static const unsigned char xe3lpg_kernel_square_bin[] = {
+	0x65, 0xa0, 0x00, 0x80, 0x20, 0x82, 0x05, 0x1f, 0x04, 0x00, 0x00,
+	0x02, 0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82,
+	0x05, 0x1f, 0x04, 0x1f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31,
+	0x22, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x05, 0x8f, 0x1f, 0x00, 0xfa,
+	0x03, 0x00, 0x70, 0xf6, 0x61, 0x80, 0x24, 0x2c, 0x02, 0x00, 0x10,
+	0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80,
+	0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x41, 0x22, 0x03, 0x80, 0x60,
+	0x06, 0x01, 0x20, 0x54, 0x05, 0x00, 0x01, 0x14, 0x02, 0x00, 0x00,
+	0x53, 0x81, 0x00, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00,
+	0x06, 0x14, 0x02, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00, 0x60, 0x06,
+	0x04, 0x06, 0x04, 0x03, 0x0e, 0x01, 0x04, 0x01, 0x04, 0x04, 0x70,
+	0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
+	0x44, 0x05, 0x00, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00,
+	0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x61, 0x00,
+	0x00, 0xb4, 0x15, 0x06, 0x10, 0x00, 0x61, 0x00, 0x08, 0xb4, 0x17,
+	0x07, 0x10, 0x00, 0x69, 0x1a, 0x10, 0x00, 0x70, 0x86, 0x05, 0x19,
+	0x04, 0x15, 0x20, 0x05, 0x02, 0x00, 0x02, 0x00, 0x69, 0x1a, 0x10,
+	0x02, 0x70, 0x86, 0x05, 0x1b, 0x04, 0x17, 0x20, 0x05, 0x02, 0x00,
+	0x02, 0x00, 0x40, 0x1a, 0x00, 0x38, 0x08, 0x19, 0x10, 0x05, 0x40,
+	0x1a, 0x08, 0x38, 0x0a, 0x1b, 0x10, 0x05, 0x31, 0x23, 0x17, 0x00,
+	0x00, 0x00, 0x14, 0x0c, 0x24, 0x08, 0x00, 0xfb, 0x00, 0x00, 0x00,
+	0x00, 0x40, 0x00, 0x00, 0x38, 0x10, 0x19, 0x30, 0x05, 0x40, 0x00,
+	0x08, 0x38, 0x12, 0x1b, 0x30, 0x05, 0x41, 0x83, 0x20, 0x20, 0x0e,
+	0x0c, 0x00, 0x0c, 0x31, 0x24, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x24, 0x10, 0x08, 0xfb, 0x14, 0x0e, 0x00, 0x00, 0x2f, 0x00, 0x14,
+	0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
+	0x00, 0x00, 0x61, 0x00, 0x10, 0x28, 0x14, 0x02, 0x10, 0x00, 0x31,
+	0x20, 0x02, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30,
+	0x00, 0x00, 0x00, 0x00
+};
+
 const struct intel_compute_kernels intel_compute_square_kernels[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
@@ -3933,5 +3965,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.sip_kernel = xe2lpg_kernel_sip_bin,
 		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 00),
+		.size = sizeof(xe3lpg_kernel_square_bin),
+		.kernel = xe3lpg_kernel_square_bin,
+	},
 	{}
 };
-- 
2.43.0

