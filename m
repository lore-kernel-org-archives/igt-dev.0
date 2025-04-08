Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9044BC369A5
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E9410E722;
	Tue,  8 Apr 2025 18:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFYelaOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD9E10E722
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744138264; x=1775674264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM70ND132LQvpnbKhQsucxM4IQJM/abVapNsz+JBo5k=;
 b=YFYelaOPM/H+JjQxgOjyMUXPueP8Ej5r9rrEJVgJ3cJ1P7+bEBF4AyHm
 Sbf1BThv0gM82GdjZGD1eufWEhheIdGJPy7k/hrwTMXs/LDQqijcWSvPt
 9E5rSDjz9Zk4K5fgexqdBBhm+gM19/qMjQDvoF8tFXwe+jLSC+UZYRUN4
 6m0v1zCKmv2Eu3T80h73d18t80TxKEPROlplDjuymBGULJhDCznQW4yjv
 v9DD9x2MX2glU2Br7nXZmXmBDlM50gRQ5U2AaazSMgFL/TaSu99id8Eox
 CujKRFty4k5LgfuamplsppCvLTVVxdm+ll1rljFNGuB4A95QNo5sH0JY4 g==;
X-CSE-ConnectionGUID: iTzLk021Q4qqsIN2y4YhjQ==
X-CSE-MsgGUID: ZDuE0kMWSnmmcs8jV3ol3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45477776"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45477776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:03 -0700
X-CSE-ConnectionGUID: Q7Bwh10jS9uEKT7hCTWJbQ==
X-CSE-MsgGUID: tJnkAT4hQnColGjeBbwQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="132487099"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:01 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v3 2/5] lib/intel_compute_square_kernels: use stoppable
 loop for LNL/BMG
Date: Tue,  8 Apr 2025 20:50:42 +0200
Message-Id: <20250408185045.272673-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
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

Instead of tweaked loop start using loop in which we may stop
it via simple cpu write to memory. Currently this is possible
for LNL and BMG platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute_square_kernels.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 76c48c4511..626dbc4cec 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3844,6 +3844,43 @@ static const unsigned char xe2lpg_kernel_inc_bin[] = {
 	0x00, 0x00, 0x00, 0x00
 };
 
+/*
+ * Opencl code is in opencl/loop.cl
+ *
+ * To work properly it requires to use uncached reads, so ocloc has to
+ * be called with: -options " -igc_opts 'LscLoadCacheControlOverride=1' arg
+*/
+
+static const unsigned char xe2lpg_kernel_loop_bin[] = {
+	0x65, 0x00, 0x00, 0x80, 0x20, 0x82, 0x05, 0x7f, 0x04, 0x00, 0x00, 0x02,
+	0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82, 0x05, 0x7f,
+	0x04, 0x7f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31, 0x20, 0x01, 0x80,
+	0x00, 0x00, 0x0c, 0x02, 0x8f, 0x7f, 0x00, 0xfa, 0x03, 0x00, 0x70, 0xf6,
+	0x61, 0x00, 0x10, 0x2c, 0x01, 0x00, 0x10, 0x00, 0x66, 0x09, 0x00, 0x80,
+	0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40,
+	0x01, 0x09, 0x8c, 0x3c, 0x00, 0x00, 0x10, 0x00, 0x61, 0x80, 0x84, 0xa4,
+	0x04, 0x02, 0x10, 0x00, 0x31, 0x21, 0x01, 0x80, 0x00, 0x00, 0x0c, 0x03,
+	0x0c, 0x04, 0x00, 0xfb, 0x00, 0x00, 0xa0, 0x00, 0x70, 0x81, 0x14, 0x80,
+	0x60, 0x86, 0x01, 0x00, 0x04, 0x03, 0x00, 0x16, 0x34, 0x12, 0x34, 0x12,
+	0x20, 0x00, 0x00, 0x94, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0xd8, 0xff, 0xff, 0xff, 0x61, 0x00, 0x10, 0x28, 0x7f, 0x01, 0x10, 0x00,
+	0x31, 0x22, 0x02, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x30,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
 unsigned char xelpg_kernel_square_bin[] = {
 	0x61, 0x00, 0x03, 0x80, 0x20, 0x42, 0x05, 0x7f, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x80, 0x20, 0x82, 0x45, 0x7f,
@@ -6629,6 +6666,8 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
 		.sip_kernel = xe2lpg_kernel_sip_bin,
 		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+		.loop_kernel = xe2lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe2lpg_kernel_loop_bin),
 	},
 	{
 		.ip_ver = IP_VER(20, 04),
@@ -6638,6 +6677,8 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
 		.sip_kernel = xe2lpg_kernel_sip_bin,
 		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+		.loop_kernel = xe2lpg_kernel_loop_bin,
+		.loop_kernel_size = sizeof(xe2lpg_kernel_loop_bin),
 	},
 	{
 		.ip_ver = IP_VER(30, 00),
-- 
2.34.1

