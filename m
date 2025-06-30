Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC668C8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCD110E456;
	Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btDXDpSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A43B10E222
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290661; x=1782826661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cy0quF1/p2m11t+2dCXgp9H36p52NcNI5xlKPTipADg=;
 b=btDXDpSiJepHiJuFOUpsw8Ezx8eojDcPJTjI1/9jGH7waT7wl77JvccF
 pt9wdza72UL852gBGqFC13VrZzqjZNN7Z/rN61fxgqnNaOShpF0fvZ0BM
 BIBqtQd//YefIcLt+fkzp02dEiIJoeIBcpiIUaZbSvFtP0MaX/P2HPO9W
 V1F2enNixz68BXgA5L1tYkxTZSWs9q+yEZUTnkTnhTzbtZbvCT2FxP5nM
 r95pUxAreOAb8/WT9eyBI6fYaXm9Qw5y0UT5nogzsdE+WcDPgHveVGgkG
 81lnfLtYXp+FIHb4stPdZC43JnKIMXQPnACQBwieVBaEWo6m/jTlE3Q8P g==;
X-CSE-ConnectionGUID: Al2EiE4fRhOHjxpyC8wnhw==
X-CSE-MsgGUID: AoM26ShDS+iN8NV8V1+I5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322574"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:41 -0700
X-CSE-ConnectionGUID: Kb3IMlUTRPCjVip7+jzuPg==
X-CSE-MsgGUID: OS0QlKOYSPW+1ba4KXhAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188337"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:40 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 6/7] tests/intel/kms_psr: Enable the tests support
 variations based on the WAs
Date: Mon, 30 Jun 2025 19:11:44 +0530
Message-Id: <20250630134145.836-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630134145.836-1-mohammed.thasleem@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
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
v3: Updated logic at igt_skip_on_f. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index da947feb6..f54e247fb 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -719,6 +719,12 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
+
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      intel_is_fbc_disabled_by_wa(data->drm_fd),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.25.1

