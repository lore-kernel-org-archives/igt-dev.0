Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFF210F9972
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214EE10E3BE;
	Wed,  8 Apr 2026 20:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbKBj1jC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1D10E6DD
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679708; x=1807215708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xmlgauChcgrfeYs1ZeUlSl01EQkmsYRBiPsyw55qd5E=;
 b=WbKBj1jCG38q3kW4GUrsUO/qte7KcJ3xVxBLLYNYx6LW5C0eE9kZfrdA
 GJDNRUuQj1BsSYHqnTlTiYtEz8pjTCPPxtrZ3zfqQoq0D1oFtyA4rKm2P
 TikoGoZ0VbvGhNYixBYRSzmtj9eSJR169CIoM/hZ/P4qMnREO0md8lOsM
 6JwrQfIWzgC9t1iGjYGL+uun7EFAl6yT66n8I25BVgLvzGMN6tFdJ4jCf
 QbCaJJGE4sOx/w6fc1tTykzSvEyjXiFs1so7VDQBRWsqzNFz9fpwgvaab
 jX+Dp/w7bGl5vSn2vnuyxW7jrheCvGcss3vqY9MS9WsyjTMBe8I5nWLVA A==;
X-CSE-ConnectionGUID: +Moy19boSYyQV/6LjHG44Q==
X-CSE-MsgGUID: YL4ikkQXSaWL9UwdbHK8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="64220923"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="64220923"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:48 -0700
X-CSE-ConnectionGUID: /t7ibo6gS9+2TjxjyuNINQ==
X-CSE-MsgGUID: VaYsIrOzQxei195lh73vpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="251711144"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 6/7] tests/kms_plane_scaling: use
 for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:12 +0300
Message-ID: <8341a13bfb1ac085c80d3c0398fc43035256e706.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

We have	a helper for looping the output	modes. Use it.

Use the mode local variable for the loop, and rename the one indicating
the found mode.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_plane_scaling.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0941dcb4eb05..fde8b8370c9f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1221,21 +1221,20 @@ static void invalid_parameter_tests(data_t *d)
 
 static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const struct invalid_paramtests *test)
 {
-	drmModeModeInfo *mode = NULL;
+	drmModeModeInfo *found = NULL, *mode;
 
-	for (int i = 0; i < output->config.connector->count_modes; i++) {
-		if (output->config.connector->modes[i].hdisplay == test->planesize[0] &&
-		    output->config.connector->modes[i].vdisplay == test->planesize[1] &&
-		    output->config.connector->modes[i].vrefresh >= test->vrefresh) {
-			if (mode &&
-			    mode->vrefresh < output->config.connector->modes[i].vrefresh)
+	for_each_connector_mode(output, mode) {
+		if (mode->hdisplay == test->planesize[0] &&
+		    mode->vdisplay == test->planesize[1] &&
+		    mode->vrefresh >= test->vrefresh) {
+			if (found && found->vrefresh < mode->vrefresh)
 				continue;
 
-			mode = &output->config.connector->modes[i];
+			found = mode;
 		}
 	}
 
-	return mode;
+	return found;
 }
 
 /*
-- 
2.47.3

