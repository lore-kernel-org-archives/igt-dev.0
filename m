Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F1FC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53F610E69C;
	Wed, 16 Sep 2026 11:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFJ8nk6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262E210E102
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557095; x=1821093095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Z/8DvC1N0sAAqxXeokmCjhFX4+ob6+egPMJEvlxYPs=;
 b=RFJ8nk6bq++g7/AERkc3KzBx3zg0RMjzzq2ViPgArEeBtQmhbOZqj8Ij
 IKw88FkmTCil97TsJpChpOhA7WHX/vcuMW5L8pTWifvxQKa+oImz6sgWi
 CVIj3iPFgMZ5xOZMhAI6ydZlOIxEfPNI8rbDxhot21JRc1nViLGlVHyAo
 z73gjTDERGA3zxOSmHQPVEjHerhT2n/GzNgjUl6m0ffF15YPYUnPm5EQY
 CP5eLC7FW5tOVR/gJ3nIBo1yuEQYIOCSo2hu4lseS+2brKs8OShFAU/OM
 ocbyFt/M5gx3BOuPr6sBhmAlmK/hCiBaOop/wDUvwlJgNGoHo8Kg1Rqk9 w==;
X-CSE-ConnectionGUID: CNV++940SI+G08uDqRWZvQ==
X-CSE-MsgGUID: SKJRwl+wRlqBrS2RYkpFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440514"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:35 -0700
X-CSE-ConnectionGUID: w0gdrCKmRjOPQCppTKL7xw==
X-CSE-MsgGUID: vI+17Al1TOOqhvdGtLZjsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800694"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:31 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 02/16] tools/intel_hdcp: Read stdin outside the
 display lock
Date: Wed, 16 Sep 2026 16:36:55 +0530
Message-ID: <20260916110718.596603-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

handle_connector_selection() prompts for a connector id and blocks in
fgets(), and it was called with data->lock held. The video player thread
takes the same lock once per frame, so the display stopped updating for
as long as the operator took to type.

Prompt before taking the lock, and hold it only for the store of the
pending command, which is all it is there to protect.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 65a25503e6..6350cf486b 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -439,6 +439,7 @@ static void *keypress_thread(void *arg)
 {
 	data_t *data = (data_t *)arg;
 	char input[256], choice;
+	int cmd;
 
 	print_menu();
 
@@ -454,23 +455,32 @@ static void *keypress_thread(void *arg)
 		if (!validate_input(input, &choice))
 			continue;
 
-		pthread_mutex_lock(&data->lock);
-
 		if (choice == 'q' || choice == 'Q') {
+			pthread_mutex_lock(&data->lock);
 			data->running = false;
 			pthread_mutex_unlock(&data->lock);
 			continue;
 		}
 
-		if (choice >= '1' && choice <= '5') {
-			data->user_cmd = choice - '0';
-
-			if (!handle_connector_selection(data, data->user_cmd))
-				data->user_cmd = 0;
-		} else {
+		if (choice < '1' || choice > '5') {
 			fprintf(stderr, "Invalid choice: %c\n", choice);
+			continue;
 		}
 
+		cmd = choice - '0';
+
+		/*
+		 * Connector selection reads from stdin, so it has to happen
+		 * before the lock is taken. Holding the lock across a blocking
+		 * read stalls the video player thread, which needs it for
+		 * every frame, and the display freezes until the operator
+		 * finishes typing.
+		 */
+		if (!handle_connector_selection(data, cmd))
+			continue;
+
+		pthread_mutex_lock(&data->lock);
+		data->user_cmd = cmd;
 		pthread_mutex_unlock(&data->lock);
 	}
 
-- 
2.43.0

