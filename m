Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F52C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856C10F32D;
	Tue, 23 Apr 2024 23:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRp+zEd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F11122AF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOEwbXMB4g1HfWZBUdq8PKIEPjFG1eMh8pO+/zUITEo=;
 b=bRp+zEd8Kf+OAP6XmGghDA1w6wrLH1c/I6IG1ZFs6fV7Iip+VAKOx/Vd
 9xFyCEI78nWYlIOZD3fQHOmKyEx620YnAE3K/Ssyhv0teiYYRonIGMnFN
 QbZvexc/HSPtedsEk6EdK7T4AqoTWCiL5NTKoXF+Eh8qXbDCFtkGGHIbP
 k+Bk/1pr4rlF2qhhkdsEjNZ994kJuVWAyTA+hoa+iED/j46wOSLC4vxGQ
 YHDAGj6/4OT7eCSr8pfLUXV1NYFk2R4hKg469qGTtlXiJAvyLxQ33RuC2
 W3AUtKZ/lQ0ABlbDFs3QXnf5eMhY8+0HUoRvQ9x5uzn8/9jJd8KYbj/E3 A==;
X-CSE-ConnectionGUID: crUUH6hzSoSzYaLaRjHyqA==
X-CSE-MsgGUID: wmNtrAexTNKgBNq6FphwSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361992"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: JqnKvY77SPi0nVkY9/Au4A==
X-CSE-MsgGUID: rgMU1545RPKTuO622aYUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180910"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 06/21] gputop: Extract clrscr()
Date: Tue, 23 Apr 2024 16:44:16 -0700
Message-ID: <20240423234431.1959354-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

