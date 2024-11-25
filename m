Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3344D58D50
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 14:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB9310E3CF;
	Mon, 25 Nov 2024 14:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxzG2VsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE1D10E3CF
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732545236; x=1764081236;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/pZ3gT1p2Ua1v6LyjmtVNG3KQrpBGJHl4VoY9VYqjEo=;
 b=YxzG2VsWRdLNCHBrnRA5VCtyxAPUSD5VRFx/VCqcWp74IUEzmxbDPAC4
 o+urVsQaa4bDLrxuOjtWPhf16sJvg0SvHxmzwP5VEh+z1czJ2PUDZ1QAg
 TsnB7dGMVl6URy3m28n2pNizfmlqnOM/hCMcBWzLz4e+qF9YMEWlaJN+3
 sic8Pm3VfSyOzlCjXxRb83OmNYOFpqhzcD96rai1U2up5gt8NJrT5/c+G
 2Xf7mMIvntEFA5XmscGAANOaR4ZwST+oslaO9A7i0K5BeB/zRPvu3Y/Mi
 63k4SNnWYfi3NvIWCrWHbwSY/mV2uBY+XCNYDEwjAhCKqjkCjuPs70D2Z g==;
X-CSE-ConnectionGUID: B3Ahpp2DRMKMeij7jFZ83A==
X-CSE-MsgGUID: Zws788MjRmWte5oKpbBcBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50177108"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="50177108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:55 -0800
X-CSE-ConnectionGUID: qE/DXLhrRaG33RsEM17A2A==
X-CSE-MsgGUID: JoVrQlRzSN6BfTT7/Y2uPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96350011"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:53 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 15:33:00 +0100
Subject: [PATCH v5 1/4] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-gpgpu_send_rework-v5-1-4454df13e1e1@intel.com>
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
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
 bh=/pZ3gT1p2Ua1v6LyjmtVNG3KQrpBGJHl4VoY9VYqjEo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRIrNk4ZhR/JW/emTp9M2mnUn/eKESb/pp8xSoxd8
 Rw/aH0+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0SKzQAKCRAjYrKT3hD91zMXC/
 9MY4BMAuagSmH3gqBdoKWFIwq+TYCQ4HKsbG9FLrneia+zUbS3276aJgtvDm3kfy3P6OEHRIm4a3jg
 4FiQoyaTdjoRp+meOwtyxKRYoiebCwMmISICweSgP8ail2C3tVulLgaEDwuyHg/PpH0+z4OtX+sQ02
 EGcrNVzs2vTq9123foKoAK2DbtU3qqILC37xXFU4aQnAzQUiwDTtNNRR3fduhOG8J7THfBC8ag1ril
 9N1CnhkULummcON8t7XsxKkGhIPK48jor7Ul6pHZHOKhDdBB37mjDY3vdb5B+kJGrI+mk/9nuz6BSL
 uP+rUAqGDTTeLE/SEQ15fUFybu3ZeRD+Y/vq60ktZsLGxRl50xRhnhQke96GSpfohmRDIxSFhqRDV5
 +zGX9u4VWfDEI8ONi1/y3Wiuf++9aKbAqi9jxMVAQQmyo5bJ6QShMvECPDsuBzeruZCtVbXSIwezzy
 le9HW2HyvgfRT4NQNuuGmq+lpH+BEIzODJbTD7ap38IYQ=
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
index 9db6bdd95c81..7bece1452e30 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 85067cf5769bd5f5ab2a2abe5bdc9645
+#define MD5_SUM_IGA64_ASMS 4c0bba92477c23a16c976cf0d7ccaba9
 
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

