Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD57FD711CD
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D10810E0A3;
	Wed, 20 Nov 2024 17:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZ334OZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB110E2F3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732123769; x=1763659769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hh1rKI10uT5Y7kvuvowiFnnPQOSm6kdroExKDLVuoL8=;
 b=kZ334OZxZ9F6fY/GKY2b1lNJAy1GECcdOVGEkQzWkwikgnVc5WxeSe4R
 pQjUZpIi9uatz+dOg4tAZB4EDladEgl0eeLVTXJaY/h+CnugidjvjGoty
 0iAceIpX7InA/16md8aXlryBWYxKEcH/Dl+ipjReD2QnHKRGto21Gs4B6
 W/mEX9uQOBer4Gkirkg6VQdPjnJN2yjEVgB9CNfM3oBPaCByGMZObzRy5
 dfHEbRNp00Vd+JkGPZ9D/xeYYv4hFhndO8r+Taf0wSSIBakuJszmw6WBF
 4fukpg1sBinH/UXgHJWe1oHXJYQultwDFCwLs3tsewuUdB+om9ZTUM1Mi Q==;
X-CSE-ConnectionGUID: qEQKKgSNTpWcM1mhXZPZSQ==
X-CSE-MsgGUID: /A5LsFbZSDqAr1AlfxNEsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32307875"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="32307875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:29:29 -0800
X-CSE-ConnectionGUID: OPeITR10Rk24IhILV7J0vg==
X-CSE-MsgGUID: 9hzcWXdkRq6JHZeNnm0tpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="113254897"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 09:29:28 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_display_modes: Skip test if joiner
 display is connected
Date: Wed, 20 Nov 2024 23:13:45 +0530
Message-Id: <20241120174345.1970095-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120174345.1970095-1-jeevan.b@intel.com>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..a2ab8f267 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -318,6 +318,8 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			igt_skip_on_f(is_joiner_mode(data.drm_fd, output),
+				      "Joiner mode found, skipping the test\n");
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1

