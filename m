Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBE0D70E1A
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607610ED8E;
	Fri, 29 Nov 2024 04:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOrl7IOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6572910ED8E
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 04:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732853579; x=1764389579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkaDad7V9SKb+5ncmRUmeY2uJAn5oOlODDtfnUrZ0X0=;
 b=IOrl7IOhIF1urSiWxkzcL0o+P6Z8JpcfkAxZUrR7tMcHBHuJkaXetDx+
 46hzXKjlSI476EPt3l2cnQMK8dY6FdPHUEB4RA8MA8vz1ckcAB/K0ECxl
 UE7lLo/lF6XQLf16lWWuwopy3GLS8HCIfzHtoKBia1Sn8CmZgexkDwJbr
 x80mQZSOJ7lt0N7TNRQrA2HmyBBxcxZo7ArWEsVc3HQhQYge/Iptm5hMF
 /yWf526ivcDinT1N41kFlYl5A0mgoBHYuG52uudWuiLJEx0IogmrYoRfJ
 YUBKVwS4piQX3oMXyqNjpI7EB7B0i+kOz5BxhLtzSO17UiIWfbs79Uk9g w==;
X-CSE-ConnectionGUID: o9uUHRkkRsyJFQxXFnrE4Q==
X-CSE-MsgGUID: D3N1qo7/QEeG97wHCr2lXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43704023"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="43704023"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:12:59 -0800
X-CSE-ConnectionGUID: jdclH00SQmiQsGa2Ix2Xeg==
X-CSE-MsgGUID: o+6BHbEAQjyF5n/G5VaB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92849029"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:12:58 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_display_modes: Skip test if joiner
 display is connected
Date: Fri, 29 Nov 2024 09:57:45 +0530
Message-Id: <20241129042746.701796-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129042746.701796-1-jeevan.b@intel.com>
References: <20241129042746.701796-1-jeevan.b@intel.com>
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

