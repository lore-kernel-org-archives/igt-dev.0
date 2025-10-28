Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A51CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18610E5C1;
	Tue, 28 Oct 2025 08:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ90Alv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41810E5C1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641044; x=1793177044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2RdkPN6PUp/D+wydnnr8Q3XpKsraJYOmGO4onzoJSI=;
 b=IQ90Alv6o9KUQ9T0rILlcqIyokllzrLYzwEXtn586WFGMpZthosPGPZj
 /b9Tm1ydYmSMizuEUTMylmXs5mC/FpJ4sSaFsH8P/n5ZRDsZpCph3e77E
 qeAWThgUtEfuexZzPJRLu+RqKPy0TdLLTsAL8DskULk4cSo6BDfyj9ecK
 TgOh+0iEkJJ5i7ZejumgzE61r2FgxCi5txkgpMCgd8kHxon5Hx4UrT7RP
 rO9xtdd8fQMLKTUbT+f5ZyzhE/wlbtkQE+/qkMj2wO71YtiiZC++dka2c
 savNehce7jVdQvvlliz1XqM7btSmOSTQ1ly3GuNLs74a8OVnNWNFjqEyc A==;
X-CSE-ConnectionGUID: gXW4zVrcQy2+5uHWsN95Fg==
X-CSE-MsgGUID: X38RpfYjQMilq57CD7prpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81156337"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81156337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:44:04 -0700
X-CSE-ConnectionGUID: iGvECZFDT8OudHzBk0rM8A==
X-CSE-MsgGUID: FwOWskb9TNCWbMEEc0Ogfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184914718"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 01:44:03 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com
Subject: [PATCH v1 4/4] tests/kms_vrr: Recalculate expected refresh rate from
 test
Date: Tue, 28 Oct 2025 14:13:54 +0530
Message-ID: <20251028084354.2682743-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
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

When IGT runs for multidisplay config it is required to
recalculate expected refresh rate from test when
TEST_FORCE_RR flag is not set.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 73c556a68..bcb756202 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -350,7 +350,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
 
 	/* If unspecified on the command line, default rate to the midpoint */
-	if (data->vtest_ns.rate_ns == 0) {
+	if (!(data->flag & TEST_FORCE_RR)) {
 		range_t *range = &data->range;
 		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
 						(range->min + range->max) / 2);
-- 
2.48.1

