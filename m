Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32FD5B174
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 09:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986F10E5E8;
	Tue, 29 Oct 2024 09:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhfW/gtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5257710E5E8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730192935; x=1761728935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iACQGiFXQhjAeyx2A/O27gOhSxueK1yaCt5ye9auNjA=;
 b=VhfW/gtGi9G3jQIXvCqxk52RNcB1l+0hYffUve7ttUt2NzjYeqz0wMhZ
 ky9cdJwuWeIHzfbXWXyVVK1WTXn2+Bb/OtAaLfrNUyYDUc5ewf4Idp4Rx
 m8ua5i7zx3HL7Pwm1TFoiBKe2J2UDtpuH5iD8Eq4PGyUXfBjK4lj95ISk
 mOLqIPLJfUzMInBzp2AbeENeCMV7kmlJoc4eZdurlQTq8/+rQxdfqAIeh
 jObikNWHVa1tqLqQuH1jMvo73xOA9BedGwchmKLZUPBNKiy4kZFbHjeAN
 DT2q1tghXChX/4E92/L9nKf3y8psOSZO6BIm3zkx9JGT/5q80BYTJK5SY g==;
X-CSE-ConnectionGUID: xdrrHtiFTbakQdmT3KDKMQ==
X-CSE-MsgGUID: ifs+uLi3Qaex7MS7l++tlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29721606"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="29721606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 02:08:55 -0700
X-CSE-ConnectionGUID: kaVwdvQsTtudqX7s1l6gsA==
X-CSE-MsgGUID: 719hARFHSk2zwPKippkIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112702532"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 02:08:53 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Skip test if big joiner
 display is connected
Date: Tue, 29 Oct 2024 14:54:45 +0530
Message-Id: <20241029092445.1965070-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

High-resolution displays that support big joiner can cause extended mode
tests to fail. This commit introduces a check to skip these tests if a
big joiner display is connected, ensuring the test suite runs smoothly
without unnecessary failures.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..0950cc483 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -318,6 +318,12 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			drmModeConnector *connector = output->config.connector;
+			drmModeModeInfo mode;
+			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
+
+			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
+				      "Big Joiner Connector Found Unsupported Config\n");
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1

