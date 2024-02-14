Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A8C4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122510E12C;
	Wed, 14 Feb 2024 06:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tijv4207";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C34B10E5D3
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893161; x=1739429161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sF5YXta9dCSRjdu9/SHclOJsSxJ+cSBhllTPTc8B8II=;
 b=Tijv4207VcInwxkJUIVEgEJB4JJa/KIj9os0UtRMK0WYF8db7fh8nQLs
 Z50nRKADnERuY2fjo5+vyUUyqrp0ujKdB1A87Ms8fd+2xnE7FR4hNUds2
 Nqldv+XJCa7adX+SRhFNLjz8nU7Xg1Q4SSqmbdkgRDdi8jgLOaMP8FiIb
 rlgH2U7NujRsdPkSwPGj/WCJnjEH9ivO8S/iXq2gu4GLdZaJmKk9ibgjm
 P4qFp8oqQ7ROAZGkxJAFSJ+KNK6t6tQM7hC0utLu64QaQUzNhlxxFfPpl
 EkNrYYEP2GYiN4NUUBziBOpQTpra0aZLNlmvPhk+xeenaMoO+L15DZT9x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645483"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427648"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:00 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 14/22] lib/igt_kms: Destroy colorops on exit
Date: Wed, 14 Feb 2024 12:09:45 +0530
Message-ID: <20240214063953.1285495-15-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

- Free the memory allocated for colorops on igt_display_fini()
- Disable COLOR_PIPELINE on igt_display_reset()

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 76b264bbb..41c259608 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2525,6 +2525,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -3252,12 +3255,15 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
 	display->pipes = NULL;
 	free(display->planes);
 	display->planes = NULL;
+	free(display->colorops);
+	display->colorops = NULL;
 }
 
 static void igt_display_refresh(igt_display_t *display)
-- 
2.43.0

