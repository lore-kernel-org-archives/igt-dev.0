Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9977FD2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22810E54B;
	Tue, 27 Jan 2026 11:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVlK0l1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F98C10E551
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514992; x=1801050992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jwNvvsE/GrAGKs5Qnp2ogBqm+S1m3lxHugwwq3rmgWE=;
 b=dVlK0l1SKCQQWkTmGx0VRsK1pwDaGpMHweAw/zN5wjVIzGhIwWM1T2hb
 LhFP2+XaOMfCZWCmxQTWwdOk5d/kmC2Xhxfle85DWMbwSZ3C6G1F1/MAa
 63Yw4zKnAHggdd6X3hMzsP7JUss6u4oGJgtcUxc+aPoohwIfWlfoSaS/i
 MbeBPzRYHSl/gFv6Q+mMZzxxSnGdQhyvFIJuyJ4TYDJ1im02zaG3Weg5I
 vrYAhhEQUO54sFQIBu4Au4TElgYh+IpmvszbLCkWJeIpgXnTxo7CUbMU9
 6vxJXsuSwAk3WxTY1zR4ltZCUHF+bZTtnyQfTT3Q5kUz2QFn1Oj0QqA0U Q==;
X-CSE-ConnectionGUID: Q13B7xrqRWS09b6UgU4FXg==
X-CSE-MsgGUID: 945khWk8RiOsif1hxrpwxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81011363"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81011363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:32 -0800
X-CSE-ConnectionGUID: 6twlta41TyGzub5wxISD4Q==
X-CSE-MsgGUID: OezbjFDmTReSl6QjsArD3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208010889"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 4/8] tests/kms_setmode: use CRTC index instead of pipe
 for intel_drrs_disable()
Date: Tue, 27 Jan 2026 13:56:01 +0200
Message-ID: <05c311883d80e602229d41dec2a7e86e4fb8fbef.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
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

All of the DRRS code uses CRTC index instead of pipe, even if the
parameter naming implies pipe. Pass in the CRTC index.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index e17edb0d0dd0..a7f7a5606bb3 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -664,7 +664,7 @@ retry:
 					     crtc->connector_count, &crtc->mode);
 
 		if (is_intel_device(drm_fd))
-			intel_drrs_disable(drm_fd, crtc->pipe_id);
+			intel_drrs_disable(drm_fd, crtc->crtc_idx);
 
 		free(ids);
 
-- 
2.47.3

