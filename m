Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224BC369A2
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49110EBC8;
	Fri,  4 Apr 2025 09:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbZRg7qU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD7A10EBAF
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743758805; x=1775294805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM70ND132LQvpnbKhQsucxM4IQJM/abVapNsz+JBo5k=;
 b=lbZRg7qURFSuxK9g9i159fUyQHBE37sgBbDEE+Fg8DE379brnPpIksCu
 UQ/FYsD5N/srExu8cc32VWpYXt5wWhPlVRQo+ZgQdvPLBwNp23J0UIS/i
 d9sOIuI0v2mOM6MTBR71HBY4DBld3Omwv3Kh6MKnjoJoPbWP60XPEijpf
 mSEoH6c5XzUcEbpNHoyQXkIYAvMc21DNyzh7PLfw8avD4cyRyR9Dp5DIJ
 9SAGmThOk6Aytx9PR9c6p2e05r9iLieQhqDn2/g3JPojEU8rs2kGhnOpy
 U+4b1SSgrqiFRFUxRmOzGcgfw7RBfDreFRTICtiqeLz9CEv39jp3sS5b2 g==;
X-CSE-ConnectionGUID: DpkX+cHtSTWhXXnEvDqwCQ==
X-CSE-MsgGUID: lg3OtbNrR4Gy7Pwk95I0sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55386117"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="55386117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:26:44 -0700
X-CSE-ConnectionGUID: QCzZH3/ZQqeOnULNwmRvNQ==
X-CSE-MsgGUID: 2H3CLiQLR+elvvbfC6FmwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127763738"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:26:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/intel_compute_square_kernels: use stoppable
 loop for LNL/BMG
Date: Fri,  4 Apr 2025 11:26:24 +0200
Message-Id: <20250404092624.232620-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404092624.232620-1-zbigniew.kempczynski@intel.com>
References: <20250404092624.232620-1-zbigniew.kempczynski@intel.com>
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

