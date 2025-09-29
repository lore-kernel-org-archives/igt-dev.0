Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DA8CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97CF10E48A;
	Mon, 29 Sep 2025 19:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yofr0cuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828C510E48A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173705; x=1790709705;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aXfcRVrttQCmWJ2kZZS4hAQ4E4/j+DHjWfdM9LCjovg=;
 b=Yofr0cuYBelyWNuaXaKfHvAB4ejC2YjUvpIz7UmWDkjK0XbWKQ6BEXJw
 KZTjbDPukgXE+Nwa5PRBNrRv4rPMFt9VWXg88MwKrEOSG5F3SSTyRlnt+
 xr/F+loghB4r7DvHiiwlIluCkcSEjVNrxN9vGnoIuHLf3jt15vNtcljtN
 /NCm7qeW1PJtaG08NWlrB2mpgcuQvjMOhV+OwhudZQ+0kCYDE9oQqlxgp
 PHMcTJbdco4/Wi5AUmOXtqdZzi8bdf1YP6RU98yO3+7f0XWIiQsl4hohG
 YbAaO+3H0qU+gnPTE3QU0Hgvo7BtUSggBB37Odcc4G0uzRobWYh+T8C2d Q==;
X-CSE-ConnectionGUID: yPjU7vbFSvyj3bFOu2ei8A==
X-CSE-MsgGUID: KJ+wGl+eQf2AY3ZIgzoocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589845"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:44 -0700
X-CSE-ConnectionGUID: mfqPv+LPTLeXv1EZq6iCsA==
X-CSE-MsgGUID: MUxrXG8YSUaay8iftGvAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178250194"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/6] tools/intel_vbt_decode: Use panel_bits()
Date: Mon, 29 Sep 2025 22:21:24 +0300
Message-ID: <20250929192127.5865-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace one hand rolled panel_bits() with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9fece741840b..a049f0b4e32f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2415,7 +2415,7 @@ static void dump_edp(struct context *context,
 			       YESNO(panel_bool(edp->edp_t3_optimization, i)));
 
 		if (context->bdb->version >= 173) {
-			int val = (edp->edp_vswing_preemph >> (i * 4)) & 0xf;
+			int val = panel_bits(edp->edp_vswing_preemph, i, 4);
 
 			printf("\t\tVswing/preemphasis table selection: %s (0x%x)\n",
 			       to_str(edp_preemph_str, val), val);
-- 
2.49.1

