Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0781AE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 16:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9946C10E0C3;
	Tue, 10 Dec 2024 16:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0yy5bL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A6B10E0C3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733847348; x=1765383348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYjuV0kS/NUiQF5kd8UrSciJgzfqjJ4/pvFoQjsSyBs=;
 b=m0yy5bL+s4ZqQ54XBta9cASIS0mAHH8X6o+wN9cERlyPVIEWGPtTJ6+K
 hc6TJNph11hCQ81g5mDeixfu2NZpwApgWZkMsgR1IT/IHm8rvFuU4W9vn
 DwM4oD9fkbYf8e/wqbPlexDLGxvtiUpaScwhhmFdTjjk0bqLJEfZSl5Lu
 uqTABv63P1eY89k4jtjBoowit8m2AtxEx8izhF74PA6zg8AXo7Qykji1L
 wU4QKhi8zEn1TOUMsWhxA9Vvv+hdwagmnrdAVhRqmI3t8nuPP4t8PyBgm
 LvirMPIiLvCuskAh0UsuCa6lze48QDCo8I7Gaj0mvkGqS8vAhaIoIrcuf g==;
X-CSE-ConnectionGUID: 8lPsNjKASPOckC/j+xCPng==
X-CSE-MsgGUID: u/h6nFBfRUWFGvOtRTv2Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38125506"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="38125506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:48 -0800
X-CSE-ConnectionGUID: 6G+vuNZTROyaaJ3nOAP1mw==
X-CSE-MsgGUID: x5UJaWhtQUOkYiqpRvPq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95520444"
Received: from unknown (HELO localhost) ([10.217.180.234])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:45 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 2/3] drm/xe/rtp: Add match helper to omit SR-IOV VF device
Date: Tue, 10 Dec 2024 17:15:24 +0100
Message-Id: <20241210161525.777763-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
References: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
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

Add a match helper that allows the application of a workaround
when the device is not an SR-IOV VF (Virtual Function) device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  5 +++++
 drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b13d4d62f0b1..7a1c78fdfc92 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -340,3 +340,8 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	return dss >= dss_per_gslice;
 }
 
+bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe)
+{
+	return !IS_SRIOV_VF(gt_to_xe(gt));
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 827d932b6908..7dea10d732d7 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -476,4 +476,15 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if device is not VF, false otherwise.
+ */
+bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe);
+
 #endif
-- 
2.31.1

