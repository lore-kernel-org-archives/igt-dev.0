Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8EDE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 13:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781C10E8E3;
	Tue, 10 Dec 2024 13:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRKQF1+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1E10E8E3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733838632; x=1765374632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRrLDCe+aqbT3kxkM3Sf1XdeD18EvmO61fwQs7XUkJA=;
 b=RRKQF1+5EYTlx2FWnk8/god85HjJkrrkdev7vDA1Ws88OOi1DzDvS1Dj
 DjrvulLdgx8/O2loJaO9lVph9PIAOGL3fShgRFIAS8i3rfAmv9FBAtbTc
 smyJdswIjziXjETGXvqo8uhjGSyM5r2LGkwyan+Wc5fqqHLef+ViP1ynh
 vKQuiqCB9ubXUQQcuDilaNfEnGCXnWLS+5GGlulJwRMlUDYKXfWjoDAw7
 o5J0mPyQwPLkiV7mm+vfgRovOZRBZ9lr0guG5wPdHzbUFqibrAOoXK0kc
 0NFbt4sTcfy96v0WJBn9/YeBzxdzgm2aMIVNeNs1lseCbuzl7UHLCNr2o w==;
X-CSE-ConnectionGUID: iyxMLQsTRa+hEze5tZzPWw==
X-CSE-MsgGUID: OrXm1mQgRPyKsIsKlhp3TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34316551"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34316551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:32 -0800
X-CSE-ConnectionGUID: 0HsEB7GaR0u0qNGPY+ONnA==
X-CSE-MsgGUID: G96WQauIS7imhw03BuJnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="132804988"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:30 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_joiner: Add
 igt_get_dsc_sink_max_slice_count() constraint
Date: Tue, 10 Dec 2024 19:23:22 +0530
Message-Id: <20241210135322.2117541-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210135322.2117541-1-swati2.sharma@intel.com>
References: <20241210135322.2117541-1-swati2.sharma@intel.com>
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

For ultrajoiner min 4 pipes are required and each pipe requires
atleast 2 slices, which makes minimum of 8 slices for ultrajoiner.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_joiner.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 9a353ee1b..418ff26a6 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -457,7 +457,8 @@ igt_main
 
 			if (ultrajoiner_found)
 				data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
-			else if (force_joiner_supported && is_dsc_supported_by_sink(data.drm_fd, output))
+			else if (force_joiner_supported && is_dsc_supported_by_sink(data.drm_fd, output) &&
+				 igt_get_dsc_sink_max_slice_count(data.drm_fd, output->name) >= 8)
 				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = output;
 
 			if (bigjoiner_found)
-- 
2.25.1

