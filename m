Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9FAE7718B
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 12:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68D910E035;
	Tue, 31 Dec 2024 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUAUDJB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C2410E033
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735649858; x=1767185858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0z+R1VEuhDJjj6pWU43OsOGLZSqI3L+GGwVSubGapN0=;
 b=DUAUDJB8bW/kyd5IZcostABIadVunJMuuO/+T0UPCoeWEm8IrmicrJ/k
 wy1lww+ScRtip9UNlNWCZGzJSQZx12f66Naj9zzCFS72KdB7Yi1UAZhao
 7Cab/eY9WOMvl9DmSQt96pjbKYbG0XysMqB5D0NdmhFg8nkVeD07qZPMy
 43eQn3xiE6ucsd+sNLDY/dWJulmvw0nKwFQnx+1fvujOI5/fma3OYL+M8
 UM576aIHfhnCrjRJK8+zjFbOyaI8vV3dkqv3oWeZkezx3i3niXo49dS/b
 UKLIrr4CBdL0z/x3Vz5vs0Cg76+zowvv2v62OafZTDR28qJc0QXk2bWgv Q==;
X-CSE-ConnectionGUID: N2iBDaMTQr6CxLY2GTavkw==
X-CSE-MsgGUID: Eq2eMn9wTH+zRDVyDoUAPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46518390"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="46518390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:38 -0800
X-CSE-ConnectionGUID: avE82hL7T1KZTQAgH1GdYg==
X-CSE-MsgGUID: pEAtp5KORHyJ+iCgKfO/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100867188"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t,
 v4 1/9] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Tue, 31 Dec 2024 18:32:33 +0530
Message-Id: <20241231130241.69689-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231130241.69689-1-swati2.sharma@intel.com>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
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
index a67d17c4f..2a26c6c0e 100644
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

