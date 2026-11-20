Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3B606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AwRflOXP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763A10E277;
	Fri, 20 Nov 2026 15:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B376F10E04D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795189857; x=1826725857;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=RrftzSNRRlWrr4riBVnuVa3MpVPw4CLnjWjq/tZchTo=;
 b=AwRflOXPigLMoybGMRiCvp1FOJdv2HilawKkvbNuhNMsve+XdDCF7tyS
 wk3bDFsFPEBFsbe8wpkAnv4pdd3FcsAer7TVlk9iwpfIV456Xed0lOCpa
 CsIeJmGkWdG3ZtFzE/FGb0bzTh5x2E4KzSSAR0HMMl0gvr8FDUd59mJIR
 ScYp0NAv14SbdNuKUvvCjOeUNUF0Sy7I2CuwBKZ76yFpQpN9HSUdkO54V
 6ytwAmFXIAfai40/zxhghaxWkGAJ1lVgAeILcy8htmcTrkBu4f672FBbD
 RMbLjybEOvp94eAhkrc+p8EWIRML2o7Ch0Ahq8th2PWQ8XvOXlmGGva4/ A==;
X-CSE-ConnectionGUID: n/sivtkkS8ma2g+VgabfBg==
X-CSE-MsgGUID: HnzasMQETaW/l5r6YW9Szg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4079101"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4079101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:50:57 -0800
X-CSE-ConnectionGUID: /pfxC9ywSWix8Vzsc7gQ8Q==
X-CSE-MsgGUID: z64feaaCTG+Jg/3sAzxmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10806789"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:50:56 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 20 Nov 2026 16:48:48 +0100
Subject: [PATCH] scripts/generate_iga64_codes: do not check/rebuild on
 cross-build env
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-do_not_build_geinsa_on_cross-v1-1-ed5082a06680@intel.com>
X-B4-Tracking: v=1; b=H4sIAN9rAGsC/yWMQQrDIBAAvxL2XCEKtrRfKUV03SZbigY3hkLI3
 6vtcYZhdhAqTAK3YYdCGwvn1ECfBsDZp4kUx8ZgRnPW2owqZpfy6kLld3QTcRLvcnJYsohqVbC
 XK6K1HtpiKfTkz29/f/xZangRrv3Zi+CFVCg+4dxVXQSO4wtiUsLblgAAAA==
X-Change-ID: 20261120-do_not_build_geinsa_on_cross-202b579cc55a
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RrftzSNRRlWrr4riBVnuVa3MpVPw4CLnjWjq/tZchTo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBrAGvklT8tSeUgE+bWwd/Zu1YnqgNmTpkkPma+y
 GrixEmkKPiJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCawBr5AAKCRAjYrKT3hD9
 13KzC/sFQm9Lz6/3BvbpCH5+YE4zy5h68byWt8UcgrbFL9WUs5UTEbT6msS9dOG9OKcjX1VC0oD
 rBYOY3MlJir32th+lgrRc7TcBceueQk0+3W4FCt9WQkS6nx6FT677UKgVDAUIkiGE21O082dq4X
 bJIoKspZgy29kTkDeFrPeZmKAXHLxUP+dMZZvN/XScRmZM0Mu28DVgL2xLOGYYKvjg9sFBd0oEr
 WodXaPkz2yaPxshwk52mOf46iusZyIExEw92hsc2+qUKbbw8E+rxOCF0RNkIqQA5ll0x8ydtnsh
 9sAsMtoee1bG/eKPSo/7IlPq0VRmFyATpiQuzVr94ffYnv8rbXzbHwv6UaIaqOc9rQftTwJqVb9
 G5PiIQd/VBlo3sJeUSdqi8WixPdy5QkpJlw/cdrdzW6oWjBoD6d6HKQhO3pRkTolBQ+a3Tfh4zf
 nYNdjpNG35d6tEtUAIM4KbwJNpCkKF+AUMrpC7ubMGrQ+i9Ovov032Lb65z9VDOR7MJEc=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cross-building IGT should be possible, but checking/re-building iga64
codes is problematic in such case.
Let's skip iga64 checks entirely on cross env for now.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/meson.build              | 4 +++-
 scripts/generate_iga64_codes | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 32d5029b8426..3ed1369b53d1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -302,7 +302,9 @@ foreach f: iga64_assembly_sources
 		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
 		output: name,
 		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
-		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
+		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@',
+			   'IGT_IS_CROSS_BUILD=@0@'.format(meson.is_cross_build().to_int()),
+			   generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
 		console: true,
 	)
 endforeach
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index a5798bc596d5..6b0984c16f83 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -34,6 +34,12 @@ while getopts ':i:o:' opt; do
 done
 OBJ=${@:OPTIND}
 
+if [ "$IGT_IS_CROSS_BUILD" = "1" ]; then
+    warn "INFO: cross-build detected, reusing pre-compiled file $INPUT."
+    cp -p $INPUT $OUTPUT
+    exit 0
+fi
+
 # read all assemblies into ASMS array
 ASMS=()
 while  read -d $'\0' asm; do
@@ -46,7 +52,7 @@ MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b
 MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
 
 if [ "$MD5_ASMS" = "$MD5_PRE" -a "${FORCE_IGA64_REBUILD:-0}" = "0" ]; then
-    echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
+    warn "INFO: iga64 assemblies not changed, reusing pre-compiled file $INPUT."
     cp -p $INPUT $OUTPUT
     exit 0
 fi

---
base-commit: 792f1105b5f0e2bc254cf2254cc8f6aef8799659
change-id: 20261120-do_not_build_geinsa_on_cross-202b579cc55a

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

