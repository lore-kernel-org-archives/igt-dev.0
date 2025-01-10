Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB6DE7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82910F184;
	Fri, 10 Jan 2025 19:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGt6bGby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE7210F184
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538361; x=1768074361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFzd19B7jMQhLxsA72Z7+5DINDiF5ma9kk/CfaS74Yc=;
 b=jGt6bGbyzyFf9pBmH1zvCqYk/IokR4xVSXbc7OzwkDwzNgnJNhWUlgv3
 flozpiQcs7mJPvGla3Kh1P4Y/6W5CJwwffRp3D+p5+IsgNEnth/Ml/ca8
 S+mp4Os1kQJHG4B4tRJylVQ5oGt4NPxTlNuOUUwezRzCiRujX3ygCG9Z8
 /+h06HSwhn9OYasBS+xe703acUgtvIgkeQmK6tkIHwmuKhuzMDxvHabG1
 pH23eg07icnUqowyw50E/hlIIkyslXIv+5o6G+ZegtM7a4pSJ0XSkoKGg
 qjqUyZJ3IEOn0TA796sWMoQU0WWy75gWkQ6HD1++JIIeu5JrGRJKgq0YR Q==;
X-CSE-ConnectionGUID: pJdquzsLRiOw1Cq+8B6Iag==
X-CSE-MsgGUID: cIkI09kcSG6gk+tRbkyDVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419809"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:46:01 -0800
X-CSE-ConnectionGUID: x/UyZQtTRNi8oKKsETuZIw==
X-CSE-MsgGUID: dYIBAcDfT02gZKdTld5uhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334444"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:59 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 5/8] lib/igt_kms: Add "sharpness strength" as crtc
 property
Date: Sat, 11 Jan 2025 01:20:57 +0530
Message-Id: <20250110195100.150301-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
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

Add "sharpness strength" as crtc property.

v2: Replace SHARPENESS_STRENGTH with SHARPNESS_STRENGTH. (Nemesa)
v3: Rebase
v4: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 95e3059f7..d2f8bd16d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -717,6 +717,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_HISTOGRAM] = "HISTOGRAM_ENABLE",
 	[IGT_CRTC_GLOBAL_HISTOGRAM] = "HISTOGRAM_DATA",
 	[IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR] = "HISTOGRAM_IET",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2621,6 +2622,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_HISTOGRAM))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_HISTOGRAM, 0);
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e2a927ab..bfd297a93 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -168,6 +168,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_HISTOGRAM,
        IGT_CRTC_GLOBAL_HISTOGRAM,
        IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR,
+       IGT_CRTC_SHARPNESS_STRENGTH,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

