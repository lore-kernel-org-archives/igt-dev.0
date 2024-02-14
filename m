Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D860C48BEC
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B63110E5B1;
	Wed, 14 Feb 2024 06:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Drd51r78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1298910E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893160; x=1739429160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aRn5f6D6RY3tfF6BIYqF8Cvwk9Pwr+vR2yJKWXd/nSc=;
 b=Drd51r78sxY501kOV3obSWsgU0k9+s/mqXAjFHbxsC5toeQW3xNjstVu
 kKkfGeu5qEW+Fk0DGCW6IdbAnxrxRRjSXuWArPSWy+mQXzYHRAXDw/8wa
 F4bet5ka4pM2jQ0aendoHl+/r/7Z+ywgYrzv19d4Qeocc2y1Q6D7hekPa
 +1DaOVtAwHAabMD7iLMgZ5wmcoq5VtF2jqD1JDgMOB6XPoWRv5TVFqFHg
 bfkyyD5TyDNTX5WMto5AswYyOVxUFbx8IXnmo1QaOqRlA6YH6Vp1DbxWo
 3uE5AyfbNcm84uxXyxokIllZNsktnOP7U4ISWat6Ttp1vi79zCp1Y6RkW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645481"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645481"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427643"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:59 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 13/22] tests/kms_properties: Fix compilation errors
Date: Wed, 14 Feb 2024 12:09:44 +0530
Message-ID: <20240214063953.1285495-14-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_properties.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 8e7aa6559..151fa6a92 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -316,7 +316,7 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
-			if (!i915_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any = found = true;
@@ -866,10 +866,6 @@ igt_main
 	igt_subtest("colorop-properties-atomic")
 		colorop_properties(&display, true);
 
-	igt_describe("Tests colorop properties with legacy commit");
-	igt_subtest("colorop-properties-legacy")
-		colorop_properties(&display, false);
-
 	igt_describe("Tests colorop properties with legacy commit");
 	igt_subtest("colorop-properties-legacy")
 		/* TODO is this true? */
-- 
2.43.0

