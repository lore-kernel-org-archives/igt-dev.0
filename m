Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB492CF9C6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 11:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6975710E88B;
	Tue, 24 Sep 2024 11:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVxoKDQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13A610E88B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 11:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727178472; x=1758714472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fCI58712lwHg2yyK7IiMsylO3NzbpoevYL95TKwMzQ=;
 b=bVxoKDQ16ecm8vMpWKMatN+tXXxM/h9D/Qzh91fNNpiwnArkcWELCPO9
 bpFCzARQHECrmyu6xivM0VtHbOOpjBbCh6Z0mOftX3bcJRb/s2nnzGRbk
 +/+VT0yDotrSlz1rLbRktE0X/Wp8OegwUS1c3RzJkUdbaZELMaYOiJjfD
 Wu3l0W3bw+rGc5/Mi+e5Ki8Y4svwCUmsQ2NRWo2zeJaffeNc3g8CJ33Rj
 VHWCUfXxgUQhvTy5BcJqflW9iSBlopH77g0EZZgtolEUaEslvTt506ecZ
 Pj5p7x/nbYifh70qDWxn8EDNe2/rsjq24U+dQkXEi0f9IhbG1WQg8aozm Q==;
X-CSE-ConnectionGUID: H8GQtiRiQb+4PBeWaSvNGw==
X-CSE-MsgGUID: X0gSpn1UQT6BwbnuQ7E0AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26261774"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26261774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:47:52 -0700
X-CSE-ConnectionGUID: GtjDr7sJQH+Y9Svy5heRUg==
X-CSE-MsgGUID: oXbAmDoXT/OL7353gZD9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71002815"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:47:49 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Add mode override in
 scaling test
Date: Tue, 24 Sep 2024 17:17:07 +0530
Message-ID: <20240924114708.2100110-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924114708.2100110-1-ramanaidu.naladala@intel.com>
References: <20240924114708.2100110-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

