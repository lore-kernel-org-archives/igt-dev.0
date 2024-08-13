Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE113C531DC
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E31E10E325;
	Tue, 13 Aug 2024 12:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0f6vop/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1387910E322
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551363; x=1755087363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NT51JyGILVk2wEHoy7AaCZzYe3fz8VqEHb2mmsrA2gY=;
 b=c0f6vop/R8L14BJbElGcyikIllg4nS4ruOrqg3kD9XsP6clxMMbzmU2z
 +5mtNq/fmCj4epldBigDbTIkgSnMMBOvYaw9Q8o0yNtzuG/U9cUSN4XS9
 sVnE50j8bl/Q3KWyNzKS9934yRD3vMpfP4t4YHLXDKU3OGiEBtBqQ0wVB
 fVNsHTH+tREErF55mPl1N5gxRJXjmz9gBZJmrcd1JS9EPackPMaDbQekr
 295f5xUVrCxGP+Qot20aFReA1vmqCminDNTxJOe7Lc//xSN6wOt4ByvC9
 4XoCAkYpsOgLmsPVSncoomgqBPMvBV9TX98Yt98u9jYUS++7B5ZXFaT7L w==;
X-CSE-ConnectionGUID: RNAVE2dAQpe86banrzWDJg==
X-CSE-MsgGUID: puYn6wdhSl+KvRBJXlxlkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869629"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:03 -0700
X-CSE-ConnectionGUID: ajZMcssEQ6SM8iKDfm4u0A==
X-CSE-MsgGUID: TTF9bqRNSzavOAqav8pSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181378"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 4/5] lib/igt_kms: Force "edid_override" to NULL on exit
Date: Tue, 13 Aug 2024 17:36:17 +0530
Message-ID: <20240813120618.2697195-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
References: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
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

Force "edid_override" to NULL on each connector on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b7c9d430d..c9f09c524 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3410,8 +3410,11 @@ void igt_display_fini(igt_display_t *display)
 	for (i = 0; i < display->n_pipes; i++)
 		igt_pipe_fini(&display->pipes[i]);
 
-	for (i = 0; i < display->n_outputs; i++)
+	for (i = 0; i < display->n_outputs; i++) {
+		kmstest_force_edid(display->drm_fd, (&display->outputs[i])->config.connector, NULL);
 		igt_output_fini(&display->outputs[i]);
+	}
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
-- 
2.43.2

