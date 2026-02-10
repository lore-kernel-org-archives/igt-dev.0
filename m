Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97F1EA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5663910E5AE;
	Tue, 10 Feb 2026 15:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FyMPStNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E6910E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737084; x=1802273084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DPjSoKLh9wmMZ+CgRXSazAl0ck3M9sRcFr68wptUewQ=;
 b=FyMPStNyMvICcm6+vom1WlyWKbL2JgrLLKDmJ3QBx9ZVpMNtWlnJFSdV
 Aadmb2bd7ETPKarIRPE/uIiLP0B7c/Iiesqe9kwh3wtiCgKl+ZYSYu2Y4
 RwX8WXJ+7ggJs1TiTgGL7U8PE5B66ZmZtr/WyU1BBhcmmJKN5gA1eWGAK
 mLBZXqeTVRxAvGzp5A+Jxqq/fK+roAEtY+M9ryODdR8BpEdAiM+IuvlfJ
 s0BLGD9CMKm0X4acqh0XdtFfAAew46LvdWioioWOAmGZinXLwFONiTO3q
 xa833DKK6Yx80rBdhy+K+V8llLBLkAFQ1+DDLN3AWEJ7EQe1ElNd3qPt7 A==;
X-CSE-ConnectionGUID: LkmUzCLPRwqbi/W9kUSxkg==
X-CSE-MsgGUID: 4lQV2tl5QKuqwDRGp32/XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912075"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:44 -0800
X-CSE-ConnectionGUID: qyIJPcSeRBKLiXAA/p9EKw==
X-CSE-MsgGUID: aL3DtUlyTZ6NdDJ74HCaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030297"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 06/11] tests/testdisplay: switch to CRTC index
 terminology
Date: Tue, 10 Feb 2026 17:23:47 +0200
Message-ID: <e63543f6315c5568822dd9d5e16eb2b516f4ef70.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Everything about the test operates on CRTC indexes. Switch from pipe to
CRTC index terminology.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/testdisplay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index aa9f397a5bba..04cb41e756eb 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -128,7 +128,7 @@ struct connector {
 	drmModeEncoder *encoder;
 	drmModeConnector *connector;
 	int crtc;
-	int pipe;
+	int crtc_index;
 };
 
 static void dump_connectors_fd(int drmfd)
@@ -229,7 +229,7 @@ static void connector_find_preferred_mode(uint32_t connector_id,
 	c->connector = config.connector;
 	c->encoder = config.encoder;
 	c->crtc = config.crtc->crtc_id;
-	c->pipe = config.crtc_index;
+	c->crtc_index = config.crtc_index;
 
 	if (mode_num != -1) {
 		igt_assert(mode_num < config.connector->count_modes);
@@ -530,7 +530,7 @@ int update_display(bool probe)
 
 			if (test_preferred_mode || force_mode ||
 			    specified_mode_num != -1)
-				crtc_idx_mask &= ~(1 << connector->pipe);
+				crtc_idx_mask &= ~(1 << connector->crtc_index);
 		}
 	}
 
-- 
2.47.3

