Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CC7C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 07:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3836D10EB26;
	Tue, 30 Jun 2026 07:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqlVVtpi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E402C10EB26
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782804100; x=1814340100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHIahtJ6udqv9BW/HBmAEAG5AmdMrkwO4EDcPe5NMOY=;
 b=TqlVVtpiBZd30BtL/3AgNOWBAQiA2BMZ4bCqzO+eKXUskyT/VKSs4HSp
 3loY2EyJvVCfFv4CPTiB0Aqni1ZApbrp7fAKYXqB7qp0fH+MJtnxnoGF1
 XWI2mP+PuIJDWuUfOwBIKxQ5e360XtJaICw7ziod7V/DF06dnOm25VAO4
 Lq99cLbDALje10beUygfMLqVyqEA+TfOaPzPcRYuRETghx7Ntk/qUKvEk
 YGV7bVoaKw7MvqCCo96iprCM56PSUlqCHiQhMUVLgndnlk9nCLYV7Q4sa
 /gLDIIgMokfl6kLnG0gg3jQR2QWKJ3mq7ZpxKdQTbMpos23WN4tk2dzWF g==;
X-CSE-ConnectionGUID: mvgS9EWARzia9/AdPjj6Ew==
X-CSE-MsgGUID: tygOZbHzQvO0+FkN4a9l1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106303143"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106303143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 00:21:34 -0700
X-CSE-ConnectionGUID: a/joydXsRT6VVt3nE/l0ng==
X-CSE-MsgGUID: RxY6v13RSl6L+7qIo5TnWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="256577397"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:21:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, animesh.manna@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_psr2_sf: Restrict ET validation to
 eDP only
Date: Tue, 30 Jun 2026 12:51:57 +0530
Message-ID: <20260630072157.2110385-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
References: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
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

V2: Update code comment.

Link: https://patchwork.freedesktop.org/patch/msgid/20240619062131.4021196-5-jouni.hogander@intel.com

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 1cc57ad35..b478eaa50 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -238,6 +238,13 @@ typedef struct {
 
 static bool is_et_check_needed(data_t *data)
 {
+	/*
+	 * FIXME: Restrict ET validation to eDP until DP-ALPM enabled.
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

