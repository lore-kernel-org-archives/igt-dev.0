Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBDC02196
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 13:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6DB10E837;
	Thu,  6 Feb 2025 13:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wzr2BP3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E3110E82B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738847720; x=1770383720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ql+G29D1zbMY5yXcxVsR4iMo8B5Y5w4dMJ78hnGqlBY=;
 b=Wzr2BP3bw3GeZfRe147Xvdop/l3BdaDdZ+yDfFDdrfqrW1Xh2VdmGUST
 XCqn8qx7flDrlboewV2QoLgl9jHz61y+UYG1cKj4tM01v8k7rSWqesYKI
 3TlK2nJZ393Px9KTj3ePBcPuGgJBDkpcVSG7YXrm24UItcBea/nsXME8i
 4K9HozvfwRiDUW5dZpiI7CIUgXAxSPHuU5+c4CAE6UPGPFXNdT0miK3aP
 LilY5HJhSp1ad67GcQKOZaKLMZ9YjuowWH7+bKabSGvIXGxFSZhAT88xJ
 Kq4/QH3kdPRDlCmmp3ugN240rY84zIilHAedOSrTYugt6YFSBpPk9Mq29 A==;
X-CSE-ConnectionGUID: uMxYxchwR7uf3EZtMzC6bA==
X-CSE-MsgGUID: 5vytehwuSZObFHB6HqnRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43203061"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43203061"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:15:04 -0800
X-CSE-ConnectionGUID: Ya1qdL6YRkG7W42xt8A8mQ==
X-CSE-MsgGUID: eUXXTsGzR6Om6J0dIaNKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111737661"
Received: from sosterlu-desk.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.161])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:15:02 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug_online: Ignore stale attention events
 during single-step
Date: Thu,  6 Feb 2025 14:14:55 +0100
Message-Id: <20250206131455.612021-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Signle step testcases are not filtering stale attention events in
resume trigger, as a result those expect fixed number of attention
events to come. If for some reason attention wasn't handeled before the
next one came test would fail. Filter out all atentions with seqno
lower than last eu control call.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ecc32ee97..c98f1ef1f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -694,6 +694,9 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 
 	get_aips_offset_table(data, threads);
 
+	if (data->last_eu_control_seqno > att->base.seqno)
+		return;
+
 	if (d->flags & TRIGGER_RESUME_PARALLEL_WALK) {
 		if (data->stepped_threads_count != -1)
 			if (data->steps_done < SINGLE_STEP_COUNT) {
@@ -766,9 +769,9 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 			     data->target_offset + steering_offset(threads)), sz);
 	fsync(data->vm_fd);
 
-	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
-		      att->exec_queue_handle, att->lrc_handle,
-		      att->bitmask, att->bitmask_size);
+	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+						    att->exec_queue_handle, att->lrc_handle,
+						    att->bitmask, att->bitmask_size);
 
 	if (data->single_step_bitmask)
 		for (int i = 0; i < att->bitmask_size; i++)
-- 
2.34.1

