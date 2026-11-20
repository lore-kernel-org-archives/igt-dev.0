Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFEC606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WfIX/OCO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9259C112A6E;
	Fri, 20 Nov 2026 13:39:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC0112A57
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795181689; x=1826717689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0509UwOWKKJsdUAWrsLVcIdpxC591ZbU0uD+z1RfRBU=;
 b=WfIX/OCOjYnRS9a6wIY6JHuO+ZaDwM5MnMtYdyyxePHdOhDTVQDdFkDq
 dlsJhm4HBPecXCtqYZE9uShUqo6anfEwKVp4c9X7EHgsFOCa+4isoq/6t
 eDJ02avUJ0D+I+ulSvButavWC2dXRthTwifgRPn6U5nK5MTvpDidUb9+W
 DY3kBxu6+W6Xb7YN7hvvjU22XMDMOsLKCcrWm7wzlhI4SNVMn6kYRatxx
 56xhrg67Msl3/x5SlyNEqB4o4JO0NA7JuHwvDQBRdp/ebIStsMpEbEuYo
 7Xct54+xVKLLFLnEB9AGOXTQFCWKVq+MjuKN2oGxrFdocpDFhqfJ4XMSb w==;
X-CSE-ConnectionGUID: 4Xl/+3r4TQWptCphniPVMg==
X-CSE-MsgGUID: 3IleHnfLSKeN6+lTlv468g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3943162"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3943162"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:49 -0800
X-CSE-ConnectionGUID: uTUTf9WnQW+uX17hley3CA==
X-CSE-MsgGUID: 1vpAzmFeRnGO4Bvfus0/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12412024"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:48 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_hdmi_audio_bw: Use hibernate helper
Date: Fri, 20 Nov 2026 19:13:59 +0530
Message-Id: <20261120134400.1888895-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120134400.1888895-1-swati2.sharma@intel.com>
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use igt_system_hibernate_autoresume() for suspend-to-disk audio
recovery. Keep the existing suspend helper for other suspend states.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_hdmi_audio_bw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_hdmi_audio_bw.c b/tests/intel/kms_hdmi_audio_bw.c
index c6b052744..31a7f2949 100644
--- a/tests/intel/kms_hdmi_audio_bw.c
+++ b/tests/intel/kms_hdmi_audio_bw.c
@@ -530,7 +530,10 @@ static void test_audio_recovery(data_t *data, enum igt_suspend_state state,
 					   data->output->config.connector,
 					   DRM_MODE_DPMS_ON);
 	} else {
-		igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+		if (state == SUSPEND_STATE_DISK)
+			igt_system_hibernate_autoresume();
+		else
+			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 	}
 
 	wait_for_eld();
-- 
2.25.1

