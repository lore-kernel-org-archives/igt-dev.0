Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A78D49227
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 14:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932D510E152;
	Mon, 18 Nov 2024 14:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwx8OxUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F3210E152
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731939971; x=1763475971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WZ98sL/3jY39+UUjhEMGbj9YgHlpi2DCJ+oLQJkfyHI=;
 b=bwx8OxUutEmC+Kt0Bes1wXFH+4ZEHzz/hiWnByjCkgUk7s+AdjwE8S+8
 JAnkzFxD+rCA5x36BTm9QemwPl3kdmHIG89sUrsa2/oejMdc6DG7ZiWbz
 V2vgmbS29QFo14UuTkbyQV2DyuXjjLKXM4ZCEWBn7F24GBsW4DCNDMIld
 QWkkomuapolSoysoiRqSapMansajRPz260Q6G8dmE5yHiGK+W0Pb9Xu8i
 f096EEWmQl4VJoI3gvElrHGys0zQeyFTiVGJs2+i/fg5ChgOW7/CG4MNs
 UaQ1ZTEv5GTKfY8bjRdhPjXU/uSa97BAtFRDd8hMFY498jVxvLIXoclj6 g==;
X-CSE-ConnectionGUID: /8zy/wapRjS8Ago9Gy/MiA==
X-CSE-MsgGUID: nmTDUl1wRDKj3jgU7q/c9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="57303530"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="57303530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 06:26:11 -0800
X-CSE-ConnectionGUID: VaoZQd3/SK6pkSg82zek+g==
X-CSE-MsgGUID: BKhN8pWXSMStdtFSdFpCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="88804519"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 06:26:09 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] lib/igt_kms: Clear all pipe properties on reset
Date: Mon, 18 Nov 2024 19:45:22 +0530
Message-ID: <20241118141522.2046021-1-bhanuprakash.modem@intel.com>
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

Just to sanitize all properties we should clear all
pipe properties on reset.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 76f32e1e0..22b6534e6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2612,6 +2612,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
-- 
2.43.0

