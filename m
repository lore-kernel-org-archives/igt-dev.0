Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41014C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 19:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74A010EB83;
	Thu, 13 Feb 2025 19:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWuqLr6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C810EB83
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474367; x=1771010367;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kq2Jvn8QP8AiP7lFzy3CO4dz7iL2LSUa8NR/fCO5+Mo=;
 b=KWuqLr6Yntj56QI1zBnk0h978CQb5Qsh2YzGHaYzhM1M/QiR9eLYM1TT
 ZvkWjcU2Htb+49g1r/mJ/W+q3GedLaThCfTglMQIssso9vtTeqKSDdpE7
 G93DEIQkSMR9elEVriw4G/TyrC2/ePzquz+cLIwnjBzHWPlBfBviZbGpH
 GsYnpC5RU6BuIqmOeYa7R101ZyuYwP0wFSZKHdg2kPfpACcaiO86GVakH
 ohFEwtRbRDYAB7hVz675Oq8R4yU2EVT8KbsTkdz2GSa94hu7Lqh0e4g1i
 yjpsEbasRCa2tcQNsUbxUIJ4YiRarJ6PHfFVH63wel95gBFaRQfNKzhKC g==;
X-CSE-ConnectionGUID: s39K8ATcSCKLnKjfGh+Q7w==
X-CSE-MsgGUID: ykfLLphsTTKfqWVXgP7WNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127167"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:19:27 -0800
X-CSE-ConnectionGUID: uzqaoWNdR1ytAC6QHiZLnw==
X-CSE-MsgGUID: ABu8gOv7TiCVKBAn5e6SIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150414554"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2140PTLH.iind.intel.com) ([10.190.232.85])
 by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 11:19:26 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH] lib/intel_compute_square_kernels: Extend compute test for ptl
Date: Thu, 13 Feb 2025 19:19:25 +0000
Message-ID: <20250213191925.15475-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_compute.c                | 10 ++++++++
 lib/intel_compute_square_kernels.c | 41 ++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 233835c6c..5350389df 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1729,6 +1729,16 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 00),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
+	{
+		.ip_ver = IP_VER(30, 01),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 static bool __run_intel_compute_kernel(int fd,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index b0912e7e4..08b07b58a 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3889,6 +3889,37 @@ unsigned char xelpg_kernel_square_bin[] = {
 	0x00, 0x00, 0x00, 0x00
 };
 
+static const unsigned char ptl_kernel_square_bin[] = {
+	0x65, 0xa0, 0x00, 0x80, 0x20, 0x82, 0x05, 0x1f, 0x04, 0x00, 0x00, 0x02,
+	0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82, 0x05, 0x1f,
+	0x04, 0x1f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31, 0x22, 0x03, 0x80,
+	0x00, 0x00, 0x0c, 0x05, 0x8f, 0x1f, 0x00, 0xfa, 0x03, 0x00, 0x70, 0xf6,
+	0x61, 0x80, 0x24, 0x2c, 0x02, 0x00, 0x10, 0x00, 0x66, 0x09, 0x00, 0x80,
+	0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40,
+	0x41, 0x22, 0x03, 0x80, 0x60, 0x06, 0x01, 0x20, 0x54, 0x05, 0x00, 0x01,
+	0x14, 0x02, 0x00, 0x00, 0x53, 0x81, 0x00, 0x80, 0x60, 0x06, 0x05, 0x03,
+	0x54, 0x05, 0x00, 0x06, 0x14, 0x02, 0x00, 0x00, 0x70, 0x00, 0x14, 0x80,
+	0x60, 0x86, 0x01, 0x00, 0x44, 0x05, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00,
+	0x52, 0x1a, 0x14, 0x00, 0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x0e, 0x01,
+	0x04, 0x01, 0x04, 0x04, 0x20, 0x00, 0x00, 0x84, 0x00, 0x40, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0xb0, 0x00, 0x00, 0x00, 0x61, 0x1a, 0x00, 0xb4,
+	0x0f, 0x06, 0x10, 0x00, 0x61, 0x00, 0x08, 0xb4, 0x11, 0x07, 0x10, 0x00,
+	0x69, 0x1a, 0x10, 0x00, 0x70, 0x86, 0x05, 0x13, 0x04, 0x0f, 0x20, 0x05,
+	0x02, 0x00, 0x02, 0x00, 0x69, 0x1a, 0x10, 0x02, 0x70, 0x86, 0x05, 0x15,
+	0x04, 0x11, 0x20, 0x05, 0x02, 0x00, 0x02, 0x00, 0x40, 0x1a, 0x00, 0x38,
+	0x08, 0x13, 0x30, 0x05, 0x40, 0x1a, 0x08, 0x38, 0x0a, 0x15, 0x30, 0x05,
+	0x31, 0x23, 0x17, 0x00, 0x00, 0x00, 0x14, 0x0c, 0x24, 0x08, 0x00, 0xfb,
+	0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x84, 0xf4, 0x03, 0x00, 0x02, 0x00,
+	0x40, 0x19, 0x00, 0x80, 0x60, 0x86, 0x15, 0x03, 0x14, 0x03, 0x00, 0x05,
+	0x01, 0x00, 0x01, 0x00, 0x40, 0x83, 0x20, 0x30, 0x0c, 0x0c, 0x80, 0x3f,
+	0x70, 0x19, 0x54, 0x80, 0x20, 0x02, 0x01, 0x00, 0x14, 0x03, 0x00, 0x52,
+	0x44, 0x05, 0x00, 0x00, 0x20, 0x00, 0x40, 0x84, 0x00, 0x40, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0xd8, 0xff, 0xff, 0xff, 0x31, 0x24, 0x16, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x24, 0x08, 0x08, 0xfb, 0x14, 0x0c, 0x00, 0x00,
+	0x61, 0x00, 0x10, 0x28, 0x0e, 0x02, 0x10, 0x00, 0x31, 0x20, 0x02, 0x80,
+	0x04, 0x00, 0x00, 0x00, 0x0c, 0x0e, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
+};
+
 const struct intel_compute_kernels intel_compute_square_kernels[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
@@ -3933,5 +3964,15 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.sip_kernel = xe2lpg_kernel_sip_bin,
 		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
 	},
+	{
+		.ip_ver = IP_VER(30, 00),
+		.size = sizeof(ptl_kernel_square_bin),
+		.kernel = ptl_kernel_square_bin,
+	},
+	{
+		.ip_ver = IP_VER(30, 01),
+		.size = sizeof(ptl_kernel_square_bin),
+		.kernel = ptl_kernel_square_bin,
+	},
 	{}
 };
-- 
2.43.0

