Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF781CE8D67
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AF10EAE8;
	Fri, 14 Nov 2025 17:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZQRkho0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C02D10EAE8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140957; x=1794676957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2dQxra8NfEwuiNIlvdCK84IqTBDP5W6T346tBe4x2E=;
 b=EZQRkho0+DzWuj07Nu7vSMzac/n0+E3odU/gaQ/jIhFYsJTMkG66E6/2
 0J/3lxqKQwrjKZ/rl1hmRJmEQFtAFzeIEC/DPmEIal9kX00MJ0j6zeuMH
 AsEMd/ny2lWhNpShsO0H2lxpJVraaTsvVSMQR/uwTgbxlw956SFl2a5VF
 LGkn2ZdFlpc/Rhy9n8snR8dG3MeoZ1x1xEnO/+r5vQ89P5A+5qTt6K1YD
 upfytlNlWkDMhkn/BTtXpvd/OMmnxv07TnooNMy1oUUXg39hwSw9LXx52
 HJzGfpgfunZCsAb1F0lbucUuy0KBugGq4hipWYNNvygKsQndkQKh+laln Q==;
X-CSE-ConnectionGUID: wadouue+SOyd3npdACvcVA==
X-CSE-MsgGUID: Ubz/A57ETSqSqqQfUiOKWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871444"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:37 -0800
X-CSE-ConnectionGUID: aDp0DJeSQ+aVakHB92j4BQ==
X-CSE-MsgGUID: 7cZtql2zQSOloqO4t8fgPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981431"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:34 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 07/23] tests/kms_color: Add helper to clear LUT data from colorops
Date: Fri, 14 Nov 2025 22:58:52 +0530
Message-Id: <20251114172908.1027816-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Introduce clear_lut_data() to release memory allocated for LUT data
in KMS_COLOROP_CUSTOM_LUT1D colorops.

Marked __maybe_unused until integrated with LUT preparation workflow.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 56d2b282b..f8d74a92c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -724,6 +724,17 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+__maybe_unused
+static void clear_lut_data(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D)
+				memset(&colorops[i]->lut1d->lut, 0, sizeof(colorops[i]->lut1d->lut));
+	}
+}
+
 __maybe_unused
 static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 {
-- 
2.25.1

