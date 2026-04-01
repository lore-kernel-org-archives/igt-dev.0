Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0BAD3516C
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 10:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BB510E3A6;
	Wed,  1 Apr 2026 10:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQtecfl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94BE10E3A6
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775038543; x=1806574543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x8AogdH3wiXl94+Dwwr9hqKQcL5F0h/bR4IIoG81rtI=;
 b=eQtecfl6QyO85lmuXwplKiIOQ0IzQCPjw5oPfZKfMT6Y6NzcIGlHg/kD
 g7jzctuEGZFTH9j6CyM5YGI/LVXjOch7jXKdGjBxb3dlyQGU6o1zSvaTD
 OG0D5c8/mhf5LVu2OPcovT44AMnp5mVKS9GgNAvXd7MT6ckerz/0qpn2+
 s9hOYKa95OdUsfN4Z1PQWAjyC9kRJDeACSiXkFHJa9mHUZPjRIj+8bXJl
 nGi6KFfAyziD28PB8wW6UvD5zwC5A3jjqvOvQ1GZP6Fvj5hqzmSIzUVqA
 Reqq4Z34O5dgjWJ/TNCsdMVhnNRmsmY3KCtia64ndFsn5tzSK+G94Gt4y A==;
X-CSE-ConnectionGUID: xG3wpgF9SVuRErAg0P5Tdg==
X-CSE-MsgGUID: 3Ut8Mw8gSF64XVimP/1qog==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87462026"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87462026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:15:42 -0700
X-CSE-ConnectionGUID: hMR+f0xgQa28ZPhdun4syQ==
X-CSE-MsgGUID: jrcWoenIQmaeOlZ0TmFsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="264563931"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:15:41 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Sumit Kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_invalid_mode: Add igt_info when test skips
Date: Wed,  1 Apr 2026 15:44:11 +0530
Message-ID: <20260401101411.408817-1-sumit.kishore@intel.com>
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

From: Sumit Kishore <sumit.kishore@intel.com>

Add igt_info to print the reason for test skip,
when an invalid mode is requested on eDP display.

v2: Update commit title and description.
    Add igt_info message.

Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
---
 tests/kms_invalid_mode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 5edffb649..1a4563153 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -136,8 +136,10 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 	 * roughly match the user will get. For now skip the
 	 * test on  any connector with a fixed mode.
 	 */
-	if (has_scaling_mode_prop(data))
+	if (has_scaling_mode_prop(data)) {
+		igt_info("Skipping as %s has scaling properties\n", data->output->name);
 		return false;
+	}
 
 	/*
 	 * Newer platforms can support modes higher than the maximum dot clock
-- 
2.43.0

