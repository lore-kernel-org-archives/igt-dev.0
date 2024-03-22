Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F630C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B63711276C;
	Fri, 22 Mar 2024 20:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHKwajMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3611276B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140118; x=1742676118;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=apY1ejFvdsWF4bGZRa+RGHpdjQ3XYBdbkI+VepwkkJ8=;
 b=UHKwajMj4pVBYY4EVFUeMh81Pm/Y7rLEFxGlISa1ntuNQpbRMut1hXjE
 tzgK+I57Bu8oxi8W247xQfsXbtpySdH8tzWT5F69BydsfcfEclnoaaXDb
 Q3aHPkgYInww0J+4Vi+w+1t5DRGcqAtRaBI6R1/B+Uhr9rhkkI8F7aG+7
 Iu0lKE67SGQNz9b1lDvelMrwx63nbMHxv10/Zmgk1c1AT43xCsnVomyc9
 nfGD9aZHGrOcY1kBZ5DjUWVWSy1qqG/9K8Gwd3gP9UpcEiBGrnkv7vHwu
 vpvL7lg/uvuabAVCWvppNsWWPRQkDTYB2pf3LG1tJ4o+2Wi6zJnkSkamz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329371"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329371"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783619"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783619"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/13] tools/intel_vbt_decode: Dump out the backlight
 entry size
Date: Fri, 22 Mar 2024 22:41:22 +0200
Message-ID: <20240322204125.17212-11-ville.syrjala@linux.intel.com>
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

Dump the backlight entry size for completeness. It's easier to
compare against the spec/etc. when everything is decoded.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 642cb84a56b6..b57d1e9602ae 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -627,6 +627,8 @@ static void dump_backlight_info(struct context *context,
 		return;
 	}
 
+	printf("\tEntry size: %u\n", backlight->entry_size);
+
 	for (i = 0; i < ARRAY_SIZE(backlight->data); i++) {
 		if (i != context->panel_type && !context->dump_all_panel_types)
 			continue;
-- 
2.43.2

