Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D2E77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 12:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCC610ED9A;
	Thu, 12 Dec 2024 12:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmpaF680";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2C10ED9A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734007549; x=1765543549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=u0XkNOHjQttBc7smcyx4cqm1eAw+ucLwFOAB7US2kxY=;
 b=XmpaF680vxVHD1cQpMlnylWvI6wqUIS2U0udmLT1XMky6xSebr/ULXUg
 mPVUuC1189faCWM7PNOlq1cRGX6r0B9P0uVXJ/lmQBp0qzIDPtcK/21Cd
 kbkRAsodT3/rnZSah6+u7Nn4Rl7VZjQ3Rvmxb33dwDsKlu2cLTeOycGdT
 81t9etdto33hA3Q0Lg/8nKPApXNWqVPu2g+TY/gx2ZZXGtlNb/fvdsv4V
 Y3I6FpidNVZr1gK9ueffM0Mz1cLM+JiQUFhTYbUzPfCcg7Hv5aDDzn+W5
 xgXV/H+CJeZCnOrhaF3d2E/BD2SXa2qnn8fO4FNydOgD7RGsE5S1Gr4Fy A==;
X-CSE-ConnectionGUID: aTg7DpMlQeq8F972Vdg7bg==
X-CSE-MsgGUID: Y3GMqYvxQH2YmjfJXrZM/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34662361"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34662361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:45:49 -0800
X-CSE-ConnectionGUID: 1BywYJwsSUewwsY7I2tpvw==
X-CSE-MsgGUID: 2EFP9jvGSmOOAwcLcpvc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119467893"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:45:46 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Dec 2024 13:45:39 +0100
Subject: [PATCH] scripts/generate_iga64_codes: fix path of iga64_macros.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
X-B4-Tracking: v=1; b=H4sIAPLaWmcC/x3MQQrCMBCF4auUWRswaSrRq4iEaTI2szANMypC6
 d2NLj94799ASZgULsMGQm9WXmuHPQyQCtaFDOducEfnrbPO3PkTecGTjw9Msmps+CxmSmMIYcp
 jPnvo3ybUh//u9dY9o5KZBWsqv9qrKez7FxWWeRN9AAAA
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=u0XkNOHjQttBc7smcyx4cqm1eAw+ucLwFOAB7US2kxY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnWtr59IB3xRT2eT8auIDO7OMORlWwwz3XtAm9cGDZ
 t02ZYwWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ1ra+QAKCRAjYrKT3hD915REC/
 9X/IH4/d98Hy70vdCdDe1J8rRrXo7Yf7sss+8e/DKgcB3zwlMDBrUO9PRI6OVojfh8J7lhmxVwpsfU
 QbiOjHiTxmgzQ33NU5OE6B73F5unt0guLzgPTKPr3WUFIdwjD1OFV1mQayKHVtBfU90PzNJKlVMJcZ
 son+f6zUG/ch/2fF4bCN8I7tQJglQKBL5bLn1s5kRd1dGgM0F1w9lAB/QlC2yIPP4roQv4OFzpidlO
 OM2YnJRoLXSf05SabWuqH0mZfvmLQ8AGlfLUPEL+81TO26XqqLPTtPs9Q81dh174zQF7Tv3Lmay8iI
 +f/oYW1LadGVLuuKCOnT6XQYVt5FqtkkHwDmCJfS5vzP2yT1ihxK1whKdvykwuYepaZYL4Xljb4QlJ
 vqz4R9i0TMdgDRz63aAJ1/X/Z+T26iePWuaPbUdep5niENvMmq2Y4k1zGDcH9C211ByZiR3LFxxRnn
 moErMmpLuRQhzIdZVhb/1MJeYYtUYaZ4aRsvVo2kvhyGs=
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

The build process fails if the build dir is not a subdir of the project.

Fixes: cba1773fd01d ("scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/meson.build              | 2 +-
 scripts/generate_iga64_codes | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 640513e6c52c..beaf43dffc5b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -252,7 +252,7 @@ iga64_generated_codes = custom_target(
     input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
     output : 'iga64_generated_codes.c',
     depend_files : 'iga64_macros.h',
-    command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
+    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
 )
 
 lib_intermediates += static_library('igt-iga64_generated_codes.c',
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 652bf01a080c..3f207e9ff1a8 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -22,6 +22,8 @@ die() {
     exit 1
 }
 
+: ${IGT_SRCDIR:=..}
+
 # parse args
 while getopts ':i:o:' opt; do
     case $opt in
@@ -40,7 +42,7 @@ while  read -d $'\0' asm; do
 done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
 
 # check if we need to recompile - checksum difference and compiler present
-MD5_ASMS="$(md5sum <<< "$(< ../lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
+MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
 MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
 
 if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
@@ -90,7 +92,7 @@ EOF
 # Compiles assembly to binary representation sent to stdout.
 compile_iga64() {
     cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
-    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros ../lib/iga64_macros.h"
+    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
     eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
     cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
     cmd+=" $WD/$asm_name.$gen_name.asm"

---
base-commit: 7812065f4aebab1629b570bd78ef71e09480b359
change-id: 20241212-fix_iga64_macros_path-5c38885d3d94

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

