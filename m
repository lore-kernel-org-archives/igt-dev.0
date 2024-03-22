Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ED3C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474CF112770;
	Fri, 22 Mar 2024 20:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJe+BRRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC0D11276F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140127; x=1742676127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LyvKqM+/mO7fODX0ARvxhSDi9Z3g0mUUzeF30oRDCYQ=;
 b=gJe+BRRIPZu7rY/Kke6kCre6F2QQ6j1+o1hFNGX9IzmlNw/eJA7wjY8J
 LgruqZImUYFeiLbHoMoJwPrLVxFWIBhCeI3cGgl/MHIESiDR8pV2JtLJ/
 W/ZfcKSrpFuRvP3mUaJ/YcqAxEfcCOMqEVfiJXPhkBfz0y/IBKOuwWP7c
 n3Hv8cbS80t+qaj21fBnaFtXQbvjWrBlmL3hcG8DaaVbFL5NakGdWrbMz
 TVhh0M4yPq71go4nl+39NauGTOr8vQIuyJbc8vg6yzWW3xrmEcIUkumWG
 FSe1ok2gjAdu/lLn4xDCpzElB8J5LXLpkAxjabLaH5sAv+v6m9EREVXS5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329385"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329385"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783622"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783622"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:42:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:42:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/13] tools/intel_vbt_decode: Decode the EFP index
Date: Fri, 22 Mar 2024 22:41:25 +0200
Message-ID: <20240322204125.17212-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Decode the new EFP panel index field.

TODO: hook this up into panel_str()

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f6549d6e0f76..c3d5db79f182 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1133,6 +1133,9 @@ static void dump_child_device(struct context *context,
 	if (context->bdb->version >= 216)
 		dump_dp_max_link_rate(context->bdb->version,
 				      child->dp_max_link_rate);
+
+	if (context->bdb->version >= 256)
+		printf("\t\tEFP panel index: %d\n", child->efp_index);
 }
 
 static void dump_child_devices(struct context *context, const uint8_t *devices,
-- 
2.43.2

