Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB94C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF3310E1D2;
	Tue, 25 Jun 2024 13:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDvDanm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AFA10E1D2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323654; x=1750859654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JnCyvnQKz8ySLCZzmRlh+wSfEDJ7LBPdh7TVwKfx7zI=;
 b=DDvDanm/v4uw0eyu3ghxkGjJXSCFS2655ZxRaQchGoKYO+IJ33rweFJ/
 5IVUIhv/I4oIJ9kFiik/897k6aIdiiXus9pPtPzIQoGNgSEqSyIjSfIer
 LhV3de+XUDOKTMISA/HSRoHEL8gNRyn6TLxVzfX53xyH15dmB2janVCno
 A6fK+zmOaOJJpuGGwu9Ji7/BP7Yhqcc8C2Z7H+NC+1ju6ZhDKb37gYb7n
 6erjn1L9MxxlUw5YjK50GtlJqB1TauunaCR7Qlktl7DoXA2cdZUim4fR6
 +m4KqDi9uKc94PsP39l/TjYSSeFm5QpSn4acmEClIWsklciqyQg27E8/+ g==;
X-CSE-ConnectionGUID: ozvVKIqdQAOeR6t5SkwUqA==
X-CSE-MsgGUID: doOnxrQ7R++mbzc55HcZyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16486705"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16486705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:54:14 -0700
X-CSE-ConnectionGUID: BVJqvjWeTGi9Sonh0x8KXQ==
X-CSE-MsgGUID: GtdKrtHASQecv9fgafprDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48644184"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:54:14 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: prefer HDMI
 port for color tests to avoid DP FSM failures
Date: Tue, 25 Jun 2024 19:36:05 +0530
Message-Id: <20240625140605.1420518-4-kunal1.joshi@intel.com>
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

Both DP and HDMI connectors are fine to capture, just we are more
stable on HDMI and sometimes face DP FSM failures, for color tests
prefer HDMI if its present, else use DP

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 392eaf1f4..5550cec22 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -468,6 +468,19 @@ static int test_setup(data_t *data, enum pipe p)
 
 	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
+	/*
+	 * Prefer to run this test on HDMI connector if its connected, since on DP we
+	 * sometimes face DP FSM issue
+	 */
+        for_each_valid_output_on_pipe(&data->display, p, data->output) {
+                for (i = 0; i < data->port_count; i++) {
+                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
+			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
+                                return i;
+                }
+        }
+
 	for_each_valid_output_on_pipe(&data->display, p, data->output) {
 		for (i = 0; i < data->port_count; i++) {
 			if (strcmp(data->output->name,
-- 
2.25.1

