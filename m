Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2343DD6DDF1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 10:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BD910E002;
	Fri, 15 Nov 2024 10:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoU2351R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DB710E858
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731668368; x=1763204368;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bW7lKXeo+FBI9p9yKWxpWkiE3jhugedigGrJG7jBZYg=;
 b=CoU2351RUaJHGRUGjtOVJj3pNfkgox+QdSt5WKr8OA0xDq/amwkgstG+
 H0WtYYrp3cbFNHKVk9DiP2LVwpJQGwZzdVWX1d0jADVfkOXE8sGE8GDIr
 jdeiM94WEFZUIXOR6ftMnyVlCwR0h9ACDLXV8/YB+8BESQ5VgQXbrSjlV
 6hPnFPd90MSeOqcyCQoeP521HXKmJSRUz7iPJnfznHza7xYhcQiXg8LIM
 Q5+qigo6/PVWxMU5f1DQHoWh9rfSYdKVYbdUM9zAq/rqkjbPD3cKfAYc3
 VoK6PyuAHkkSSam/+6AGdh4vSOd/fSaRyla+GIKz5JvddzlRFz/45suS2 g==;
X-CSE-ConnectionGUID: c2pVn7ILTUeHlmUAR5r3JQ==
X-CSE-MsgGUID: C8TDd6i+SWixxyhgXfQM+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31824703"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31824703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:59:28 -0800
X-CSE-ConnectionGUID: 6jLvn/hhTEeDCgwAcH6xhw==
X-CSE-MsgGUID: bJsxhCYDSaqsjr/BV9tDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88948334"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:59:26 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 15 Nov 2024 11:59:11 +0100
Subject: [PATCH v2 1/2] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241115-gpgpu_send_rework-v2-1-d1c84135aaaf@intel.com>
References: <20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com>
In-Reply-To: <20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2700;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=bW7lKXeo+FBI9p9yKWxpWkiE3jhugedigGrJG7jBZYg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnNymMEdlO8gRoslnxPrUrnJvHE5bCqveFp8k49Pgk
 DZImYiOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZzcpjAAKCRAjYrKT3hD911/uC/
 oCei9h8qYsr28RvWWuxw8ZRboJ+nXpJSS2fN+8KqO+UhD+4TRqlV0OCIAINwtNPwXEFJAgkcusfzuX
 9jIcVxXTqzhWS7qjoPQvcj2ulPcZtdEbR00Xp8haJEyCml7sA6VDLFiFfvRpp+CMUTJtQhmEypyGtN
 K25qMIdClMlzN4xGOsBF37o3EtK4wMaSZW3HMKCxT+reUeNQHlPEWnqSV3//eFAlHFWG89XWs2PSXN
 ZelnK05Ml834Z2XNUKPC1i5cAG7fIbT1D+N9UnYf1nlHFOszBy8yVPMn+yjrF+MW4799fg1HEtyf9z
 TkUcWx2guymiRlU5ZI2FrVq5yjlIm6XghHs7PslXAyk8y25Ft9jmTydUOuSpmlSNpvhDNktA57HDLt
 TSn1FZc8PrWX22kI9w4w327458EIDrANiar3OePDrDU9UU5/VCHvXbpktZFw/xePX/+7IjWDlYdsCq
 +FjjKnZxTjNlMwztyYmweeP1Pa9e9cyHjMNC2ffLGthkc=
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

