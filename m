Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B5D60CFD
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA510E299;
	Mon, 18 Nov 2024 23:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6y7m/A+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566010E040
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972954; x=1763508954;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G7l0ib8+QEAgg4AIsKBibiDazGQbjzzu/FWpLW6Gqes=;
 b=Z6y7m/A+PHMFebSt6EqTKQn15lNs9ngzpxy2BGKGI1+Slxser1QjbIBb
 0NGMGUhDKn8n1RYto8G7ka7fuKNUNHXr59y2J0XJ1Kf/gUMFX8DHmmo3y
 OXILgI/Hk0wO8uDCfG5a1/4UI0YnG9eIa8Gvmx4ox7qjUJfPhYWxqWQt4
 E3093ZjfNde//ZhYNECscqcPoBkoskKZkWVPirFckyPmUZppBkYbzLaGh
 CHAVVKvmiXlICMvjIrnIknOGV/d9PPHTsFEk1UXQY87RyHFMUHVhoQVMk
 f/0lJ6Gj/OGpms8X78syh/DPunV6ZBDAvNWmskCOSjHrtKTyEhwVAec47 Q==;
X-CSE-ConnectionGUID: 9OuYbjfxSNut0DN2iheM6g==
X-CSE-MsgGUID: RKU3BUBPRTGcue436OMYuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451231"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: UhPclqnBTkKzTVYZP4VkkA==
X-CSE-MsgGUID: Kx+tWJr3Q6aK5qA+0u8mbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245227"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 10/29] drm/xe: Enable indirect ring on media GT
Date: Mon, 18 Nov 2024 15:36:01 -0800
Message-Id: <20241118233620.2373819-11-matthew.brost@intel.com>
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

The media GT supports this, required for UMD submission, so enable by
default.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b81e7d00a86..a27450e63cf9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -209,6 +209,7 @@ static const struct xe_media_desc media_xelpmp = {
 
 static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
+	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-- 
2.34.1

