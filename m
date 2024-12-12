Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DBAE77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 10:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233010E07D;
	Thu, 12 Dec 2024 10:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QW5ZELJQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E7F10E07D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734000764; x=1765536764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdVGnhbAOJ0Gv2W1A35eXBE5I6NTabeqladvZ/kOtD4=;
 b=QW5ZELJQK57biC/7CrXzrdeNSwQv7rqlxfrgCiKQlh5uOCo9RXPMpwnw
 j6UZiJiyvaxcchicMUBbdXOLWr9bev+Vloz8Q/4Mnrfp/Yjrliu+Bcujv
 CsQK5JEub9+mfNN0xNGqTloAkdrIjJFU0pFnS3Wh75/YhD07IOGOU+WVx
 zn2IAJbWgc3asIYtn5C0jeEsB8ZU7oM0CJdFycuHZkFQKA3oq3/sxslwb
 0PUeAnxdSqKN7PRY4CmfQiu0w+qSEwWUoXZiVrgdGOjHAQHtYBUVmkV/I
 GS/yytYPXqFv2wEtPY+vDSH6beESD50yzfB3fqUFCALpAvHLGhakZ0J7p Q==;
X-CSE-ConnectionGUID: X+NyEN9DSneOYeKtWXtpUw==
X-CSE-MsgGUID: dNGmKVkmS7WiN+HgcXfO2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59810642"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="59810642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:52:44 -0800
X-CSE-ConnectionGUID: Fnz7FZjmRpmP6m+qVfP4Iw==
X-CSE-MsgGUID: AZeMV2LrR7OIkLtPMOapIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127191860"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:52:44 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t 1/1] scripts/generate_iga64_codes: Fix dist build
Date: Thu, 12 Dec 2024 11:52:31 +0100
Message-ID: <20241212105231.49481-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
References: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
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

Distro building is running script from different working
directory then scripts are located and this makes script
to try regenerate its files and it fails with:

scripts/generate_iga64_codes: line 43: ../lib/iga64_macros.h: No such file or directory
Generating new lib/iga64_generated_codes.c
Generating iga64_code_gpgpu_fill for platform 2
<command-line>: fatal error: ../lib/iga64_macros.h: No such file or directory

Created workaround for finding the file path and if this fails,
bailing out with warning and no regeneration.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/generate_iga64_codes | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 652bf01a0..56419199a 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -32,6 +32,18 @@ while getopts ':i:o:' opt; do
 done
 LIBS=${@:OPTIND}
 
+IGA64_MACROS_H=../lib/iga64_macros.h
+if [ -f ${IGA64_MACROS_H} ]; then
+    IGA64_MACROS_H_PATH=${IGA64_MACROS_H}
+else
+    IGA64_MACROS_H_PATH=`dirname $0`/${IGA64_MACROS_H}
+fi
+if [ ! -f ${IGA64_MACROS_H_PATH} ]; then
+    echo "WARNING: cannot find ${IGA64_MACROS_H} in path, skipping verification"
+    cp $INPUT $OUTPUT
+    exit 0
+fi
+
 # read all assemblies into ASMS array
 ASMS=()
 while  read -d $'\0' asm; do
@@ -40,7 +52,7 @@ while  read -d $'\0' asm; do
 done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
 
 # check if we need to recompile - checksum difference and compiler present
-MD5_ASMS="$(md5sum <<< "$(< ../lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
+MD5_ASMS="$(md5sum <<< "$(< ${IGA64_MACROS_H_PATH}) ${ASMS[@]}" | cut -b1-32)"
 MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
 
 if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
@@ -90,7 +102,7 @@ EOF
 # Compiles assembly to binary representation sent to stdout.
 compile_iga64() {
     cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
-    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros ../lib/iga64_macros.h"
+    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros ${IGA64_MACROS_H_PATH}"
     eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
     cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
     cmd+=" $WD/$asm_name.$gen_name.asm"
-- 
2.47.1

