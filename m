Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F21C25B5C
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736C0112189;
	Wed,  1 May 2024 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDmnlvni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2392E10EF57
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714584792; x=1746120792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVC8dQifgnds4INfZNb0qtWycAhWBSMP7a+Dm+GfFm4=;
 b=PDmnlvniAd0js+JcLwU9rJ4b/DsOQbWvstR2hfVau7ZOR2W+YhEcEoy0
 BQTkaFt4dShdntIjkLY81tkAiybvgSOEoOhIXsJPUfu/9ZazGmISl+o7N
 lLHNxwROzePaA3IreGFPXmsWNGdPKX+/0jJfUC9dijsQBAx3EhzfYEm8n
 9aUeKJg1dHbZgZFA/v8uqiPEqvOSkp+eb/r83PG33s0Pd7QQ4IGCgsXUW
 gnZhK5KZel5+MWUUpJ0g7B2K+x9e41TnrqWUOU8RJJc/QRn7rURLncWzH
 /QpxaT0kjPSZJRPFS00x4JRjMtBjIx6Qg9aWBKGjc2dOL60KLgsaIX8LM Q==;
X-CSE-ConnectionGUID: o5BEjEyuRI647wBYQKYUyg==
X-CSE-MsgGUID: Fo+dNutQTGimAgZph/AQ+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10497105"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10497105"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:12 -0700
X-CSE-ConnectionGUID: L2krHqlXTj+EuJI+1hHwrQ==
X-CSE-MsgGUID: KwsQUAzhTCSWNqdUjARJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26721824"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] gputop: Allow to limit number of executions
Date: Wed,  1 May 2024 12:33:02 -0500
Message-ID: <20240501173303.115737-4-lucas.demarchi@intel.com>
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

Add argument to limit number of executions, similar to the one accepted
by `top`. This allows testing changes and optimizations more easily.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 481e79753..1ac382a7e 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -293,6 +293,7 @@ static void clrscr(void)
 }
 
 struct gputop_args {
+	long n_iter;
 };
 
 static void help(void)
@@ -301,19 +302,22 @@ static void help(void)
 	       "\t%s [options]\n\n"
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n"
 	       , program_invocation_short_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "h";
+	static const char cmdopts_s[] = "hn:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
+	       {"iterations", required_argument, 0, 'n'},
 	       { }
 	};
 
 	/* defaults */
 	memset(args, 0, sizeof(*args));
+	args->n_iter = -1;
 
 	for (;;) {
 		int c, idx = 0;
@@ -323,6 +327,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			break;
 
 		switch (c) {
+		case 'n':
+			args->n_iter = strtol(optarg, NULL, 10);
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -342,6 +349,7 @@ int main(int argc, char **argv)
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	int ret;
+	long n;
 
 	ret = parse_args(argc, argv, &args);
 	if (ret < 0)
@@ -349,13 +357,15 @@ int main(int argc, char **argv)
 	if (!ret)
 		return EXIT_SUCCESS;
 
+	n = args.n_iter;
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
 
 	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
-	for (;;) {
+	while (n != 0) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
 
@@ -381,6 +391,8 @@ int main(int argc, char **argv)
 			printf("\n");
 
 		usleep(period_us);
+		if (n > 0)
+			n--;
 	}
 
 	igt_drm_clients_free(clients);
-- 
2.45.0

