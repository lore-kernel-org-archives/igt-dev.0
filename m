Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE1ED3B7E1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE1210E386;
	Mon, 25 Nov 2024 07:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYd2/cNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3610E386
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519929; x=1764055929;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Y8fCA/MKbtaMus9BpH7A1HPoTy/s8DNtxZtPEP0goHE=;
 b=TYd2/cNSD0ujvkrLpAJ+Xaw5P3rwhVGS6bi9Aw25IJfHK9ef6WteOVch
 /m2mvwXd3UhdellYlR0BlbwiycWyrwTI0YpHVRp9xTxGBa8sY8zwuzguT
 wVqVGsJu8C9ElNCHxhhuVwed1g3oFKZmTjINmQdGyU3w/1lzcj91n4Dnr
 u0KRTWovyLQoxtegFzEPuH7hceNceInbxIgk06GfvwmJOfmyxidOyIltC
 MaqM4Imxo9pKrSpj6y69El0p9RR+vFowHUq52o3iQnIePu8LFJ/KAq4gU
 lMYJpInugOOcknYBQbm4/W/7Pk/rh2NH53zceq8Nx99NyaYa474Xu/snx A==;
X-CSE-ConnectionGUID: b2gSlcRQS2i7RMe12sN1CQ==
X-CSE-MsgGUID: bMWVluemSSugO06woS2GvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31972837"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31972837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:09 -0800
X-CSE-ConnectionGUID: +OuUoMh/QjmHycjngHH5Yw==
X-CSE-MsgGUID: A8Umwn9sQK6VtPAiNgJqBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91595689"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:08 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 08:31:50 +0100
Subject: [PATCH v4 1/4] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-gpgpu_send_rework-v4-1-c16b568a1f3d@intel.com>
References: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2700;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Y8fCA/MKbtaMus9BpH7A1HPoTy/s8DNtxZtPEP0goHE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRCfz1xpPpyRYYnkRtE86MJWrui3xhkbn4biXvwkn
 DeT4gESJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0Qn8wAKCRAjYrKT3hD91ynNDA
 CWfp1RMAZjXC/x1SWjujnpyeATg6kqM6pg8eiEYQ0Xa6vpzhUyONKDEt+1uUgYQ/feBQ0rn1hXm3pR
 G8sFBgkeQuFgd/TBsEMwedtn2V2W/Cmo5Eg28PkNRuzFLD3lTRmrrskfOU1WBm9Q6v9+mQNKixc0fq
 9d9rKeaiWCFvxz0gXuuNHsN8p/xi3xWYAN6I5TuplQJhWrnbRZbrcJHTJIUxljcRTlb7lfNM2PGWJj
 Ii0TmpAXYOXTx6B8JeRU+LO62/zDMk2mX2ewvLkZVg12JXa5n4HST25as6qVB7jQT2yE2W5YXx+BrC
 66jp7j2dC6VDO/KOG81xU6ThApkPC/j2gfnKX4ZzCU9QyH1rpNpGdf+PY/v1om/EaA3+XBUSSvGg0u
 ZwBVbOaSugUaKBO0Zp4yES+IGtrPrhulQ3yLT8iIwKIbaiOaK8JxrpVpizbxUDlthRGWy3xGro6QKJ
 868xh2CJFzp3kgqjfrEBCtKL8OOhkgZL9jhAEI5bI0ct8=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Since generated code depends on iga64_macros.h assemblies should be
recompiled on it's change as well.

v2:
  - added warning to iga64_macros.h (Zbigniew)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/iga64_generated_codes.c  | 2 +-
 lib/iga64_macros.h           | 5 ++++-
 lib/meson.build              | 1 +
 scripts/generate_iga64_codes | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6638be07b356..41be66f74486 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
+#define MD5_SUM_IGA64_ASMS 09d72b5fd1f62c8c2905caa80f400567
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index 03cc726d48c2..6459b524c3fd 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -1,7 +1,10 @@
 /* SPDX-License-Identifier: MIT */
 /* Copyright © 2024 Intel Corporation */
 
-/* Header used during pre-process phase of iga64 assembly. */
+/* Header used during pre-process phase of iga64 assembly.
+ * WARNING: changing this file causes rebuild of all shaders.
+ * Do not touch without current version of iga64 compiler.
+ */
 
 #ifndef IGA64_MACROS_H
 #define IGA64_MACROS_H
diff --git a/lib/meson.build b/lib/meson.build
index 3d459c7a3bae..207b6e18519a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -250,6 +250,7 @@ iga64_generated_codes = custom_target(
     'iga64_generated_codes.c',
     input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
     output : 'iga64_generated_codes.c',
+    depend_files : 'iga64_macros.h',
     command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
 )
 
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index bbf1f7008242..652bf01a080c 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -40,7 +40,7 @@ while  read -d $'\0' asm; do
 done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
 
 # check if we need to recompile - checksum difference and compiler present
-MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
+MD5_ASMS="$(md5sum <<< "$(< ../lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
 MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
 
 if [ "$MD5_ASMS" = "$MD5_PRE" ]; then

-- 
2.34.1

