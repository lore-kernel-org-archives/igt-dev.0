Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF9CCD1284
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E68D11393D;
	Fri,  5 Apr 2024 06:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADIBhhCI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC966113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296874; x=1743832874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k13TweCUhYQJ3xG6xUsLtFJU0++x8izoNPja29qjGWs=;
 b=ADIBhhCICN6zyFjUtLNjqnrZEoBm6kq8k7ejHG1aZw6Tum2EEAf3zWBV
 BYr2kSL+/OZL/3bHTToT+MP/arz914fKID4XclKG2rVaaSfgwGH5p+NpV
 yNa0D1mgeCpYuZLUWYqRDttcHbyMGEPj8zF6IBtlgiDae4qKIgVC+Iapy
 PUZ9+eQFodnTOT8zgGsjhgpqjyjL2TxyMMXaMu7trF6cZgROsh/0697Jg
 BX+rU45lLxznBeB2wEfiGMeKPcVx6k5jiF0qzZdwQVhqFd5GSRcq5/MHy
 F1Y5ayh9znwn0diStmK7nsykPVGEQiyoipGp3fQ+IVXMjiTd3R691XqHM w==;
X-CSE-ConnectionGUID: REbNMwsYScShQCLhDTYBog==
X-CSE-MsgGUID: DMtERuq3RryzeBaNlXlqyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121754"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:13 -0700
X-CSE-ConnectionGUID: aWR3aUiUTWGiIfmkCpJ4Bg==
X-CSE-MsgGUID: JPVGuW9nRceyDFFJKbtRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615838"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 10/12] gputop: Extract method to update console size
Date: Fri,  5 Apr 2024 01:00:54 -0500
Message-ID: <20240405060056.59379-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405060056.59379-1-lucas.demarchi@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index b13044b50..1f349b3ed 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -243,6 +243,23 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 
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
@@ -258,17 +275,8 @@ int main(int argc, char **argv)
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
2.44.0

