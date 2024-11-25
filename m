Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2940CD58D65
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903310E6A4;
	Mon, 25 Nov 2024 16:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCjL81Ui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE83C10E69C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732551592; x=1764087592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkaDad7V9SKb+5ncmRUmeY2uJAn5oOlODDtfnUrZ0X0=;
 b=lCjL81UiucHGtIAmh+bU6t456T6S+8D0TAvBdw2+kFjCU5pFxabSoe64
 f6DJrm64rdOWxNb9NEhPawyE61x6KxOu7Y+DmDqBzB/9zhmw+a6oK2qKd
 sJLcpwMhzoNjX9IFix/9x0Ky6i+7H3g18NRyW/z3JGcIJwAX5FNCnkaUF
 AW41+73BGPuCkjz6gqzeL07GPqXnTzPiRaOL5vBsVer1VLnBxWvH0zH+p
 3VpGD+6bEDob05ta7HtNA68ywGQJ1SsOFejjCWd2zykPO3m4oG8uy4S3/
 49tw+F83baY5OXwaO8rnHfHxY2um/SpUWaUSBbawCy2vKOIv6ql4+T93F w==;
X-CSE-ConnectionGUID: bpgS4ZrPQVmRoV9OhXIeHw==
X-CSE-MsgGUID: RgSq/tkiTc+8UI5cLVswRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55171144"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55171144"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:19:38 -0800
X-CSE-ConnectionGUID: PqZk9uoCRxOB3V90yJ5Fjg==
X-CSE-MsgGUID: K1EoGiJfTGS3xRlyDw5tnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91768492"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:19:36 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH 3/3] tests/kms_display_modes: Skip test if joiner display is
 connected
Date: Mon, 25 Nov 2024 22:04:26 +0530
Message-Id: <20241125163426.382975-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125163426.382975-1-jeevan.b@intel.com>
References: <20241125163426.382975-1-jeevan.b@intel.com>
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

