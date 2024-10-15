Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73096D216A9
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 13:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD310E2C1;
	Tue, 15 Oct 2024 13:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oK7rbz7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6510E2C1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729000673; x=1760536673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lgs2P+mKEunfidmGmC2Qes3fpIGfTrntnGseQIGz0sY=;
 b=oK7rbz7u4BqOVPxW9fGo5fr+OqzB/Fpf5mTDM1Ciczy0JnA3JC3nndnc
 alOTYeHhRc5GZRYMUx0gMcfUlD3UDW2nLfm9ZHeowkWLq+28jmSyemjtw
 04o4qFFrmTs7D10fw+hziiBoVg1QCd4ALoCalYg/sberrv2Y++OpSu60X
 dsBgkm+FZzCk/o5ze1Qu772OZibn6irGowUfvdpi+oi2+DUKI+aWu2KeO
 P7lLbyCKnjTappNeaiQSXkdr1VEnTVj3f6LspNZVx9OdVPnx46cMP26+G
 /N/baNO2O244RT5PAAYM2w7XuahdvmfXgRC/x0nihCwn22WY1Wc5vj9nl Q==;
X-CSE-ConnectionGUID: yHDXxvkESk2INcm3sVXzlA==
X-CSE-MsgGUID: v3gVwFDURfWhazup97uhZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28494409"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28494409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:57:53 -0700
X-CSE-ConnectionGUID: vztd/kpzTxqHzZtDFhjhtg==
X-CSE-MsgGUID: IvKAiuwYT2ueGd98osayTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77788276"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 06:57:51 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v6 1/2] tests/kms_plane_scaling: Add mode override in
 scaling test
Date: Tue, 15 Oct 2024 19:26:53 +0530
Message-ID: <20241015135654.2328448-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015135654.2328448-1-ramanaidu.naladala@intel.com>
References: <20241015135654.2328448-1-ramanaidu.naladala@intel.com>
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

Add a call to igt_output_override_mode to ensure the correct mode
is set for each connector. Modify check_scaling_pipe_plane_rot
function to include igt_output_override_mode. This change helps
in accurately testing the scaling functionality by explicitly
setting the mode before running the tests.

Fixes: 27926dd5792a ("tests/kms_plane_scaling: Find display mode fitting in BW for rotations")
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_scaling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bc9114acd..96ceedee2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -585,6 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
 
-- 
2.43.0

