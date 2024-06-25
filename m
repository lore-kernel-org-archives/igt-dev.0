Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5716C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496810E653;
	Tue, 25 Jun 2024 13:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naDXEe1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F1110E19D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323653; x=1750859653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tC7D1hpKg/IaW2w+t6XodAWL0Ve2s9eZG+iR+BbZ1sw=;
 b=naDXEe1vjoGC/W7QgLUldh4/NoyH/aMMVR26P+ie5Q2ax054q798Ap58
 F8lkDf+n3UjHLkZVkL0tOANXfxTft/eIS2azodjdajtFHoTq508jR+wlI
 SLhlqKXdrMfRGu7KeIPTieopgXV1X2GreLqLsdfX9pKTZzyGuzFcywSvB
 +3AkhtKCRSMWirlw3lKSRtSI59ZEKy5+2LBlDH02cknzrRtDuKGthZZDk
 rE6XPr8oo/PqMOu24JOQMYThLnDhHqC9QggOfpQr5rUZ2y3y1TidB8h+X
 uwztpkdaYf4yUHeQLVZiK/bLUZ3Kv9aIEoiMuyI/wG2/th+jBqbN8eiJD A==;
X-CSE-ConnectionGUID: n/c7fnyIRJmVlBNxbS+V/g==
X-CSE-MsgGUID: e9cOnQeQQsK9cDq6h9zt7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16486702"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16486702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:54:12 -0700
X-CSE-ConnectionGUID: y+o6wGeoQsC9fjxPjrrriQ==
X-CSE-MsgGUID: ZETDnjIrSzmxvXxtM2V1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48644180"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:54:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: plug ports
 before starting the test
Date: Tue, 25 Jun 2024 19:36:04 +0530
Message-Id: <20240625140605.1420518-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625140605.1420518-1-kunal1.joshi@intel.com>
References: <20240625140605.1420518-1-kunal1.joshi@intel.com>
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

There is no harm in plugging discovered ports,
just incase they are not plugged we skip in test_setup

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 4156023da..392eaf1f4 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -709,6 +709,7 @@ run_tests_for_pipe(data_t *data)
 
 igt_main
 {
+	int i;
 	data_t data = {};
 
 	igt_fixture {
@@ -730,6 +731,13 @@ igt_main
 
 		if (!data.port_count)
 			igt_skip("No ports connected\n");
+		/*
+		 * We don't cause any harm by plugging
+		 * discovered ports, just incase they are not plugged
+		 * we currently skip in test_setup
+		 */
+		for( i = 0; i < data.port_count; i++)
+			chamelium_plug(data.chamelium, data.ports[i]);
 
 		kmstest_set_vt_graphics_mode();
 	}
-- 
2.25.1

