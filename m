Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E69D609A7
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 07:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A2B10EA16;
	Wed, 27 Nov 2024 07:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uv3fxQwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E60810EA16
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694386; x=1764230386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkaDad7V9SKb+5ncmRUmeY2uJAn5oOlODDtfnUrZ0X0=;
 b=Uv3fxQwI6RkoNewnajo8P+xlzcIXfKonIKWvQVvElV5hn4/AQ4oZ5Wdd
 WamhcSU0vSAz+6cas/TYBIQUz9sruuEikbfk3vF/KUjiUoQ3o55xxyzqL
 QR/ynEMq6NUlhCBZcHpfqcmlCe9aNzu+CTQLGw7+0dMVDAfjh/d7Nu0wT
 onC1Bc5pZkZ5OIQx2mTXw4W+Bg98k1DLEtrvvmuuXtwHCDbTq1mGMKARe
 QGImKEPX53k0gF17j449DOiN9mY+OXbtzaiz805MkgXv0cRkwpk4nFsBn
 0NUX91z2XJWCL4x3mUlTRuT+u95oVT5hOwMy3Nq8XiV7wqPKuOO1/tmb3 g==;
X-CSE-ConnectionGUID: IhT33b5GSxKebdGeF+otRQ==
X-CSE-MsgGUID: 1rbpxMfIQ8a6uXLunLpPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32628701"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32628701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 23:59:01 -0800
X-CSE-ConnectionGUID: dJDVNUM7RemoUTmkdjY/fw==
X-CSE-MsgGUID: 8YiK6H5HTdOkSQiC4N8Qqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92008479"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 23:58:59 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_display_modes: Skip test if joiner
 display is connected
Date: Wed, 27 Nov 2024 13:43:56 +0530
Message-Id: <20241127081357.569876-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127081357.569876-1-jeevan.b@intel.com>
References: <20241127081357.569876-1-jeevan.b@intel.com>
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

