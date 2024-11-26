Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E478ED3B9B7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D8A10E91D;
	Tue, 26 Nov 2024 16:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGC0Z0kK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51EA10E91D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637744; x=1764173744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkaDad7V9SKb+5ncmRUmeY2uJAn5oOlODDtfnUrZ0X0=;
 b=NGC0Z0kK358qWNflWcwLDeoPQFXJQKbcVNwS+HdJ58YQOI2XVlrNCejA
 YZkPO1UfpP61O+haevWsl8EwMCOdCI+qgmHhcm6yePSa2eGrizIsMNltr
 1AYa6buzHOVPd6vOwEYGcUfVd+F7XElqw/U0vTwlxpCe6lcjgL1dZ5d+p
 i2ALuO76d/pj9JmIZf/cYwibpqDfGrQXSydOAEBFx5qvcXcwCc/wGfvrC
 XKKVNc9viGVvb5wt8h/YEkjuTNzSEWQKxoQIWP41IvYY2+hRAOMVKnVOY
 AKG8sWc7ELWWRx61dPZEjUeJZ+54cH0I6S1B13B4MaDPeyQo4iWJTgYzj A==;
X-CSE-ConnectionGUID: yoXArRvZS5ilSAHGm3LlDw==
X-CSE-MsgGUID: IEWAt+H4Rk2APCDMx2eONQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43468133"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43468133"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:44 -0800
X-CSE-ConnectionGUID: hRccgTHCTF2cTYTtyccXHg==
X-CSE-MsgGUID: ULXHPFdHTAC1VJqPOJnMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129179989"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:42 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 5/5] tests/kms_display_modes: Skip test if joiner
 display is connected
Date: Tue, 26 Nov 2024 22:00:21 +0530
Message-Id: <20241126163021.458991-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126163021.458991-1-jeevan.b@intel.com>
References: <20241126163021.458991-1-jeevan.b@intel.com>
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

High-resolution displays that support joiner modes can cause extended mode
tests to fail. This commit introduces a check to skip these tests if a
joiner mode display is connected, ensuring the test suite runs smoothly
without unnecessary failures.

v2: Add output name in skip message.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_display_modes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..716e07a40 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -318,6 +318,9 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			igt_skip_on_f(is_joiner_mode(data.drm_fd, output),
+				      "Joiner mode found on output %s, skipping the test\n",
+				      output->name);
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1

