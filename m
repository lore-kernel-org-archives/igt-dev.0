Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745EED7879A
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1410E9F1;
	Thu, 21 Nov 2024 17:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTTh/mkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086F710E9F1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209206; x=1763745206;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bW7lKXeo+FBI9p9yKWxpWkiE3jhugedigGrJG7jBZYg=;
 b=MTTh/mkCBfe8eRH+mdyFbIkrT2jj3lJvYv3Qm6kfdpDGitmw4MLr0TUJ
 B32GgFNQwSXNvPcOhQLObW3egXUFb1tXE3sTW4ybk/EiRBHOeGPZudgPI
 fLap2DzYuXrPJpUFlXKHI8rDrV3xty5kmVH9bpytExz5UW1gFuN8ytWJo
 JftgO6P5K68f3Ruga+unRKGxXSigLg3dqFb/6PYa/7zQypPqhmX7jhzlX
 deldU9W8VAbQRPAvnXXCo8lo9n+NgfCP/QImqDqZo7KSOj5wLGrAORoN7
 ojC9979cY4XM8FdL8j3ElrTp1+mGXsEff0Fn92BJfNmiFnDXmaBqM49jA Q==;
X-CSE-ConnectionGUID: YOy2UvTUTTy+BZ9sGyT6zw==
X-CSE-MsgGUID: p/a10ZBKTSSeJKUA21v49A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42953410"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42953410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:26 -0800
X-CSE-ConnectionGUID: PqaHgCrRQhaBQv1QP66M3Q==
X-CSE-MsgGUID: IUsUCnlqQzq1h1zKbzzHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95365427"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:24 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 Nov 2024 18:12:49 +0100
Subject: [PATCH v3 1/4] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241121-gpgpu_send_rework-v3-1-0b6aa48ab006@intel.com>
References: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
In-Reply-To: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
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
 bh=bW7lKXeo+FBI9p9yKWxpWkiE3jhugedigGrJG7jBZYg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnP2ovIkQ93yzKwBFIf5b5Uj5FkJgHbQI59T/+p1Kp
 8w0gcb2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZz9qLwAKCRAjYrKT3hD91zuWDA
 CJwfyk90pxuviWW+8Tv0p1yVgXhE97RGz574BIJVmYE+x1ojeOO0ylq4KfXcSvbEq41a3ephM789pj
 C+WeOVLIKlG0mfkMAuZ8TiHG0/ZcQsqKsiU86efkcjMtcl+zd6w2Dxp1bivpzdMw1eRP3PsoQLYXBT
 jGMDY+gqTTma40rUL6/z5WTJ76iPFI8FttI3PHD9gXnAuwTUIh5t7ZXhFBRnsgdPuDkhwV+5jVAijE
 n1lDNhYQrEzhli9aEyi3PJok+aCuyQnbjtkxS2rR/UTM2UWGqIP+YPIsAurN1HvqaEYFc8fgEDS4kD
 qiptPuf5pasgCGYitLFjooJcCbxoPczBNe0QdFew6giF7pIOMn80u3WhHxv1ZBbqp5ZsRY4tB5HB7F
 QVFgWcPGJiW9eMzYGz+EGnBlf5DDedxxG9BNf7MlJv9FfCGfSqCVoMt84OVooccxGuhxwjKmG6lXFk
 dU9hX1szDm9X1f410/22umijuwRcZ1oJ5lvUbsIsD3ZiQ=
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

