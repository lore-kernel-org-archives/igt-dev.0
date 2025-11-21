Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5478ACFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065E610E037;
	Fri, 21 Nov 2025 19:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFEt1X4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA4410E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752011; x=1795288011;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EYnV7S9oVc8ZFnsrR1dPgZhvHxgDIl1BHF8Ar4dUd1s=;
 b=YFEt1X4t8islWOZJkFH7BuIbBYFI/zYbNsRWyeqHEWWswmDTuGdr8KzO
 Zds+GI7+yg5r7eDicptsznzfEpeBW+A4EjD4XP0IMx//KDttAlyX6JsNR
 JiRScm2PCRvbQrAS3q7cmKelw8MgJsQT2wRRsiUf9mfrizx/b7at46JwR
 FCQhmmqq8+LZwsKQ/KPM/m1Qh+VTvhLKeeHFNRg74sbdEUQFN95zOznoY
 Nyh+ftS5j6LHckQ0oseJTEXmel/BdU0QkCCcjn29W145ccmcSi6EDnPmq
 FauJjUgJic/pS06u2tUrs2q5rQtLgy76RwWpBKECb4YlhFHZ0Au56sCfa g==;
X-CSE-ConnectionGUID: yVOJDC8HQVm9syWw2RXSRA==
X-CSE-MsgGUID: C2/IBMmYRHCtShemqXw3JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454393"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:51 -0800
X-CSE-ConnectionGUID: 4k4NFGmmR5mxOpgza9qdag==
X-CSE-MsgGUID: G291E/lHR+GRqcO+2zveXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537609"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/8] lib/kms: Nuke unused kmstest_{crtc,plane}
Date: Fri, 21 Nov 2025 21:06:28 +0200
Message-ID: <20251121190633.24522-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
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

struct kmstest_plane and struct kmstest_crtc are unused.
Get rid of them.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e1241342a0c9..c9216dd5bdbe 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -214,26 +214,6 @@ struct kmstest_connector_config {
 	char *connector_path;
 };
 
-struct kmstest_plane {
-	int id;
-	int index;
-	int type;
-	int pos_x;
-	int pos_y;
-	int width;
-	int height;
-};
-
-struct kmstest_crtc {
-	int id;
-	int pipe;
-	bool active;
-	int width;
-	int height;
-	int n_planes;
-	struct kmstest_plane *planes;
-};
-
 /**
  * kmstest_force_connector_state:
  * @FORCE_CONNECTOR_UNSPECIFIED: Unspecified
-- 
2.49.1

