Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEE0E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 16:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225AF10E3C5;
	Tue, 10 Dec 2024 16:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRub/V7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E810E3C5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733847342; x=1765383342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1J5tbUuMRR615IHC7TAg5mUhd3lbZoG0JM9XZkyDsZc=;
 b=cRub/V7SmuOYmwK8p8BAuUVLSkGv7ezq6TwLG9qHLb1uVBivbdj8dWYN
 WcjDJWgoNgJKMQLHWtxXZGh7U11q83/s+o56sUQnBSGIQGkICxm8mglw/
 a5EfLfocWP9zucvOrVK4XX6AaFY9r1fYvLktYiQU+DLFO6nCyTRvD8UFX
 XEBcjeRqOto8FoFh/ukKyjbg3DeL4mqqqh1Sxv3VwWmqp5XC0I+6BDAfC
 S8+c6+3Di+8Zy7TPVeKVXfPXreG9wwGyZpqSBi55pYa7pUNFCp4mf/tAy
 wkDInUywnDINEXOLQlvbs2dWAYNFk1AHVBlve0800JxtEVMENpbG3TwY8 Q==;
X-CSE-ConnectionGUID: x0LMrDg6S3qj7LfjMAKolQ==
X-CSE-MsgGUID: 9oKXhFvMTC6DGkVzIgaFgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38125499"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="38125499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:41 -0800
X-CSE-ConnectionGUID: IoMEXi3DR7qeejm6y4lytg==
X-CSE-MsgGUID: +Mb6uXW2Taeab8pw2R1O5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95520420"
Received: from unknown (HELO localhost) ([10.217.180.234])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:38 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/vf: Don't check has flat ccs in bios on VF
Date: Tue, 10 Dec 2024 17:15:23 +0100
Message-Id: <20241210161525.777763-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
References: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
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

From: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Don't check for flat ccs from VF-level as VF does not have direct
access to the register.

If the BIOS disables FlatCCS support (a use-case that will nearly never
be used) and the has_flat_ccs flag is set, there shouldn't be
any functional impact. The hardware will drop writes to the CCS region,
and reads from the CCS region will always return 0.
For the native case, the flag is disabled if the BIOS disables
it to avoid unnecessary overhead in buffer object (BO) creation
and migration.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 56d4ffb650da..ec0ea9c914b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -604,7 +604,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
-	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
+	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
-- 
2.31.1

