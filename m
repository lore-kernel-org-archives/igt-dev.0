Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F9C18E72
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613E8113770;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYlGD63l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A7711376F
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sL2erHgzB4R5X638LEGF1444UWBA4GpOuIrge0FvXY=;
 b=kYlGD63lQymmrE8DRhFk/2DzoCmtHJZCCVpP04L62jnoMSLzM3mdlApz
 YqTPmfFZH0hVZ4e9LrgJz5RrZXDOeOKWRDqwra1F8HyPNJ60LjIJuDAn5
 hLG3dDrEzeeD2GT3CeokG4SD6sjQ5zuTo8ttFPXy9tu+vcYVDS+mOyowS
 yRySX3yRmLcQ+cBl0qLV80YZw3yl5kreYDtc6kzSTgYF/3gxUe8t+1SS7
 PhWrFrZNK3KfHpaiqx+2KukpvivEhMifgq8mx8iLF0ZAvwq8qWSPlm32D
 jnJoT0RMOotEEP7PeH6Gt0uRM+Sxyr5z3GuODCthuJBV2nLxVWFYd7UyB Q==;
X-CSE-ConnectionGUID: QcLXMHovRm+/Zsb35N4Vng==
X-CSE-MsgGUID: 48Xj/nwrSBG8bQMlI7o/nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362015"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: JuW1o31TREKyN9mAZi8TVw==
X-CSE-MsgGUID: H/O1gVROT0GXg52xDoY/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180945"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 16/21] gputop: Add support to
 drm-cycles/drm-total-cycles
Date: Tue, 23 Apr 2024 16:44:26 -0700
Message-ID: <20240423234431.1959354-17-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

Add support for using only GPU timestamps to calculate the utilization.
It uses drm-cycles and drm-total-cycles read from fdinfo. For any
2 samples, the utilization is calculated as:

	         u[i+1] - u[i]
	pct  = -----------------
	        Gt[i+1] - Gt[i]

with u == drm-cycles and Gt == drm-total-cycles.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index bca7f4bc7..9edb76acc 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -208,8 +208,16 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100 /
-		      c->engines->capacity[i];
+		switch (c->dcut) {
+		case DCUT_ENGINE_TIME:
+			pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100 /
+				c->engines->capacity[i];
+			break;
+		case DCUT_GPU_TOTAL_CYCLES:
+			pct = (double)c->u[i].delta_busy / c->u[i].delta_total_cycles * 100 /
+				c->engines->capacity[i];
+			break;
+		}
 
 		/*
 		 * Guard against fluctuations between our scanning period and
-- 
2.43.0

