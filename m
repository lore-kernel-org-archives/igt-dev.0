Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15DAC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776BC10E2AD;
	Mon, 16 Jun 2025 06:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kzmf11sZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9708A10E2AD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 06:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055948; x=1781591948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UEKCtdVqkcncJLVZCuu4OSaDR1dnIw9mf9wkvWoPDTs=;
 b=Kzmf11sZ4L3D0Dqt175JmhhjHjXGbJAYuCCW8ZLZ6fcWfji6+YJDNxJ2
 CRfBiEb+Uoewrejp7ZixgvO27J6kS4NToOy/kfPOy/tCK0Sv5EYWcy2gs
 KRut/BwmHYph7k6CRSe722qm0SUF7WJ1wAGoMwrVJH8x3Q5IszWIG8aav
 KAN42QpNiVAqa7mv4CsLfpxY+h7wWYKSkSBxsHAUQkPHLWpHTCj8BRhVE
 u9EBAvQHWnz3+FOcHJHkLq4pKY7+L+UxQz4av5aM7PB8wawbjGUJHpnd0
 tg9gOjLNqshqz9/47gEWfdBnsH+oRaxoNof0p2t/9q06roQEVsYZ846MO A==;
X-CSE-ConnectionGUID: Iit/FtxyQL68N47l/Kf65A==
X-CSE-MsgGUID: kO3JRmgeTGK+EvWwII2pmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52280800"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52280800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:07 -0700
X-CSE-ConnectionGUID: saObPnHCS9+jseAvkwd4EA==
X-CSE-MsgGUID: o/5LXXPNTkqoynuY/PERvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153535982"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:06 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/5] tests/kms_flip: Modify check_state to return
 true on unexpected sequence
Date: Mon, 16 Jun 2025 12:08:28 +0530
Message-ID: <20250616063831.3332042-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
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

Ensure function execution continues despite unexpected sequences
or timestamps due to shorter frame times in higher refresh rate
panels.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ca31ef7dd..2328259ba 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -706,7 +706,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
 		igt_debug("unexpected %s seq %u, should be >= %u\n",
 			  es->name, es->current_seq, es->last_seq + o->seq_step);
-		return false;
+		return true;
 	}
 
 	if (o->flags & TEST_CHECK_TS) {
@@ -736,7 +736,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 				  es->name, es->current_seq,
 				  es->last_seq + o->seq_step);
 
-			return false;
+			return true;
 		}
 	}
 
-- 
2.43.0

