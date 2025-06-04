Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67677C61DB8
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1926C10E787;
	Wed,  4 Jun 2025 17:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/CYMVj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD6610E75F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057571; x=1780593571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSRHlZUDl7nmZlqbQ71vIchtJCsMAa6MguwBZn97BDk=;
 b=V/CYMVj64uZL+y06Ryjob4vKT/dp3JEcCnDrRDyX9LbrVxNMp1pngS+R
 Lv7vZSIp0355cJxhgbS3tHye5HJvgV4AwK9iCuzz/l0H+iP4diJ70wPgN
 vR2bh4qjvTGl/2lO3QWa2a+RbTmjdfcwSpsFOPvR3D5LP3dAWKMmw8k2e
 ugcXbYG9UX4u2u2M5nNYUOD0sHmPw9d+O/Iu1ikSAOn+HfhK6JVIAErRb
 CHngTILVRO5VBxtkMeroacvAEXOrdq2szxSbK6QPNqkDcuQb1rvWCJ78K
 fqw5t+5hHageIKxzN6MpWwUCBP/KEw/7Cvw+PttTB3rs5IVYKPSg8gaIU Q==;
X-CSE-ConnectionGUID: j6iYlaAQQUGRrJt+YckXSw==
X-CSE-MsgGUID: ffXv88pgSeOC4EHcyJKBGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595950"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:33 -0700
X-CSE-ConnectionGUID: mufkydyjRAC5HcvUfU3gHQ==
X-CSE-MsgGUID: iHw1X4qpTteTQRWR6J20FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203271"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:32 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v15 3/9] lib/igt_aux: Handle absence of libproc2 in Android
Date: Wed,  4 Jun 2025 17:16:50 +0000
Message-ID: <20250604171656.31559-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

Handle the absence of libproc2 in Android by conditionally including
libproc2 headers and function calls based on the definition of
HAVE_LIBPROC2. This ensures compatibility by only compiling
libproc2-related code when the library is available.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_aux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 2905824a5..5c2679812 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -55,7 +55,7 @@
 
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
-#else
+#elif HAVE_LIBPROC2
 #  include <libproc2/pids.h>
 #endif
 
@@ -1289,7 +1289,7 @@ struct igt_process {
 #ifdef HAVE_LIBPROCPS
 	PROCTAB * proc;
 	proc_t *proc_info;
-#else
+#elif HAVE_LIBPROC2
 	struct pids_info *info;
 	struct pids_stack *stack;
 #endif
@@ -1305,7 +1305,7 @@ static void open_process(struct igt_process *prcs)
 	prcs->proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
 	igt_assert_f(prcs->proc != NULL, "procps open failed\n");
 	prcs->proc_info = NULL;
-#else
+#elif HAVE_LIBPROC2
 	enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID, PIDS_CMD };
 	int err;
 
@@ -1327,7 +1327,7 @@ static void close_process(struct igt_process *prcs)
 	closeproc(prcs->proc);
 	prcs->proc_info = NULL;
 	prcs->proc = NULL;
-#else
+#elif HAVE_LIBPROC2
 	procps_pids_unref(&prcs->info);
 	prcs->info = NULL;
 #endif
@@ -1351,7 +1351,7 @@ static bool get_process_ids(struct igt_process *prcs)
 		prcs->egid = prcs->proc_info->egid;
 		prcs->comm = prcs->proc_info->cmd;
 	}
-#else
+#elif HAVE_LIBPROC2
 	enum rel_items { EU_PID, EU_EUID, EU_EGID, EU_CMD }; // order at open
 
 	prcs->tid = 0;
-- 
2.49.0

