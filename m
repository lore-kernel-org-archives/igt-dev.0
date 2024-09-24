Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB72CF9C6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3610E8CC;
	Tue, 24 Sep 2024 14:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZU7j0Za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8535710E8CB
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188565; x=1758724565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZD1/XxQqYF/SP5VOO1LlBnNu4mmGPludgJEz2xSAq34=;
 b=ZZU7j0Za75JWhd3irkNh8fNuKQtlJJZgXY6sGJNMeZytI2d+u5VciqvZ
 j0/D5gRkkD+3RlOE1j/SzSms1eE4TdrDSmj62AK4UXmwf/GZ7anXmZ5PU
 Wp/ablJULQUQMdv08pch63IKntr22755fkKICinuZw9W2H3QcuoOsNlgE
 eMJ21ebzmf4J6ipqel6Hi4RjKGB6XfOgxud0cjWGK72xe6ZXkjlobjb+b
 R7AOOLXgvaYliWnKrKpatnKS4uIwP3a8L3zaYEQsgOqoRt8v3TbN5gacZ
 Fx5rDoSyjroaco8dbA0EAJi91qEDixWeqgSQDuQX20nJXDsVQwlCftgVP w==;
X-CSE-ConnectionGUID: sAoDRKErTQySe81d4j232w==
X-CSE-MsgGUID: koi8cgkgS4KlCiHBDdv3sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26137203"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26137203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:05 -0700
X-CSE-ConnectionGUID: aqB8IN40SkabFP4vaUq9CA==
X-CSE-MsgGUID: zeqYSpFhQ1ys+Trvqk/M4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102258333"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:04 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 5/5] lib/igt_kms: Reset spurious hpd to default on exit
Date: Tue, 24 Sep 2024 19:56:38 +0530
Message-ID: <20240924142638.238291-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
References: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
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
index c1d80dbb8..e47db0309 100644
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
@@ -3416,6 +3429,9 @@ void igt_display_fini(igt_display_t *display)
 		igt_output_fini(&display->outputs[i]);
 	}
 
+	if (display->n_pipes && display->n_outputs)
+		igt_reset_spurious_hpd(display->drm_fd);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
-- 
2.43.0

