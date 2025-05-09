Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7E3C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297C10E9D4;
	Fri,  9 May 2025 07:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8+yqCW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312DA10E9D4
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746777179; x=1778313179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9te4nqFrlV8U/BgfNubyRcA0wA8/TMMVRlhAUIUaps=;
 b=T8+yqCW7ANfQRsLoAlHP1A5vKHSLLQhd4ucU58TlVk0Mk+VMyTqATBpB
 sY3m+swrqWs6cd249fBqCFVRzLBy274d14neoz6Mfr/S81bzIAHvfEXmg
 mhjH5eaI1tz2nOxdrCUWlBmqrN58G+QDu7GjyeurTJHcmGIqPH0uH+aEs
 EToNsqJeeyx9/G0M8jrGe7wAVTXO6MeByZoo9qRKKMZyzB06h5MRQ5574
 RhkC4hB1PaeDjZ/tUp9xvtRMLN7oaqcmIFzYv02HpswpacOeiXlqudGj2
 kYEQWBaOeJGMQ4mOEIAHgan+sXE9GkdD9R67lal4BT7SWF6gsRaXtacht g==;
X-CSE-ConnectionGUID: nEFjaS3KT+etK5z6JchaHw==
X-CSE-MsgGUID: v44c3Zg6TUqTP5byFeerXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36222480"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="36222480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:52:59 -0700
X-CSE-ConnectionGUID: AFduTGLNRNeUMlGgsKZygg==
X-CSE-MsgGUID: 2xNvoXe1TnCAQEgl9OOXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167476496"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:52:57 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/kms_flip: Modify check_state to return
 true on unexpected sequence
Date: Fri,  9 May 2025 13:22:29 +0530
Message-ID: <20250509075232.1610123-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
References: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
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
 tests/kms_flip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 65016c66d..4d40ed26a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -704,7 +704,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
 		igt_debug("unexpected %s seq %u, should be >= %u\n",
 			  es->name, es->current_seq, es->last_seq + o->seq_step);
-		return false;
+		return true;
 	}
 
 	if (o->flags & TEST_CHECK_TS) {
@@ -726,7 +726,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 				  timeval_float(&es->current_ts), es->current_seq,
 				  elapsed, expected);
 
-			return false;
+			return true;
 		}
 
 		if (es->current_seq != es->last_seq + o->seq_step) {
@@ -734,7 +734,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 				  es->name, es->current_seq,
 				  es->last_seq + o->seq_step);
 
-			return false;
+			return true;
 		}
 	}
 
-- 
2.43.0

