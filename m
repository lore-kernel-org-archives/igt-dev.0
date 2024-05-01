Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F29CC41513
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F6C10F1D4;
	Wed,  1 May 2024 17:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7JhT+SA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CBC10EF57
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714584791; x=1746120791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0+7GjVqtDyAgjWkIYJ+ogZ+Sd8WsRyBgIparqxYSWc=;
 b=T7JhT+SAj410F922/FbPP1xpCI8s+D66NmaspWBRGaZtCl8du1qCQQrO
 cbGsMGkckEDtMbwTK2ZtIk0aAPmCQ2id77YKSWaqVCAGfQCOKgwhLXJAT
 KjO6dug9Se1lemjS70ioe6PA9Z2hagA3LOrdBGn5DavUZhfmDA7qktMhz
 rOKSwCylTFlrdcAfgxBqEbLVEvRdXu6GcnBAB1mqenkCkwFETBvG1Zjtd
 lbuj0Pz4YwoEQsLLPWSdczfSxonCIN3oF34AO45H1T/d4cA0r9YYe8mPe
 Kjpz7bufiFzWYmvpsqwIZ8/PFhsHJBQxqxRMldCdhWLxQ9+eFSmVst110 w==;
X-CSE-ConnectionGUID: +2jrJCfnRUy1grdi2eoNhw==
X-CSE-MsgGUID: rc9mzYIAR8KRhzexcSpNyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10497103"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10497103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:11 -0700
X-CSE-ConnectionGUID: QPwwpKmkT3i5vllFH23V5A==
X-CSE-MsgGUID: eHDKHGD8RNSPgjHT5pyTbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26721818"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] gputop: Add option parsing
Date: Wed,  1 May 2024 12:33:01 -0500
Message-ID: <20240501173303.115737-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240501173303.115737-1-lucas.demarchi@intel.com>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
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

Add skeleton for option parsing, with just a -h/--help to be used
for additional options later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tools/gputop.c b/tools/gputop.c
index 7fd9e9790..481e79753 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -292,11 +292,62 @@ static void clrscr(void)
 	printf("\033[H\033[J");
 }
 
+struct gputop_args {
+};
+
+static void help(void)
+{
+	printf("Usage:\n"
+	       "\t%s [options]\n\n"
+	       "Options:\n"
+	       "\t-h, --help                show this help\n"
+	       , program_invocation_short_name);
+}
+
+static int parse_args(int argc, char * const argv[], struct gputop_args *args)
+{
+	static const char cmdopts_s[] = "h";
+	static const struct option cmdopts[] = {
+	       {"help", no_argument, 0, 'h'},
+	       { }
+	};
+
+	/* defaults */
+	memset(args, 0, sizeof(*args));
+
+	for (;;) {
+		int c, idx = 0;
+
+		c = getopt_long(argc, argv, cmdopts_s, cmdopts, &idx);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'h':
+			help();
+			return 0;
+		default:
+			fprintf(stderr, "Unkonwn option '%c'.\n", c);
+			return -1;
+		}
+	}
+
+	return 1;
+}
+
 int main(int argc, char **argv)
 {
+	struct gputop_args args;
 	unsigned int period_us = 2e6;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
+	int ret;
+
+	ret = parse_args(argc, argv, &args);
+	if (ret < 0)
+		return EXIT_FAILURE;
+	if (!ret)
+		return EXIT_SUCCESS;
 
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
-- 
2.45.0

