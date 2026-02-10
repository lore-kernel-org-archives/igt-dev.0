Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C051E94629
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 02:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D942E10E4AE;
	Tue, 10 Feb 2026 02:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMmPnDwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7D110E4AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770691905; x=1802227905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wSHePKE2R0iV3IH/xVSAQ6R7qINGeivUkAAAp9C0+tY=;
 b=kMmPnDwCjdJFKxkJKqQyda4+416+RieIeZPUbisLXF9lThybrJmkXgfm
 Go3lkd1DwqjGIgPoj3QHbOiq/zxS8Ey+Rij9neMfY2uvXwr3Tpu6aClC1
 BGbKOvSgtFQn0g8vgHDfTtu1ZiEl6KupVLfliBbeEF69h2uEPRYaRTt1E
 zdCsRxS7wCed7lu8XWuEIvCR0aHhoqcl880R11axIfoMU8JYltHZTz1jY
 wFLeHuRXZt5vUGqMzLQmCepturDEpl/W9XYvA26BygM4mi/3+dY7RIecF
 TI0GGEphRpv5GOdzST85m3EjSHoNaeGhGLTsSMfw7zLK6O5q9mRnmq/wd A==;
X-CSE-ConnectionGUID: blvFzbzITWaDWH2eJYV0+Q==
X-CSE-MsgGUID: f1PggqpAQemvJnEa71kqlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71706903"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71706903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 18:51:45 -0800
X-CSE-ConnectionGUID: LcBpzHqsT7eCIBl3xfKaUg==
X-CSE-MsgGUID: QcfezvHITGip3NwpDK2fJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="215945984"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 18:51:43 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, nitin.r.gote@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe/xe2_hpg: Apply Wa_14024997852
Date: Tue, 10 Feb 2026 08:21:30 +0530
Message-ID: <20260210025130.770085-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Applied Wa_14024997852 to Graphics version 20.02

v2:
   - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)

Cc: Nitin Gote <nitin.r.gote@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1e8d61ac581b..08a7dcdc1a72 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -874,6 +874,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 
+	{ XE_RTP_NAME("14024997852"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_TE_AUTOSTRIP |
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
-- 
2.43.0

