Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8D1C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119E10E1C2;
	Tue, 25 Jun 2024 04:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJVNZN50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D7D10E1C2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719289649; x=1750825649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lM5XXxt8tj7DG1tGDQphhwAgWnln3fz/EKgET0Un8uo=;
 b=FJVNZN50Jms+P0ZcBkGCQKG3aTvHiLM0AJJugnEmOxE4NFZEZp2jBzrJ
 n2R5m3GaZmYRUvKxa/8iZDS3+TrlxV+2Vvs23zSjpOHNs2b8GldkuV4y4
 nxNUw8SftiOnGX2rUHkHgcuiFUa2uCD5GvUA/Otn+m0b0/3re7Ufkaql7
 AmlQZzP8kDafGARjT3Mdq3rruS4Ku5JpV85SbqQsvImtmcZKNOmFVb1pO
 fWwg4RBMGAtDRdtWR6U4jgO5DE/Rk68iMbcTzHXNI02M/4OKlUf9A1RbY
 sRw+WdkSA7Cgs23lTzrKEh/IDSM2wcguu84OuFR8L7i/xLL9wslRUOfRI A==;
X-CSE-ConnectionGUID: /CDQt+6vQMa1BXR6OdqCXw==
X-CSE-MsgGUID: fXPSLzydTAiSvq1u5IPFQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26908573"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="26908573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:27:29 -0700
X-CSE-ConnectionGUID: kg1LGGzVTJ+vf+00vJsWxA==
X-CSE-MsgGUID: Mi/EnViORnOirFyzKfGy2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="47951945"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:27:27 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [i-g-t] tests/kms_hdr: Fix bpc-switch subtests
Date: Tue, 25 Jun 2024 09:49:18 +0530
Message-ID: <20240625041918.248208-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

igt@kms_hdr@bpc-switch.* subtests are getting skip due to
recently merged cleanup patch. This patch will fix the logic
to run the subtests.

Fixes: (4fe91292b) tests/kms_hdr: Use lib helper to check the pipe/output combo validity
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 475463c21..36ebb4f4e 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -274,7 +274,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
-			if (intel_pipe_output_combo_valid(display)) {
+			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_pipe(output, PIPE_NONE);
 				continue;
 			}
-- 
2.43.2

