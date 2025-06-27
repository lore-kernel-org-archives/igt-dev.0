Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D1EC7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8B310E972;
	Fri, 27 Jun 2025 06:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt3kgdmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24010E971
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004049; x=1782540049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOUfuRcBBqPR0fWkmRxYYxV9fQ95UV7jSrZ0IlvW7/E=;
 b=Yt3kgdmyRrc4I3m3cvSKcBmAgPTsgz4XP1HEv/NjgTF4mOQn0nH8nI1B
 +5petn7BOcQbUeLVCmKblPYcoafyHWeK6F1XZKzAsuUsmEJz3oO8+YL4f
 it6xTY/DDmdoEByTMrKt2krtFzGMrwk9VMqGBw7Va9ZJ0kPEKjks9sSHH
 NdtyZJHty/aoZBi/iccDMMnpNiSiOOwmmioIRo8vXIKHpbZflmum7zD83
 AjtiSv3qGSVRmoIqB3wvBeaFZ1A2l7NhX8z3OqPKrslnaoeY1WvonRfsR
 4SjFzS2gOX8F2xWFjtZPOE9cnvuZRaCe/naILzT3FV5MOiO5rfElryo+I w==;
X-CSE-ConnectionGUID: s/xeJuAGT+CRHtpqPzI1ZQ==
X-CSE-MsgGUID: 10Vuohf+R5S3h32gLxoEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278514"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:49 -0700
X-CSE-ConnectionGUID: 5b6slD4wRJeHUxA09hz4Jw==
X-CSE-MsgGUID: /TYh0FLBR2KgmQJKHadvPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809504"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:48 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 6/7] tests/intel/kms_psr: Enable the tests support
 variations based on the WAs
Date: Fri, 27 Jun 2025 11:34:45 +0530
Message-Id: <20250627060446.29615-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index da947feb6..1192320a7 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -719,6 +719,12 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
+
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_disabled_by_wa(data->drm_fd),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.34.1

