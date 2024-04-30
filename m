Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F936C10F16
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13214112E6F;
	Tue, 30 Apr 2024 19:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuLbYbD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0F1112E6D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503689; x=1746039689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOEwbXMB4g1HfWZBUdq8PKIEPjFG1eMh8pO+/zUITEo=;
 b=AuLbYbD+oxC30KYbnnoKLLJhuaUNQbflZD9iHXKSXd0S/mMYUZAC3tXI
 TjWfSjzfp5AowS5FeUSUyQzLvvHhODajUQxM/tGoH8j2RhQwJUi1V6KPp
 TGCtS2ZmiRmH+BpzyHa0GSe93fbrda0F3SBBZzOySdDoNQ//+YwUrRj3B
 K3DkKcBaX4YwNpJAe0kVMSAXZViFwwOKxolbfV8MVeG4wFeATSCFX40Af
 x8dOQhO7kG+StoCgl8deh/JLnaHdKPeRPG+DYc/eo9mX/DSy6PUi6vBzK
 D60jbdOnteI8c2Jq5zw5JdIud+2Vtnfc2lNyaS4UWPavrxu9xONzYGWdx A==;
X-CSE-ConnectionGUID: fKIV9JTCRcGDS8uczwPWiA==
X-CSE-MsgGUID: GHNPbukESO26/0HYdvaXEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025098"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
X-CSE-ConnectionGUID: JOxdi9fJQB63dXg4Hk4AQA==
X-CSE-MsgGUID: YoGeZ/xSTRSizalEIGug3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570801"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [CI 6/6] tools/gputop: Extract clrscr()
Date: Tue, 30 Apr 2024 12:01:50 -0700
Message-ID: <20240430190150.3654507-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430190150.3654507-1-lucas.demarchi@intel.com>
References: <20240430190150.3654507-1-lucas.demarchi@intel.com>
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

Make it clear what the CSI is doing.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 455f77d0c..8cec951b4 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -285,6 +285,11 @@ static void update_console_size(int *w, int *h)
 	}
 }
 
+static void clrscr(void)
+{
+	printf("\033[H\033[J");
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = 2e6;
@@ -301,12 +306,11 @@ int main(int argc, char **argv)
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
 
-		update_console_size(&con_w, &con_h);
-
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 		igt_drm_clients_sort(clients, client_cmp);
 
-		printf("\033[H\033[J");
+		update_console_size(&con_w, &con_h);
+		clrscr();
 
 		igt_for_each_drm_client(clients, c, i) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
-- 
2.43.0

