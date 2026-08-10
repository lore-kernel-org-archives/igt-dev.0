Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633C5C5B567
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 19:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D959110E985;
	Mon, 10 Aug 2026 19:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoJcx4BZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153410E985
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786391105; x=1817927105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I418hHQCVs1PvLY70HV17Uj97hgM03ERpCbN+E/fVms=;
 b=JoJcx4BZY489xhEIuc5cQ0Wb88eeJWu8hQTs3hezAs1eRoLUhKb3uGzE
 dpfxDWyU/Od7gZHbgcp8SdwpsSU2TH5uEft3xcY59TG+lTn4hKsH2LFJN
 xvWbKSTqVPccJWvnsfEV/idZjTsiDa4DpOJbKQFpbCAghDp9WhfNPsbk0
 YbAh6lCcFi2wm1fESdJXE6L4OnntPwYcFkBuDm4Wky6zceaJi9xEJtBCg
 1kpyQB/Qsmg/ph21qu26lBSMFdDWs3PMjoARxAloUwdng7+ZOsCa3X9Ka
 Nbwi4yR2urybKInq/jFZ4uDzuo6WUhsVHluTOXLt0agSB6Mx4w+WvRYMN A==;
X-CSE-ConnectionGUID: lCE4bLxFSLCxiDVfgKYGMQ==
X-CSE-MsgGUID: HANqayG/SA6isarXMNod1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86675862"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="86675862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 12:45:04 -0700
X-CSE-ConnectionGUID: DADkeY7AQQmSIRmuO1WYng==
X-CSE-MsgGUID: xrFo3kQDRfm6096iUEIpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="286542483"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:45:02 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_psr2_sf: Restrict ET validation to
 eDP only
Date: Tue, 11 Aug 2026 01:15:15 +0530
Message-ID: <20260810194515.1080592-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630072157.2110385-1-ramanaidu.naladala@intel.com>
References: <20260630072157.2110385-1-ramanaidu.naladala@intel.com>
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

The current driver supports Early Transport (ET) only for eDP
Panel Replay. Running this check on other connector types can
lead to invalid results. Restrict the validation to eDP to keep
the test aligned with current behavior and avoid unnecessary
failures.

v2: Update code comment.
v3: Update code comment.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 1cc57ad35..eec916c25 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -238,6 +238,13 @@ typedef struct {
 
 static bool is_et_check_needed(data_t *data)
 {
+	/*
+	 * ET is supported only on eDP.
+	 */
+	if (data->output->config.connector->connector_type !=
+	    DRM_MODE_CONNECTOR_eDP)
+		return false;
+
 	switch (data->psr_mode) {
 	case PR_MODE_SEL_FETCH:
 	case PR_MODE_SEL_FETCH_ET:
-- 
2.43.0

