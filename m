Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56864C677C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EE710E2B2;
	Tue, 10 Jun 2025 17:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYcRSfWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9810E2B2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577147; x=1781113147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZmAr5ayRTr84CfKXPqq1/4rPupkJGhUzoXsGjKYgCM=;
 b=WYcRSfWnxpMF2jUZap0k1sTejuaya6OhT9hsNzo+G7TzOR3t/99nhKv0
 aNGJ/7ZCQnmK/WpFzxLJ731T78wm6nJzpTcDUY6fXnJVVixtsrr3mcT+G
 6xIzoZ3sAdSREAen8nuO+/K5FltLomtjEyBhZ6WH6UOncFOGuQWj1Rn0X
 bZMie4U2JeJS08Yx0LLtB0lCn/vjSnBMkPMiRLTe3OaBGc7zQxVrPiEVK
 IFRaef5S1ILzCZHKYw+B0xQoRuQCGkdq7oP6NmlBo+C5kbgXhRksDrDlJ
 9ktCICdQ1+S5CoLhiqwWZGUFivFXVY5VGjaBqedfKpgmHK99GCXXpmLNb A==;
X-CSE-ConnectionGUID: XSLMqpdfReC7LMtDLi4fkw==
X-CSE-MsgGUID: zr1LfLFRT4e76MjZ3Xj2aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505949"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:07 -0700
X-CSE-ConnectionGUID: HsLuMMv+R4G8AgYZEVXrtg==
X-CSE-MsgGUID: ckFWYpiLSJCzaHk4cor8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854452"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:39:06 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 6/7] tests/intel/kms_psr: Enable the tests support
 variations based on the WAs
Date: Tue, 10 Jun 2025 23:12:43 +0530
Message-Id: <20250610174244.1292-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index da947feb6..7167b4242 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define WA_FBC_DISABLED "16023588340"
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -719,6 +721,12 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
+
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_supported(data->drm_fd, WA_FBC_DISABLED),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.34.1

