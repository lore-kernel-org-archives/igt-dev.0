Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B267ED4920E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E1410E5B8;
	Tue, 19 Nov 2024 05:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHs9DhpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77310E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YoEr6xfu3LA6sw8w/CXJNzDankHwaSiVej8NX+w1cY=;
 b=aHs9DhpGQ/1nTvoKN2d3j2xb2fGxiZqNsOuEzvnjU1pOP6of2woAwmXu
 dGTmaJoPr6Q7GwLPowAaHYX0o68xxHL1rc0h0xLKASPITZIVvwd8HjEve
 kMNFBo8+oNS9h+stIgSWPOPHXdkJo+KfBbOGn5y5qXMsJgULxO7RGqPzz
 oCcu5p2qhCk68zLq8Bdl/Ko9tI+WOOnDLDRWYST/JH8ahW4OvCLCvyCok
 /BeeiQZQAYoWmpUElO1YN7tdy5WvGK5k8M1t7jTyv2wVekQmhxlPCxbd/
 hfMPS/JoyeKQUPBSXRriOAsSyECP/hp3R8OUqsR5b+WtPUBQvrHEIxe4G A==;
X-CSE-ConnectionGUID: CnAbVDh4Qp28X7JNh+gaTg==
X-CSE-MsgGUID: a7N0CwirSrqAVUqx4vCNgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884742"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884742"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
X-CSE-ConnectionGUID: bR/+635WQ9SagMWiHZ5TEA==
X-CSE-MsgGUID: fMzMEDAXTpOe3JJDWYlH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865114"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 6/6] lib/igt_kmod: Do not leak kmod ctx
Date: Mon, 18 Nov 2024 21:29:54 -0800
Message-ID: <20241119052954.1993905-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119052954.1993905-1-lucas.demarchi@intel.com>
References: <20241119052954.1993905-1-lucas.demarchi@intel.com>
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

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 3f77a0c94..eef3657c3 100644
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

