Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E05D5AE60
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470110E7B3;
	Thu,  7 Nov 2024 05:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ai182UJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFD610E7AC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730958798; x=1762494798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WUxtN1RA5cN/gY2pz8XjB7PotRn+Gl7g+mgrhiyfobM=;
 b=Ai182UJZ8bnuliJcSeg4yFSTacGgfg+1hVOsoh/Tx14LSenD3GlamwKE
 PoUEyi/n1u7JSASEOUqVq5glh7KX9VnomSmZCMtcSV++HVAS4gABb+DWI
 dcqGTIekBa/WBi0bXFRgNO4YRQoECMiavzphXaIYlPNFn+F8ypIHoXL/k
 T6Wrhty7+albJNSRCL1Uw8mp2sk1DUZ152fYRzdCOUTtOnMxDM584HNlm
 EoxyFhR/e2zyViKvQnaXeHcbdzFenPd485NKdHUWW/YmHiUvd9iqk85fp
 M/aMsbIhZ+FSxppRTJsonfYHbYRU24ryFy86DjpbrjH3nPKyMXE6fnzRk g==;
X-CSE-ConnectionGUID: 7jELJwacTmyrt25pEc6jnw==
X-CSE-MsgGUID: TSqiMtw/QTO2k0LUVFhWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41381735"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41381735"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:13 -0800
X-CSE-ConnectionGUID: fjocHVoTThKMXm7vpydeTA==
X-CSE-MsgGUID: ErZBAwExSfW1BEiZsoyLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84879402"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 6/6] lib/igt_kmod: Do not leak kmod ctx
Date: Wed,  6 Nov 2024 21:52:54 -0800
Message-ID: <20241107055254.3129207-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107055254.3129207-1-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
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

kmod_ctx() is used as a cheap way to cache the kmod ctx. Make sure it's
released when the process exit by using igt_install_exit_handler(),
which also guarantees children forked with igt_fork* don't free it on
exit. Normal forks are still susceptible to breakage, but if it that
happens, let it break so we can fix.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 7be95a61c..89736ae59 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -71,14 +71,20 @@ static void squelch(void *data, int priority,
 {
 }
 
+static struct kmod_ctx *ctx__;
+
+static void free_kmod_ctx(int sig)
+{
+	kmod_unref(ctx__);
+}
+
 static struct kmod_ctx *kmod_ctx(void)
 {
-	static struct kmod_ctx *ctx;
 	const char **config_paths = NULL;
 	char *config_paths_str;
 	char *dirname;
 
-	if (ctx)
+	if (ctx__)
 		goto out;
 
 	dirname = getenv("IGT_KMOD_DIRNAME");
@@ -112,14 +118,16 @@ static struct kmod_ctx *kmod_ctx(void)
 		config_paths[i] = NULL;
 	}
 
-	ctx = kmod_new(dirname, config_paths);
-	igt_assert(ctx != NULL);
+	ctx__ = kmod_new(dirname, config_paths);
+	igt_assert(ctx__ != NULL);
 
 	free(config_paths);
+	igt_install_exit_handler(free_kmod_ctx);
+
+	kmod_set_log_fn(ctx__, squelch, NULL);
 
-	kmod_set_log_fn(ctx, squelch, NULL);
 out:
-	return ctx;
+	return ctx__;
 }
 
 /**
-- 
2.47.0

