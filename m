Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA93CCA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA8B10E68F;
	Wed,  4 Sep 2024 07:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uhfz137U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444AF10E691
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725434517; x=1756970517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Ne6pwy9yP2HejDMI62/iQCM8rTgKRChgOq+Ca7aCJ8=;
 b=Uhfz137UDgpb8ybYRiuA6DF0lJgoyCyv9uGjOPt1jXBuUYxqTqQfdc3l
 m6H/osrqx6IQL7noedF8dRn47u7awX74II9A1BqnGbeRAKc4p3YCgwCHi
 H+HH7d+rLfGtjBGQ7oIIM5d5ZEhjIkqxsp5GtIZCGBoG7KRSPO57OR17v
 4kh7BIRid5GoMFaeC292wsvbrWOApTrwPFjLLCq39U/bbDAG/GpdCmQNX
 NxFIIIfxJfIij7fF/dZVN7ZqTP7VdhwuYZ0jt4hR0MzLzr8KzfvLrBlIN
 hRZcr/DtbuBdCub6rxwy56XlsUTAUgvXTeszvXKkeMijufI1yHcxgkdkV w==;
X-CSE-ConnectionGUID: klv13MfzR/qIua3moExPdg==
X-CSE-MsgGUID: eawEIgU4Qy2t0imElFwPRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23951612"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23951612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:21:57 -0700
X-CSE-ConnectionGUID: Ao3kwVKjRyaHmMnM/DmquA==
X-CSE-MsgGUID: PZPeQH1lRuGKZVttO5CUwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65901798"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:21:56 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3,
 1/3] tests/intel/kms_dsc: move restore funcs() to reset func()
Date: Wed,  4 Sep 2024 12:54:23 +0530
Message-Id: <20240904072425.1022100-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904072425.1022100-1-swati2.sharma@intel.com>
References: <20240904072425.1022100-1-swati2.sharma@intel.com>
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

It makes sense to move restore funcs() to reset func().

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 9b48caf76..ef4646957 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -126,6 +126,9 @@ static void test_reset(data_t *data)
 	igt_debug("Reset DSC output format\n");
 	data->output_format = DSC_FORMAT_RGB;
 	force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+
+	restore_force_dsc_en();
+	restore_force_dsc_fractional_bpp_en();
 }
 
 static void test_cleanup(data_t *data)
@@ -236,8 +239,6 @@ static void update_display(data_t *data, uint32_t test_type)
 				mode->vrefresh,
 				enabled ? "ON" : "OFF");
 
-	restore_force_dsc_en();
-	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
 		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
-- 
2.25.1

