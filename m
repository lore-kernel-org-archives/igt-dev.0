Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D9CCD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 09:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8710E83B;
	Wed, 10 Jun 2026 09:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8YpFdIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8C110E844
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781083908; x=1812619908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WMtSw2JnzVYISfASiY5pwF/DKe6G2g8k0PCXXetPA5E=;
 b=J8YpFdIEtbilZmTCmzOCM3EX0s47SJWaCJw4lIg+bhgyzuBIS8oDWeY0
 Y1nAyyDCu4MVxKckNe8S0OjTg/Gkgox2kK5kO8acQkp8Y+iYXS8CjAjHL
 7igrR8c9hgKz5twaoq9yNKzZmLgsGZAFPIlXYAjx+kgImJOJnxTzrXyji
 Tyn3jRYQLhu2TSXPpP6YB655jolSC9DYzvUs0hGJHZRrB+ZoW7wP/cVjY
 i4xJGP0omHfWaqjBpM6m2PssnHYcEhnfg2ypqVCogjY274GtO3CryaJjt
 SPj3sH0eUvZ5YMIiUkf0DZNDBsf0V2q3Aou3Yx+OLHg6Djdd7lnGUbII7 w==;
X-CSE-ConnectionGUID: dngJI5h+QU688AgYIXx8bQ==
X-CSE-MsgGUID: msyLtPMqSeq5ygNsE0iBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93359340"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93359340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:31:47 -0700
X-CSE-ConnectionGUID: kx03MnXaTg+OB5pva9SU8A==
X-CSE-MsgGUID: TwAdbRmSQl+UjTF4gYxYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246218966"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:31:46 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_psr2_sf: Restrict ET validation to
 eDP only
Date: Wed, 10 Jun 2026 15:02:15 +0530
Message-ID: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Link: https://patchwork.freedesktop.org/patch/msgid/20240619062131.4021196-5-jouni.hogander@intel.com

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_psr2_sf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 1cc57ad35..66166f3b1 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -238,6 +238,14 @@ typedef struct {
 
 static bool is_et_check_needed(data_t *data)
 {
+	/*
+	 * FIXME: Restrict ET validation to eDP until DP Panel Replay +
+	 * ALPM is stable.
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

