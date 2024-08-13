Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D3C531DD
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A775210E326;
	Tue, 13 Aug 2024 12:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShO8d1CP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A50610E326
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551364; x=1755087364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7fuiVgB49bA3gHyFref26E0/QQTGrzUpNjpIm9A7r+8=;
 b=ShO8d1CP69PA9gA4asS0cK4j/H1qGhjfjfHk/pexW06V8lEUPAIpbgee
 6CtsX2aOflz1YQV72zjFWZU6v31k7OVfqa+h+6SrFq6cF9vc9mwi+zdmc
 t2Dde+XeGLDyW82hQLEDG9ONaWC7e/DMHUZv9zhx6brH6RYsAAUUORise
 dXfPvYi4IDqZxmMiIo4IvliD6f8IPVlpsfU8A4YPNc2jmCTcV652H7fQy
 Wt7Xmw8bVydVgXlIteeUsy22DPvbcGGKfh1mEUsPvCbhkbLAwoc/slALF
 BEmjTtsk1LKrkupkDjDRuUARGmmdGvCxvONyE03+lJ1HJ9jHa5S94vLFE Q==;
X-CSE-ConnectionGUID: 8mmw0VLOSlePqE/voevg8Q==
X-CSE-MsgGUID: hTfBE0yJQsCjzAeb0343JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869630"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:04 -0700
X-CSE-ConnectionGUID: x76OCN3VRO2Xt6LDoR1yYg==
X-CSE-MsgGUID: /4oxF4AlSfedz2B+Y4F6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181390"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:03 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 5/5] lib/igt_kms: Reset spurious hpd to default on exit
Date: Tue, 13 Aug 2024 17:36:18 +0530
Message-ID: <20240813120618.2697195-6-bhanuprakash.modem@intel.com>
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

Add support to force the spurious hpd to default on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c9f09c524..936fec4ba 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2896,6 +2896,19 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
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
@@ -3415,6 +3428,9 @@ void igt_display_fini(igt_display_t *display)
 		igt_output_fini(&display->outputs[i]);
 	}
 
+	if (display->n_pipes && display->n_outputs)
+		igt_reset_spurious_hpd(display->drm_fd);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
-- 
2.43.2

