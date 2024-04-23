Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D99C25B10
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC38113776;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZaPJmR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65CA113767
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwdAqC23Z9eAgAKWVT6wY2rqyep61xh+CQyScxjNn/g=;
 b=PZaPJmR+aIq+DpH2X1rk6KWzKjlbe/WS7DJoDpcsRuRHUcVRsJVyhu4i
 DD9/8cLrZsRxzGh04NgAPK4t76Sc0WnbyBNtual6xUDtL+S4KzVAWaeOy
 CNM89iBbJWsLv831z78cy1228yUelAKpU6f7dKbxJVwVEEeR1vtkvC4FW
 OwlvIHUmIqFfMyYzU7bXDpPxszTdlxuIVPLZK6RovyIsRCQhSRhnzOWk6
 F9NwcCjRPFb6abHTd/9z/m/jOJC93vRg0f1cv1CpYaRZXTu2r84rkhpF7
 emUhsTAkNNQewU/gdn0UnFds5cHvLLQs+5EJqb1mBOENuvhSDu4Ac22Ee A==;
X-CSE-ConnectionGUID: N0PMQunvScmfYTHhNN4pnQ==
X-CSE-MsgGUID: c/yvFMg0T62xHFrqq4PLxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362021"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362021"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:50 -0700
X-CSE-ConnectionGUID: WmZMsIQhTWGwcrYX1UuQ+w==
X-CSE-MsgGUID: VvQqAq/DS/uwzUdLIR3vTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180956"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 19/21] gputop: Allow to limit number of executions
Date: Tue, 23 Apr 2024 16:44:29 -0700
Message-ID: <20240423234431.1959354-20-lucas.demarchi@intel.com>
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

Add argument to limit number of executions, similar to the one accepted
by `top`. This allows testing changes and optimizations more easily.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index d9a151d3b..e99aa56e5 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -301,6 +301,7 @@ static void clrscr(void)
 }
 
 struct gputop_args {
+	long n_iter;
 };
 
 static void help(void)
@@ -309,19 +310,22 @@ static void help(void)
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
@@ -331,6 +335,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			break;
 
 		switch (c) {
+		case 'n':
+			args->n_iter = strtol(optarg, NULL, 10);
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -350,6 +357,7 @@ int main(int argc, char **argv)
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	int ret;
+	long n;
 
 	ret = parse_args(argc, argv, &args);
 	if (ret < 0)
@@ -357,13 +365,15 @@ int main(int argc, char **argv)
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
 
@@ -389,6 +399,8 @@ int main(int argc, char **argv)
 			printf("\n");
 
 		usleep(period_us);
+		if (n > 0)
+			n--;
 	}
 
 	igt_drm_clients_free(clients);
-- 
2.43.0

