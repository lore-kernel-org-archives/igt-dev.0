Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA369CF9C6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764DC10E8C3;
	Tue, 24 Sep 2024 14:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7VgJsYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212FF10E70E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188564; x=1758724564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/FzmN1jUJIxVCf6lP71ZOW5zcsobSrZdf+kJNAek22c=;
 b=X7VgJsYVjloTf9ve8nT/oAgWlnQuWl6Ar7llZJAZnDJDKbGuSCGj5VFQ
 LTei0y0DMp1IxsNSq3iBJyQh+C4B6BRRNuDP9oyqLEJTupKqALKbTmpo9
 /0yrlTp7yGylJ+qfYfTABzY6QFf3o78/a1CKxRK3McZyiuJNZMwDFcxdc
 d+Dyi0Nhuz5zB12BOlMSbtu4zAj+PHGXcxxLUSGaudvxUfbx+6w6nOAZH
 uc+PzQPUdt5HUfYp8l3GKjDCBYG6zgeTZbjvBT/u5/mOnS/gybvV3or7a
 6wsj5X7xGDP2WY31iW1OO4zpLJC20z0f36hvWbcVZaTCh7abl9MNQBF9G A==;
X-CSE-ConnectionGUID: QaWZwxKGTgKk/k655Ykl6A==
X-CSE-MsgGUID: pKPBQXbdRu23FhNYISxh8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26137200"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26137200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:04 -0700
X-CSE-ConnectionGUID: DkGiNmIhRhm/cPy+QW20+g==
X-CSE-MsgGUID: /PKjVvGQTXCAx2G/epqFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102258325"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:03 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 4/5] lib/igt_kms: Force "edid_override" to NULL on exit
Date: Tue, 24 Sep 2024 19:56:37 +0530
Message-ID: <20240924142638.238291-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
References: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
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

Force "edid_override" to NULL on each connector on exit.

V2: - Ignore if connector config not found

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d7f6e475e..c1d80dbb8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3410,8 +3410,12 @@ void igt_display_fini(igt_display_t *display)
 	for (i = 0; i < display->n_pipes; i++)
 		igt_pipe_fini(&display->pipes[i]);
 
-	for (i = 0; i < display->n_outputs; i++)
+	for (i = 0; i < display->n_outputs; i++) {
+		if ((&display->outputs[i])->config.connector)
+			kmstest_force_edid(display->drm_fd, (&display->outputs[i])->config.connector, NULL);
 		igt_output_fini(&display->outputs[i]);
+	}
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
-- 
2.43.0

