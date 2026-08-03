Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673DC5516F
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 05:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA79E10E02F;
	Mon,  3 Aug 2026 05:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXOeuZD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AEF10E02F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734183; x=1817270183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIC1TxaXElVStY6q9xiRB4gXtLnYhaD/8GVoelNbn7w=;
 b=NXOeuZD5A9NiiMs+3zhM2QklMR3FN1Ao/gvMDrscyFq/LqxZ77UUBrz4
 ZXuHa5uWP1KXk2IfL2GarRVSeb4FcUAZ917Mjtss3szVmpRa5vHb7fijk
 M+xaf+K0yb0CMsGmDLu7rwYVdpxzihjOD8MqJP4FuSDcxcnjzePfSAizQ
 Z9+xrmS/aPS6G/AMQCdDG7STjy/XHm7HEuVyS2CZYDwLKCRkgHicJFCq+
 lFbEjATcrLCAYD8+WM1fAnWtEjcquv1qFGtxS5bFr57mqHDQUlUW4UWND
 G4VeLpjGUdvAWwxh3T1dTv3CbNvFkIBqRXS3SHAtcbALlSM3Io6fjlUS/ A==;
X-CSE-ConnectionGUID: SwTYS7GwQRyWO7IM88arLg==
X-CSE-MsgGUID: zy8n494JScyhrNyVYxuLEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86138252"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="86138252"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:16:22 -0700
X-CSE-ConnectionGUID: /7zjE8SeT0aE+y3pseUYgA==
X-CSE-MsgGUID: xW8/+Z/oSPyaH90/3MFMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="259313618"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:16:21 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/gpgpu_fill: Rename variable to reflect
 function purpose
Date: Mon,  3 Aug 2026 07:16:10 +0200
Message-ID: <20260803051608.61167-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803051608.61167-4-zbigniew.kempczynski@intel.com>
References: <20260803051608.61167-4-zbigniew.kempczynski@intel.com>
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

Proved gpgpu kernel for xehp works both for i915 and xe. Rename i915
to avoid name confusion as upcoming change alters shader processing
(canonicalizing offset).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/gpgpu_fill.c | 10 +++++-----
 lib/gpgpu_fill.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 2c47169d2c..e7c9c3cd21 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -282,9 +282,9 @@ __gen9_gpgpu_fillfunc(int i915,
 	intel_bb_destroy(ibb);
 }
 
-static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
+static struct gpgpu_shader *__xehp_gpgpu_kernel(int fd)
 {
-	struct gpgpu_shader *kernel = gpgpu_shader_create(i915);
+	struct gpgpu_shader *kernel = gpgpu_shader_create(fd);
 
 	emit_iga64_code(kernel, gpgpu_fill, R"(
 // fill up r1 with target colour
@@ -407,7 +407,7 @@ static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe)
 	return kernel;
 }
 
-void xehp_gpgpu_fillfunc(int i915,
+void xehp_gpgpu_fillfunc(int fd,
 			 struct intel_buf *buf,
 			 unsigned int x, unsigned int y,
 			 unsigned int width, unsigned int height,
@@ -417,12 +417,12 @@ void xehp_gpgpu_fillfunc(int i915,
 	struct gpgpu_shader *kernel;
 	struct xehp_interface_descriptor_data idd;
 
-	ibb = intel_bb_create(i915, PAGE_SIZE);
+	ibb = intel_bb_create(fd, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, buf, true);
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
-	kernel = __xehp_gpgpu_kernel(i915);
+	kernel = __xehp_gpgpu_kernel(fd);
 	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
 				       kernel->size * 4, &idd);
 	gpgpu_shader_destroy(kernel);
diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
index 96d291c987..6f2d74d70d 100644
--- a/lib/gpgpu_fill.h
+++ b/lib/gpgpu_fill.h
@@ -62,7 +62,7 @@ void gen12_gpgpu_fillfunc(int i915,
 			  uint8_t color);
 
 void
-xehp_gpgpu_fillfunc(int i915,
+xehp_gpgpu_fillfunc(int fd,
 		    struct intel_buf *dst,
 		    unsigned int x, unsigned int y,
 		    unsigned int width, unsigned int height,
-- 
2.54.0

