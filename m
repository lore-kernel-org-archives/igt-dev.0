Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AA5D1CA38
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C0010E525;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktMe9s4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D7C10E520
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vjxI00B99gAIadntN9MZz6xkWCaAargmd8dw8CmjMOQ=;
 b=ktMe9s4xozAbRaUCO59XHTK1S/mI7clH4JWRNegrvrdV1D1RY9gAnfLC
 VIcNsNNInOezGpnFU6U74bZ+wetg305ZB5+NQkOZwmAecc/D7dGn2taTe
 81noKO0XfOu2GUNmq9UdXObApvCLYdcrjmOhcXMaGezugCmZddXdb00Bp
 mEUwRhE+LMq3xf0ZlR4D4XcaxyBvf+nPkWlJneRgGA4NYmfvsZhEhvJDA
 tw0n3L++Q8A96ltp9R4yFBy+00aG/5hgt0OOOZhqG2EtoBc+EEBP/2Teg
 gGJ+D772lN9ALzmwFmj95JnatHqvlPSjoHZwNppPtVMVAQxnznnxdD2C2 g==;
X-CSE-ConnectionGUID: bLNtkArsSBuRyO8/WBNdww==
X-CSE-MsgGUID: b3/gyX3sRPGAI+Nu21XSQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133564"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: 9SC+if76S8yvh2kpZ4OCuQ==
X-CSE-MsgGUID: KXW+GCZ5Rly4OThTV/4K7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781721"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_kmod: Remove unused module_ref
Date: Mon,  4 Nov 2024 22:18:37 -0800
Message-ID: <20241105061845.2486557-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

This is unused since commit 03706cd84099 ("lib/igt_kmod: remove the
conditional audio removal code"). Nuke it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index fb83f17c0..d031bfe18 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -593,14 +593,6 @@ static int igt_always_unload_audio_driver(char **who)
 	return 0;
 }
 
-struct module_ref {
-	char *name;
-	unsigned long mem;
-	unsigned int ref_count;
-	unsigned int num_required;
-	unsigned int *required_by;
-};
-
 int igt_audio_driver_unload(char **who)
 {
 	/*
-- 
2.47.0

