Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB65C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 05:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D55410E2A6;
	Tue, 13 Aug 2024 05:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4qjP0zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985810E2A6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 05:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723528119; x=1755064119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AJ8XsWg81LHj/x/hgJfNLyzwZl+zPBRgnibucvw0bRg=;
 b=T4qjP0zsq0VXnILqqybfsxWGO5VxQedOui02Fwk4AObjbjXXnopU4Ge6
 u58XjLFnhwm148knBe8swwZIhiE2uQTLeYfWIxBgdZ+wSP37c2UKQfCQl
 aNd5Kh/X2g7IxIMKjZNzK17ZIGm+srHDHq6vDiYpgJdKgZc99iNxXiYbF
 5B0UsHIN+lxMAPOHsId9Qclubjn1PVW/o1iHaialaWSmwje+CFXgd6oS+
 ujtdCyjoNr+rScpUmiD2ST21b8PaekLLRsEpY3J1nlWlOs5OeTDsj0zDB
 iwrAdrrc/+8Kq2A4R70kAa2Myg9KbbT+3zUYCevAR8ZrubYa6U07RphzE g==;
X-CSE-ConnectionGUID: CVZXzOnVTuWJh0/ZM1Hlnw==
X-CSE-MsgGUID: 3UDFS7XGTpGOpVx8Z9/QqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25459901"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25459901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:25 -0700
X-CSE-ConnectionGUID: Bt2UxqXzSOqpuxpkhsrU7Q==
X-CSE-MsgGUID: SRNMpQS9TfGKRtma/Ymorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58623763"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:24 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/4] tests/kms_dither: Add more logs to skips
Date: Tue, 13 Aug 2024 11:08:43 +0530
Message-ID: <20240813053845.2567954-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch adds print statements
at crucial points to provide better insights.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index d8255f190..ce4172117 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -207,11 +207,17 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
-		if (!is_supported(output))
+		if (!is_supported(output)) {
+			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
-		if (igt_get_output_max_bpc(data->drm_fd, output->name) < output_bpc)
+		if (igt_get_output_max_bpc(data->drm_fd, output->name) < output_bpc) {
+			igt_info("Output %s: Doesn't support %d-bpc.\n",
+				 igt_output_name(output), output_bpc);
 			continue;
+		}
 
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
-- 
2.43.2

