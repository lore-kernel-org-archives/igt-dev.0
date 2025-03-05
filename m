Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E28C282D3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 09:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E1A10E70E;
	Wed,  5 Mar 2025 09:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMi25LKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EE210E70E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741167796; x=1772703796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qOoFrM8fDNTHJkCGAyVifwa/1uR6an6qOFaYK8Xkscg=;
 b=IMi25LKOeD5KD59YgjK0iUb9N5eTV20rl7UxKg/NIDhM3VtCfAc7OdB4
 EEqqawf2OaWGoPZXNHcwcpTyJ6qJw8iE5x9dVPq5dyF6+VSB7fSmHYD4/
 p2VaGmgaKDcddPNCEE7c1Gv9MumnLTUS4592dX0w42Cr9QKSGNQZXEN62
 oP1piUOjLzc66trqQstsybUJ88SnUUdQfGFU5Tb83InGpOzFr7Knt84PL
 QQ2Q+YLAjsyAIkun9N261X/d/FWh6gySwGSe64C9moWVHpry8vvMUHRYN
 I+6skBd8+0w6tpKtrZjj2hX0070vlVFlSHukaXWU5nt/dPOIKTuaeSBnK w==;
X-CSE-ConnectionGUID: CZWAY++STc2T8V9w0Eocxg==
X-CSE-MsgGUID: DBZCleH7RhmivvCJIiC05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42145198"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42145198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:43:16 -0800
X-CSE-ConnectionGUID: dkRkaXuaQoO2mrcHgsCcwg==
X-CSE-MsgGUID: V1RFTVy/Rwava5RzHjZhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123571620"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:43:14 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dp_link_training: Restrict to Intel GPUs
Date: Wed,  5 Mar 2025 10:43:07 +0100
Message-Id: <20250305094307.1349154-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Use DRIVER_INTEL instead of DRIVER_ANY to avoid assertions on non-Intel
hardware. Previously, the test opened any DRM driver and failed if it
was not Intel.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/intel/kms_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index f00376614..7d3848b94 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -335,7 +335,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.31.1

