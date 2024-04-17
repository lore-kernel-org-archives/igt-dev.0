Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC6C04FFE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1FF11340C;
	Wed, 17 Apr 2024 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wjo5LOmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A0E11341A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713353559; x=1744889559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lp9t6/GBFYrSnE/T3qHrD8Ymodm16lcHkUMI/oXtSgA=;
 b=Wjo5LOmy52RowzxwHAyTlPvfHRkQPFLceBm5y+CenxcRc9FWskwjMKPJ
 geIALv1FEImylVTbZf4/CBdahdnxAbHcRBoJGm7mfA3QJG52r9KNdx1lU
 FiDln70ki70Yr75+CfS5eo/vHVYLIrrsmSikraw0wXan6vivJ1V4z7CBo
 hKQ4C/UeU1K16vhmk9AfqpLNsLrO2+DSEVM6NS5mtJXQIUd5dw2YLFmEB
 k7er5MH+G7sovOElbfkiX++D/1QrV9HrIZ3qPEJra5NpOVY+BMT/vQpQe
 yOnqFXO76t2f1epcf0j8Wn7IO7uDJfApU7v5ELrpwj8X8t7ShKTM0FSbb g==;
X-CSE-ConnectionGUID: 4RM64BXRQE6KvEM8orP+Mg==
X-CSE-MsgGUID: dqsGQyIJTM2TmfvidkjU1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8719253"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8719253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:32:39 -0700
X-CSE-ConnectionGUID: LezqYArfQ5uwXJySt5+MYw==
X-CSE-MsgGUID: VcyfBvlTTom5tOE06wx8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22658105"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:32:37 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_big_joiner: add missing commit
 after reset
Date: Wed, 17 Apr 2024 17:13:22 +0530
Message-Id: <20240417114326.2245087-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417114326.2245087-1-kunal1.joshi@intel.com>
References: <20240417114326.2245087-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

add missing commit after reset

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 88923be6b..f325a9839 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
 		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
 		mode = igt_output_get_mode(output);
-- 
2.25.1

