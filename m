Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13220CCD190
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07A310E58C;
	Tue, 14 Oct 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwkLCTrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335F10E58C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434752; x=1791970752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9aRQuXgC1zHQDoYmmkPvRi0h2gSFMa5kkY4ycACCAP0=;
 b=XwkLCTrE56HCmmYlzBFwOqWNqytOxGCiifeq5uz6gz9MHsyiBDuJrcOz
 +/25z9MXNMa0sBaleJa0sJbGAz9Pyjj4VQciBRpU9KiOXxau0bMpEY0tn
 Mx12atjhTqBeR3gDJS9GgNvcx51R3DGYtpA8OWtqbJBH/Tkn5Rq1pUij2
 d0br8+lwGtMrY5EoV/GdTqOBsqUzo69393F3Q2DtdUZkzLnurO/T1LXhx
 HdE7fPyQ0mAL7TLdVOhwrrHYaegY6gTytqNw9NGlFjbs+NIJLmK0eSiQL
 Z0ROymBWlefJN0k3dpYiKnPm+k3nTAJmtfXDfShEh5RI++iD5lr1NgXZP Q==;
X-CSE-ConnectionGUID: ds1lEFhnSBeBPfBB4/X2kg==
X-CSE-MsgGUID: Sf4YNu57RoSTd+qW7izPbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192504"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:11 -0700
X-CSE-ConnectionGUID: H1M2VeAcQZWVVBDyPXGtzg==
X-CSE-MsgGUID: W7V9eiHRTWqseTDWWD2TmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066494"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:10 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 4/7] lib/xe/xe_eudebug: Mark client done after log is
 read
Date: Tue, 14 Oct 2025 12:38:45 +0300
Message-ID: <20251014093848.2394531-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

Dont mark that we are done until the client has send it's
log to session to avoid teardown too early.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0989330b39..84309043d5 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1614,9 +1614,9 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
 void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
 {
 	if (!c->done) {
-		c->done = 1;
 		c->seqno = wait_from_client(c, CLIENT_FINI);
 		event_log_read_from_fd(c->log, c->p_out[0]);
+		c->done = 1;
 	}
 }
 
-- 
2.43.0

