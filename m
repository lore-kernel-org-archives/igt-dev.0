Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20756C3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C565910E9B2;
	Fri,  9 May 2025 05:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFjE2wym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7C410E9B2
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746768433; x=1778304433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9te4nqFrlV8U/BgfNubyRcA0wA8/TMMVRlhAUIUaps=;
 b=dFjE2wymMb63rwIKWoVmdhUqyauxjpwhipwToyE8khvfwSrsjSykM7Fi
 ziNdW0y2loSS2y4h8GG+hq0oqRl/uxAh1fBvEqiv4qCJz+8A584AY7akZ
 R9KQjqJ/uyHbJij+UNGfbZmUVvNaTbppAH1K1zvgvdNAQFLmS+bpY1jO5
 32Ed1jWdx1qyh8FTCt89lKpD+yc98pxMPgsP0pdhXPEm33rXWcJiPG24J
 VkD6Y9AtASLoTR1PQEHJO1RjCwdnsyr612CFju7G09Pu5B9FaPhJaftLx
 2CHkZ5hlBjafOwI+3Sf8Fp417eamazLFGu7hovPlWLwYEF4gi7kI87kZd Q==;
X-CSE-ConnectionGUID: wWUzi94/R8ittZEbG6sgGQ==
X-CSE-MsgGUID: l89tuaAoRvyqxRfqaSO8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66116663"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66116663"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:13 -0700
X-CSE-ConnectionGUID: MWKdgYQ5QOuGVH1xTuLdqA==
X-CSE-MsgGUID: 3Sn3eBGtRZKdt0twArdDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="159815402"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:11 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/4] tests/kms_flip: Modify check_state to return
 true on unexpected sequence
Date: Fri,  9 May 2025 10:56:40 +0530
Message-ID: <20250509052643.1607987-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509052643.1607987-1-ramanaidu.naladala@intel.com>
References: <20250509052643.1607987-1-ramanaidu.naladala@intel.com>
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

