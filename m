Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59968E77186
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 04:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036E510E18F;
	Thu, 12 Dec 2024 04:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N268v0j3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BB610E18F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 04:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733977693; x=1765513693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gz0CF8Gv2kHoLnpBNc/kONHixPMUeNY8O01sqrv2h5g=;
 b=N268v0j3k7VWwRRCNKqTbSRmUDLTZaXlcpRixFhEiUJNoNrTLTkpy+CB
 DiXwLRmG4J0Yjp/sZVv5MQY1WHiUXROlOBpu3aV81I1Y4GUmT83fateRV
 dCB9NXTeIR2rTRymS8nPHwCk1O/BSx34T2zmZbCzIkmEPMgfYXR+npbuO
 rE0sJF5wNHBJ2dz+xiJbSvn4cLUGbp6UGkQbmHZJYONTSvaAEn3AyfdYo
 JkjG5zfo9fb4ZlU6urzPNYS+Tb+wxBLTisC125VpxSLQpidfFDt37v/13
 tKFPUefzRJZs8jfUEDnFaHG+QoV+KA0heGUvBkRgCdwT7wkn8cFG1jnQ2 w==;
X-CSE-ConnectionGUID: YlGnReIEReqd3lU/N0Rd1Q==
X-CSE-MsgGUID: P48yxi3PRS2G0uaKUrG9Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="44994150"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="44994150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:28:13 -0800
X-CSE-ConnectionGUID: rLL7L0prSre6GLK7/n8jvQ==
X-CSE-MsgGUID: j1qxdHnQTzO3XriUgD29YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96173863"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:28:13 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Update chamelium-only.testlist
Date: Thu, 12 Dec 2024 09:55:09 +0530
Message-Id: <20241212042509.30614-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

kms_dp_tiled_display is renamed to kms_tiled_display.
Update this in the chamelium-only.testslist

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3547

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 7f5c6978e..fa4e4e588 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -65,4 +65,4 @@ igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
 igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
-igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium
+igt@kms_tiled_display@basic-test-pattern-with-chamelium
-- 
2.39.1

