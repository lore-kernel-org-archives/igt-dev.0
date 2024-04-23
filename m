Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBBC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5E41122AF;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+v4DdE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6631122AF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XcSkXTGug4UoI5RLs2EuL/6Q4oTZA+vuiVwGRuoSGOw=;
 b=U+v4DdE0xxCTbp2/+VrM6CHgFwsLlEi0vVm/ipTBoVMYg7ndX9lmTFV9
 jpK/eXR7WQzYz9U0DGdFb0xZfoBN6Ajye+7b0X5vXDB2YedrOuT3w5wZc
 wyN4iB979Zhf/sGNbMoSyrIPvapgCOLeqowH+OeW/oDlFr4RqBq5gKBQB
 7Xn4goZcdorXdTyvp4ftfDMNXSNETAxkRw4g2Uz5sjKj5qUHyzdVvKnXt
 M02XaOjS2W/4Snr/y+JrIjlHuQvtC2Lh92ISJ2gnkMlvsomQ2JAgs+wOV
 DQA+u4SYew74VuXqeSqtl8JDAWI8OqO/08Rcil1+HZ4kR3Uq/yuqYKof1 A==;
X-CSE-ConnectionGUID: ANj4Z4V7QT2lMlujUwXTDQ==
X-CSE-MsgGUID: DLpeKLuBTjuhq2puBC1ARQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362019"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362019"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:50 -0700
X-CSE-ConnectionGUID: Wpg1JK+jTuCillAOK9vtsw==
X-CSE-MsgGUID: AM6xdAdNRhOMLle4gzmTIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180953"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 18/21] gputop: Add option parsing
Date: Tue, 23 Apr 2024 16:44:28 -0700
Message-ID: <20240423234431.1959354-19-lucas.demarchi@intel.com>
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

Add skeleton for option parsing, with just a -h/--help to be used
for additional options later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tools/gputop.c b/tools/gputop.c
index 820a1b553..d9a151d3b 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -300,11 +300,62 @@ static void clrscr(void)
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
2.43.0

