Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E8D65C6C
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC61E10E26B;
	Thu, 14 Nov 2024 10:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f09M2lWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFE410E26B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731580310; x=1763116310;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=9jykRE8WjZXE+oIxt+0meSpFjsMNMoDFjWPUbNR4Zro=;
 b=f09M2lWFwdJfw9G3LPvvuuZyhkh6KIau6KxIz44ZMcNcG+qf8nVTORPj
 Fr4q11DlTYu2wvk9ur6GrBKZQUJRLLaTpSbuvjaOqU9JgdhkoMo5/PhMI
 pdQA85bC93HRfFKhKt95A8uGuw0dGHEKdFcAY1SC56vkLL2jWKGWCAF9K
 TDiKrRJf4XFylC8uzkD7qR8I+1LvN095LviHirJa2/xvTuBiYkJx4UQJa
 5nT+TiNgx31XOHcA4yM4RoUcFedpSGvMhnvVIVFzRab9+BGNI7GajwIpD
 DIC5tziR7ZoEnI5HgS9Szp9zD6lewgj2yt9JTALnqIrhKtSU4nAUCnCmi A==;
X-CSE-ConnectionGUID: izPdK9lQS7K/tAQEr6hzzQ==
X-CSE-MsgGUID: +Mdpu0XjTvmHN4z191lrmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31380136"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31380136"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:31:50 -0800
X-CSE-ConnectionGUID: UMig8MHXQNyDyMbYz75A5g==
X-CSE-MsgGUID: Zp2qK4P9TES4ocTjC/UX7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93096097"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:31:48 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 14 Nov 2024 11:31:38 +0100
Subject: [PATCH 1/2] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-gpgpu_send_rework-v1-1-e0914e09e7b2@intel.com>
References: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
In-Reply-To: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=9jykRE8WjZXE+oIxt+0meSpFjsMNMoDFjWPUbNR4Zro=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnNdGRX4fpxuPmBfbcNYp4SKAWl675+qBUlwRj3bV5
 QMX2sEqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZzXRkQAKCRAjYrKT3hD916lpC/
 49DY4OJ4X+KoupQcsIFnK1kmFsCPwvzyBM/wu9ZNnKRo7H+GkjmE5ynEfmHc+xSL2e+Ieh2acaBwrq
 EUvX9kJpGJS9bNc9rxyi1x6aHkODWfFPsq5I4/IC+hrLRP7uN1OjMGfk9uMEJlEMi9l4vY/zBfaUtb
 qXV+d4+suR0f3Rw4yyHkZ5kLY5gqLQXVbLd+NjSKWQksztXn3UvYiwHt5+SVtbxliU6hIVhFawtM+m
 G6v4q40NpkFCVJ29lTiYRctqwtF6NjlpDjJvmguBsfPG9PgDM/RUrs87fEDsSV5LOy277QH4pTNND9
 bX/8nDAScUYIepm47cPpHkDxDqtAOqTQF0Q/jQiLx06szozvYhrg8Duk25gFQgyBcHgItB5gUdJ6vE
 1WRCbH76Hjb7QKJ7+6UGPtddimcg4iQhtiEjZGI4vBRIf1H9jIPQSK58ADPAjv2ZCYP81lVFkhQSZ/
 31nYWcG+t9nbgqUOupgwV/dVAwDCNaeVFF+vLL4T2AC24=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/iga64_generated_codes.c  | 2 +-
 lib/meson.build              | 1 +
 scripts/generate_iga64_codes | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6638be07b356..0bd92b8c4dc9 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
+#define MD5_SUM_IGA64_ASMS e2d97ef45d5f322200793a0aa76872d7
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/meson.build b/lib/meson.build
index c3556a921adf..cec148388b77 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -248,6 +248,7 @@ iga64_generated_codes = custom_target(
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

