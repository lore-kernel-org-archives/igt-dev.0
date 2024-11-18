Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B5D60D00
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC4010E2A0;
	Mon, 18 Nov 2024 23:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnQo/ZQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668A10E299
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972953; x=1763508953;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=poahaFFlyliF7Ds8FoyFTl1+7yOcxw9tdG8AI0fNJNU=;
 b=PnQo/ZQPC+rsQd7h74gVOdNWGjHUCjptI+gh4WhJeZzRtCI56a0vrmwa
 iJKhsF4a10TQ4Qdomaebgq9S9ynGftbHbfOMZuPuwm5UvSQ9ZFYAuxBwu
 DLqk4M5vRPM+YiwK5SqU0fJaiLcTGmj7bUXofXzdQcecQJ96d/tBzul9c
 R90UwSnt5DGryhLM/XiqAwxyvstBk0G++V3DEiZU7wotBphT4y8Xclu7D
 zBQSU/+0sZJZvG+DMIWZ13IkUMe8aHwYJFsLAT9g5TLTLPi3ELjYSBTEG
 oN+UvoTeucGaFX4ilSpVjLUaUWheTCHLguixqfYfEt6nwGEdtzLUYAMNi A==;
X-CSE-ConnectionGUID: wOXulK3GQRuBudTjAbAzTQ==
X-CSE-MsgGUID: CDTFRGAuS6q0nyLd5/IgDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451225"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: SovXB3WwRm+xErR3ABBXZA==
X-CSE-MsgGUID: VWNudQIAQniU8xw1POGqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245222"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 05/29] drm/xe: Add doorbell ID to snapshot capture
Date: Mon, 18 Nov 2024 15:35:56 -0800
Message-Id: <20241118233620.2373819-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Useful for debugging hangs with doorbells.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cc7a98c1343e..c226c7b3245d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2227,6 +2227,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		return NULL;
 
 	snapshot->guc.id = q->guc->id;
+	snapshot->guc.db_id = q->guc->db.id;
 	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
 	snapshot->class = q->class;
 	snapshot->logical_mask = q->logical_mask;
@@ -2321,6 +2322,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tClass: %d\n", snapshot->class);
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
 	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tDoorbell ID: %d\n", snapshot->guc.db_id);
 	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
 	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
 	drm_printf(p, "\tTimeslice: %u (us)\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..12fef7848b78 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -113,6 +113,8 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 wqi_tail;
 		/** @guc.id: GuC id for this exec_queue */
 		u16 id;
+		/** @guc.db_id: Doorbell id */
+		u16 db_id;
 	} guc;
 
 	/**
-- 
2.34.1

