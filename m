Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A262C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1946510FD9F;
	Fri, 19 Apr 2024 06:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7JPxXjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F2C10E62E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508158; x=1745044158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lp9t6/GBFYrSnE/T3qHrD8Ymodm16lcHkUMI/oXtSgA=;
 b=j7JPxXjXpq/KrUl1JikYFGXKdF4KH8n8+4TU68BxDsa/cdo93hG9jnOa
 W4UKGdWz7hyAIpMg4TN8FV4sHW2rZ90CL+Dogy9BkVArvYds57+cwPUEJ
 43eTl1bo43SvMET9ianFs0nimNsKbGdbVIfvR6kukY3geEQn4j8fiQiYr
 6CJCWBAbb5DJhoza9aeQa1dnSSGwo4Z13mkxtoRiRNnh8qO+22SYPhqbd
 hLLIKeD53bBAEOt//4EvQypJ56bY9bIWCnUHfkwai0I26iqEeZs2xJfbN
 DF492SbdOcVzH8oY/EW255GUPpq7v/ViUl+QcbZsI2aE3atAlPKDg4QoP g==;
X-CSE-ConnectionGUID: FBIntP1cRDurUJFX7JZgew==
X-CSE-MsgGUID: LL+HorMDQR6hpEt5DlHLhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637557"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637557"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:18 -0700
X-CSE-ConnectionGUID: Cgkze9esSh+xuMx2ZqNgSw==
X-CSE-MsgGUID: 519T+gt2TyeZUHYq7ktdDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310782"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:16 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
Date: Fri, 19 Apr 2024 12:09:57 +0530
Message-Id: <20240419064001.2401850-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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

