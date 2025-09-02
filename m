Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1DACA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8FC10E6B0;
	Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/fb51IZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A07C10E6AE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816357; x=1788352357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ror5f7KV1uFex25M6FjDhvgkZiIlkQS9zveHh/8uTQU=;
 b=g/fb51IZGlLHcbJ1XNOQGvY/HLPLxeBvrseBaWGTXNtBW9mIis1McV8m
 C67wer393A9RMGXjpCGdGOW1C8jUeRspjnRd6/guWU7L9xgeVWrR69/fB
 OPWCGoPSsmHcSoTG2n0VcfBIB/2zsayUBOgHwQFN76Q+mK4PbdG/CUrDz
 tQAZv2Ul+hdgdMdOa4mlx+FYHolH4yPqei5DnjLEFzoZB2EN62MfUAe35
 XB9l8xaLZ/PpVy2llTR2Z7AT/xxdg/4hQWvNqSavvdaMymGFHZdnexV9B
 eLSGzeVMtS1QXrwMKSCDeOIKMKWHWpy+0D/LbpzlZP32jQCIUSwRPc6om Q==;
X-CSE-ConnectionGUID: lvDonsjeR6+HQopeSfbkMw==
X-CSE-MsgGUID: Ec2GXY+PToimwei1d0u4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517414"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:37 -0700
X-CSE-ConnectionGUID: lGD+cj6XQeSCjhz0kkRVjw==
X-CSE-MsgGUID: A3v6zFmMR+qCJm5Wf5t3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153294"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:31 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/7] lib/xe_eudebug: Harden xe_eudebug_client_stop for
 SIGINT
Date: Tue,  2 Sep 2025 14:31:58 +0200
Message-Id: <20250902123203.4907-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a check if client still exists before xe_eudebug_client_wait_done
to avoid getting stuck on wait_from_client.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..5aec75282 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1452,6 +1452,11 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
 		int waitstatus;
 		int ret;
 
+		/* process may be gone already (SIGINT) */
+		ret = waitpid(c->pid, &waitstatus, WNOHANG);
+		if (ret == -1)
+			goto out;
+
 		xe_eudebug_client_wait_done(c);
 
 		token_signal(c->p_in, CLIENT_STOP, c->pid);
@@ -1459,7 +1464,7 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
 		/* process may be gone already */
 		if (!(ret == -1 && errno == ECHILD))
 			igt_assert_eq(ret, c->pid);
-
+out:
 		c->pid = 0;
 	}
 }
-- 
2.34.1

