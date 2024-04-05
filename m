Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EE1CD129A
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77EF113940;
	Fri,  5 Apr 2024 06:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkhhuOH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CBD11393C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296875; x=1743832875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7TerGcemT6KK8OqP9ZuZfPpwRHgnIt4MdwQHhPAo1aE=;
 b=NkhhuOH6Er210/KmuoeGI6uVx8t2HM6gX9MWfifAc/EtivzRtv+NeJmH
 eJuk2BEJ4/v3Xifjdm90OyPkZsg+LYqw3eoOBpk2hxMrFYZt3vm350sGl
 /BEPI9jGiVp0144c9A0LyH+JWr0YQ9/rrjnaRp3rO+uRcIRErHvyi0O9T
 5Cf/RNjC3etkVMFUmlYcBx2IDiy45sRaYQYXbKR1r53aCulIBpUjY9937
 COGN8Bb2fDuhy8lJ5ndld+l3js0CML3vDkrBmBCj7FI58/UjF9YEzTY7W
 CKRmAMFRAyIXZqeuCIgEEqut3WzN8N7R1yGq9nl2PjgvFQaSOfB1Uz5M5 A==;
X-CSE-ConnectionGUID: mvtZ1lKlTRacOX7FWcCAEQ==
X-CSE-MsgGUID: i8Bkd/r1S2Kx9aFPbDj+1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121756"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121756"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:14 -0700
X-CSE-ConnectionGUID: CyzUVBkZTDGPlRW1topRxQ==
X-CSE-MsgGUID: Wj5JOYXFTK6+nyPcE/xDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615842"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 11/12] gputop: Extract clrscr()
Date: Fri,  5 Apr 2024 01:00:55 -0500
Message-ID: <20240405060056.59379-12-lucas.demarchi@intel.com>
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

Make it clear what the CSI is doing.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 1f349b3ed..ea23e1de5 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -260,6 +260,11 @@ static void update_console_size(int *w, int *h)
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
@@ -276,12 +281,11 @@ int main(int argc, char **argv)
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
2.44.0

