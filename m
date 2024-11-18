Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F164D49208
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 10:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF0110E36F;
	Mon, 18 Nov 2024 10:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsevJ1aE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E5610E488
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731924647; x=1763460647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izIF9euECV1yX4WtTDwJ8e2Bp1gPfOqOgNIyzMkjtw8=;
 b=jsevJ1aEfV6y0vIPE7T0ysD2RKi5OIpp7JGsjAOV1HlXcaeSY6VS45k4
 FxXC1r7m+424yFaqi6MKw+C0J1iorWGUSkAa58n16zRBUvHW0BiBwtAZA
 /ZBmvtbPA+JBaStGcUr4DDrNIAkjSU1QodvU72MxMAExdGXkyhqsUNDpt
 xUpaEN5xFR9CeG0hu3CHdOTVFgRQ3eE/CwFAHAnmWZgGIdQM5dy9QQpJH
 y5AoCghHfeGvrlKFZ1OHNStBtudbRHz0Hp+T/m6g9AP8snJNh2NHR+5Mx
 KiFQbP0jCfgT6ItGWLl8RjV620u8bgnlQZSBhpUsZrEyGdfG85HjU6lqP Q==;
X-CSE-ConnectionGUID: 4GXar+g3RQyyYpVqFrs5kg==
X-CSE-MsgGUID: gY+UnX80RgCj0RMHgJ7l6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31809916"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31809916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:47 -0800
X-CSE-ConnectionGUID: ObIhkCncSG60xg7N//6CoQ==
X-CSE-MsgGUID: FgIqt3P7R1uCcBkKICz3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94272170"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:45 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V3 4/4] lib/igt_kms: Reset spurious hpd to default on exit
Date: Mon, 18 Nov 2024 15:29:48 +0530
Message-ID: <20241118095948.2017893-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
References: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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

Add support to force the spurious hpd to default on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f88c7d6c0..275589f70 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2922,6 +2922,19 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 	dump_connector_attrs();
 }
 
+static void igt_reset_spurious_hpd(int drm_fd)
+{
+	/* Proceed with spurious HPD handling only if the env var is set */
+	if (!getenv("IGT_KMS_IGNORE_HPD"))
+		return;
+
+	/* Set the ignore HPD for the driver */
+	if (!igt_ignore_long_hpd(drm_fd, false)) {
+		igt_info("Unable set the ignore HPD debugfs entry \n");
+		return;
+	}
+}
+
 /**
  * igt_display_reset_outputs:
  * @display: a pointer to an initialized #igt_display_t structure
@@ -3438,6 +3451,10 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
+	if (display->n_pipes && display->n_outputs)
+		igt_reset_spurious_hpd(display->drm_fd);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
-- 
2.43.0

