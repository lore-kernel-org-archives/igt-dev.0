Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF614C3ABA9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836F510E1B2;
	Tue, 29 Apr 2025 20:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOTsQ4Ku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD510E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959236; x=1777495236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQYtW9qkvnhEngHGNmZkZt7AvSzeubnPXxtiYgznjEM=;
 b=dOTsQ4KumMxkX9OPIjUDOITo3O6YFW++JZxxPLoyMvmWj9vCJG/Y5HaE
 /FZmCcmxtocWy3OjOK+tM8FCj/Qc0LJdjGQ/2k3uMNKNHXkrwQi0jFAw1
 kRVkLBZeeYG86PsSGyO3Axc8tTtSBTHkBl6D22zTYiNR2n9OrVTmGgwyr
 eyLReRvX5Yje3z6aOq+Jpg+B6WEglkfELLATaR+b5QzJWJLFsMW02qh1C
 DvIGZ+IiWaY7B75r2mXzeXRTEDuud/aBk1zFp9BFOliRWeT8rE3ecCU/1
 sPJ5ED4UjtOt+5QO5GTj6w8WWNBYBO+2btfTh3X0h+bsNHDUklKEpIw1/ Q==;
X-CSE-ConnectionGUID: wLVmeIbxTTuTa2piQ4fyYA==
X-CSE-MsgGUID: zFDUzMUlRAKkq0ZPAr/FDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72983442"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72983442"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:40:36 -0700
X-CSE-ConnectionGUID: vkkHgLnsS+2dB25myMgaSg==
X-CSE-MsgGUID: 6+LvR4KIQYCCMFW49hLc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="138739944"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 13:40:34 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 2/5] Replace program_invocation_short_name with prog_name from
 command line
Date: Tue, 29 Apr 2025 20:39:16 +0000
Message-ID: <20250429203919.41503-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
References: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
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

program_invocation_short_name is global variable provided by glibc.

Inorder to get the igt built for Android(without glibc), replaced the
program_invocation_short_name with the prog_name.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/gputop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..ef868f670 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -335,7 +335,7 @@ struct gputop_args {
 	unsigned long delay_usec;
 };
 
-static void help(void)
+static void help(char* prog_name)
 {
 	printf("Usage:\n"
 	       "\t%s [options]\n\n"
@@ -343,7 +343,7 @@ static void help(void)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
-	       , program_invocation_short_name);
+	       , prog_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
@@ -384,7 +384,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			}
 			break;
 		case 'h':
-			help();
+			help(argv[0]);
 			return 0;
 		default:
 			fprintf(stderr, "Unkonwn option '%c'.\n", c);
-- 
2.49.0

