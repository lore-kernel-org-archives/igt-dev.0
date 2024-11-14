Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B91D6A229
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B518210E35C;
	Thu, 14 Nov 2024 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOafvAog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8724B10E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611025; x=1763147025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MpmAeuSKgW5YLAA9tZnKv5wHcrarPBLwswJYgoDm3KA=;
 b=iOafvAogKtIGu1EXjeBmCA+f1ick9+8O++mruuew/VL/KCqh/hs+ipaX
 Ti02jhdjVNA3sJT3OHTLUtyisXXjbV36ceM3BwERrVILTJHG6/OB599qA
 9voKSZFrkGDpN6Jq620YCWuOs3BkhSEaB2JBdASXg4pYeWp9fPsAsToS4
 68H5fSZDJH6ODcaM7S80D2wCYD+hAkvlJIdxKuzsFBbihLxpyZH+jScCq
 OgUoI1MxDrFe2iVlf3uXVCKUYzC2ZHDwDuve1mWK89K8e+qIaHvv2Khth
 XECk4N9LImezcQYkrT9E3E5aoKOst2roFd8NbAM1/xi9MIjB4s+cUpeeV w==;
X-CSE-ConnectionGUID: 6pVgk8NpRsSrFGVaUnGYXA==
X-CSE-MsgGUID: AyzmKuLSTcCtUbHv9OxoMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442557"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: UVfrZmUpRjiJw4OiRB6Juw==
X-CSE-MsgGUID: CCLxlqMNSFW1j66zeZHOIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242105"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/9] PTL: lib/intel_device_info: Enable flatccs for
 PTL
Date: Thu, 14 Nov 2024 11:03:32 -0800
Message-Id: <20241114190339.3885752-3-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Turn FlatCCS on for PTL.
Update blt command properties for PTL to be same as LNL.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 lib/intel_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 69132e91c..7a2109598 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -531,9 +531,10 @@ static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
+	.has_flatccs = true,
 	.is_pantherlake = true,
 	.codename = "pantherlake",
-	.cmds_info = &gen12_pvc_cmds_info,
+	.cmds_info = &xe2_cmds_info,
 };
 
 #define INTEL_PCI_ID_INIT(_id, _info) { \
-- 
2.25.1

