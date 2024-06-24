Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD2FC2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 07:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AC310E372;
	Mon, 24 Jun 2024 07:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyU7vmsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B201310E371
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212772; x=1750748772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHqgtoRdz7n2YnJ6L1luFbP0sw/CODU7rpnMBq6XUD8=;
 b=YyU7vmsBf7pXNvhYPWRIwQsAo6m12f9d6sux1jOt9Sqv4ybedgD7iMN7
 b6n3kAVcFjtFhxnQh8mulZRX0283jGixZMiQL3CAhLWv1zUF/iv/kYOhK
 +1zbbL6JOFyZvvla1dTmCvP0r3TsJOzpiReuvYMCL2Q5KgdelsV5UEtk7
 IvBWvi1tLdoON1JiU87lV8dZaJoVVxW1IYsoIsSF0muhMrglxCxFoPFHP
 bmQBF2J6DSoJLoGdUxhdsSoYtH6INb7uDT/lanCWk1TaInhuHfQRsFOn7
 nmwBTOc7uUGWdnKFs1TTiAEvs5JWnd2P/t/Lo3QtyU+9mRbxJWw8Ex4Vn Q==;
X-CSE-ConnectionGUID: GfiNTIl+TwuxFJ46TbtxZw==
X-CSE-MsgGUID: +QhPKHgMTwqoKmsbEdy7jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15921321"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="15921321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:06:12 -0700
X-CSE-ConnectionGUID: U8tYW5MJQzSkykoNlWH+rw==
X-CSE-MsgGUID: 2jTuauL1SYKNLJV/V30V5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="48372219"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 00:06:10 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH 2/2] tests/chamelium/kms_chamelium_color: plug ports and
 prefer HDMI
Date: Mon, 24 Jun 2024 12:48:05 +0530
Message-Id: <20240624071805.1356668-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624071805.1356668-1-kunal1.joshi@intel.com>
References: <20240624071805.1356668-1-kunal1.joshi@intel.com>
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

plug port before starting the test and prefer HDMI connector
as we face DP FSM issues on DP connector

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 4156023da..f8e80f350 100644
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
@@ -709,6 +722,7 @@ run_tests_for_pipe(data_t *data)
 
 igt_main
 {
+	int i;
 	data_t data = {};
 
 	igt_fixture {
@@ -731,6 +745,9 @@ igt_main
 		if (!data.port_count)
 			igt_skip("No ports connected\n");
 
+		for( i = 0; i < data.port_count; i++)
+			chamelium_plug(data.chamelium, data.ports[i]);
+
 		kmstest_set_vt_graphics_mode();
 	}
 
-- 
2.25.1

