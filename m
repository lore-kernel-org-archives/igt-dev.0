Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D73FC2BA15
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 14:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6610ECDD;
	Wed, 19 Jun 2024 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zhd6oz0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E576D10ECDE
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718807757; x=1750343757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=usRGE18FOBo/VTPkdkRQtCQ4EJRuJ/R8RqK6xWpCJIQ=;
 b=Zhd6oz0BuVJHv4qrZtIEV4k0hkHczscE17kc9/8OiGcxMS505P1QGNEt
 cXMjzmu24biSNhqK196M2aaA4YN8o0HGp9tiTSSwuOiyMfl6smArYKmJz
 h3JjyA62+GZgv+7fVXn/kd1NnbkfDqul26cG2QUwIu4YF48HxTPjcraxw
 i9gENfLSy0EQpjJ+rdOfbT491sWgON0oSk46VasGPyOOI4GwHomQXMAQD
 VMPVTqmRKjyicGbTnabyt85PSJ1HXKrpnGJlCy/xVxWvbBVFlQvXtS/Wp
 kM22PVpN3FeOH6bfHZd5YFIsYYAnf8b3C6UeEJV8xsPY+fH7l14aW1Vr9 Q==;
X-CSE-ConnectionGUID: aR25hGNETeODBqRgaOSNhw==
X-CSE-MsgGUID: hCskhOeBRuq2cHLKrWmvAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26342576"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26342576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:35:57 -0700
X-CSE-ConnectionGUID: 5GoJTwgkT/2pEIB0MbssLQ==
X-CSE-MsgGUID: 5dHpES87TKKFHMn4eOzPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="47074555"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:35:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_pat: account for Wa_16023588340
Date: Wed, 19 Jun 2024 15:35:41 +0100
Message-ID: <20240619143542.110461-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
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

We can't use the CLOS3 entries on BMG g21.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_pat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 041952bd8..9191b3577 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -24,7 +24,11 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
 		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
-		pat->max_index = 31;
+
+		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+			pat->max_index = 27;
+		else
+			pat->max_index = 31;
 	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
-- 
2.45.1

