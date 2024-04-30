Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F3AC19F4F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54861112E70;
	Tue, 30 Apr 2024 19:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksrEZ/aD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A4C112E6C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503689; x=1746039689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84pG65xfafATRDEUI15keg25WW/JWPm3j+AQuAsfD0w=;
 b=ksrEZ/aD4GYc2iwjK77btWkXSKAY+Nunjj7EVWNZJSC+uRokSHekHLhi
 36gBPcuEYYkhR2EqSkR0UUzZ1tE4ViGTpVzBYZSJ7SbGGEH/Ih3diTxtI
 AevtjVN4nDIWwj/wFb/V5bPyS1/XJI3/IC129gr2liO9hqJKcv6EiRNeo
 TkHFHolwzm+0IiR9UvTILfSv7q2z2Nw3+yDZD67f+4jF3tJaCC/f81iqE
 oQZdscU77mRgT+a/CAuQUp+XYNeXChAfwKd0AlNSLdBekTnUz21bjlslM
 LeenhYPaMHhGOfrGSiuLn598bGlnk1VdDocqtfnsWBdDBwu3CN0ZGT1y4 w==;
X-CSE-ConnectionGUID: t8rbB8eiSwqT4LSwsJiPtA==
X-CSE-MsgGUID: 86jMZKwnSdicg6xUcbbIaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025096"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
X-CSE-ConnectionGUID: oVwjiS93ROuFcrLo0wVF6A==
X-CSE-MsgGUID: lUGJcWhwQtKufhtPYaHu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [CI 5/6] tools/gputop: Extract method to update console size
Date: Tue, 30 Apr 2024 12:01:49 -0700
Message-ID: <20240430190150.3654507-5-lucas.demarchi@intel.com>
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

