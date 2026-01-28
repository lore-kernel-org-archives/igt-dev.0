Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA1D25B44
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 11:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918210E6AC;
	Wed, 28 Jan 2026 11:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6WhBt6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9510E6AA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769600392; x=1801136392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Fnct1zB7HxqZd/QJqZIFaOXkJ8wCCroFLZD2Satc34=;
 b=i6WhBt6Qc+FFuHf1uox8SdqmSGyFPWtswNLWKavGM3dTlweV9Q+Gech+
 WuSpbfTXd6Kkmo1ZwcO2ODo2EW686PDuI0H8BnRRW4Ez6LUxtGZCpIKv8
 1nA/L5SoPow4l1esGla/2jI3NdpgLg5amY89RDxoPIPnhx8NmHFP2TAyG
 wgdEUZs092qP3/eXgp90vcvBDriv+lVMNxKzBmvbWF728ZjI5IAn7fIOj
 Wxc4UtTOzK7Cho4kXbOBfTr2xg6qWNEDdg2MROWjTL6zZU09YaK4Vn1E0
 R/OX3EYX+B5iLm4Ftpi3wORPc228UH+dz+N771o+C8rDYfN7FS3qBAMbT Q==;
X-CSE-ConnectionGUID: 709/kaZ6QRmKaX22fsh1jg==
X-CSE-MsgGUID: +bt22XuISdqkSEPsCXhVNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69825696"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="69825696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:39:52 -0800
X-CSE-ConnectionGUID: qIs7UQRLTOiWApNHt0MK3A==
X-CSE-MsgGUID: 5tXxdbzKSc2Megmb5TMs3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208264068"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:39:50 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] tests/xe_eudebug_online: fix thread ID math in
 pagefault-one-of-many shader
Date: Wed, 28 Jan 2026 12:39:34 +0100
Message-Id: <20260128113934.707513-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128113934.707513-1-jan.maslak@intel.com>
References: <20260128113934.707513-1-jan.maslak@intel.com>
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

Replace the incorrect use of r1.4 (wrong inline field) with explicit dim.x
passed as an argument, then computing tgid.y * dim.x + tgid.x via mul + add.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c                   | 5 +++--
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 084bdeb77..9f736af58 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -267,12 +267,13 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 	mov (1) r30.4<1>:ud 0x3f:ud
 	mov (1) r30.7<1>:ud 0x3:ud // 4 bytes
 	// calculate thread id: r20.0 = dim.x * tgid.y + tgid.x
-	mad (1) r20.0<1>:ud r0.1<0;0>:ud r0.6<0;0>:ud r1.4<0>:ud
+	mul (1) r20.0<1>:ud r0.6<0;1,0>:ud ARG(1):ud
+	add (1) r20.0<1>:ud r20.0<0;1,0>:ud r0.1<0;1,0>:ud
 	// page-fault only for arbitrary thread
 	cmp (1) (eq)f0.0 null<1>:ud r20.0<0;1,0>:ud ARG(0):ud
 (f0.0)	send.ugm (1) r31 r30 null 0x0 0x2128403 // load_block2d.ugm.d32t.a64.uc.uc
 #endif
-			)", data->pf_thread_number);
+			)", data->pf_thread_number, data->w_dim.x);
 
 		gpgpu_shader__label(shader, 0);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
index 3bd5b0c5f..2fe6bb7d8 100644
--- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
+++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
+#define MD5_SUM_IGA64_ASMS 7ab1b0da138a90599e4086c2c40269c9
 
 struct iga64_template const iga64_code_store_sr0_0[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
@@ -24,13 +24,14 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
 };
 
 struct iga64_template const iga64_code_pagefault_one_of_many[] = {
-	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
 		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
 		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
 		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
 		0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
 		0x00000061, 0x1e754220, 0x00000000, 0x00000003,
-		0x0000005b, 0x14040220, 0x02020014, 0x01440064,
+		0x00000041, 0x14058220, 0x02000064, 0xc0ded001,
+		0x00001940, 0x14050220, 0x02001404, 0x00000014,
 		0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
 		0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-- 
2.34.1

