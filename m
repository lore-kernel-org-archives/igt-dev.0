Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674F9C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 17:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2200810E990;
	Wed,  3 Jul 2024 17:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dASMBgNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CB610E990
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720029062; x=1751565062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/GoSpWD/OOWqkZUSz4DtZ33zMoWFi8Qv5WHdSqWizXU=;
 b=dASMBgNmlRVf/k50xIk9ncQvg17bUh42lMSL5udGGhZ06pojJnoWNv3f
 7TwcLtHnFw72Hv6U69JsNtWUjFgsIEri4wJfWSPIriU41plWKls19QjPB
 HI7ujHhoR/q+j161JP+odJoowHVS2DMrY/2pIXYtWN+hQjFJUWRrd3CnZ
 ZCBQPVy9n+SMdS80OT7c9hq4tsTjaHEfihHswCcqlrX9qGMGVtErPuUx/
 W2neJgmfW/UmPFquH2VTCrMIZn/oxf2CaW9oIKALPn8EVeg+3W94qq8aG
 Vg54m5qL/jgMOk9/KLn9KQ8nhSg+SxFTDy3vGcJXMtoRRzhr8aBKH/HAO Q==;
X-CSE-ConnectionGUID: vMNHHptqSJa7/gxDX9ayjQ==
X-CSE-MsgGUID: Ez8j9NX2R9SFkNbGE15+Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17412369"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17412369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 10:50:47 -0700
X-CSE-ConnectionGUID: 3S+lYcNLSRi712UyAMyVoA==
X-CSE-MsgGUID: uAgHr5Z5S4C/bvQDVbrBqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="50922729"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.214])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 10:50:43 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Peter Senna Tschudin <peter.senna.tschudin@intel.com>
Subject: [PATCH i-g-t] Revert "lib/igt_kmod: unload mei_gsc_proxy for Intel
 drivers"
Date: Wed,  3 Jul 2024 19:50:37 +0200
Message-ID: <20240703175037.53008-1-kamil.konieczny@linux.intel.com>
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

This reverts commit c7650224f5d2af27c3500732a98ead3c3fab61f3.

Unloading this module breaks runs for i915 on integrated GPU
starting from MeteorLake, it should be applied only od discrete.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna.tschudin@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ca14186a8..33f059199 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -623,8 +623,6 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
 		"mei_pxp",
 		"mei_hdcp",
-		/* mei_gsc_proxy should be unloaded before mei_gsc */
-		"mei_gsc_proxy",
 		"mei_gsc",
 		NULL,
 	};
-- 
2.43.0

