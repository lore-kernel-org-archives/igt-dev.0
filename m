Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE34C531DD
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 04:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3CC10E25D;
	Tue, 13 Aug 2024 04:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfcA1kFV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A6C10E25D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522925; x=1755058925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sz9vNQdJ7NQ4MLGulSu3AZljZst/kxPdQx7aYUGvDCU=;
 b=ZfcA1kFVKuYgdTS6xDAaeDCFgho+Y4boI13SkytH7lAL58jBErp9vM2b
 tB6ewxmRqA5by5OybJkxuakGnvvxWLw2bsusrcvC4d9JLI4MSce+UCY2e
 ZHPYoNmNiefiB1uFzXJQ95KbfnB63QJN7BzMQrfBcTcqtkULaBFsDn4bx
 Y29xlErZP4+Q4KsvhMFIimbZs9b2hCqckPWh5sVkD3fDKF753OyQaG4bw
 eW5gEEtjxE3NTTFIoqsKR1yHXqdFOHAnHEF7BE4V5NfynDtRaPJhB+Jj6
 vAvdV9p4b6AVOrRMc85OTxN/uWYpqdQzg0POoA+YctIdOQ4vpVsN+0cAr g==;
X-CSE-ConnectionGUID: uZ9/uqQGRiy22ps/GCfETA==
X-CSE-MsgGUID: d0R21pp5QT2+ymUS3EiESA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186577"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:22:04 -0700
X-CSE-ConnectionGUID: DdWOamNnTQaqDnOdEhhYYQ==
X-CSE-MsgGUID: xOiM2mQKR2uKM9zdzzEMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58210039"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 21:22:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit call
Date: Tue, 13 Aug 2024 09:49:33 +0530
Message-ID: <20240813041936.4014668-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813041936.4014668-1-suraj.kandpal@intel.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
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

Currently we are calling try commit twice once in if condition and
again right after that. The correct sequence should be we call try
commit again only if the first one fails.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6bd744351..db6dc17b1 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
 
 		for (count = 0; count < valid_outputs; count++)
 			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
-	}
 
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+	}
 
 	for (count = 0; count < valid_outputs; count++) {
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
-- 
2.43.2

