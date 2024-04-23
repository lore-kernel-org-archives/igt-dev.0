Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA59DC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F5C11376B;
	Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVGOvHtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2366113769
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84pG65xfafATRDEUI15keg25WW/JWPm3j+AQuAsfD0w=;
 b=JVGOvHtWyf5BS0zOv3ZITlHfY0rbkA8lH4Swl7BVdq0Zf81KWvx9K9dR
 2Ao1CFyrq4iqEltmAX3uVJq4dVxZEhE9es8GJnU1Wc7Jv1lqyFnwXD2GO
 Gp065hg/DWvO7dzxxVNtUMt+68addX4wrrg1KTAyCAbHCYt5AAWqHGguN
 Wn/aIrYch+9gk3+RnCEXlQCDtP13RQbekeQ+758QRu6XqLKsSP/akSdw2
 imgu6nhQXbxH3e8vf3TJsGHxfpUn00Wlwtpt307D1O/rrltsPTMKApttM
 Kmr2jRNBMPSOn7Tr9BNhMUEhjrdlVEqloVHJCJTK7JF8n7Owu+iUGemUu Q==;
X-CSE-ConnectionGUID: p7MJgaJ5TDidolXuKcMqNg==
X-CSE-MsgGUID: X/ICUsRuScKkmhuZNEi1ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361990"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: 1rWhGprKQwGmaTuJNicRYg==
X-CSE-MsgGUID: 5QBhbAilTByWV0Hsb0DN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180907"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 05/21] gputop: Extract method to update console size
Date: Tue, 23 Apr 2024 16:44:15 -0700
Message-ID: <20240423234431.1959354-6-lucas.demarchi@intel.com>
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

Cleanup the mainloop moving the console size handling to a helper
functions.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 8f81e6fca..455f77d0c 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -268,6 +268,23 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 
 }
 
+static void update_console_size(int *w, int *h)
+{
+	struct winsize ws = {};
+
+	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
+		return;
+
+	*w = ws.ws_col;
+	*h = ws.ws_row;
+
+	if (*w == 0 && *h == 0) {
+		/* Serial console. */
+		*w = 80;
+		*h = 24;
+	}
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = 2e6;
@@ -283,17 +300,8 @@ int main(int argc, char **argv)
 	for (;;) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
-		struct winsize ws;
-
-		if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
-			con_w = ws.ws_col;
-			con_h = ws.ws_row;
-			if (con_w == 0 && con_h == 0) {
-				/* Serial console. */
-				con_w = 80;
-				con_h = 24;
-			}
-		}
+
+		update_console_size(&con_w, &con_h);
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 		igt_drm_clients_sort(clients, client_cmp);
-- 
2.43.0

